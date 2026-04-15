# Converted from PathFinder 2.2 to 3.0 on Jun 18, 2004 3:12:07 PM EDT

#*******************************************************************************
#*  Component:   BF9091Create.f                                                *
#*  Description:                                                               *
#*                                                                             *
#*******************************************************************************
#*  Chg#    Release  Description                                               *
#*                                                                             *
#*  DBL63   25JAN02  Module created                                            *
#*                                                                             *
#*******************************************************************************

INCLUDE "BF9090-P.p";
INCLUDE "BF9091-P.p";
INCLUDE "BF9090-I.s";
INCLUDE "BF9092-I.s";
INCLUDE "BF9090-O.s";
INCLUDE "BF9092-P.p";
INCLUDE "GenCreate.f";

PROCESS BF9091Create
{
    STEP Main
    {
        USES PROCESS "GenCreate";
        ATTRIBUTES
        {
            GetMessages = "NO";
        }

        STRINGTABLE.IDS_TITLE_BF9091Create -> Title;
        "BF9090-I" -> InputS;
        "BF9091-P" -> CreateP;
        "BF9090-P" -> RetrieveP;
        "BF9092-I" -> EditS;
        "BF9092-P" -> UpdateP;
        "BF9090-O" -> OutputS;
    }

    IF action == "ACTION_BACK"
        EXIT;

    IF DisplayInput == "FALSE"
        EXIT;


    BRANCH Main;
}

