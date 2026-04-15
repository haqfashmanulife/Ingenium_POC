# Converted from PathFinder 2.2 to 3.0 on Jun 18, 2004 3:12:05 PM EDT

#*******************************************************************************
#*  Component:   BF1372Revrseti.f                                              *
#*  Description:                                                               *
#*                                                                             *
#*******************************************************************************
#*  Chg#    Release  Description                                               *
#*                                                                             *
#*  014590  6.0      New for release 6.0                                       *
#*                                                                             *
#*******************************************************************************

INCLUDE "BF1372-I.s";
INCLUDE "BF1372-O.s";
INCLUDE "BF1372-P.p";
INCLUDE "GenConfrm.f";

PROCESS BF1372Revrseti
{
    STEP Main
    {
        USES PROCESS "GenConfrm";

        # Set up the title strings. 

        STRINGTABLE.IDS_TITLE_BF1372Process -> ProcessTitle;
        STRINGTABLE.IDS_TITLE_BF1372Phase1 -> Phase1Title;
        STRINGTABLE.IDS_TITLE_BF1372Phase2 -> Phase2Title;
        STRINGTABLE.IDS_TITLE_BF1372Phase3 -> Phase3Title;

        # SERV-Revrseti starts with Phase 2.

        "2" -> InitialState;

        # Set the names of the S and P steps to be used

        "Not Applicable" -> KeyFieldsS;
        "BF1372-P" -> GetInitialHostDataP;
        "BF1372-I" -> DataInputS;
        "BF1372-P" -> PerformHostEditsP;
        "BF1372-O" -> ConfirmS;
        "BF1372-P" -> UpdateHostP;
    }

    IF action == "ACTION_BACK"
        EXIT;


    BRANCH Main;
}

