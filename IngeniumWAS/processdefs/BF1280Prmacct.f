# Converted from PathFinder 2.2 to 3.0 on Jun 18, 2004 3:12:05 PM EDT

#*******************************************************************************
#*  Component:   BF1280Prmacct.f                                               *
#*  Description:                                                               *
#*                                                                             *
#*******************************************************************************
#*  Chg#    Release  Description                                               *
#*                                                                             *
#*  014590  6.0      New for release 6.0                                       *
#*                                                                             *
#*******************************************************************************

INCLUDE "BF1280-I.s";
INCLUDE "BF1280-O.s";
INCLUDE "BF1280-P.p";
INCLUDE "GenConfrm.f";

PROCESS BF1280Prmacct
{
    STEP Main
    {
        USES PROCESS "GenConfrm";

        # Set up the title strings. 

        STRINGTABLE.IDS_TITLE_BF1280Process -> ProcessTitle;
        STRINGTABLE.IDS_TITLE_BF1280Phase1 -> Phase1Title;
        STRINGTABLE.IDS_TITLE_BF1280Phase2 -> Phase2Title;
        STRINGTABLE.IDS_TITLE_BF1280Phase3 -> Phase3Title;

        # ACPM starts with Phase 2.

        "2" -> InitialState;

        # Set the names of the S and P steps to be used

        "Not Applicable" -> KeyFieldsS;
        "BF1280-P" -> GetInitialHostDataP;
        "BF1280-I" -> DataInputS;
        "BF1280-P" -> PerformHostEditsP;
        "BF1280-O" -> ConfirmS;
        "BF1280-P" -> UpdateHostP;
    }

    IF action == "ACTION_BACK"
        EXIT;


    BRANCH Main;
}

