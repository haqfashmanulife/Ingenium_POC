#*******************************************************************************
#*  Component:   BF9C23Delete.f                                                *
#*  Description: TD Reinstatement Information(REIN) Delete function            *
#*                                                                             *
#*******************************************************************************
#*  Chg#    Release  Description                                               *
#*                                                                             *
#*  NWLGLR  CTS      Intial Version                                            *
#*  ATF506  CTS      Fix for error in delete functionality                     *
#*******************************************************************************

INCLUDE "BF9C20-I.s";

INCLUDE "BF9C20-P.p";

INCLUDE "BF9C20-O.s";

INCLUDE "BF9C23-P.p";

#ATF506 - Changes Begin

#INCLUDE "BF9C23-O.s";

#ATF506 - Changes Ends

INCLUDE "GenDelete.f";

PROCESS BF9C23Delete
{
    STEP Main
    {
        USES PROCESS "GenDelete";
        ATTRIBUTES
        {
            GetMessages = "NO";
        }

        STRINGTABLE.IDS_TITLE_BF9C23Delete -> Title;

        "BF9C20-I" -> InputS;

        "BF9C20-P" -> RetrieveP;

        "BF9C20-O" -> ConfirmS;

        "BF9C23-P" -> DeleteP;

        "BF9C20-O" -> OutputS;
    }


    IF action == "ACTION_BACK"
        EXIT;

    IF DisplayInput == "FALSE"
        EXIT;


    
}

