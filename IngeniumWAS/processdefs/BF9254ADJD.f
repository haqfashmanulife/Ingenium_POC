# Converted from PathFinder 2.2 to 3.0 on Jun 18, 2004 3:12:10 PM EDT

#*******************************************************************************
#*  Component:   BF9254ADJD.f                                              *
#*  Description:                                                               *
#*                                                                             *
#*******************************************************************************
#*  Chg#    Release  Description                                               *
#*                                                                             *
#*  HCL104  HIN/CL   Run Auto Adjudication                                     *
#*                                                                             *
#*******************************************************************************

INCLUDE "BF9254-P.p";
INCLUDE "BF9254-I.s";
INCLUDE "BF9254-O.s";
INCLUDE "GenRetrieve.f";

PROCESS BF9254ADJD
{
    STEP Main
    {
        USES PROCESS "GenRetrieve";
        ATTRIBUTES
        {
            GetMessages = "NO";
        }

        STRINGTABLE.IDS_TITLE_BF9254ADJD -> Title;
        "BF9254-I" -> InputS;
        "BF9254-P" -> RetrieveP;
        "BF9254-O" -> OutputS;
    }

    IF DisplayInput == "FALSE"
        EXIT;

    IF action == "ACTION_BACK"
        EXIT;


    BRANCH Main;
}

