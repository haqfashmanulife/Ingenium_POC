#*******************************************************************************
#*  Component:   BF9931Create.f                                                *
#*  Description:   Adjudicator ID Create                                       *
#*                                                                             *
#*******************************************************************************
#*  Chg#    Release  Description                                               *
#*                                                                             *
#*  EN000388  CTS   INITIAL VERSION                                            *
#*                                                                             *
#*******************************************************************************

INCLUDE "BF9931-P.p";
INCLUDE "BF9932-P.p";
INCLUDE "BF9931-I.s";
INCLUDE "BF9932-I.s";
INCLUDE "BF9930-O.s";
INCLUDE "BF9930-P.p";
INCLUDE "GenCreate.f";

PROCESS BF9931Create
{
    STEP Main
    {
        USES PROCESS "GenCreate";
        ATTRIBUTES
        {
            GetMessages = "NO";
        }

        STRINGTABLE.IDS_TITLE_BF9931Create -> Title;
        "BF9931-I" -> InputS;
        "BF9931-P" -> CreateP;
        "BF9930-P" -> RetrieveP;
        "BF9932-I" -> EditS;
        "BF9932-P" -> UpdateP;
        "BF9930-O" -> OutputS;
    }

    IF action == "ACTION_BACK"
        EXIT;

    IF DisplayInput == "FALSE"
        EXIT;


    BRANCH Main;
}

