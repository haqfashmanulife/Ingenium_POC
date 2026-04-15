# Converted from PathFinder 2.2 to 3.0 on Jun 18, 2004 3:12:06 PM EDT

#*******************************************************************************
#*  Component:   BF1851Create.f                                                *
#*  Description:                                                               *
#*                                                                             *
#*******************************************************************************
#*  Chg#    Release  Description                                               *
#*                                                                             *
#*  014590  6.0      New for release 6.0                                       *
#*  017151  6.1.2.J  CODE CLEANUP                                              *
#*                                                                             *
#*******************************************************************************

INCLUDE "BF1850-P.p";
INCLUDE "BF1851-P.p";
INCLUDE "BF1851-I.s";
INCLUDE "BF1852-I.s";
INCLUDE "BF1850-O.s";
INCLUDE "BF1852-P.p";
INCLUDE "GenCreate.f";

PROCESS BF1851Create
{
    STEP Main
    {
        USES PROCESS "GenCreate";
        ATTRIBUTES
        {
            GetMessages = "NO";
        }

        STRINGTABLE.IDS_TITLE_BF1851Create -> Title;
        "BF1851-I" -> InputS;
        "BF1851-P" -> CreateP;
        "BF1850-P" -> RetrieveP;
        "BF1852-I" -> EditS;
        "BF1852-P" -> UpdateP;
        "BF1850-O" -> OutputS;
    }

    IF action == "ACTION_BACK"
        EXIT;

    IF DisplayInput == "FALSE"
        EXIT;


    BRANCH Main;
}

