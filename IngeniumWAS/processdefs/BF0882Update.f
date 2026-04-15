# Converted from PathFinder 2.2 to 3.0 on Jun 18, 2004 3:12:04 PM EDT

#*******************************************************************************
#*  Component:   BF0882Update.f                                                *
#*  Description:                                                               *
#*                                                                             *
#*******************************************************************************
#*  Chg#    Release  Description                                               *
#*                                                                             *
#*  014590  6.0      New for release 6.0                                       *
#*                                                                             *
#*******************************************************************************

INCLUDE "BF0880-P.p";
INCLUDE "BF0880-I.s";
INCLUDE "BF0882-I.s";
INCLUDE "BF0880-O.s";
INCLUDE "BF0882-P.p";
INCLUDE "GenUpdate.f";

PROCESS BF0882Update
{
    STEP Main
    {
        USES PROCESS "GenUpdate";
        ATTRIBUTES
        {
            GetMessages = "NO";
        }

        STRINGTABLE.IDS_TITLE_BF0882Update -> Title;
        "BF0880-I" -> InputS;
        "BF0880-P" -> RetrieveP;
        "BF0882-I" -> EditS;
        "BF0882-P" -> UpdateP;
        "BF0880-O" -> OutputS;
    }

    IF DisplayInput == "FALSE"
        EXIT;

    IF action == "ACTION_BACK"
        EXIT;


    BRANCH Main;
}

