# Converted from PathFinder 2.2 to 3.0 on Jun 18, 2004 3:12:05 PM EDT

#*******************************************************************************
#*  Component:   BF1376Reviap.f                                                *
#*  Description:                                                               *
#*                                                                             *
#*******************************************************************************
#*  Chg#    Release  Description                                               *
#*                                                                             *
#*  014590  6.0      New for release 6.0                                       *
#*                                                                             *
#*******************************************************************************

INCLUDE "BF1376-I.s";
INCLUDE "BF1376-O.s";
INCLUDE "BF1376-P.p";
INCLUDE "GenConfrm.f";

PROCESS BF1376Reviap
{
    STEP Main
    {
        USES PROCESS "GenConfrm";

        # Set up the title strings. 

        STRINGTABLE.IDS_TITLE_BF1376Process -> ProcessTitle;
        STRINGTABLE.IDS_TITLE_BF1376Phase1 -> Phase1Title;
        STRINGTABLE.IDS_TITLE_BF1376Phase2 -> Phase2Title;
        STRINGTABLE.IDS_TITLE_BF1376Phase3 -> Phase3Title;

        # SERV-Reviap starts with Phase 2.

        "2" -> InitialState;

        # Set the names of the S and P steps to be used

        "Not Reviaplicable" -> KeyFieldsS;
        "BF1376-P" -> GetInitialHostDataP;
        "BF1376-I" -> DataInputS;
        "BF1376-P" -> PerformHostEditsP;
        "BF1376-O" -> ConfirmS;
        "BF1376-P" -> UpdateHostP;
    }

    IF action == "ACTION_BACK"
        EXIT;


    BRANCH Main;
}

