# Converted from PathFinder 2.2 to 3.0 on Jun 18, 2004 3:12:10 PM EDT

#*******************************************************************************
#*  Component:   BF9241PrtCntCli.f                                                  *
#*  Description:                                                               *
#*                                                                             *
#*******************************************************************************
#*  Chg#    Release  Description                                               *
#*                                                                             *
#*  HCL103D HIN/CL   PRINT CONTACT CLIENT LABEL SHEET                          *
#*                                                                             *
#*******************************************************************************

INCLUDE "BF9241-I.s";
INCLUDE "BF9241-O.s";
INCLUDE "BF9241-P.p";

PROCESS BF9241PrtCntCli
{
    Title = STRINGTABLE.IDS_TITLE_BF9241PrtCntCli;
    TitleBar = "TitleBar";
    TitleBarSize = "70";
    ButtonBar = "ButtonBarOKCancel";
    ButtonBarSize = "40";
    MessageFrame = "MessagesDisp";
    MessageFrameSize = "70";


    # Ask the user where they'd like to start the list

    STEP ListStart
    {
        USES S-STEP "BF9241-I";
    }

    IF action == "ACTION_BACK"
        EXIT;

    STEP RetrieveList
    {
        USES P-STEP "BF9241-P";
    }

    Title = STRINGTABLE.IDS_TITLE_BF9241PrtCntCli;

    IF LSIR-RETURN-CD != "00"
        BRANCH ListStart;


    STEP DisplayList
    {
        USES S-STEP "BF9241-O";
    }

    IF action == "ACTION_BACK"
        EXIT;


    # If the user has pressed the OK button, go to print label sheet and exit

    IF action == "ACTION_NEXT"
        BRANCH ListStart;

}

