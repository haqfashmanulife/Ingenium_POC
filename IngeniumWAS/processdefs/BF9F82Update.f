# Converted from PathFinder 2.2 to 3.0 on Jun 18, 2004 3:12:04 PM EDT

#*******************************************************************************
#*  Component:   BF9F82Update.f                                                *
#*  Description:                                                               *
#*                                                                             *
#*******************************************************************************
#*  Chg#    Release  Description                                               *
#*  MP334C  CTS      POLICY OWNER CHANGE HISTORY                               *
#*******************************************************************************
INCLUDE "BF9F82-P.p";
INCLUDE "BF9F82-I.s";
INCLUDE "BF9F80-O.s";
INCLUDE "BF9F80-P.p";
INCLUDE "GenUpdate.f";

PROCESS BF9F82Update
{

    STEP Main
    {
        USES PROCESS "GenUpdate";
        ATTRIBUTES
        {
            GetMessages = "NO";
        }

        STRINGTABLE.IDS_TITLE_BF9F82Update -> Title;
        
    # Since there is no seperate menu for update, we are giving BF9F82-I 
    #    as dummy input for GenUpdate.This will not called as the 
    # DisplayInput will be set to False.Only RetrieveP,EditS,UpdateP,BF9F80-O is used. 
    
        "BF9F82-I" -> InputS;
        "BF9F80-P" -> RetrieveP;
        "BF9F82-I" -> EditS;
        "BF9F82-P" -> UpdateP;
        "BF9F80-O" -> OutputS;
    }

    IF DisplayInput == "FALSE"
        EXIT;

    IF action == "ACTION_BACK"
        EXIT;


    BRANCH Main;

}

