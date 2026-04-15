# Converted from PathFinder 2.2 to 3.0 on Jun 18, 2004 3:12:05 PM EDT

#*******************************************************************************
#*  Component:   BF1365Wpoff.f                                                 *
#*  Description:                                                               *
#*                                                                             *
#*******************************************************************************
#*  Chg#    Release  Description                                               *
#*                                                                             *
#*  014590  6.0      New for release 6.0                                       *
#*                                                                             *
#*******************************************************************************

INCLUDE "BF1365-I.s";
INCLUDE "BF1365-O.s";
INCLUDE "BF1365-P.p";
INCLUDE "GenConfrm.f";

PROCESS BF1365Wpoff
{
    STEP Main
    {
        USES PROCESS "GenConfrm";

        # Set up the title strings. 

        STRINGTABLE.IDS_TITLE_BF1365Process -> ProcessTitle;
        STRINGTABLE.IDS_TITLE_BF1365Phase1 -> Phase1Title;
        STRINGTABLE.IDS_TITLE_BF1365Phase2 -> Phase2Title;
        STRINGTABLE.IDS_TITLE_BF1365Phase3 -> Phase3Title;

        # SERV starts with Phase 2.

        "2" -> InitialState;

        # Set the names of the S and P steps to be used

        "Not Applicable" -> KeyFieldsS;
        "BF1365-P" -> GetInitialHostDataP;
        "BF1365-I" -> DataInputS;
        "BF1365-P" -> PerformHostEditsP;
        "BF1365-O" -> ConfirmS;
        "BF1365-P" -> UpdateHostP;
    }

    IF action == "ACTION_BACK"
        EXIT;


    BRANCH Main;
}

