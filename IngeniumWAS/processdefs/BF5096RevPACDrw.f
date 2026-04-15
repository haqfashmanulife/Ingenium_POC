# Converted from PathFinder 2.2 to 3.0 on Jun 18, 2004 3:12:07 PM EDT

#*******************************************************************************
#*  Component:   BF5096RevPACDrw.f                                             *
#*  Description:                                                               *
#*                                                                             *
#*******************************************************************************
#*  Chg#    Release  Description                                               *
#*                                                                             *
#*  014590  6.0      New for release 6.0                                       *
#*                                                                             *
#*******************************************************************************

INCLUDE "BF5096Key-I.s";
INCLUDE "BF5096Data-I.s";
INCLUDE "BF5096-O.s";
INCLUDE "BF5096-P.p";
INCLUDE "GenConfrm.f";

PROCESS BF5096RevPACDrw
{
    STEP Main
    {
        USES PROCESS "GenConfrm";

        # Set up the title strings. 

        STRINGTABLE.IDS_TITLE_BF5096Process -> ProcessTitle;
        STRINGTABLE.IDS_TITLE_BF5096Phase1 -> Phase1Title;
        STRINGTABLE.IDS_TITLE_BF5096Phase2 -> Phase2Title;
        STRINGTABLE.IDS_TITLE_BF5096Phase3 -> Phase3Title;

        # BHST-reverse PAC draw starts at phase 1.

        "1" -> InitialState;

        # Set the names of the S and P steps to be used

        "BF5096Key-I" -> KeyFieldsS;
        "BF5096-P" -> GetInitialHostDataP;
        "BF5096Data-I" -> DataInputS;
        "BF5096-P" -> PerformHostEditsP;
        "BF5096-O" -> ConfirmS;
        "BF5096-P" -> UpdateHostP;
    }

    IF action == "ACTION_BACK"
        EXIT;


    BRANCH Main;
}

