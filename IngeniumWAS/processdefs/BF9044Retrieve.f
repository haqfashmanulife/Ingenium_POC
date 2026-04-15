# Converted from PathFinder 2.2 to 3.0 on Jun 18, 2004 3:12:07 PM EDT

#*******************************************************************************
#*  Component:   BF9044Retrieve.f                                              *
#*  Description:                                                               *
#*                                                                             *
#*******************************************************************************
#*  Chg#    Release  Description                                               *
#*                                                                             *
#*  P00064  02NB33   GW - new for MCL  2002-11-22                              *
#*                                                                             *
#*******************************************************************************

INCLUDE "BF9044-P.p";
INCLUDE "BF9044-I.s";
INCLUDE "BF9044-O.s";
INCLUDE "GenRetrieve.f";

PROCESS BF9044Retrieve
{
    STEP Main
    {
        USES PROCESS "GenRetrieve";
        ATTRIBUTES
        {
            GetMessages = "NO";
        }

        STRINGTABLE.IDS_TITLE_BF9044List -> Title;
        "BF9044-I" -> InputS;
        "BF9044-P" -> RetrieveP;
        "BF9044-O" -> OutputS;
    }

    IF DisplayInput == "FALSE"
        EXIT;

    IF action == "ACTION_BACK"
        EXIT;


    BRANCH Main;
}

