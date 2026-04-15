# Converted from PathFinder 2.2 to 3.0 on Jun 18, 2004 3:12:05 PM EDT

#*******************************************************************************
#*  Component:   BF9E42Revrsmat.f                                              *
#*  Description: Maturity Reversal Process                                     *
#*                                                                             *
#*******************************************************************************
#*  Chg#    Release  Description                                               *
#*                                                                             *
#*  23802H  CTS      INITIAL VERSION                                           *
#*******************************************************************************

INCLUDE "BF9E42-I.s";
INCLUDE "BF9E42-O.s";
INCLUDE "BF9E42-P.p";
INCLUDE "GenConfrm.f";

PROCESS BF9E42Revrsmat
{
    STEP Main
    {
        USES PROCESS "GenConfrm";

        # Set up the title strings. 

        STRINGTABLE.IDS_TITLE_BF9E42Process -> ProcessTitle;
        STRINGTABLE.IDS_TITLE_BF9E42Phase1 -> Phase1Title;
        STRINGTABLE.IDS_TITLE_BF9E42Phase2 -> Phase2Title;
        STRINGTABLE.IDS_TITLE_BF9E42Phase3 -> Phase3Title;

        # SERV starts with Phase 2.

        "2" -> InitialState;

        # Set the names of the S and P steps to be used

        "Not Applicable" -> KeyFieldsS;
        "BF9E42-P" -> GetInitialHostDataP;
        "BF9E42-I" -> DataInputS;
        "BF9E42-P" -> PerformHostEditsP;
        "BF9E42-O" -> ConfirmS;
        "BF9E42-P" -> UpdateHostP;
    }

    IF action == "ACTION_BACK"
        EXIT;


    BRANCH Main;
}

