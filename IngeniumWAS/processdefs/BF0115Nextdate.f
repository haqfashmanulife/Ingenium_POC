# Converted from PathFinder 2.2 to 3.0 on Jun 18, 2004 3:12:03 PM EDT

#*******************************************************************************
#*  Component:   BF0115Nextdate.f                                              *
#*  Description:                                                               *
#*                                                                             *
#*******************************************************************************
#*  Chg#    Release  Description                                               *
#*                                                                             *
#*  014590  6.0      New for release 6.0                                       *
#*  016347  602J     Fix focus on override page                                *
#*                                                                             *
#*******************************************************************************

INCLUDE "BF0115-I.s";
INCLUDE "BF0115-O.s";
INCLUDE "BF0115-P.p";

PROCESS BF0115Nextdate
{
    Title = STRINGTABLE.IDS_TITLE_BF0115Nextdate;
    TitleBar = "TitleBar";
    TitleBarSize = "70";
    ButtonBar = "ButtonBarOKCancel";
    ButtonBarSize = "40";
    MessageFrame = "MessagesDisp";
    MessageFrameSize = "70";

    STEP Input
    {
        USES S-STEP "BF0115-I";
    }

    IF action == "ACTION_BACK"
        EXIT;

    # Initial Create will set Process State to 1

    STEP PerformHostEdits-P
    {
        USES P-STEP "BF0115-P";
        "2" -> MIR-DV-PRCES-STATE-CD;
    }

    IF LSIR-RETURN-CD != "00" && LSIR-RETURN-CD != "03"
        BRANCH Input;


    # Display OK/Cancel ButtonBar

    IF MIR-DV-PRCES-OVRID-IND == "N"
        ButtonBar = "ButtonBarOKCancel";


    # change the focus to the override button (not OKbutton) if using the 
    # override button bar
    # Display Override/Cancel ButtonBar

    IF MIR-DV-PRCES-OVRID-IND == "Y"
    {
        ButtonBar = "ButtonBarOverrideCancel";
        FocusFrame = "ButtonFrame";
        FocusField = "overrideButton";

    }

    STEP Confirm
    {
        USES S-STEP "BF0115-O";
    }

    IF action == "ACTION_BACK"
    {
        MESSAGES-T[0] = "";
        ButtonBar = "ButtonBarOKCancel";

        BRANCH Input;

    }

    STEP UpdateHost-P
    {
        USES P-STEP "BF0115-P";
        "3" -> MIR-DV-PRCES-STATE-CD;
    }

    IF LSIR-RETURN-CD != "00"
        BRANCH Confirm;


    # Return To Main Menu

    IF action == "ACTION_BACK"
        EXIT;


    # Return To List

    IF DisplayInput == "FALSE"
        EXIT;


    ButtonBar = "ButtonBarOKCancel";

    BRANCH Input;
}

