# Converted from PathFinder 2.2 to 3.0 on Jun 18, 2004 3:12:07 PM EDT

#*******************************************************************************
#*  Component:   BF9044List.f                                                  *
#*  Description:                                                               *
#*                                                                             *
#*******************************************************************************
#*  Chg#    Release  Description                                               *
#*                                                                             *
#*  P00064  02NB33    GW   New for MCL                                         *
#*  UY3004  STREAM3  UNISYS POST MIGRATION DUPLICATION POLICY
#*******************************************************************************

INCLUDE "BF9044-I.s";
INCLUDE "BF9044-O.s";
INCLUDE "BF9044-P.p";
INCLUDE "BF9044Retrieve.f";
INCLUDE "BF9042Update.f";

PROCESS BF9044List
{
    Title = STRINGTABLE.IDS_TITLE_BF9044List;
    TitleBar = "TitleBar";
    TitleBarSize = "70";
    ButtonBar = "ButtonBarOKCancel";
    ButtonBarSize = "40";
    MessageFrame = "MessagesDisp";
    MessageFrameSize = "70";


    # Ask the user where they'd like to start the list

    STEP ListStart
    {
        USES S-STEP "BF9044-I";
    }

    IF action == "ACTION_BACK"
        EXIT;
    #UY3004 CHANGES START

    UserDefinedPolicyIDBase   = MIR-POL-ID-BASE;
    UserDefinedPolicyIDSuffix = MIR-POL-ID-SFX;
    
    STEP Retrieve
    {
        USES PROCESS "BF9D34List";

        UserDefinedPolicyIDBase -> MIR-POL-ID-BASE;
        UserDefinedPolicyIDSuffix -> MIR-POL-ID-SFX;
        WS-POL-ID-BASE <- WS9D34-POL-ID-BASE;
        WS-POL-ID-SFX  <- WS9D34-POL-ID-SFX;
        WS-POL-COUNTER  <-WS9D34-POL-COUNTER;
        WS-CANCEL-IND  <- WS9D34-CANCEL-IND;
        WS-RETURN-CD <- WS9D34-RETURN-CD;
        UserDefinedPolicyIDBase <- WS9D34-POL-ID-BASE;
        UserDefinedPolicyIDSuffix <- WS9D34-POL-ID-SFX;
    }

    IF  WS-CANCEL-IND == "Y" || WS-RETURN-CD !="00"
       {
        BRANCH ListStart;
       }

    IF WS-POL-COUNTER <="01"
      {
       MIR-POL-ID-BASE = UserDefinedPolicyIDBase;
       MIR-POL-ID-SFX  = UserDefinedPolicyIDSuffix ;
      }

    IF WS-POL-COUNTER >"01"
      {
       MIR-POL-ID-BASE = WS-POL-ID-BASE;
       MIR-POL-ID-SFX  = WS-POL-ID-SFX ;
      }

# for more button moving and checking the policy
    TEST-POL-ID-BASE = MIR-POL-ID-BASE;
    TEST-POL-ID-SFX  = MIR-POL-ID-SFX ;

    #UY3004 CHANGES ENDS

    STEP RetrieveList
    {
        USES P-STEP "BF9044-P";
    }

    IF LSIR-RETURN-CD != "00"
        BRANCH ListStart;


    Title = STRINGTABLE.IDS_TITLE_BF9044List;
    ButtonBar = "ButtonBarOKCancelUpdate";

    STEP DisplayList
    {
        USES S-STEP "BF9044-O";
    }

    IF action == "ACTION_BACK"
        EXIT;

    IF action == "ACTION_NEXT"
        BRANCH ListStart;


    # The user wants to update an item in the list
    # MIR-RECPT-NUM-T[index]

    IF action == "ACTION_UPDATE"
    {
        STEP ACTION_UPDATE
        {
            USES PROCESS "BF9042Update";
            ATTRIBUTES
            {
                GetMessages = "NO";
            }

            MIR-POL-ID-BASE -> MIR-POL-ID-BASE;
            MIR-RECPT-NUM-T[index] -> MIR-RECPT-NBR;
            "FALSE" -> DisplayInput;
        }

        BRANCH RetrieveList;

    }
}

