# Converted from PathFinder 2.2 to 3.0 on Jun 18, 2004 3:12:03 PM EDT

#*******************************************************************************
#*  Component:   BF0645Mcvadj.f                                                *
#*  Description:                                                               *
#*                                                                             *
#*******************************************************************************
#*  Chg#    Release  Description                                               *
#*                                                                             *
#*  014590  6.0      New for release 6.0                                       *
#*                                                                             *
#*******************************************************************************

INCLUDE "BF0645Key-I.s";
INCLUDE "BF0645Data-I.s";
INCLUDE "BF0645-O.s";
INCLUDE "BF0645-P.p";
INCLUDE "GenConfrm.f";

PROCESS BF0645Mcvadj
{
    STEP Main
    {
        USES PROCESS "GenConfrm";

        # Set up the title strings. 

        STRINGTABLE.IDS_TITLE_BF0645Process -> ProcessTitle;
        STRINGTABLE.IDS_TITLE_BF0645Phase1 -> Phase1Title;
        STRINGTABLE.IDS_TITLE_BF0645Phase2 -> Phase2Title;
        STRINGTABLE.IDS_TITLE_BF0645Phase3 -> Phase3Title;

        # APRO starts with Phase 2.

        "1" -> InitialState;

        # Set the names of the S and P steps to be used

        "BF0645Key-I" -> KeyFieldsS;
        "BF0645-P" -> GetInitialHostDataP;
        "BF0645Data-I" -> DataInputS;
        "BF0645-P" -> PerformHostEditsP;
        "BF0645-O" -> ConfirmS;
        "BF0645-P" -> UpdateHostP;
    }

    IF action == "ACTION_BACK"
        EXIT;


    BRANCH Main;
}

