# Converted from PathFinder 2.2 to 3.0 on Jun 18, 2004 3:12:04 PM EDT

#*******************************************************************************
#*  Component:   BF0892Update.f                                                *
#*  Description:                                                               *
#*                                                                             *
#*******************************************************************************
#*  Chg#    Release  Description                                               *
#*                                                                             *
#*  014590  6.0      New for release 6.0                                       *
#*                                                                             *
#*******************************************************************************

INCLUDE "BF0890-P.p";
INCLUDE "BF0890-I.s";
INCLUDE "BF0892-I.s";
INCLUDE "BF0890-O.s";
INCLUDE "BF0892-P.p";
INCLUDE "GenUpdate.f";

PROCESS BF0892Update
{
    STEP Main
    {
        USES PROCESS "GenUpdate";
        ATTRIBUTES
        {
            GetMessages = "NO";
        }

        STRINGTABLE.IDS_TITLE_BF0892Update -> Title;
        "BF0890-I" -> InputS;
        "BF0890-P" -> RetrieveP;
        "BF0892-I" -> EditS;
        "BF0892-P" -> UpdateP;
        "BF0890-O" -> OutputS;
    }

    IF DisplayInput == "FALSE"
        EXIT;

    IF action == "ACTION_BACK"
        EXIT;


    BRANCH Main;
}

