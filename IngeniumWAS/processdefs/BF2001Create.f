# Converted from PathFinder 2.2 to 3.0 on Jun 18, 2004 3:12:06 PM EDT

#*******************************************************************************
#*  Component:   BF2001Create.f                                                *
#*  Description:                                                               *
#*                                                                             *
#*******************************************************************************
#*  Chg#    Release  Description                                               *
#*                                                                             *
#*  014590  6.0      New for release 6.0                                       *
#*                                                                             *
#*******************************************************************************

INCLUDE "BF2000-P.p";
INCLUDE "BF2001-P.p";
INCLUDE "BF2000-I.s";
INCLUDE "BF2002-I.s";
INCLUDE "BF2000-O.s";
INCLUDE "BF2002-P.p";
INCLUDE "GenCreate.f";

PROCESS BF2001Create
{
    STEP Main
    {
        USES PROCESS "GenCreate";
        ATTRIBUTES
        {
            GetMessages = "NO";
        }

        STRINGTABLE.IDS_TITLE_BF2001Create -> Title;
        "BF2000-I" -> InputS;
        "BF2001-P" -> CreateP;
        "BF2000-P" -> RetrieveP;
        "BF2002-I" -> EditS;
        "BF2002-P" -> UpdateP;
        "BF2000-O" -> OutputS;
    }

    IF action == "ACTION_BACK"
        EXIT;

    IF DisplayInput == "FALSE"
        EXIT;


    BRANCH Main;
}

