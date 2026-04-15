# Converted from PathFinder 2.2 to 3.0 on Jun 18, 2004 3:12:03 PM EDT

#*******************************************************************************
#*  Component:   BF0236Paid.f                                                  *
#*  Description:                                                               *
#*                                                                             *
#*******************************************************************************
#*  Chg#    Release  Description                                               *
#*                                                                             *
#*  014590  6.0      New for release 6.0                                       *
#*  016736  611J     Code cleanup                                              *
#*                                                                             *
#*******************************************************************************

INCLUDE "BF0236-I.s";
INCLUDE "BF0236-O.s";
INCLUDE "BF0236-P.p";
INCLUDE "GenConfrm.f";

PROCESS BF0236Paid
{
    STEP Main
    {
        USES PROCESS "GenConfrm";

        # Set up the title strings. 

        STRINGTABLE.IDS_TITLE_BF0236Process -> ProcessTitle;
        STRINGTABLE.IDS_TITLE_BF0236Phase1 -> Phase1Title;
        STRINGTABLE.IDS_TITLE_BF0236Phase2 -> Phase2Title;
        STRINGTABLE.IDS_TITLE_BF0236Phase3 -> Phase3Title;

        # PPay starts with Phase 2.

        "2" -> InitialState;

        # Set the names of the S and P steps to be used

        "Not Applicable" -> KeyFieldsS;
        "BF0236-P" -> GetInitialHostDataP;
        "BF0236-I" -> DataInputS;
        "BF0236-P" -> PerformHostEditsP;
        "BF0236-O" -> ConfirmS;
        "BF0236-P" -> UpdateHostP;
    }

    IF action == "ACTION_BACK"
        EXIT;


    BRANCH Main;
}

