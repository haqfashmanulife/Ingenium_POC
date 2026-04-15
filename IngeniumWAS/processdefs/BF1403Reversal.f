# Converted from PathFinder 2.2 to 3.0 on Jun 18, 2004 3:12:05 PM EDT

#*******************************************************************************
#*  Component:   BF1403Reversal.f                                              *
#*  Description:                                                               *
#*                                                                             *
#*******************************************************************************
#*  Chg#    Release  Description                                               *
#*                                                                             *
#*  014590  6.0      New for release 6.0                                       *
#*                                                                             *
#*******************************************************************************

INCLUDE "BF1403-I.s";
INCLUDE "BF1403-O.s";
INCLUDE "BF1403-P.p";
INCLUDE "GenConfrm.f";

PROCESS BF1403Reversal
{
    STEP Main
    {
        USES PROCESS "GenConfrm";

        # Set up the title strings. 

        STRINGTABLE.IDS_TITLE_BF1403Process -> ProcessTitle;
        STRINGTABLE.IDS_TITLE_BF1403Phase1 -> Phase1Title;
        STRINGTABLE.IDS_TITLE_BF1403Phase2 -> Phase2Title;
        STRINGTABLE.IDS_TITLE_BF1403Phase3 -> Phase3Title;

        # PPay starts with Phase 2.

        "2" -> InitialState;

        # Set the names of the S and P steps to be used

        "Not Applicable" -> KeyFieldsS;
        "BF1403-P" -> GetInitialHostDataP;
        "BF1403-I" -> DataInputS;
        "BF1403-P" -> PerformHostEditsP;
        "BF1403-O" -> ConfirmS;
        "BF1403-P" -> UpdateHostP;
    }

    IF action == "ACTION_BACK"
        EXIT;


    BRANCH Main;
}

