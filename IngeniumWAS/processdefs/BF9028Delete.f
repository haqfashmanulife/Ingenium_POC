# Converted from PathFinder 2.2 to 3.0 on Jun 18, 2004 3:12:07 PM EDT

#*******************************************************************************
#*  Component:   BF9028Delete.f                                                *
#*  Description:                                                               *
#*                                                                             *
#*******************************************************************************
#*  Chg#    Release  Description                                               *
#*                                                                             *
#*  B00317  01AUG01  Module created                                            *
#*                                                                             *
#*******************************************************************************

INCLUDE "BF9025-P.p";
INCLUDE "BF9025-I.s";
INCLUDE "BF9025-O.s";
INCLUDE "BF9028-P.p";
INCLUDE "GenDelete.f";

PROCESS BF9028Delete
{
    STEP Main
    {
        USES PROCESS "GenDelete";
        STRINGTABLE.IDS_TITLE_BF9028Delete -> Title;
        "BF9025-I" -> InputS;
        "BF9025-P" -> RetrieveP;
        "BF9025-O" -> ConfirmS;
        "BF9028-P" -> DeleteP;
        "BF9025-O" -> OutputS;
    }

    IF action == "ACTION_BACK"

        # Return To Main Menu

        EXIT;


    # Return To List

    IF DisplayInput == "FALSE"
        EXIT;


    BRANCH Main;
}

