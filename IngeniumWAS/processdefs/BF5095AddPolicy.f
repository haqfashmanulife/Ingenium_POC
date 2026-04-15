# Converted from PathFinder 2.2 to 3.0 on Jun 18, 2004 3:12:07 PM EDT

#*******************************************************************************
#*  Component:   BF5095AddPolicy.f                                             *
#*  Description:                                                               *
#*                                                                             *
#*******************************************************************************
#*  Chg#    Release  Description                                               *
#*                                                                             *
#*  014590  6.0      New for release 6.0                                       *
#*                                                                             *
#*******************************************************************************

INCLUDE "BF5100-P.p";
INCLUDE "BF5095-P.p";
INCLUDE "BF5095-I.s";
INCLUDE "BF5102-I.s";
INCLUDE "BF5100-O.s";
INCLUDE "BF5102-P.p";
INCLUDE "GenCreate.f";

PROCESS BF5095AddPolicy
{
    STEP Main
    {
        USES PROCESS "GenCreate";
        ATTRIBUTES
        {
            GetMessages = "NO";
        }

        STRINGTABLE.IDS_TITLE_BF5095AddPolicy -> Title;
        "BF5095-I" -> InputS;
        "BF5095-P" -> CreateP;
        "BF5100-P" -> RetrieveP;
        "BF5102-I" -> EditS;
        "BF5102-P" -> UpdateP;
        "BF5100-O" -> OutputS;
    }

    IF DisplayInput == "FALSE"
        EXIT;

    IF action == "ACTION_BACK"
        EXIT;


    BRANCH Main;
}

