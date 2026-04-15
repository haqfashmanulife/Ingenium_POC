# Converted from PathFinder 2.2 to 3.0 on Jun 18, 2004 3:12:06 PM EDT

#*******************************************************************************
#*  Component:   BF1911Create.f                                                *
#*  Description:                                                               *
#*                                                                             *
#*******************************************************************************
#*  Chg#    Release  Description                                               *
#*                                                                             *
#*  014590  6.0      New for release 6.0                                       *
#*  017151  6.1.2.J  CODE CLEANUP                                              *
#*                                                                             *
#*******************************************************************************

INCLUDE "BF1910-P.p";
INCLUDE "BF1911-P.p";
INCLUDE "BF1911-I.s";
INCLUDE "BF1912-I.s";
INCLUDE "BF1910-O.s";
INCLUDE "BF1912-P.p";
INCLUDE "GenCreate.f";

PROCESS BF1911Create
{
    STEP Main
    {
        USES PROCESS "GenCreate";
        ATTRIBUTES
        {
            GetMessages = "NO";
        }

        STRINGTABLE.IDS_TITLE_BF1911Create -> Title;
        "BF1911-I" -> InputS;
        "BF1911-P" -> CreateP;
        "BF1910-P" -> RetrieveP;
        "BF1912-I" -> EditS;
        "BF1912-P" -> UpdateP;
        "BF1910-O" -> OutputS;
    }

    IF action == "ACTION_BACK"
        EXIT;

    IF DisplayInput == "FALSE"
        EXIT;


    BRANCH Main;
}

