# Converted from PathFinder 2.2 to 3.0 on Jun 18, 2004 3:12:06 PM EDT

#*******************************************************************************
#*  Component:   BF1811Create.f                                                *
#*  Description:                                                               *
#*                                                                             *
#*******************************************************************************
#*  Chg#    Release  Description                                               *
#*                                                                             *
#*  014590  6.0      New for release 6.0                                       *
#*  017151  6.1.2.J  CODE CLEANUP                                              *
#*                                                                             *
#*******************************************************************************

INCLUDE "BF1810-P.p";
INCLUDE "BF1811-P.p";
INCLUDE "BF1811-I.s";
INCLUDE "BF1812-I.s";
INCLUDE "BF1810-O.s";
INCLUDE "BF1812-P.p";
INCLUDE "GenCreate.f";

PROCESS BF1811Create
{
    STEP Main
    {
        USES PROCESS "GenCreate";
        ATTRIBUTES
        {
            GetMessages = "NO";
        }

        STRINGTABLE.IDS_TITLE_BF1811Create -> Title;
        "BF1811-I" -> InputS;
        "BF1811-P" -> CreateP;
        "BF1810-P" -> RetrieveP;
        "BF1812-I" -> EditS;
        "BF1812-P" -> UpdateP;
        "BF1810-O" -> OutputS;
    }

    IF action == "ACTION_BACK"
        EXIT;

    IF DisplayInput == "FALSE"
        EXIT;


    BRANCH Main;
}

