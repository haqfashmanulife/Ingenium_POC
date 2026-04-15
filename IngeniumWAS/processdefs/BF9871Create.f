# Converted from PathFinder 2.2 to 3.0 on Jun 18, 2004 3:12:10 PM EDT

#*******************************************************************************
#*  Component:   BF9871Create.f                                                *
#*  Description: Disease/Surgery Major Code Create function                    *
#*                                                                             *
#*******************************************************************************
#*  Chg#    Release  Description                                               *
#*                                                                             *
#*  HCL111  HIN/CL   DISEASE AND SURGERY TABLES                                *
#*                                                                             *
#*******************************************************************************

INCLUDE "BF9870-I.s";
INCLUDE "BF9871-P.p";
INCLUDE "BF9870-P.p";
INCLUDE "BF9872-I.s";
INCLUDE "BF9872-P.p";
INCLUDE "BF9870-O.s";
INCLUDE "GenCreate.f";

PROCESS BF9871Create
{
    STEP Main
    {
        USES PROCESS "GenCreate";
        ATTRIBUTES
        {
            GetMessages = "NO";
        }

        STRINGTABLE.IDS_TITLE_BF9871Create -> Title;
        "BF9870-I" -> InputS;
        "BF9871-P" -> CreateP;
        "BF9870-P" -> RetrieveP;
        "BF9872-I" -> EditS;
        "BF9872-P" -> UpdateP;
        "BF9870-O" -> OutputS;
    }

    IF action == "ACTION_BACK"
        EXIT;

    IF DisplayInput == "FALSE"
        EXIT;


    BRANCH Main;
}

