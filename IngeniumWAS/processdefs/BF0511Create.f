# Converted from PathFinder 2.2 to 3.0 on Jun 18, 2004 3:12:03 PM EDT

#*******************************************************************************
#*  Component:   BF0511Create.f                                                *
#*  Description:                                                               *
#*                                                                             *
#*******************************************************************************
#*  Chg#    Release  Description                                               *
#*                                                                             *
#*  014590  6.0      New for release 6.0                                       *
#*  017151  612J     Code Clean-up: chgd upd output step to ret output step    *
#*                                                                             *
#*******************************************************************************

INCLUDE "BF0511-I.s";
INCLUDE "BF0512-I.s";
INCLUDE "BF0511-P.p";
INCLUDE "BF0510-O.s";

PROCESS BF0511Create
{
    Title = STRINGTABLE.IDS_TITLE_BF0511Create;
    TitleBar = "TitleBar";
    TitleBarSize = "70";
    ButtonBar = "ButtonBarOKCancel";
    ButtonBarSize = "40";
    MessageFrame = "MessagesDisp";
    MessageFrameSize = "70";


    # MFSL & MFSD Create Part 1

    STEP BF0511-I
    {
        USES S-STEP "BF0511-I";
    }

    IF action == "ACTION_BACK"
        EXIT;

    STEP BF0511-P1
    {
        USES P-STEP "BF0511-P";
        "1" -> MIR-DV-PRCES-STATE-CD;
    }

    IF LSIR-RETURN-CD != "00"
        BRANCH BF0511-I;



    # MFSL & MFSD Create Part 2

    STEP BF0512-I
    {
        USES S-STEP "BF0512-I";
    }

    IF action == "ACTION_BACK"
        BRANCH BF0511-I;

    STEP BF0511-P2
    {
        USES P-STEP "BF0511-P";
        "2" -> MIR-DV-PRCES-STATE-CD;
    }

    IF LSIR-RETURN-CD != "00"
        BRANCH BF0512-I;


    ButtonBar = "ButtonBarOK";

    STEP BF0510-O
    {
        USES S-STEP "BF0510-O";
    }
}

