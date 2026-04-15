# Converted from PathFinder 2.2 to 3.0 on Jun 18, 2004 3:12:03 PM EDT

#*******************************************************************************
#*  Component:   BF0235Reversal.f                                              *
#*  Description:                                                               *
#*                                                                             *
#*******************************************************************************
#*  Chg#    Release  Description                                               *
#*                                                                             *
#*  014590  6.0      New for release 6.0                                       *
#*  016736  611J     Code cleanup					       *	
#*                                                                             *
#*******************************************************************************

INCLUDE "BF0230-I.s";
INCLUDE "BF0230-O.s";
INCLUDE "BF0235-P.p";
INCLUDE "GenConfrm.f";

PROCESS BF0235Reversal
{
    STEP Main
    {
        USES PROCESS "GenConfrm";

        # Set up the title strings. 

        STRINGTABLE.IDS_TITLE_BF0235Process -> ProcessTitle;
        STRINGTABLE.IDS_TITLE_BF0235Phase1 -> Phase1Title;
        STRINGTABLE.IDS_TITLE_BF0235Phase2 -> Phase2Title;
        STRINGTABLE.IDS_TITLE_BF0235Phase3 -> Phase3Title;

        # PPay starts with Phase 2.

        "2" -> InitialState;

        # Set the names of the S and P steps to be used

        "Not Applicable" -> KeyFieldsS;
        "BF0235-P" -> GetInitialHostDataP;
        "BF0230-I" -> DataInputS;
        "BF0235-P" -> PerformHostEditsP;
        "BF0230-O" -> ConfirmS;
        "BF0235-P" -> UpdateHostP;
    }

    IF action == "ACTION_BACK"
        EXIT;


    BRANCH Main;
}

