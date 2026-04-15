# Converted from PathFinder 2.2 to 3.0 on Jun 18, 2004 3:12:07 PM EDT

#*******************************************************************************
#*  Component:   BF9080Cancel.f                                               *
#*  Description:                                                               *
#*                                                                             *
#*******************************************************************************
#*  Chg#    Release  Description                                               *
#*                                                                             *
#*  B00554  01AUG01  Module created                                            *
#*                                                                             *
#*******************************************************************************

INCLUDE "BF9080-I.s";
INCLUDE "BF9080-O.s";
INCLUDE "BF9080-P.p";
INCLUDE "GenConfrm.f";

PROCESS BF9080Cancel
{
    STEP Main
    {
        USES PROCESS "GenConfrm";

        # Set up the title strings. 

        STRINGTABLE.IDS_TITLE_BF9080Cancel -> ProcessTitle;
        STRINGTABLE.IDS_TITLE_BF9080Cancel -> Phase2Title;
        STRINGTABLE.IDS_TITLE_BF9080Cancel -> Phase3Title;

        # PPay starts with Phase 2.

        "2" -> InitialState;

        # Set the names of the S and P steps to be used

        "Not Applicable" -> KeyFieldsS;
        "BF9080-P" -> GetInitialHostDataP;
        "BF9080-I" -> DataInputS;
        "BF9080-P" -> PerformHostEditsP;
        "BF9080-O" -> ConfirmS;
        "BF9080-P" -> UpdateHostP;
    }

    IF action == "ACTION_BACK"
        EXIT;


    BRANCH Main;
}

