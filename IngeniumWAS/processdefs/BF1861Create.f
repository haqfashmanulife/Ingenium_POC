# Converted from PathFinder 2.2 to 3.0 on Jun 18, 2004 3:12:06 PM EDT

#*******************************************************************************
#*  Component:   BF1861Create.f                                                *
#*  Description:                                                               *
#*                                                                             *
#*******************************************************************************
#*  Chg#    Release  Description                                               *
#*                                                                             *
#*  014590  6.0      New for release 6.0                                       *
#*  017151  6.1.2.J  CODE CLEANUP                                              *
#*                                                                             *
#*******************************************************************************

INCLUDE "BF1860-P.p";
INCLUDE "BF1861-P.p";
INCLUDE "BF1861-I.s";
INCLUDE "BF1862-I.s";
INCLUDE "BF1860-O.s";
INCLUDE "BF1862-P.p";
INCLUDE "GenCreate.f";

PROCESS BF1861Create
{
    STEP Main
    {
        USES PROCESS "GenCreate";
        ATTRIBUTES
        {
            GetMessages = "NO";
        }

        STRINGTABLE.IDS_TITLE_BF1861Create -> Title;
        "BF1861-I" -> InputS;
        "BF1861-P" -> CreateP;
        "BF1860-P" -> RetrieveP;
        "BF1862-I" -> EditS;
        "BF1862-P" -> UpdateP;
        "BF1860-O" -> OutputS;
    }

    IF action == "ACTION_BACK"
        EXIT;

    IF DisplayInput == "FALSE"
        EXIT;


    BRANCH Main;
}

