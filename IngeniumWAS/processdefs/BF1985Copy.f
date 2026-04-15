# Converted from PathFinder 2.2 to 3.0 on Jun 18, 2004 3:12:06 PM EDT

#*******************************************************************************
#*  Component:   BF1985Copy.f                                                  *
#*  Description:                                                               *
#*                                                                             *
#*******************************************************************************
#*  Chg#    Release  Description                                               *
#*                                                                             *
#*  014590  6.0      New for release 6.0                                       *
#*                                                                             *
#*******************************************************************************

INCLUDE "BF1985-I.s";
INCLUDE "BF1985-O.s";
INCLUDE "BF1985-P.p";
INCLUDE "GenCopy.f";

PROCESS BF1985Copy
{
    STEP Main
    {
        USES PROCESS "GenCopy";
        ATTRIBUTES
        {
            GetMessages = "NO";
        }

        STRINGTABLE.IDS_TITLE_BF1985Copy -> Title;
        "BF1985-I" -> InputS;
        "BF1985-P" -> CopyP;
    }


    # Return To Main Menu

    IF action == "ACTION_BACK"
        EXIT;


    # Return To List

    IF DisplayInput == "FALSE"
        EXIT;


    BRANCH Main;
}

