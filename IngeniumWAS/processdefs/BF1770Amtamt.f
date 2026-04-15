# Converted from PathFinder 2.2 to 3.0 on Jun 18, 2004 3:12:06 PM EDT

#*******************************************************************************
#*  Component:   BF1770Amtamt.f                                                *
#*  Description:                                                               *
#*                                                                             *
#*******************************************************************************
#*  Chg#    Release  Description                                               *
#*                                                                             *
#*  014590  6.0      New for release 6.0                                       *
#*                                                                             *
#*******************************************************************************

INCLUDE "BF1770Key-I.s";
INCLUDE "BF1770Data-I.s";
INCLUDE "BF1770-O.s";
INCLUDE "BF1770-P.p";
INCLUDE "GenConfrm.f";

PROCESS BF1770Amtamt
{
    STEP Main
    {
        USES PROCESS "GenConfrm";

        # Set up the title strings. 

        STRINGTABLE.IDS_TITLE_BF1770Process -> ProcessTitle;
        STRINGTABLE.IDS_TITLE_BF1770Phase1 -> Phase1Title;
        STRINGTABLE.IDS_TITLE_BF1770Phase2 -> Phase2Title;
        STRINGTABLE.IDS_TITLE_BF1770Phase3 -> Phase3Title;

        # FTRS starts with Phase 1.

        "1" -> InitialState;

        # Set the names of the S and P steps to be used

        "BF1770Key-I" -> KeyFieldsS;
        "BF1770-P" -> GetInitialHostDataP;
        "BF1770Data-I" -> DataInputS;
        "BF1770-P" -> PerformHostEditsP;
        "BF1770-O" -> ConfirmS;
        "BF1770-P" -> UpdateHostP;
    }

    IF action == "ACTION_BACK"
        EXIT;


    BRANCH Main;
}

