# Converted from PathFinder 2.2 to 3.0 on Jun 18, 2004 3:12:05 PM EDT

#*******************************************************************************
#*  Component:   BF1401Monthly.f                                               *
#*  Description:                                                               *
#*                                                                             *
#*******************************************************************************
#*  Chg#    Release  Description                                               *
#*                                                                             *
#*  014590  6.0      New for release 6.0                                       *
#*                                                                             *
#*******************************************************************************

INCLUDE "BF1401-I.s";
INCLUDE "BF1401-O.s";
INCLUDE "BF1401-P.p";
INCLUDE "GenConfrm.f";

PROCESS BF1401Monthly
{
    STEP Main
    {
        USES PROCESS "GenConfrm";

        # Set up the title strings. 

        STRINGTABLE.IDS_TITLE_BF1401Process -> ProcessTitle;
        STRINGTABLE.IDS_TITLE_BF1401Phase1 -> Phase1Title;
        STRINGTABLE.IDS_TITLE_BF1401Phase2 -> Phase2Title;
        STRINGTABLE.IDS_TITLE_BF1401Phase3 -> Phase3Title;

        # PPay starts with Phase 2.

        "2" -> InitialState;

        # Set the names of the S and P steps to be used

        "Not Applicable" -> KeyFieldsS;
        "BF1401-P" -> GetInitialHostDataP;
        "BF1401-I" -> DataInputS;
        "BF1401-P" -> PerformHostEditsP;
        "BF1401-O" -> ConfirmS;
        "BF1401-P" -> UpdateHostP;
    }

    IF action == "ACTION_BACK"
        EXIT;


    BRANCH Main;
}

