# Converted from PathFinder 2.2 to 3.0 on Jun 18, 2004 3:12:06 PM EDT

#*******************************************************************************
#*  Component:   BF1651Create.f                                                *
#*  Description:                                                               *
#*                                                                             *
#*******************************************************************************
#*  Chg#    Release  Description                                               *
#*                                                                             *
#*  014590  6.0      New for release 6.0                                       *
#*  017151  6.1.2.J  CODE CLEANUP                                              *
#*                                                                             *
#*******************************************************************************

INCLUDE "BF1650-P.p";
INCLUDE "BF1651-P.p";
INCLUDE "BF1651-I.s";
INCLUDE "BF1652-I.s";
INCLUDE "BF1650-O.s";
INCLUDE "BF1652-P.p";
INCLUDE "GenCreate.f";

PROCESS BF1651Create
{
    STEP Main
    {
        USES PROCESS "GenCreate";
        ATTRIBUTES
        {
            GetMessages = "NO";
        }

        STRINGTABLE.IDS_TITLE_BF1651Create -> Title;
        "BF1651-I" -> InputS;
        "BF1651-P" -> CreateP;
        "BF1650-P" -> RetrieveP;
        "BF1652-I" -> EditS;
        "BF1652-P" -> UpdateP;
        "BF1650-O" -> OutputS;
    }

    IF action == "ACTION_BACK"
        EXIT;

    IF DisplayInput == "FALSE"
        EXIT;


    BRANCH Main;
}

