# Converted from PathFinder 2.2 to 3.0 on Jun 18, 2004 3:12:06 PM EDT

#*******************************************************************************
#*  Component:   BF2031Create.f                                                *
#*  Description:                                                               *
#*                                                                             *
#*******************************************************************************
#*  Chg#    Release  Description                                               *
#*                                                                             *
#*  014590  6.0      New for release 6.0                                       *
#*  017151  6.1.2.J  CODE CLEANUP                                              *
#*                                                                             *
#*******************************************************************************

INCLUDE "BF2030-P.p";
INCLUDE "BF2031-P.p";
INCLUDE "BF2031-I.s";
INCLUDE "BF2032-I.s";
INCLUDE "BF2030-O.s";
INCLUDE "BF2032-P.p";
INCLUDE "GenCreate.f";

PROCESS BF2031Create
{
    STEP Main
    {
        USES PROCESS "GenCreate";
        ATTRIBUTES
        {
            GetMessages = "NO";
        }

        STRINGTABLE.IDS_TITLE_BF2031Create -> Title;
        "BF2031-I" -> InputS;
        "BF2031-P" -> CreateP;
        "BF2030-P" -> RetrieveP;
        "BF2032-I" -> EditS;
        "BF2032-P" -> UpdateP;
        "BF2030-O" -> OutputS;
    }

    IF action == "ACTION_BACK"
        EXIT;

    IF DisplayInput == "FALSE"
        EXIT;


    BRANCH Main;
}

