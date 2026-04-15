# Converted from PathFinder 2.2 to 3.0 on Jun 18, 2004 3:12:05 PM EDT

#*******************************************************************************
#*  Component:   BF1362Aplrev.f                                                *
#*  Description:                                                               *
#*                                                                             *
#*******************************************************************************
#*  Chg#    Release  Description                                               *
#*                                                                             *
#*  014590  6.0      New for release 6.0                                       *
#*  PF 2.2  PF22     Fixed SyntaxCheck error - BF1361-Prev renamed BF1362-P    *
#*                                                                             *
#*******************************************************************************

INCLUDE "BF1362-I.s";
INCLUDE "BF1362-O.s";
INCLUDE "BF1362-P.p";
INCLUDE "GenConfrm.f";

PROCESS BF1362Aplrev
{
    STEP Main
    {
        USES PROCESS "GenConfrm";

        # Set up the title strings. 

        STRINGTABLE.IDS_TITLE_BF1362Process -> ProcessTitle;
        STRINGTABLE.IDS_TITLE_BF1362Phase1 -> Phase1Title;
        STRINGTABLE.IDS_TITLE_BF1362Phase2 -> Phase2Title;
        STRINGTABLE.IDS_TITLE_BF1362Phase3 -> Phase3Title;

        # SERV-APL starts with Phase 2.

        "2" -> InitialState;

        # Set the names of the S and P steps to be used

        "Not Applicable" -> KeyFieldsS;
#        "BF1361-Prev" -> GetInitialHostDataP;
        "BF1362-P" -> GetInitialHostDataP;
        "BF1362-I" -> DataInputS;
#        "BF1361-Prev" -> PerformHostEditsP;
        "BF1362-P" -> PerformHostEditsP;
        "BF1362-O" -> ConfirmS;
#        "BF1361-Prev" -> UpdateHostP;
        "BF1362-P" -> UpdateHostP;
    }

    IF action == "ACTION_BACK"
        EXIT;


    BRANCH Main;
}

