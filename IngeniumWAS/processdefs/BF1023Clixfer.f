# Converted from PathFinder 2.2 to 3.0 on Jun 18, 2004 3:12:04 PM EDT

#*******************************************************************************
#*  Component:   BF1023Clixfer.f                                               *
#*  Description:                                                               *
#*                                                                             *
#*******************************************************************************
#*  Chg#    Release  Description                                               *
#*                                                                             *
#*  014590  6.0      New for release 6.0                                       *
#*                                                                             *
#*******************************************************************************

INCLUDE "BF1023-I.s";
INCLUDE "BF1023-O.s";
INCLUDE "BF1023-P.p";
INCLUDE "GenConfrm.f";

PROCESS BF1023Clixfer
{
    STEP Main
    {
        USES PROCESS "GenConfrm";

        # Set up the title strings. 

        STRINGTABLE.IDS_TITLE_BF1023Process -> ProcessTitle;
        STRINGTABLE.IDS_TITLE_BF1023Phase1 -> Phase1Title;
        STRINGTABLE.IDS_TITLE_BF1023Phase2 -> Phase2Title;
        STRINGTABLE.IDS_TITLE_BF1023Phase3 -> Phase3Title;

        # PPay starts with Phase 2.

        "2" -> InitialState;

        # Set the names of the S and P steps to be used

        "Not Applicable" -> KeyFieldsS;
        "BF1023-P" -> GetInitialHostDataP;
        "BF1023-I" -> DataInputS;
        "BF1023-P" -> PerformHostEditsP;
        "BF1023-O" -> ConfirmS;
        "BF1023-P" -> UpdateHostP;
    }

    IF action == "ACTION_BACK"
        EXIT;


    BRANCH Main;
}

