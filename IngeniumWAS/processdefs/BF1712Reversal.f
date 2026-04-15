# Converted from PathFinder 2.2 to 3.0 on Jun 18, 2004 3:12:06 PM EDT

#*******************************************************************************
#*  Component:   BF1712Reversal.f                                              *
#*  Description:                                                               *
#*                                                                             *
#*******************************************************************************
#*  Chg#    Release  Description                                               *
#*                                                                             *
#*  014590  6.0      New for release 6.0                                       *
#*                                                                             *
#*******************************************************************************

INCLUDE "BF1712Key-I.s";
INCLUDE "BF1712Data-I.s";
INCLUDE "BF1712-O.s";
INCLUDE "BF1712-P.p";
INCLUDE "GenConfrm.f";

PROCESS BF1712Reversal
{
    STEP Main
    {
        USES PROCESS "GenConfrm";

        # Set up the title strings. 

        STRINGTABLE.IDS_TITLE_BF1712Process -> ProcessTitle;
        STRINGTABLE.IDS_TITLE_BF1712Phase1 -> Phase1Title;
        STRINGTABLE.IDS_TITLE_BF1712Phase2 -> Phase2Title;
        STRINGTABLE.IDS_TITLE_BF1712Phase3 -> Phase3Title;

        # PDEP starts with Phase 1.

        "1" -> InitialState;

        # Set the names of the S and P steps to be used

        "BF1712Key-I" -> KeyFieldsS;
        "BF1712-P" -> GetInitialHostDataP;
        "BF1712Data-I" -> DataInputS;
        "BF1712-P" -> PerformHostEditsP;
        "BF1712-O" -> ConfirmS;
        "BF1712-P" -> UpdateHostP;
    }

    IF action == "ACTION_BACK"
        EXIT;


    BRANCH Main;
}

