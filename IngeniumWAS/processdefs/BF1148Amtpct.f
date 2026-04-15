# Converted from PathFinder 2.2 to 3.0 on Jun 18, 2004 3:12:04 PM EDT

#*******************************************************************************
#*  Component:   BF1148Amtpct.f                                                *
#*  Description:                                                               *
#*                                                                             *
#*******************************************************************************
#*  Chg#    Release  Description                                               *
#*                                                                             *
#*  014590  6.0      New for release 6.0                                       *
#*  016736  6.1.1J   Code Cleanup - fixed Phase 3 title                        *
#*                                                                             *
#*******************************************************************************

INCLUDE "BF1147Key-I.s";
INCLUDE "BF1148-I.s";
INCLUDE "BF1147-O.s";
INCLUDE "BF1148-P.p";
INCLUDE "GenConfrm.f";

PROCESS BF1148Amtpct
{
    STEP Main
    {
        USES PROCESS "GenConfrm";
        STRINGTABLE.IDS_TITLE_BF1148Amtpct -> ProcessTitle;
        STRINGTABLE.IDS_TITLE_BF1148Amtpct -> Phase1Title;
        STRINGTABLE.IDS_TITLE_BF1148Amtpct -> Phase2Title;
        STRINGTABLE.IDS_TITLE_BF1148Amtpct -> Phase3Title;
        "BF1147Key-I" -> KeyFieldsS;
        "BF1148-I" -> DataInputS;
        "BF1147-O" -> ConfirmS;
        "BF1148-P" -> GetInitialHostDataP;
        "BF1148-P" -> PerformHostEditsP;
        "BF1148-P" -> UpdateHostP;
    }

    IF action == "ACTION_BACK"
        EXIT;


    BRANCH Main;
}

