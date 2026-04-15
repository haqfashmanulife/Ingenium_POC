# Converted from PathFinder 2.2 to 3.0 on Jun 18, 2004 3:12:03 PM EDT

#*******************************************************************************
#*  Component:   BF0181Create.f                                                *
#*  Description:                                                               *
#*                                                                             *
#*******************************************************************************
#*  Chg#    Release  Description                                               *
#*                                                                             *
#*  014590  6.0      New for release 6.0                                       *
#*  017151  6.1.2.J  CODE CLEANUP                                              *
#*                                                                             *
#*******************************************************************************

INCLUDE "BF0180-P.p";
INCLUDE "BF0181-P.p";
INCLUDE "BF0181-I.s";
INCLUDE "BF0182-I.s";
INCLUDE "BF0180-O.s";
INCLUDE "BF0182-P.p";
INCLUDE "GenCreate.f";

PROCESS BF0181Create
{
    STEP Main
    {
        USES PROCESS "GenCreate";
        ATTRIBUTES
        {
            GetMessages = "NO";
        }

        STRINGTABLE.IDS_TITLE_BF0181Create -> Title;
        "BF0181-I" -> InputS;
        "BF0181-P" -> CreateP;
        "BF0180-P" -> RetrieveP;
        "BF0182-I" -> EditS;
        "BF0182-P" -> UpdateP;
        "BF0180-O" -> OutputS;
    }

    IF action == "ACTION_BACK"
        EXIT;

    IF DisplayInput == "FALSE"
        EXIT;


    BRANCH Main;
}

