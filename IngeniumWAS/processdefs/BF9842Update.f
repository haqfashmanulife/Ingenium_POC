# Converted from PathFinder 2.2 to 3.0 on Jun 18, 2004 3:12:10 PM EDT

#*******************************************************************************
#*  Component:   BF9842Update.f                                                *
#*  Description:                                                               *
#*                                                                             *
#*******************************************************************************
#*  Chg#    Release  Description                                               *
#*                                                                             *
#*  PR006Q  20AUG03  CREATED FOR OLD POLICY INFORMATION UPDATE (MY KEMPO)      *
#*******************************************************************************

INCLUDE "BF8000-I.s";
INCLUDE "BF9840-P.p";
INCLUDE "BF9842-I.s";
INCLUDE "BF9842-P.p";
INCLUDE "BF9840-O.s";
INCLUDE "GenUpdate.f";

PROCESS BF9842Update
{
    STEP Main
    {
        USES PROCESS "GenUpdate";
        ATTRIBUTES
        {
            GetMessages = "NO";
        }

        STRINGTABLE.IDS_TITLE_BF9842Update -> Title;
        "BF8000-I" -> InputS;
        "BF9840-P" -> RetrieveP;
        "BF9842-I" -> EditS;
        "BF9842-P" -> UpdateP;
        "BF9840-O" -> OutputS;
    }

    IF DisplayInput == "FALSE"
        EXIT;

    IF action == "ACTION_BACK"
    {
        action = "ACTION_PREVIOUS";

        EXIT;

    }

    BRANCH Main;
}

