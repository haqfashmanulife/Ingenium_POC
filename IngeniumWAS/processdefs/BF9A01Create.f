# Converted from PathFinder 2.2 to 3.0 on Jun 18, 2004 3:12:04 PM EDT

#*******************************************************************************
#*  Component:   BF9A01Create.f                                                *
#*  Description: For Creating a New Plan Payout Method                         *
#*                                                                             *
#*******************************************************************************
#*  Chg#    Release  Description                                               *
#*                                                                             *
#*  014590  6.0      New for release 6.0                                       *
#*  017151  612J     Code Clean-up: chgd upd output step to ret output step    *
#*  IPMPPU  CTS      NEW PLAN PAYOUT METHOD CREATE                             *
#*******************************************************************************

INCLUDE "BF9A00-P.p";
INCLUDE "BF9A01-P.p";
INCLUDE "BF9A01-I.s";
INCLUDE "BF9A02-I.s";
INCLUDE "BF9A00-O.s";
INCLUDE "BF9A02-P.p";
INCLUDE "GenCreate.f";

PROCESS BF9A01Create
{
    STEP Main
    {
        USES PROCESS "GenCreate";
        ATTRIBUTES
        {
            GetMessages = "NO";
        }

        STRINGTABLE.IDS_TITLE_BF9A01Create -> Title;
        "BF9A01-I" -> InputS;
        "BF9A01-P" -> CreateP;
        "BF9A00-P" -> RetrieveP;
        "BF9A02-I" -> EditS;
        "BF9A02-P" -> UpdateP;
        "BF9A00-O" -> OutputS;
    }

    IF action == "ACTION_BACK"
        EXIT;

    IF DisplayInput == "FALSE"
        EXIT;


    BRANCH Main;
}

