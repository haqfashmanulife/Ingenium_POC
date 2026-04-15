# Converted from PathFinder 2.2 to 3.0 on Jun 18, 2004 3:12:05 PM EDT

#*******************************************************************************
#*  Component:   BF1400Irreg.f                                                 *
#*  Description:                                                               *
#*                                                                             *
#*******************************************************************************
#*  Chg#    Release  Description                                               *
#*                                                                             *
#*  014590  6.0      New for release 6.0                                       *
#*                                                                             *
#*******************************************************************************

INCLUDE "BF1400-I.s";
INCLUDE "BF1400-O.s";
INCLUDE "BF1400-P.p";
INCLUDE "GenConfrm.f";

PROCESS BF1400Irreg
{
    STEP Main
    {
        USES PROCESS "GenConfrm";

        # Set up the title strings. 

        STRINGTABLE.IDS_TITLE_BF1400Process -> ProcessTitle;
        STRINGTABLE.IDS_TITLE_BF1400Phase1 -> Phase1Title;
        STRINGTABLE.IDS_TITLE_BF1400Phase2 -> Phase2Title;
        STRINGTABLE.IDS_TITLE_BF1400Phase3 -> Phase3Title;

        # PPay starts with Phase 2.

        "2" -> InitialState;

        # Set the names of the S and P steps to be used

        "Not Applicable" -> KeyFieldsS;
        "BF1400-P" -> GetInitialHostDataP;
        "BF1400-I" -> DataInputS;
        "BF1400-P" -> PerformHostEditsP;
        "BF1400-O" -> ConfirmS;
        "BF1400-P" -> UpdateHostP;
    }

    IF action == "ACTION_BACK"
        EXIT;


    BRANCH Main;
}

