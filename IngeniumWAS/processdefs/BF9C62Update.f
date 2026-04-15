# Converted from PathFinder 2.2 to 3.0 on Jun 18, 2004 3:12:06 PM EDT

#*******************************************************************************
#*  Component:   BF9C62Update.f                                                *
#*  Description: CSOM9C60                                                      *
#*                                                                             *
#*******************************************************************************
#*  Chg#    Release  Description                                               *
#*                                                                             *
#*  M161CA  CTS     Implementing the Screen changes for the Credit card        *
#*  M161CA          processing                                                 *
#*  Q10078  CTS     M161CA TASK                                                *
#*  UY3004  STREAM3 UNISYS POST MIGRATION DUPLICATION POLICY                   *
#*  23774A  CTS      AUDIT LOG RELATED  CHANGES                                *
#*******************************************************************************

INCLUDE "BF9C60-I.s";
INCLUDE "BF9C60-P.p";
INCLUDE "BF9C62-I.s";
INCLUDE "BF9C62-P.p";
INCLUDE "BF9C60-O.s";
    #Q10078 START
#INCLUDE "GenUpdate.f";
# 23774A CHANGES BEGIN
INCLUDE "BF9G99-P.p";
# 23774A CHANGES END
    
PROCESS BF9C62Update
{
    Title = STRINGTABLE.IDS_TITLE_BF9C62Update;
    TitleBar = "TitleBar";
    TitleBarSize = "70";
    ButtonBar = "ButtonBarOKCancel";
    ButtonBarSize = "40";
    MessageFrame = "MessagesDisp";
    MessageFrameSize = "70";

    # Enter the key(s) for the value that you'd like to create

    STEP Input
    {
        USES S-STEP "BF9C60-I";
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

    TRACE ("MIR-CRC-SEQ-NUM-T[] before BF9C60-p  " +MIR-CRC-SEQ-NUM-T[1]);
    # Retrieve the record 

    STEP Retrieve
    {
        USES P-STEP "BF9C60-P";
    }

    IF LSIR-RETURN-CD != "00"
        BRANCH Input;

    
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

    # If user selects Cancel and did not come from a list, then clear messages 
    # and branch back 1 step;
    # otherwise, exit to list.
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
    }

    IF LSIR-RETURN-CD != "00"
        BRANCH Edit;

# 23774A CHANGES BEGIN
    temp-DTL-INFO  = MIR-POL-ID-BASE + " " + MIR-POL-ID-SFX;
    
   STEP AUTROutput
    {
        USES P-STEP "BF9G99-P";
    
    SESSION.MIR-USER-ID -> MIR-USER-ID;
    SESSION.LSIR-BPF-ID  -> MIR-BFCN-ID;

    temp-DTL-INFO -> MIR-TRNX-DTL-INFO;    
    "C" -> MIR-LOG-LEVL-CD;    
    }
      
    IF LSIR-RETURN-CD != "00"
       BRANCH Edit;
        
# 23774A CHANGES END
    IF action == "ACTION_OK"
    {
        ButtonBar = "ButtonBarOKCancel";    
        BRANCH Input;
    }
    #Q10078 END
}

