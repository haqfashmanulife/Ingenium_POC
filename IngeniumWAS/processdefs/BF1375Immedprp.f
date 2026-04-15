# Converted from PathFinder 2.2 to 3.0 on Jun 18, 2004 3:12:05 PM EDT

#*******************************************************************************
#*  Component:   BF1375Immedprp.f                                              *
#*  Description:                                                               *
#*                                                                             *
#*******************************************************************************
#*  Chg#    Release  Description                                               *
#*                                                                             *
#*  014590  6.0      New for release 6.0                                       *
#*                                                                             *
#*******************************************************************************

INCLUDE "BF1375-I.s";
INCLUDE "BF1375-O.s";
INCLUDE "BF1375-P.p";
INCLUDE "GenConfrm.f";

PROCESS BF1375Immedprp
{
    STEP Main
    {
        USES PROCESS "GenConfrm";

        # Set up the title strings. 

        STRINGTABLE.IDS_TITLE_BF1375Process -> ProcessTitle;
        STRINGTABLE.IDS_TITLE_BF1375Phase1 -> Phase1Title;
        STRINGTABLE.IDS_TITLE_BF1375Phase2 -> Phase2Title;
        STRINGTABLE.IDS_TITLE_BF1375Phase3 -> Phase3Title;

        # SERV-Immedprp starts with Phase 2.

        "2" -> InitialState;

        # Set the names of the S and P steps to be used

        "Not Immedprplicable" -> KeyFieldsS;
        "BF1375-P" -> GetInitialHostDataP;
        "BF1375-I" -> DataInputS;
        "BF1375-P" -> PerformHostEditsP;
        "BF1375-O" -> ConfirmS;
        "BF1375-P" -> UpdateHostP;
    }

    IF action == "ACTION_BACK"
        EXIT;


    BRANCH Main;
}

