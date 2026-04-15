# Converted from PathFinder 2.2 to 3.0 on Jun 18, 2004 3:12:06 PM EDT

#*******************************************************************************
#*  Component:   BF2011Create.f                                                *
#*  Description:                                                               *
#*                                                                             *
#*******************************************************************************
#*  Chg#    Release  Description                                               *
#*                                                                             *
#*  014590  6.0      New for release 6.0                                       *
#*  017151  612J     Code Clean-up: chgd upd output step to ret output step    *
#*                                                                             *
#*******************************************************************************

INCLUDE "BF2010-P.p";
INCLUDE "BF2011-P.p";
INCLUDE "BF2011-I.s";
INCLUDE "BF2012-I.s";
INCLUDE "BF2010-O.s";
INCLUDE "BF2012-P.p";
INCLUDE "GenCreate.f";

PROCESS BF2011Create
{
    STEP Main
    {
        USES PROCESS "GenCreate";
        ATTRIBUTES
        {
            GetMessages = "NO";
        }

        STRINGTABLE.IDS_TITLE_BF2011Create -> Title;
        "BF2011-I" -> InputS;
        "BF2011-P" -> CreateP;
        "BF2010-P" -> RetrieveP;
        "BF2012-I" -> EditS;
        "BF2012-P" -> UpdateP;
        "BF2010-O" -> OutputS;
    }

    IF action == "ACTION_BACK"
        EXIT;

    IF DisplayInput == "FALSE"
        EXIT;


    BRANCH Main;
}

