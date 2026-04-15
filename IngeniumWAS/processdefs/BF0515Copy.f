# Converted from PathFinder 2.2 to 3.0 on Jun 18, 2004 3:12:03 PM EDT

#*******************************************************************************
#*  Component:   BF0515Copy.f                                                  *
#*  Description:                                                               *
#*                                                                             *
#*******************************************************************************
#*  Chg#    Release  Description                                               *
#*                                                                             *
#*  014590  6.0      New for release 6.0                                       *
#*  016269  602J     fix branching when changing language                      *
#*                                                                             *
#*******************************************************************************

INCLUDE "BF0510-I.s";
INCLUDE "BF0515-I.s";
INCLUDE "BF0515-P.p";
INCLUDE "BF0515-O.s";

PROCESS BF0515Copy
{
    Title = STRINGTABLE.IDS_TITLE_BF0515Copy;
    TitleBar = "TitleBar";
    TitleBarSize = "70";
    ButtonBar = "ButtonBarOKCancel";
    ButtonBarSize = "40";
    MessageFrame = "MessagesDisp";
    MessageFrameSize = "70";


    # MFSL & MFSD Copy Part 1

    STEP BF0510-I
    {
        USES S-STEP "BF0510-I";
    }

    IF action == "ACTION_BACK"
        EXIT;

    STEP BF0515-P1
    {
        USES P-STEP "BF0515-P";
        "1" -> MIR-DV-PRCES-STATE-CD;
    }

    IF LSIR-RETURN-CD != "00"
        BRANCH BF0510-I;



    # MFSL & MFSD Copy Part 2

    STEP BF0515-I
    {
        USES S-STEP "BF0515-I";
    }

    IF action == "ACTION_BACK"
        BRANCH BF0510-I;

    STEP BF0515-P2
    {
        USES P-STEP "BF0515-P";
        "2" -> MIR-DV-PRCES-STATE-CD;
    }

    IF LSIR-RETURN-CD != "00"
        BRANCH BF0515-I;


    ButtonBar = "ButtonBarOK";

    STEP BF0515-O
    {
        USES S-STEP "BF0515-O";
    }

}

