# Converted from PathFinder 2.2 to 3.0 on Jun 18, 2004 3:12:06 PM EDT

#*******************************************************************************
#*  Component:   BF2022T4RSP.f                                                 *
#*  Description:                                                               *
#*                                                                             *
#*******************************************************************************
#*  Chg#    Release  Description                                               *
#*                                                                             *
#*  014590  6.0      New for release 6.0                                       *
#*                                                                             *
#*******************************************************************************

INCLUDE "BF2022-I.s";
INCLUDE "BF2022-O.s";
INCLUDE "BF2022-P.p";
INCLUDE "GenConfrm.f";

PROCESS BF2022T4RSP
{
    STEP Main
    {
        USES PROCESS "GenConfrm";

        # Set up the title strings. 

        STRINGTABLE.IDS_TITLE_BF2022Process -> ProcessTitle;
        STRINGTABLE.IDS_TITLE_BF2022Phase1 -> Phase1Title;
        STRINGTABLE.IDS_TITLE_BF2022Phase2 -> Phase2Title;
        STRINGTABLE.IDS_TITLE_BF2022Phase3 -> Phase3Title;

        # PRNT starts with Phase 2.

        "2" -> InitialState;

        # Set the names of the S and P steps to be used

        "Not Applicable" -> KeyFieldsS;
        "BF2022-I" -> DataInputS;
        "BF2022-P" -> PerformHostEditsP;
        "BF2022-O" -> ConfirmS;
        "BF2022-P" -> UpdateHostP;
    }

    IF action == "ACTION_BACK"
        EXIT;


    BRANCH Main;
}

