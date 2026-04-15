# Converted from PathFinder 2.2 to 3.0 on Jun 18, 2004 3:12:07 PM EDT

#*******************************************************************************
#*  Component:   BF8103Delete.f                                                *
#*  Description:                                                               *
#*                                                                             *
#*******************************************************************************
#*  Chg#    Release  Description                                               *
#*                                                                             *
#*  014590  6.0      New for release 6.0                                       *
#*  016071  602J     code fix with pcr fix                                     *
#*                                                                             *
#*******************************************************************************

INCLUDE "BF8100-P.p";
INCLUDE "BF8100-I.s";
INCLUDE "BF8100-O.s";
INCLUDE "BF8103-P.p";
INCLUDE "GenDelete.f";

PROCESS BF8103Delete
{
    STEP Main
    {
        USES PROCESS "GenDelete";
        STRINGTABLE.IDS_TITLE_BF8103Delete -> Title;
        "BF8100-I" -> InputS;
        "BF8100-P" -> RetrieveP;
        "BF8100-O" -> ConfirmS;
        "BF8103-P" -> DeleteP;
        "BF8100-O" -> OutputS;
    }


    # Return To Main Menu

    IF action == "ACTION_BACK"
        EXIT;


    # Return To List

    IF DisplayInput == "FALSE"
        EXIT;


    BRANCH Main;
}

