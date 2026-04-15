# Converted from PathFinder 2.2 to 3.0 on Jun 18, 2004 3:12:04 PM EDT

#*******************************************************************************
#*  Component:   BF0921Create.f                                                *
#*  Description:                                                               *
#*                                                                             *
#*******************************************************************************
#*  Chg#    Release  Description                                               *
#*                                                                             *
#*  014590  6.0      New for release 6.0                                       *
#*  016736  611J     Code Cleanup                                              *
#*                                                                             *
#*******************************************************************************

INCLUDE "BF0921-I.s";
INCLUDE "BF0922-I.s";
INCLUDE "BF0921-P.p";
INCLUDE "BF0920-O.s";

PROCESS BF0921Create
{
    Title = STRINGTABLE.IDS_TITLE_BF0921Create;
    TitleBar = "TitleBar";
    TitleBarSize = "70";
    ButtonBar = "ButtonBarOKCancel";
    ButtonBarSize = "40";
    MessageFrame = "MessagesDisp";
    MessageFrameSize = "70";


    # ANDI Create Part 1

    STEP BF0921-I
    {
        USES S-STEP "BF0921-I";
    }

    IF action == "ACTION_BACK"
        EXIT;

    STEP BF0921-P1
    {
        USES P-STEP "BF0921-P";
        "1" -> MIR-DV-PRCES-STATE-CD;
    }

    IF LSIR-RETURN-CD != "00"
        BRANCH BF0921-I;



    # ANDI Create Part 2, is Updating the 'details' of the ANDI record

    STEP BF0922-I
    {
        USES S-STEP "BF0922-I";
    }

    IF action == "ACTION_BACK"
        BRANCH BF0921-I;

    STEP BF0921-P2
    {
        USES P-STEP "BF0921-P";
        "2" -> MIR-DV-PRCES-STATE-CD;
    }

    IF LSIR-RETURN-CD != "00"
        BRANCH BF0922-I;


    ButtonBar = "ButtonBarOK";

    STEP BF0920-O
    {
        USES S-STEP "BF0920-O";
    }

    BRANCH BF0921-I;
}

