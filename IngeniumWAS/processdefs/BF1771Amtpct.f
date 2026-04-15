# Converted from PathFinder 2.2 to 3.0 on Jun 18, 2004 3:12:06 PM EDT

#*******************************************************************************
#*  Component:   BF1771Amtpct.f                                                *
#*  Description:                                                               *
#*                                                                             *
#*******************************************************************************
#*  Chg#    Release  Description                                               *
#*                                                                             *
#*  014590  6.0      New for release 6.0                                       *
#*                                                                             *
#*******************************************************************************

INCLUDE "BF1771Key-I.s";
INCLUDE "BF1771Data-I.s";
INCLUDE "BF1771-O.s";
INCLUDE "BF1771-P.p";
INCLUDE "GenConfrm.f";

PROCESS BF1771Amtpct
{
    STEP Main
    {
        USES PROCESS "GenConfrm";

        # Set up the title strings. 

        STRINGTABLE.IDS_TITLE_BF1771Process -> ProcessTitle;
        STRINGTABLE.IDS_TITLE_BF1771Phase1 -> Phase1Title;
        STRINGTABLE.IDS_TITLE_BF1771Phase2 -> Phase2Title;
        STRINGTABLE.IDS_TITLE_BF1771Phase3 -> Phase3Title;

        # FTRS starts with Phase 1.

        "1" -> InitialState;

        # Set the names of the S and P steps to be used

        "BF1771Key-I" -> KeyFieldsS;
        "BF1771-P" -> GetInitialHostDataP;
        "BF1771Data-I" -> DataInputS;
        "BF1771-P" -> PerformHostEditsP;
        "BF1771-O" -> ConfirmS;
        "BF1771-P" -> UpdateHostP;
    }

    IF action == "ACTION_BACK"
        EXIT;


    BRANCH Main;
}

