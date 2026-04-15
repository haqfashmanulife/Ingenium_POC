# Converted from PathFinder 2.2 to 3.0 on Jun 18, 2004 3:12:04 PM EDT

#*******************************************************************************
#*  Component:   BF9F80Retrieve.f                                              *
#*  Description:                                                               *
#*                                                                             *
#*******************************************************************************
#*  Chg#    Release  Description                                               *
#*  MP334C  CTS      POLICY OWNER CHANGE HISTORY                               *
#*******************************************************************************
INCLUDE "BF9F82-I.s";
INCLUDE "BF9F80-P.p";
INCLUDE "BF9F80-O.s";
INCLUDE "GenRetrieve.f";

PROCESS BF9F80Retrieve
{
    STEP Main
    {
        USES PROCESS "GenRetrieve";
        ATTRIBUTES
        {
            GetMessages = "NO";
        }

    # Since there is no seperate menu for Retrieve, we are giving BF9F82-I
    #    as dummy input for GenRetrieve.This will not called as the 
    # DisplayInput will be set to False.Only RetrieveP,OutputS is used. 
    
        STRINGTABLE.IDS_TITLE_BF9F80Retrieve -> Title;
        "BF9F82-I" -> InputS;
        "BF9F80-P" -> RetrieveP;
        "BF9F80-O" -> OutputS;
    }

    IF DisplayInput == "FALSE"
        EXIT;

    IF action == "ACTION_BACK"
        EXIT;


    BRANCH Main;
}

