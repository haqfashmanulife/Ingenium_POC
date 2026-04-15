# Converted from PathFinder 2.2 to 3.0 on Jun 18, 2004 3:12:10 PM EDT

#*******************************************************************************
#*  Component:   BF9661Create.f                                                *
#*  Description: Benefit Support Table (BENS) Create function                  *
#*                                                                             *
#*******************************************************************************
#*  Chg#    Release  Description                                               *
#*                                                                             *
#*  HPR102  HIN/CL   CLAIM REQUIREMENTS                                        *
#*                                                                             *
#*******************************************************************************

INCLUDE "BF9660-P.p";
INCLUDE "BF9661-P.p";
INCLUDE "BF9660-I.s";
INCLUDE "BF9662-I.s";
INCLUDE "BF9660-O.s";
INCLUDE "BF9662-P.p";
INCLUDE "GenCreate.f";

PROCESS BF9661Create
{
    STEP Main
    {
        USES PROCESS "GenCreate";
        ATTRIBUTES
        {
            GetMessages = "NO";
        }

        STRINGTABLE.IDS_TITLE_BF9661Create -> Title;
        "BF9660-I" -> InputS;
        "BF9661-P" -> CreateP;
        "BF9660-P" -> RetrieveP;
        "BF9662-I" -> EditS;
        "BF9662-P" -> UpdateP;
        "BF9660-O" -> OutputS;
    }

    IF DisplayInput == "FALSE"
        EXIT;

    IF action == "ACTION_BACK"
        EXIT;


    BRANCH Main;
}

