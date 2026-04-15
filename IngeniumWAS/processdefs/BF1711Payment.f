# Converted from PathFinder 2.2 to 3.0 on Jun 18, 2004 3:12:06 PM EDT

#*******************************************************************************
#*  Component:   BF1711Payment.f                                               *
#*  Description:                                                               *
#*                                                                             *
#*******************************************************************************
#*  Chg#    Release  Description                                               *
#*                                                                             *
#*  014590  6.0      New for release 6.0                                       *
#*                                                                             *
#*******************************************************************************

INCLUDE "BF1711Key-I.s";
INCLUDE "BF1711Data-I.s";
INCLUDE "BF1711-O.s";
INCLUDE "BF1711-P.p";
INCLUDE "GenConfrm.f";

PROCESS BF1711Payment
{
    STEP Main
    {
        USES PROCESS "GenConfrm";

        # Set up the title strings. 

        STRINGTABLE.IDS_TITLE_BF1711Process -> ProcessTitle;
        STRINGTABLE.IDS_TITLE_BF1711Phase1 -> Phase1Title;
        STRINGTABLE.IDS_TITLE_BF1711Phase2 -> Phase2Title;
        STRINGTABLE.IDS_TITLE_BF1711Phase3 -> Phase3Title;

        # PDEP starts with Phase 1.

        "1" -> InitialState;

        # Set the names of the S and P steps to be used

        "BF1711Key-I" -> KeyFieldsS;
        "BF1711-P" -> GetInitialHostDataP;
        "BF1711Data-I" -> DataInputS;
        "BF1711-P" -> PerformHostEditsP;
        "BF1711-O" -> ConfirmS;
        "BF1711-P" -> UpdateHostP;
    }

    IF action == "ACTION_BACK"
        EXIT;


    BRANCH Main;
}

