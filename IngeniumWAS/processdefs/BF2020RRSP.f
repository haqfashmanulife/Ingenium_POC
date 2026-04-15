# Converted from PathFinder 2.2 to 3.0 on Jun 18, 2004 3:12:06 PM EDT

#*******************************************************************************
#*  Component:   BF2020RRSP.f                                                  *
#*  Description:                                                               *
#*                                                                             *
#*******************************************************************************
#*  Chg#    Release  Description                                               *
#*                                                                             *
#*  014590  6.0      New for release 6.0                                       *
#*                                                                             *
#*******************************************************************************

INCLUDE "BF2020-I.s";
INCLUDE "BF2020-O.s";
INCLUDE "BF2020-P.p";
INCLUDE "GenConfrm.f";

PROCESS BF2020RRSP
{
    STEP Main
    {
        USES PROCESS "GenConfrm";

        # Set up the title strings. 

        STRINGTABLE.IDS_TITLE_BF2020Process -> ProcessTitle;
        STRINGTABLE.IDS_TITLE_BF2020Phase1 -> Phase1Title;
        STRINGTABLE.IDS_TITLE_BF2020Phase2 -> Phase2Title;
        STRINGTABLE.IDS_TITLE_BF2020Phase3 -> Phase3Title;

        # PRNT starts with Phase 2.

        "2" -> InitialState;

        # Set the names of the S and P steps to be used

        "Not Applicable" -> KeyFieldsS;
        "BF2020-I" -> DataInputS;
        "BF2020-P" -> PerformHostEditsP;
        "BF2020-O" -> ConfirmS;
        "BF2020-P" -> UpdateHostP;
    }

    IF action == "ACTION_BACK"
        EXIT;


    BRANCH Main;
}

