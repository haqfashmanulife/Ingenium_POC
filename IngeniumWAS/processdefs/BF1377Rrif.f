# Converted from PathFinder 2.2 to 3.0 on Jun 18, 2004 3:12:05 PM EDT

#*******************************************************************************
#*  Component:   BF1377Rrif.f                                                  *
#*  Description:                                                               *
#*                                                                             *
#*******************************************************************************
#*  Chg#    Release  Description                                               *
#*                                                                             *
#*  014590  6.0      New for release 6.0                                       *
#*                                                                             *
#*******************************************************************************

INCLUDE "BF1377-I.s";
INCLUDE "BF1377-O.s";
INCLUDE "BF1377-P.p";
INCLUDE "GenConfrm.f";

PROCESS BF1377Rrif
{
    STEP Main
    {
        USES PROCESS "GenConfrm";

        # Set up the title strings. 

        STRINGTABLE.IDS_TITLE_BF1377Process -> ProcessTitle;
        STRINGTABLE.IDS_TITLE_BF1377Phase1 -> Phase1Title;
        STRINGTABLE.IDS_TITLE_BF1377Phase2 -> Phase2Title;
        STRINGTABLE.IDS_TITLE_BF1377Phase3 -> Phase3Title;

        # SERV-Rrif starts with Phase 2.

        "2" -> InitialState;

        # Set the names of the S and P steps to be used

        "Not Rriflicable" -> KeyFieldsS;
        "BF1377-P" -> GetInitialHostDataP;
        "BF1377-I" -> DataInputS;
        "BF1377-P" -> PerformHostEditsP;
        "BF1377-O" -> ConfirmS;
        "BF1377-P" -> UpdateHostP;
    }

    IF action == "ACTION_BACK"
        EXIT;


    BRANCH Main;
}

