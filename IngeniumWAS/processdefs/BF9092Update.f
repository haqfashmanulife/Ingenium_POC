# Converted from PathFinder 2.2 to 3.0 on Jun 18, 2004 3:12:07 PM EDT

#*******************************************************************************
#*  Component:   BF9092Update.f                                                *
#*  Description:                                                               *
#*                                                                             *
#*******************************************************************************
#*  Chg#    Release  Description                                               *
#*                                                                             *
#*  DBL63   25JAN02  Module created                                            *
#*                                                                             *
#*******************************************************************************

INCLUDE "BF9090-P.p";
INCLUDE "BF9090-I.s";
INCLUDE "BF9092-I.s";
INCLUDE "BF9090-O.s";
INCLUDE "BF9092-P.p";
INCLUDE "GenUpdate.f";

PROCESS BF9092Update
{
    STEP Main
    {
        USES PROCESS "GenUpdate";
        ATTRIBUTES
        {
            GetMessages = "NO";
        }

        STRINGTABLE.IDS_TITLE_BF9092Update -> Title;
        "BF9090-I" -> InputS;
        "BF9090-P" -> RetrieveP;
        "BF9092-I" -> EditS;
        "BF9092-P" -> UpdateP;
        "BF9090-O" -> OutputS;
    }

    IF DisplayInput == "FALSE"
        EXIT;

    IF action == "ACTION_BACK"
        EXIT;


    BRANCH Main;
}

