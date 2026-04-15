# Converted from PathFinder 2.2 to 3.0 on Jun 18, 2004 3:12:07 PM EDT

#*******************************************************************************
#*  Component:   BF2351Create.f                                                *
#*  Description:                                                               *
#*                                                                             *
#*******************************************************************************
#*  Chg#    Release  Description                                               *
#*                                                                             *
#*  014590  6.0      New for release 6.0                                       *
#*  UY3004 STREAM3   UNISYS POST MIGRATION DUPLICATE POLICY                    *
#*                                                                             *
#*******************************************************************************

INCLUDE "BF2351-I.s";
INCLUDE "BF2351-P.p";
INCLUDE "BF2351-O.s";

PROCESS BF2351Create
{
    Title = STRINGTABLE.IDS_TITLE_BF2351Create;
    TitleBar = "TitleBar";
    TitleBarSize = "70";
    ButtonBar = "ButtonBarOKCancel";
    ButtonBarSize = "40";
    MessageFrame = "MessagesDisp";
    MessageFrameSize = "70";


    # SKIP STRAIGHT TO STEP Input WITHOUT CLEARING KEY

    IF DisplayInput == "FALSE"
        BRANCH Input;



    # CLEAR POLICY NUMBER
    # CLEAR SUFFIX NUMBER

    MIR-CPEVNT-POL-CLI-ID-BASE = " ";
    MIR-CPEVNT-POL-CLI-ID-SFX = " ";


    # Enter the key(s) for the value that you'd like to create

    STEP Input
    {
        USES S-STEP "BF2351-I";
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

#UY3004 CHANGES END

    # SET SEQUENCE NUMBER TO 001

    MIR-CPEVNT-SEQ-NUM = "001";


    # Create the new record

    STEP Create
    {
        USES P-STEP "BF2351-P";
    }

    IF LSIR-RETURN-CD != "00"
        BRANCH Input;



    # USE "OK" BUTTON BAR FOR OUTPUT PAGE

    ButtonBar = "ButtonBarOK";

    STEP Output
    {
        USES S-STEP "BF2351-O";
    }

    # RESET KEY IF NOT ORIGINATING FROM LIST

    IF DisplayInput != "FALSE"
    {

        # USE "OK/CANCEL" BUTTON BAR FOR INPUT PAGE

        ButtonBar = "ButtonBarOKCancel";

        STEP Input-2
        {
            USES S-STEP "BF2351-I";
            " " -> MIR-EVNT-ACT-CD;
            " " -> MIR-CPEVNT-POL-CLI-ID-BASE;
            " " -> MIR-CPEVNT-POL-CLI-ID-SFX;
            LSIR-SYS-DT-EXT -> MIR-CPEVNT-TRXN-DT;
            LSIR-SYS-TIME -> MIR-CPEVNT-TRXN-TIME;
            " " -> MIR-EVNT-ACTV-CD;
        }

        IF action == "ACTION_BACK"
            EXIT;

        # SET SEQUENCE NUMBER TO 001

        MIR-CPEVNT-SEQ-NUM = "001";

        BRANCH Create;

    }
}

