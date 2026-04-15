# Converted from PathFinder 2.2 to 3.0 on Jun 18, 2004 3:12:04 PM EDT

#*******************************************************************************
#*  Component:   BF9F83Delete.f                                                *
#*  Description:                                                               *
#*                                                                             *
#*******************************************************************************
#*  Chg#    Release  Description                                               *
#*  MP334C  CTS      POLICY OWNER CHANGE HISTORY                               *
#*******************************************************************************
INCLUDE "BF9F82-I.s";
INCLUDE "BF9F80-O.s";
INCLUDE "BF9F80-P.p";
INCLUDE "BF9F83-P.p";
INCLUDE "GenDelete.f";

PROCESS BF9F83Delete
{
    STEP Main
    {
        USES PROCESS "GenDelete";
        STRINGTABLE.IDS_TITLE_BF9F83Delete -> Title;
        
    # Since there is no seperate menu for delete, we are giving BF9F82-I
    #    as dummy input for GenDelete.
    
        "BF9F82-I" -> InputS;
        "BF9F80-P" -> RetrieveP;
        "BF9F80-O" -> ConfirmS;
        "BF9F83-P" -> DeleteP;
        "BF9F84-O" -> OutputS;
    }

    IF action == "ACTION_BACK"
        EXIT;

    IF DisplayInput == "FALSE"
        EXIT;


    BRANCH Main;
}

