#*******************************************************************************
#*  Component:   BF9933Delete.f                                                *
#*  Description:   Adjudicator ID Delete                                       *
#*                                                                             *
#*******************************************************************************
#*  Chg#    Release  Description                                               *
#*                                                                             *
#*  EN000388  CTS   INITIAL VERSION                                            *
#*                                                                             *
#*******************************************************************************



INCLUDE "BF9930-P.p";
INCLUDE "BF9930-I.s";
INCLUDE "BF9930-O.s";
INCLUDE "BF9933-O.s";
INCLUDE "BF9933-P.p";
INCLUDE "GenDelete.f";

PROCESS BF9933Delete
{
    STEP Main
    {
        USES PROCESS "GenDelete";
        STRINGTABLE.IDS_TITLE_BF9933Delete -> Title;
        "BF9930-I" -> InputS;
        "BF9930-P" -> RetrieveP;
        "BF9930-O" -> ConfirmS;
        "BF9933-P" -> DeleteP;
        "BF9933-O" -> OutputS;
    }


    # Return To Main Menu

    IF action == "ACTION_BACK"
        EXIT;


    # Return To List

    IF DisplayInput == "FALSE"
        EXIT;


    BRANCH Main;
}
