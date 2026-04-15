# Converted from PathFinder 2.2 to 3.0 on Jun 18, 2004 3:12:10 PM EDT

#*******************************************************************************
#*  Component:   BF9A41Create.f                                                *
#*  Description: Death Benefit Table (DBEN) Create function                    *
#*                                                                             *
#*******************************************************************************
#*  Chg#    Release  Description                                               *
#*  IPCAMC  CTS      Intial Version                                            *                                                                          
#*                                                                             *
#*******************************************************************************

INCLUDE "BF9A40-P.p";
INCLUDE "BF9A41-P.p";
INCLUDE "BF9A40-I.s";
INCLUDE "BF9A42-I.s";
INCLUDE "BF9A40-O.s";
INCLUDE "BF9A42-P.p";
INCLUDE "GenCreate.f";

PROCESS BF9A41Create
{
    STEP Main
    {
        USES PROCESS "GenCreate";
        ATTRIBUTES
        {
            GetMessages = "NO";
        }

        STRINGTABLE.IDS_TITLE_BF9A41Create -> Title;
        "BF9A40-I" -> InputS;
        "BF9A41-P" -> CreateP;
        "BF9A40-P" -> RetrieveP;
        "BF9A42-I" -> EditS;
        "BF9A42-P" -> UpdateP;
        "BF9A40-O" -> OutputS;
    }

    IF DisplayInput == "FALSE"
        EXIT;

    IF action == "ACTION_BACK"
        EXIT;


    BRANCH Main;
}

