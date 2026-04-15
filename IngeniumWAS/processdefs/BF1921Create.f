# Converted from PathFinder 2.2 to 3.0 on Jun 18, 2004 3:12:06 PM EDT

#*******************************************************************************
#*  Component:   BF1921Create.f                                                *
#*  Description:                                                               *
#*                                                                             *
#*******************************************************************************
#*  Chg#    Release  Description                                               *
#*                                                                             *
#*  014590  6.0      New for release 6.0                                       *
#*                                                                             *
#*******************************************************************************

INCLUDE "BF1921-I.s";
INCLUDE "BF1921-P.p";
INCLUDE "BF1920-P.p";
INCLUDE "BF1922-I.s";
INCLUDE "BF1920-O.s";
INCLUDE "BF1922-P.p";
INCLUDE "GenCreate.f";

PROCESS BF1921Create
{
    STEP Main
    {
        USES PROCESS "GenCreate";
        ATTRIBUTES
        {
            GetMessages = "NO";
        }

        STRINGTABLE.IDS_TITLE_BF1921Create -> Title;
        "BF1921-I" -> InputS;
        "BF1921-P" -> CreateP;
        "BF1920-P" -> RetrieveP;
        "BF1922-I" -> EditS;
        "BF1922-P" -> UpdateP;
        "BF1920-O" -> OutputS;
    }

    IF action == "ACTION_BACK"
        EXIT;

    IF DisplayInput == "FALSE"
        EXIT;


    BRANCH Main;
}

