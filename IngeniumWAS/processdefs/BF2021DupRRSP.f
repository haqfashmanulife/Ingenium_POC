# Converted from PathFinder 2.2 to 3.0 on Jun 18, 2004 3:12:06 PM EDT

#*******************************************************************************
#*  Component:   BF2021DupRRSP.f                                               *
#*  Description:                                                               *
#*                                                                             *
#*******************************************************************************
#*  Chg#    Release  Description                                               *
#*                                                                             *
#*  014590  6.0      New for release 6.0                                       *
#*                                                                             *
#*******************************************************************************

INCLUDE "BF2021-I.s";
INCLUDE "BF2021-O.s";
INCLUDE "BF2021-P.p";
INCLUDE "GenConfrm.f";

PROCESS BF2021DupRRSP
{
    STEP Main
    {
        USES PROCESS "GenConfrm";

        # Set up the title strings. 

        STRINGTABLE.IDS_TITLE_BF2021Process -> ProcessTitle;
        STRINGTABLE.IDS_TITLE_BF2021Phase1 -> Phase1Title;
        STRINGTABLE.IDS_TITLE_BF2021Phase2 -> Phase2Title;
        STRINGTABLE.IDS_TITLE_BF2021Phase3 -> Phase3Title;

        # PRNT starts with Phase 2.

        "2" -> InitialState;

        # Set the names of the S and P steps to be used

        "Not Applicable" -> KeyFieldsS;
        "BF2021-I" -> DataInputS;
        "BF2021-P" -> PerformHostEditsP;
        "BF2021-O" -> ConfirmS;
        "BF2021-P" -> UpdateHostP;
    }

    IF action == "ACTION_BACK"
        EXIT;


    BRANCH Main;
}

