# Converted from PathFinder 2.2 to 3.0 on Jun 18, 2004 3:12:04 PM EDT

#*******************************************************************************
#*  Component:   BF1081Reset.f                                                 *
#*  Description:                                                               *
#*                                                                             *
#*******************************************************************************
#*  Chg#    Release  Description                                               *
#*                                                                             *
#*  014590  6.0      New for release 6.0                                       *
#*                                                                             *
#*******************************************************************************

INCLUDE "BF1080-P.p";
INCLUDE "BF1080-I.s";
INCLUDE "BF1080-O.s";
INCLUDE "BF1081-P.p";
INCLUDE "GenUpdate.f";

PROCESS BF1081Reset
{
    STEP Main
    {
        USES PROCESS "GenUpdate";
        ATTRIBUTES
        {
            GetMessages = "NO";
        }

        STRINGTABLE.IDS_TITLE_BF1081Reset -> Title;
        "BF1080-I" -> InputS;
        "BF1080-P" -> RetrieveP;
        "BF1080-O" -> EditS;
        "BF1081-P" -> UpdateP;
        "BF1080-O" -> OutputS;
    }

    IF DisplayInput == "FALSE"
        EXIT;

    IF action == "ACTION_BACK"
        EXIT;


    BRANCH Main;
}

