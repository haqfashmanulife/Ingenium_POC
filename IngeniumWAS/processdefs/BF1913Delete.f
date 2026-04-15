# Converted from PathFinder 2.2 to 3.0 on Jun 18, 2004 3:12:06 PM EDT

#*******************************************************************************
#*  Component:   BF1913Delete.f                                                *
#*  Description:                                                               *
#*                                                                             *
#*******************************************************************************
#*  Chg#    Release  Description                                               *
#*                                                                             *
#*  014590  6.0      New for release 6.0                                       *
#*                                                                             *
#*******************************************************************************

INCLUDE "BF1910-P.p";
INCLUDE "BF1910-I.s";
INCLUDE "BF1910-O.s";
INCLUDE "BF1913-O.s";
INCLUDE "BF1913-P.p";
INCLUDE "GenDelete.f";

PROCESS BF1913Delete
{
    STEP Main
    {
        USES PROCESS "GenDelete";
        STRINGTABLE.IDS_TITLE_BF1913Delete -> Title;
        "BF1910-I" -> InputS;
        "BF1910-P" -> RetrieveP;
        "BF1910-O" -> ConfirmS;
        "BF1913-P" -> DeleteP;
        "BF1913-O" -> OutputS;
    }


    # Return To Main Menu

    IF action == "ACTION_BACK"
        EXIT;


    # Return To List

    IF DisplayInput == "FALSE"
        EXIT;


    BRANCH Main;
}

