# Converted from PathFinder 2.2 to 3.0 on Jun 18, 2004 3:12:05 PM EDT

#*******************************************************************************
#*  Component:   BF1378Rrifrev.f                                               *
#*  Description:                                                               *
#*                                                                             *
#*******************************************************************************
#*  Chg#    Release  Description                                               *
#*                                                                             *
#*  014590  6.0      New for release 6.0                                       *
#*  PF 2.2  PF22     Fixed SyntaxCheck error - BF1377-Prev renamed BF1378-P    *
#*                                                                             *
#*******************************************************************************

INCLUDE "BF1378-I.s";
INCLUDE "BF1378-O.s";
INCLUDE "BF1378-P.p";
INCLUDE "GenConfrm.f";

PROCESS BF1378Rrifrev
{
    STEP Main
    {
        USES PROCESS "GenConfrm";

        # Set up the title strings. 

        STRINGTABLE.IDS_TITLE_BF1378Process -> ProcessTitle;
        STRINGTABLE.IDS_TITLE_BF1378Phase1 -> Phase1Title;
        STRINGTABLE.IDS_TITLE_BF1378Phase2 -> Phase2Title;
        STRINGTABLE.IDS_TITLE_BF1378Phase3 -> Phase3Title;

        # SERV-Rrifrev starts with Phase 2.

        "2" -> InitialState;

        # Set the names of the S and P steps to be used

        "Not Rrifrevlicable" -> KeyFieldsS;
#        "BF1377-Prev" -> GetInitialHostDataP;
        "BF1378-P" -> GetInitialHostDataP;
        "BF1378-I" -> DataInputS;
#        "BF1377-Prev" -> PerformHostEditsP;
        "BF1378-P" -> PerformHostEditsP;
        "BF1378-O" -> ConfirmS;
#        "BF1377-Prev" -> UpdateHostP;
        "BF1378-P" -> UpdateHostP;
    }

    IF action == "ACTION_BACK"
        EXIT;


    BRANCH Main;
}

