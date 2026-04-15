# Converted from PathFinder 2.2 to 3.0 on Jun 18, 2004 3:12:07 PM EDT

#*******************************************************************************
#*  Component:   BF9085Reset.f                                                 *
#*  Description:                                                               *
#*                                                                             *
#*******************************************************************************
#*  Chg#    Release  Description                                               *
#*                                                                             *
#*  B00554  01AUG01  Module created                                            *
#*                                                                             *
#*******************************************************************************

INCLUDE "BF9085-I.s";
INCLUDE "BF9085-O.s";
INCLUDE "BF9085-P.p";
INCLUDE "GenConfrm.f";

PROCESS BF9085Reset
{
    STEP Main
    {
        USES PROCESS "GenConfrm";

        # Set up the title strings. 

        STRINGTABLE.IDS_TITLE_BF9085Reset -> ProcessTitle;
        STRINGTABLE.IDS_TITLE_BF9085Reset -> Phase2Title;
        STRINGTABLE.IDS_TITLE_BF9085Reset -> Phase3Title;

        # PPay starts with Phase 2.

        "2" -> InitialState;

        # Set the names of the S and P steps to be used

        "Not Applicable" -> KeyFieldsS;
        "BF9085-P" -> GetInitialHostDataP;
        "BF9085-I" -> DataInputS;
        "BF9085-P" -> PerformHostEditsP;
        "BF9085-O" -> ConfirmS;
        "BF9085-P" -> UpdateHostP;
    }

    IF action == "ACTION_BACK"
        EXIT;


    BRANCH Main;
}

