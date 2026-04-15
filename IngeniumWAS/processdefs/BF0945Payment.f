# Converted from PathFinder 2.2 to 3.0 on Jun 18, 2004 3:12:04 PM EDT

#*******************************************************************************
#*  Component:   BF0945Payment.f                                               *
#*  Description:                                                               *
#*                                                                             *
#*******************************************************************************
#*  Chg#    Release  Description                                               *
#*                                                                             *
#*  014590  6.0      New for release 6.0                                       *
#*                                                                             *
#*******************************************************************************

INCLUDE "BF0945-I.s";
INCLUDE "BF0945-O.s";
INCLUDE "BF0945-P.p";
INCLUDE "GenConfrm.f";

PROCESS BF0945Payment
{
    STEP Main
    {
        USES PROCESS "GenConfrm";

        # Set up the title strings. 

        STRINGTABLE.IDS_TITLE_BF0945Payment -> ProcessTitle;
        STRINGTABLE.IDS_TITLE_BF0945Payment -> Phase1Title;
        STRINGTABLE.IDS_TITLE_BF0945Payment -> Phase2Title;
        STRINGTABLE.IDS_TITLE_BF0945Payment -> Phase3Title;

        # Set the names of the S and P steps to be used

        "BF0945-I" -> KeyFieldsS;
        "BF0945-P" -> GetInitialHostDataP;
        "BF0945-I" -> DataInputS;
        "BF0945-P" -> PerformHostEditsP;
        "BF0945-O" -> ConfirmS;
        "BF0945-P" -> UpdateHostP;
        "2" -> InitialState;
    }

    IF action == "ACTION_BACK"
        EXIT;


    BRANCH Main;
}

