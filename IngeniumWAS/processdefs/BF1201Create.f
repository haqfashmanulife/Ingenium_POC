# Converted from PathFinder 2.2 to 3.0 on Jun 18, 2004 3:12:04 PM EDT

#*******************************************************************************
#*  Component:   BF1201Create.f                                                *
#*  Description:                                                               *
#*                                                                             *
#*******************************************************************************
#*  Chg#    Release  Description                                               *
#*                                                                             *
#*  014590  6.0      New for release 6.0                                       *
#*                                                                             *
#*******************************************************************************

INCLUDE "BF1200-I.s";
INCLUDE "BF1200-P.p";
INCLUDE "BF1201-P.p";
INCLUDE "BF1202-I.s";
INCLUDE "BF1200-O.s";
INCLUDE "BF1202-P.p";
INCLUDE "GenCreate.f";

PROCESS BF1201Create
{
    STEP Main
    {
        USES PROCESS "GenCreate";
        ATTRIBUTES
        {
            GetMessages = "NO";
        }

        STRINGTABLE.IDS_TITLE_BF1201Create -> Title;
        "BF1200-I" -> InputS;
        "BF1201-P" -> CreateP;
        "BF1200-P" -> RetrieveP;
        "BF1202-I" -> EditS;
        "BF1202-P" -> UpdateP;
        "BF1200-O" -> OutputS;
    }

    IF action == "ACTION_BACK"
        EXIT;

    IF DisplayInput == "FALSE"
        EXIT;


    BRANCH Main;
}

