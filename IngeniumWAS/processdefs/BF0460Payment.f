# Converted from PathFinder 2.2 to 3.0 on Jun 18, 2004 3:12:03 PM EDT

#*******************************************************************************
#*  Component:   BF0460Payment.f                                               *
#*  Description:                                                               *
#*                                                                             *
#*******************************************************************************
#*  Chg#    Release  Description                                               *
#*                                                                             *
#*  014590  6.0      New for release 6.0                                       *
#*                                                                             *
#*******************************************************************************

INCLUDE "BF0460-I.s";
INCLUDE "BF0460-O.s";
INCLUDE "BF0460-P.p";
INCLUDE "GenConfrm.f";

PROCESS BF0460Payment
{
#FFF10R CHANGES START HERE     
    MIR-PRCES-CRCY-CD = "JP";
    MIR-GLOB-CRCY-CD = "JP";
#FFF10R CHANGES END HERE 
    STEP Main
    {
        USES PROCESS "GenConfrm";

        # Set up the title strings. 

        STRINGTABLE.IDS_TITLE_BF0460Process -> ProcessTitle;
        STRINGTABLE.IDS_TITLE_BF0460Phase1 -> Phase1Title;
        STRINGTABLE.IDS_TITLE_BF0460Phase2 -> Phase2Title;
        STRINGTABLE.IDS_TITLE_BF0460Phase3 -> Phase3Title;

        # PPay starts with Phase 2.

        "2" -> InitialState;

        # Set the names of the S and P steps to be used

        "Not Applicable" -> KeyFieldsS;
        "BF0460-P" -> GetInitialHostDataP;
        "BF0460-I" -> DataInputS;
        "BF0460-P" -> PerformHostEditsP;
        "BF0460-O" -> ConfirmS;
        "BF0460-P" -> UpdateHostP;
    }

    IF action == "ACTION_BACK"
        EXIT;


    BRANCH Main;
}

