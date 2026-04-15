# Converted from PathFinder 2.2 to 3.0 on Jun 18, 2004 3:12:03 PM EDT

#*******************************************************************************
#*  Component:   BF0081Create.f                                                *
#*  Description:                                                               *
#*                                                                             *
#*******************************************************************************
#*  Chg#    Release  Description                                               *
#*                                                                             *
#*  014590  6.0      New for release 6.0                                       *
#*  017151  612J     Code Clean-up;chgd upd output step to ret output step     *                                       *
#*                                                                             *
#*******************************************************************************

INCLUDE "BF0080-P.p";
INCLUDE "BF0081-P.p";
INCLUDE "BF0081-I.s";
INCLUDE "BF0082-I.s";
INCLUDE "BF0080-O.s";
INCLUDE "BF0082-P.p";
INCLUDE "GenCreate.f";

PROCESS BF0081Create
{
    STEP Main
    {
        USES PROCESS "GenCreate";
        ATTRIBUTES
        {
            GetMessages = "NO";
        }

        STRINGTABLE.IDS_TITLE_BF0081Create -> Title;
        "BF0081-I" -> InputS;
        "BF0081-P" -> CreateP;
        "BF0080-P" -> RetrieveP;
        "BF0082-I" -> EditS;
        "BF0082-P" -> UpdateP;
        "BF0080-O" -> OutputS;
    }

    IF action == "ACTION_BACK"
        EXIT;

    IF DisplayInput == "FALSE"
        EXIT;


    BRANCH Main;
}

