# Converted from PathFinder 2.2 to 3.0 on Jun 18, 2004 3:12:07 PM EDT

#*******************************************************************************
#*  Component:   BF2341Create.f                                                *
#*  Description:                                                               *
#*                                                                             *
#*******************************************************************************
#*  Chg#    Release  Description                                               *
#*                                                                             *
#*  014590  6.0      New for release 6.0                                       *
#*                                                                             *
#*******************************************************************************

INCLUDE "BF2341-I.s";
INCLUDE "BF2341-P.p";
INCLUDE "BF2341-O.s";

PROCESS BF2341Create
{
    Title = STRINGTABLE.IDS_TITLE_BF2341Create;
    TitleBar = "TitleBar";
    TitleBarSize = "70";
    ButtonBar = "ButtonBarOKCancel";
    ButtonBarSize = "40";
    MessageFrame = "MessagesDisp";
    MessageFrameSize = "70";


    # SKIP STRAIGHT TO STEP Input WITHOUT CLEARING KEY

    IF DisplayInput == "FALSE"
        BRANCH Input;



    # CLEAR CLIENT NUMBER

    MIR-CPEVNT-POL-CLI-ID = " ";


    # Enter the key(s) for the value that you'd like to create

    STEP Input
    {
        USES S-STEP "BF2341-I";
    }

    IF action == "ACTION_BACK"
        EXIT;

    IF action == "ACTION_REFRESH"
        BRANCH Input;



    # Create the new record
    # SET SEQUENCE NUMBER TO 001

    MIR-CPEVNT-SEQ-NUM = "001";

    STEP Create
    {
        USES P-STEP "BF2341-P";
    }

    IF LSIR-RETURN-CD != "00"
        BRANCH Input;



    # USE "OK" BUTTON BAR FOR OUTPUT PAGE

    ButtonBar = "ButtonBarOK";

    STEP Output
    {
        USES S-STEP "BF2341-O";
    }

    # RESET KEY IF NOT ORIGINATING FROM LIST

    IF DisplayInput != "FALSE"
    {

        # USE "OK/CANCEL" BUTTON BAR FOR OUTPUT PAGE

        ButtonBar = "ButtonBarOKCancel";

        STEP Input-2
        {
            USES S-STEP "BF2341-I";
            " " -> MIR-EVNT-ACT-CD;
            " " -> MIR-CPEVNT-POL-CLI-ID;
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

