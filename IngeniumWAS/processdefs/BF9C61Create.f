# Converted from PathFinder 2.2 to 3.0 on Jun 18, 2004 3:12:06 PM EDT

#*******************************************************************************
#*  Component:   BF9C61Create.f                                                *
#*  Description: CSOM9C60                                                      *
#*                                                                             *
#*******************************************************************************
#*  Chg#    Release  Description                                               *
#*                                                                             *
#*  M161CA  CTS     Implementing the Screen changes for the Credit card        *
#*  M161CA          processing                                                 *
#*  Q10078  CTS     M161CA TASK                                                *
#*  M3199A  CTS      M3199A ENHANCEMENT OF CREDIT CARD CHANGES                 *
#*  UY3004  STREAM3 UNISYS POST MIGRATION DUPLICATION POLICY                   *
#*******************************************************************************

INCLUDE "BF9C61-I.s";
INCLUDE "BF9C61-P.p";
INCLUDE "BF9C60-P.p";
INCLUDE "BF9C62-I.s";
INCLUDE "BF9C60-O.s";
INCLUDE "BF9C62-P.p";
#Q10078 START
#INCLUDE "GenCreate.f";

PROCESS BF9C61Create
{
    Title = STRINGTABLE.IDS_TITLE_BF9C61Create;
    TitleBar = "TitleBar";
    TitleBarSize = "70";
    ButtonBar = "ButtonBarOKCancel";
    ButtonBarSize = "40";
    MessageFrame = "MessagesDisp";
    MessageFrameSize = "70";


    # Enter the key(s) for the value that you'd like to create

    STEP Input
    {
        USES S-STEP "BF9C61-I";
    }

    IF action == "ACTION_BACK"
        EXIT;

    IF action == "ACTION_REFRESH"
        BRANCH Input;

#UY3004 CHANGES START

    UserDefinedPolicyIDBase   = MIR-POL-ID-BASE;
    UserDefinedPolicyIDSuffix = MIR-POL-ID-SFX;
    
    STEP RetrieveList
    {
        USES PROCESS "BF9D34List";

        UserDefinedPolicyIDBase -> MIR-POL-ID-BASE;
        UserDefinedPolicyIDSuffix -> MIR-POL-ID-SFX;
        WS-POL-ID-BASE <- WS9D34-POL-ID-BASE;
        WS-POL-ID-SFX  <- WS9D34-POL-ID-SFX;
        WS-POL-COUNTER <-WS9D34-POL-COUNTER;
        WS-CANCEL-IND  <- WS9D34-CANCEL-IND;
        WS-RETURN-CD   <- WS9D34-RETURN-CD;
        UserDefinedPolicyIDBase <- WS9D34-POL-ID-BASE;
        UserDefinedPolicyIDSuffix <- WS9D34-POL-ID-SFX;
    }

    IF  WS-CANCEL-IND == "Y" || WS-RETURN-CD !="00"
       {
        BRANCH Input;
       }

    IF WS-POL-COUNTER <="01"
      {
       MIR-POL-ID-BASE = UserDefinedPolicyIDBase;
       MIR-POL-ID-SFX  = UserDefinedPolicyIDSuffix ;
      }

    IF WS-POL-COUNTER >"01"
      {
       MIR-POL-ID-BASE = WS-POL-ID-BASE;
       MIR-POL-ID-SFX  = WS-POL-ID-SFX;
      }

#UY3004 CHANGES END

    # Create the new record

    STEP Create
    {
        USES P-STEP "BF9C61-P";
    }
    MIR-CRC-SEQ-NUM = MIR-CRC-SEQ-NUM;
    MIR-CRC-SEQ-NUM-T[1] = MIR-CRC-SEQ-NUM;
    MIR-CRC-SEQ-NUM-N = MIR-CRC-SEQ-NUM-N;
    MIR-CRC-NUM-T[1] = MIR-CRC-NUM-STAR-T + MIR-CRC-NUM-VALU-T;
    MIR-CRC-AUTH-AMT-T[1] = "  ";
    MIR-CRC-CO-NM-T[1] = "  ";
    MIR-CRC-AUTH-NUM-T[1] = "  ";
    MIR-CRC-AUTH-DT-T[1] = "  ";
    MIR-BILL-SUSP-IND-T[1] = "  ";
    MIR-CRC-NUM-VALU-T = " ";    
#M3199A CHANGES  START    
    MIR-PPNCC-RPT-IND-T[1] = "  ";    
#M3199A CHANGES ENDS    
    
    IF LSIR-RETURN-CD != "00"
        BRANCH Input;

    # Edit the new record

    STEP Edit
    {
        USES S-STEP "BF9C62-I";
    }
    
    STEP Check
    {
        USES P-STEP "BF9C62-P";
        "2" -> MIR-DV-PRCES-STATE-CD;
    }
    
    IF LSIR-RETURN-CD != "00"
        BRANCH Edit;
    
    MIR-CRC-NUM-T[1] = MIR-CRC-NUM-STAR-T + MIR-CRC-NUM-VALU-T;

    IF action == "ACTION_BACK"
    {
        IF DisplayInput != "FALSE"
        {
            ButtonBar = "ButtonBarOKCancel";
            MESSAGES-T[0] = "";

            BRANCH Input;

        }
        ELSE
            EXIT;


    }
    IF action == "ACTION_REFRESH"
        BRANCH Edit;

    # Display the output before the update process
    
    STEP Output
    {
        USES S-STEP "BF9C60-O";
    }

    MIR-CRC-NUM-T[1] = MIR-CRC-NUM-VALU-T + MIR-CRC-NUM-STAR-T;

    IF action == "ACTION_BACK"
    {
        IF DisplayInput != "FALSE"
        {
            ButtonBar = "ButtonBarOKCancel";
            MESSAGES-T[0] = "";

            BRANCH Edit;

        }
        ELSE
            EXIT;


    }
    IF action == "ACTION_REFRESH"
        BRANCH Output;

    # Update the record who's data was just entered.

    STEP Update
    {
        USES P-STEP "BF9C62-P";
        "1" -> MIR-DV-PRCES-STATE-CD;
    }

    IF LSIR-RETURN-CD != "00"
        BRANCH Edit;


    IF action == "ACTION_OK"
    {
        ButtonBar = "ButtonBarOKCancel";    
        BRANCH Input;
    }
#Q10078 END
}

