# Converted from PathFinder 2.2 to 3.0 on Jun 18, 2004 3:12:03 PM EDT

#*******************************************************************************
#*  Component:   BF0635Srrevrs.f                                               *
#*  Description:                                                               *
#*                                                                             *
#*******************************************************************************
#*  Chg#    Release  Description                                               *
#*                                                                             *
#*  014590  6.0      New for release 6.0                                       *
#*                                                                             *
#*******************************************************************************

INCLUDE "BF0635-I.s";
INCLUDE "BF0635-O.s";
INCLUDE "BF0635-P.p";
INCLUDE "GenConfrm.f";

PROCESS BF0635Srrevrs
{
    STEP Main
    {
        USES PROCESS "GenConfrm";

        # Set up the title strings. 

        STRINGTABLE.IDS_TITLE_BF0635Process -> ProcessTitle;
        STRINGTABLE.IDS_TITLE_BF0635Phase1 -> Phase1Title;
        STRINGTABLE.IDS_TITLE_BF0635Phase2 -> Phase2Title;
        STRINGTABLE.IDS_TITLE_BF0635Phase3 -> Phase3Title;

        # Srrevrs starts with Phase 2.

        "2" -> InitialState;

        # Set the names of the S and P steps to be used

        "Not Applicable" -> KeyFieldsS;
        "BF0635-I" -> DataInputS;
        "BF0635-P" -> PerformHostEditsP;
        "BF0635-O" -> ConfirmS;
        "BF0635-P" -> UpdateHostP;
    }

    IF action == "ACTION_BACK"
        EXIT;


    BRANCH Main;
}

