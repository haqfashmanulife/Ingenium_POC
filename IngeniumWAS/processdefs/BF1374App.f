# Converted from PathFinder 2.2 to 3.0 on Jun 18, 2004 3:12:05 PM EDT

#*******************************************************************************
#*  Component:   BF1374App.f                                                   *
#*  Description:                                                               *
#*                                                                             *
#*******************************************************************************
#*  Chg#    Release  Description                                               *
#*                                                                             *
#*  014590  6.0      New for release 6.0                                       *
#*                                                                             *
#*******************************************************************************

INCLUDE "BF1374-I.s";
INCLUDE "BF1374-O.s";
INCLUDE "BF1374-P.p";
INCLUDE "GenConfrm.f";

PROCESS BF1374App
{
    STEP Main
    {
        USES PROCESS "GenConfrm";

        # Set up the title strings. 

        STRINGTABLE.IDS_TITLE_BF1374Process -> ProcessTitle;
        STRINGTABLE.IDS_TITLE_BF1374Phase1 -> Phase1Title;
        STRINGTABLE.IDS_TITLE_BF1374Phase2 -> Phase2Title;
        STRINGTABLE.IDS_TITLE_BF1374Phase3 -> Phase3Title;

        # SERV-App starts with Phase 2.

        "2" -> InitialState;

        # Set the names of the S and P steps to be used

        "Not Applicable" -> KeyFieldsS;
        "BF1374-P" -> GetInitialHostDataP;
        "BF1374-I" -> DataInputS;
        "BF1374-P" -> PerformHostEditsP;
        "BF1374-O" -> ConfirmS;
        "BF1374-P" -> UpdateHostP;
    }

    IF action == "ACTION_BACK"
        EXIT;


    BRANCH Main;
}

