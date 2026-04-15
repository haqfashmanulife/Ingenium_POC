# Converted from PathFinder 2.2 to 3.0 on Jun 18, 2004 3:12:07 PM EDT

#*******************************************************************************
#*  Component:   BF8101Create.f                                                *
#*  Description:                                                               *
#*                                                                             *
#*******************************************************************************
#*  Chg#    Release  Description                                               *
#*                                                                             *
#*  014590  6.0      New for release 6.0                                       *
#*  016071  602J     code fix with pcr fix                                     *
#*                                                                             *
#*******************************************************************************

INCLUDE "BF8100-P.p";
INCLUDE "BF8101-P.p";
INCLUDE "BF8100-I.s";
INCLUDE "BF8102-I.s";
INCLUDE "BF8100-O.s";
INCLUDE "BF8102-P.p";
INCLUDE "GenCreate.f";

PROCESS BF8101Create
{
    STEP Main
    {
        USES PROCESS "GenCreate";
        ATTRIBUTES
        {
            GetMessages = "NO";
        }

        STRINGTABLE.IDS_TITLE_BF8101Create -> Title;
        "BF8100-I" -> InputS;
        "BF8101-P" -> CreateP;
        "BF8100-P" -> RetrieveP;
        "BF8102-I" -> EditS;
        "BF8102-P" -> UpdateP;
        "BF8100-O" -> OutputS;
    }

    IF action == "ACTION_BACK"
        EXIT;

    IF DisplayInput == "FALSE"
        EXIT;


    BRANCH Main;
}

