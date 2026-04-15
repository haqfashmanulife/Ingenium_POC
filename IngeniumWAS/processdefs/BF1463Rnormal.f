# Converted from PathFinder 2.2 to 3.0 on Jun 18, 2004 3:12:05 PM EDT

#*******************************************************************************
#*  Component:   BF1463Rnormal.f                                               *
#*  Description:                                                               *
#*                                                                             *
#*******************************************************************************
#*  Chg#    Release  Description                                               *
#*                                                                             *
#*  014590  6.0      New for release 6.0                                       *
#*  R15582  CTS      AUDIT LOG RELATED CHANGES                                 *
#*                                                                             *
#*******************************************************************************

INCLUDE "BF1463-I.s";
INCLUDE "BF1463-O.s";
INCLUDE "BF1463-P.p";
#R15582 CHANGES BEGIN
#INCLUDE "GenConfrm.f";
INCLUDE "GenConfrmAud.f";
#R15582 CHANGES END

PROCESS BF1463Rnormal
{
    STEP Main
    {
        #USES PROCESS "GenConfrm";
        USES PROCESS "GenConfrmAud";

        # Set up the title strings. 

        STRINGTABLE.IDS_TITLE_BF1463Process -> ProcessTitle;
        STRINGTABLE.IDS_TITLE_BF1463Phase1 -> Phase1Title;
        STRINGTABLE.IDS_TITLE_BF1463Phase2 -> Phase2Title;
        STRINGTABLE.IDS_TITLE_BF1463Phase3 -> Phase3Title;

        # TERM starts with Phase 2.

        "2" -> InitialState;

        # Set the names of the S and P steps to be used

        "Not Applicable" -> KeyFieldsS;
        "BF1463-P" -> GetInitialHostDataP;
        "BF1463-I" -> DataInputS;
        "BF1463-P" -> PerformHostEditsP;
        "BF1463-O" -> ConfirmS;
        "BF1463-P" -> UpdateHostP;
    }

    IF action == "ACTION_BACK"
        EXIT;


    BRANCH Main;
}

