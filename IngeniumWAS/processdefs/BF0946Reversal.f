# Converted from PathFinder 2.2 to 3.0 on Jun 18, 2004 3:12:04 PM EDT

#*******************************************************************************
#*  Component:   BF0946Reversal.f                                              *
#*  Description:                                                               *
#*                                                                             *
#*******************************************************************************
#*  Chg#    Release  Description                                               *
#*                                                                             *
#*  014590  6.0      New for release 6.0                                       *
#*                                                                             *
#*******************************************************************************

INCLUDE "BF0946-I.s";
INCLUDE "BF0946-O.s";
INCLUDE "BF0946-P.p";
INCLUDE "GenConfrm.f";

PROCESS BF0946Reversal
{
    STEP Main
    {
        USES PROCESS "GenConfrm";

        # Set up the title strings. 

        STRINGTABLE.IDS_TITLE_BF0946Reversal -> ProcessTitle;
        STRINGTABLE.IDS_TITLE_BF0946Reversal -> Phase1Title;
        STRINGTABLE.IDS_TITLE_BF0946Reversal -> Phase2Title;
        STRINGTABLE.IDS_TITLE_BF0946Reversal -> Phase3Title;

        # Set the names of the S and P steps to be used

        "BF0946-I" -> KeyFieldsS;
        "BF0946-P" -> GetInitialHostDataP;
        "BF0946-I" -> DataInputS;
        "BF0946-P" -> PerformHostEditsP;
        "BF0946-O" -> ConfirmS;
        "BF0946-P" -> UpdateHostP;
        "2" -> InitialState;
    }

    IF action == "ACTION_BACK"
        EXIT;


    BRANCH Main;
}

