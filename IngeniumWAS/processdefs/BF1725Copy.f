# Converted from PathFinder 2.2 to 3.0 on Jun 18, 2004 3:12:06 PM EDT

#*******************************************************************************
#*  Component:   BF1725Copy.f                                                  *
#*  Description:                                                               *
#*                                                                             *
#*******************************************************************************
#*  Chg#    Release  Description                                               *
#*                                                                             *
#*  014590  6.0      New for release 6.0                                       *
#*                                                                             *
#*******************************************************************************

INCLUDE "BF1725-I.s";
INCLUDE "BF1725-O.s";
INCLUDE "BF1725-P.p";
INCLUDE "GenCopy.f";

PROCESS BF1725Copy
{
    STEP Main
    {
        USES PROCESS "GenCopy";
        ATTRIBUTES
        {
            GetMessages = "NO";
        }

        STRINGTABLE.IDS_TITLE_BF1725Copy -> Title;
        "BF1725-I" -> InputS;
        "BF1725-P" -> CopyP;
    }

    IF DisplayInput == "FALSE"
        EXIT;

    IF action == "ACTION_BACK"
        EXIT;


    BRANCH Main;
}

