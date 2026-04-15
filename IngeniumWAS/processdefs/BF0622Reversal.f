# Converted from PathFinder 2.2 to 3.0 on Jun 18, 2004 3:12:03 PM EDT

#*******************************************************************************
#*  Component:   BF0622Reversal.f                                              *
#*  Description:                                                               *
#*                                                                             *
#*******************************************************************************
#*  Chg#    Release  Description                                               *
#*                                                                             *
#*  014590  6.0      New for release 6.0                                       *
#*                                                                             *
#*******************************************************************************

INCLUDE "BF0622-I.s";
INCLUDE "BF0622-O.s";
INCLUDE "BF0622-P.p";
INCLUDE "GenConfrm.f";

PROCESS BF0622Reversal
{
    STEP Main
    {
        USES PROCESS "GenConfrm";

        # Set up the title strings. 

        STRINGTABLE.IDS_TITLE_BF0622Process -> ProcessTitle;
        STRINGTABLE.IDS_TITLE_BF0622Phase1 -> Phase1Title;
        STRINGTABLE.IDS_TITLE_BF0622Phase2 -> Phase2Title;
        STRINGTABLE.IDS_TITLE_BF0622Phase3 -> Phase3Title;

        # APay starts with Phase 2.

        "2" -> InitialState;

        # Set the names of the S and P steps to be used

        "Not Applicable" -> KeyFieldsS;
        "BF0622-I" -> DataInputS;
        "BF0622-P" -> PerformHostEditsP;
        "BF0622-O" -> ConfirmS;
        "BF0622-P" -> UpdateHostP;
    }

    IF action == "ACTION_BACK"
        EXIT;


    BRANCH Main;
}

