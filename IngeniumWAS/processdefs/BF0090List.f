# Converted from PathFinder 2.2 to 3.0 on Jun 18, 2004 3:12:03 PM EDT

#*******************************************************************************
#*  Component:   BF0090List.f                                                  *
#*  Description:                                                               *
#*                                                                             *
#*******************************************************************************
#*  Chg#    Release  Description                                               *
#*                                                                             *
#*  014590  6.0      New for release 6.0                                       *
#*  016227  602J     Modify order of processing                                *
#*                                                                             *
#*  R10440  CTS      VM MIGRATION PLAN - REGARDING DUMMY DEPLOYMENT FOR        *  
#*                   INGENIUM PRODUCTION                                       *
#*******************************************************************************

INCLUDE "BF0090-O.s";
INCLUDE "BF0090-P.p";

PROCESS BF0090List
{
    Title = STRINGTABLE.IDS_TITLE_BF0090List;
    TitleBar = "TitleBar";
    TitleBarSize = "70";
    ButtonBar = "ButtonBarListsScroll";
    ButtonBarSize = "40";
    MessageFrame = "MessagesDisp";
    MessageFrameSize = "70";

    STEP RetrieveList
    {
        USES P-STEP "BF0090-P";
    }

    STEP DisplayList
    {
        USES S-STEP "BF0090-O";
    }

    IF action == "ACTION_BACK"
        EXIT;


    # If the user has pressed the more button, go back and reget the list

    IF action == "ACTION_MORE"
    {
        MIR-DV-BCKWRD-SCROLL-IND = "N";

        BRANCH RetrieveList;

    }
    IF action == "ACTION_PREVIOUS"
    {
        MIR-DV-BCKWRD-SCROLL-IND = "Y";

        BRANCH RetrieveList;

    }
}

