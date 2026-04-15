# Converted from PathFinder 2.2 to 3.0 on Jun 18, 2004 3:12:03 PM EDT

#*******************************************************************************
#*  Component:   BF0612Update.f                                                *
#*  Description:                                                               *
#*                                                                             *
#*******************************************************************************
#*  Chg#    Release  Description                                               *
#*                                                                             *
#*  014590  6.0      New for release 6.0                                       *
#*  017151  6.1.2.J  CODE CLEANUP                                              *
#*                                                                             *
#*******************************************************************************

INCLUDE "BF0610-P.p";
INCLUDE "BF0610-I.s";
INCLUDE "BF0612-I.s";
INCLUDE "BF0610-O.s";
INCLUDE "BF0612-P.p";
INCLUDE "GenUpdate.f";

PROCESS BF0612Update
{
    STEP Main
    {
        USES PROCESS "GenUpdate";
        ATTRIBUTES
        {
            GetMessages = "NO";
        }

        STRINGTABLE.IDS_TITLE_BF0612Update -> Title;
        "BF0610-I" -> InputS;
        "BF0610-P" -> RetrieveP;
        "BF0612-I" -> EditS;
        "BF0612-P" -> UpdateP;
        "BF0610-O" -> OutputS;
    }

    IF DisplayInput == "FALSE"
        EXIT;

    IF action == "ACTION_BACK"
        EXIT;


    BRANCH Main;
}

