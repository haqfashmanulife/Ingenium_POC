# Converted from PathFinder 2.2 to 3.0 on Jun 18, 2004 3:12:06 PM EDT

#*******************************************************************************
#*  Component:   BF1841Create.f                                                *
#*  Description:                                                               *
#*                                                                             *
#*******************************************************************************
#*  Chg#    Release  Description                                               *
#*                                                                             *
#*  014590  6.0      New for release 6.0                                       *
#*                                                                             *
#*******************************************************************************

INCLUDE "BF1841Key-I.s";
INCLUDE "BF1841Data-I.s";
INCLUDE "BF1841-O.s";
INCLUDE "BF1841-P.p";
INCLUDE "GenConfrm.f";

PROCESS BF1841Create
{
    STEP Main
    {
        USES PROCESS "GenConfrm";

        # Set up the title strings. 

        STRINGTABLE.IDS_TITLE_BF1841Create -> ProcessTitle;
        STRINGTABLE.IDS_TITLE_BF1841Phase1 -> Phase1Title;
        STRINGTABLE.IDS_TITLE_BF1841Phase2 -> Phase2Title;
        STRINGTABLE.IDS_TITLE_BF1841Phase3 -> Phase3Title;

        # FICA starts with Phase 1.

        "1" -> InitialState;

        # Set the names of the S and P steps to be used

        "BF1841Key-I" -> KeyFieldsS;
        "BF1841-P" -> GetInitialHostDataP;
        "BF1841Data-I" -> DataInputS;
        "BF1841-P" -> PerformHostEditsP;
        "BF1841-O" -> ConfirmS;
        "BF1841-P" -> UpdateHostP;
    }

    IF action == "ACTION_BACK"
        EXIT;


    BRANCH Main;
}

