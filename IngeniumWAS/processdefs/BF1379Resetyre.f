# Converted from PathFinder 2.2 to 3.0 on Jun 18, 2004 3:12:05 PM EDT

#*******************************************************************************
#*  Component:   BF1379Resetyre.f                                              *
#*  Description:                                                               *
#*                                                                             *
#*******************************************************************************
#*  Chg#    Release  Description                                               *
#*                                                                             *
#*  014590  6.0      New for release 6.0                                       *
#*                                                                             *
#*******************************************************************************

INCLUDE "BF1379-I.s";
INCLUDE "BF1379-O.s";
INCLUDE "BF1379-P.p";
INCLUDE "GenConfrm.f";

PROCESS BF1379Resetyre
{
    STEP Main
    {
        USES PROCESS "GenConfrm";

        # Set up the title strings. 

        STRINGTABLE.IDS_TITLE_BF1379Process -> ProcessTitle;
        STRINGTABLE.IDS_TITLE_BF1379Phase1 -> Phase1Title;
        STRINGTABLE.IDS_TITLE_BF1379Phase2 -> Phase2Title;
        STRINGTABLE.IDS_TITLE_BF1379Phase3 -> Phase3Title;

        # SERV-Resetyre starts with Phase 2.

        "2" -> InitialState;

        # Set the names of the S and P steps to be used

        "Not Resetyrelicable" -> KeyFieldsS;
        "BF1379-P" -> GetInitialHostDataP;
        "BF1379-I" -> DataInputS;
        "BF1379-P" -> PerformHostEditsP;
        "BF1379-O" -> ConfirmS;
        "BF1379-P" -> UpdateHostP;
    }

    IF action == "ACTION_BACK"
        EXIT;


    BRANCH Main;
}

