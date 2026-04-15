# Converted from PathFinder 2.2 to 3.0 on Jun 18, 2004 3:12:07 PM EDT

#*******************************************************************************
#*  Component:   BF9074List.f                                                  *
#*  Description: LINC TRANSACTION LIST                                         *
#*                                                                             *
#*******************************************************************************
#*  Chg#    Release  Description                                               *
#*                                                                             *
#*  01NB05B EKM      CREATION OF FLOW FILE                                     *
#*******************************************************************************

INCLUDE "BF9074-I.s";
INCLUDE "BF9074-O.s";
INCLUDE "BF9074-P.p";

PROCESS BF9074List
{
    Title = STRINGTABLE.IDS_TITLE_BF9074List;
    TitleBar = "TitleBar";
    TitleBarSize = "70";
    ButtonBar = "ButtonBarOKCancel";
    ButtonBarSize = "40";
    MessageFrame = "MessagesDisp";
    MessageFrameSize = "70";

    STEP BF9074-I
    {
        USES S-STEP "BF9074-I";
    }

    IF action == "ACTION_BACK"
        EXIT;

    STEP BF9074-P
    {
        USES P-STEP "BF9074-P";
    }

    IF LSIR-RETURN-CD != "00"
        BRANCH BF9074-I;


    ButtonBar = "ButtonBarLists";

    STEP BF9074-O
    {
        USES S-STEP "BF9074-O";
    }

    IF action == "ACTION_BACK"
        EXIT;

    IF action == "ACTION_MORE"
        BRANCH BF9074-P;

}

