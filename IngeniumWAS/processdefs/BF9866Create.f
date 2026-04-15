# Converted from PathFinder 2.2 to 3.0 on Jun 18, 2004 3:12:10 PM EDT

#*******************************************************************************
#*  Component:   BF9866Create.f                                                *
#*  Description: BENM Discharge Multiplier Create function                     *
#*                                                                             *
#*******************************************************************************
#*  Chg#    Release  Description                                               *
#*                                                                             *
#*  HCL111  HIN/CL   DISEASE AND SURGERY TABLES                                *
#*                                                                             *
#*******************************************************************************

INCLUDE "BF9865-I.s";
INCLUDE "BF9866-P.p";
INCLUDE "BF9865-P.p";
INCLUDE "BF9867-I.s";
INCLUDE "BF9867-P.p";
INCLUDE "BF9865-O.s";
INCLUDE "GenCreate.f";

PROCESS BF9866Create
{
    STEP Main
    {
        USES PROCESS "GenCreate";
        ATTRIBUTES
        {
            GetMessages = "NO";
        }

        STRINGTABLE.IDS_TITLE_BF9866Create -> Title;
        "BF9865-I" -> InputS;
        "BF9866-P" -> CreateP;
        "BF9865-P" -> RetrieveP;
        "BF9867-I" -> EditS;
        "BF9867-P" -> UpdateP;
        "BF9865-O" -> OutputS;
    }

    IF action == "ACTION_BACK"
        EXIT;

    IF DisplayInput == "FALSE"
        EXIT;


    BRANCH Main;
}

