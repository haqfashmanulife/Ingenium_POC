# Converted from PathFinder 2.2 to 3.0 on Jun 18, 2004 3:12:07 PM EDT

#*******************************************************************************
#*  Component:   BF2354List.f                                                  *
#*  Description:                                                               *
#*                                                                             *
#*******************************************************************************
#*  Chg#    Release  Description                                               *
#*                                                                             *
#*  014590  6.0      New for release 6.0                                       *
#*  UY3004 STREAM3   UNISYS POST MIGRATION DUPLICATE POLICY                    *
#*                                                                             *
#*******************************************************************************
# Change this to the S that starts the list

INCLUDE "BF2354-I.s";

# Change this to the P that retrieves the list

INCLUDE "BF2354-O.s";
INCLUDE "BF2354-P.p";
INCLUDE "BF2351Create.f";

PROCESS BF2354List
{
    Title = STRINGTABLE.IDS_TITLE_BF2354List;
    TitleBar = "TitleBar";
    TitleBarSize = "70";
    ButtonBar = "ButtonBarOKCancel";
    ButtonBarSize = "40";
    MessageFrame = "MessagesDisp";
    MessageFrameSize = "70";


    # Ask the user where they'd like to start the list

    STEP ListStart
    {
        USES S-STEP "BF2354-I";
    }

    IF action == "ACTION_BACK"
        EXIT;

#UY3004 CHANGES START
    UserDefinedPolicyIDBase   = MIR-CPEVNT-POL-CLI-ID-BASE;
    UserDefinedPolicyIDSuffix = MIR-CPEVNT-POL-CLI-ID-SFX;
    
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
        BRANCH ListStart;
       }

    IF WS-POL-COUNTER <="01"
      {
       MIR-CPEVNT-POL-CLI-ID-BASE = UserDefinedPolicyIDBase;
       MIR-CPEVNT-POL-CLI-ID-SFX  = UserDefinedPolicyIDSuffix;
      }

    IF WS-POL-COUNTER >"01"
      {
       MIR-CPEVNT-POL-CLI-ID-BASE = WS-POL-ID-BASE;
       MIR-CPEVNT-POL-CLI-ID-SFX  = WS-POL-ID-SFX;
      }

    # for more button moving and checking the policy
    TEST-POL-ID-BASE = MIR-CPEVNT-POL-CLI-ID-BASE;
    TEST-POL-ID-SFX  = MIR-CPEVNT-POL-CLI-ID-SFX ;

#UY3004 CHANGES END

    STEP RetrieveList
    {
        USES P-STEP "BF2354-P";
    }

    IF LSIR-RETURN-CD != "00"
        BRANCH ListStart;


    Title = STRINGTABLE.IDS_TITLE_BF2354List;
    ButtonBar = "ButtonBarListsC";

    STEP DisplayList
    {
        USES S-STEP "BF2354-O";
    }

    IF action == "ACTION_BACK"
        EXIT;


    # If the user has pressed the more button, go back and reget the list

    IF action == "ACTION_MORE" || action == "ACTION_NEXT"
    #UY3004 CHANGES START
    #UY3004 BRANCH RetrieveList;
      {
       IF  TEST-POL-ID-BASE == MIR-CPEVNT-POL-CLI-ID-BASE && TEST-POL-ID-SFX   == MIR-CPEVNT-POL-CLI-ID-SFX
           BRANCH RetrieveList;
       ELSE
           UserDefinedPolicyIDBase   = MIR-CPEVNT-POL-CLI-ID-BASE;
           UserDefinedPolicyIDSuffix = MIR-CPEVNT-POL-CLI-ID-SFX;
           BRANCH Retrieve;
      }
    #UY3004 CHANGES ENDS


    # The user has indicated that they want to add an element to the list

    IF action == "ACTION_ADD"
    {
        STEP ACTION_ADD
        {
            USES PROCESS "BF2351Create";
            ATTRIBUTES
            {
                GetMessages = "NO";
                SendMessages = "NO";
            }

            " " -> MIR-EVNT-ACT-CD;
            LSIR-SYS-DT-EXT -> MIR-CPEVNT-TRXN-DT;
            LSIR-SYS-TIME -> MIR-CPEVNT-TRXN-TIME;
            " " -> MIR-EVNT-ACTV-CD;
            "FALSE" -> DisplayInput;
        }

        BRANCH RetrieveList;

    }

    # The user hasn't selected an item to work with.  Go back.

    IF index == "0"
        BRANCH DisplayList;

}

