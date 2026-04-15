# Converted from PathFinder 2.2 to 3.0 on Jun 18, 2004 3:12:10 PM EDT

#*******************************************************************************
#*  Component:   BF9881Create.f                                                *
#*  Description: MCAT Medical Category Table Create function                   *
#*                                                                             *
#*******************************************************************************
#*  Chg#    Release  Description                                               *
#*                                                                             *
#*  HCL111  HIN/CL   DISEASE AND SURGERY TABLES                                *
#*                                                                             *
#*******************************************************************************

INCLUDE "BF9880-I.s";
INCLUDE "BF9881-P.p";
INCLUDE "BF9880-P.p";
INCLUDE "BF9882-I.s";
INCLUDE "BF9882-P.p";
INCLUDE "BF9880-O.s";
INCLUDE "GenCreate.f";

PROCESS BF9881Create
{
    STEP Main
    {
        USES PROCESS "GenCreate";
        ATTRIBUTES
        {
            GetMessages = "NO";
        }

        STRINGTABLE.IDS_TITLE_BF9881Create -> Title;
        "BF9880-I" -> InputS;
        "BF9881-P" -> CreateP;
        "BF9880-P" -> RetrieveP;
        "BF9882-I" -> EditS;
        "BF9882-P" -> UpdateP;
        "BF9880-O" -> OutputS;
    }

    IF action == "ACTION_BACK"
        EXIT;

    IF DisplayInput == "FALSE"
        EXIT;


    BRANCH Main;
}

