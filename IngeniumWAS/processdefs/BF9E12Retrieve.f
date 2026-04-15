# Converted from PathFinder 2.2 to 3.0 on march 31, 2022 3:12:04 PM EDT

#*******************************************************************************
#*  Component:   BF9E12Retrieve.f                                              *
#*  Description:                                                               *
#*                                                                             *
#*******************************************************************************
#*  Chg#    Release  Description                                               *
#*                                                                             *
#*  UYS26B        CREATING NEW SCREEN FOR FACE AMOUNT PROJECTION               *
#*  S22206        CHANGES HA BEE DONE FOR UDSD-2206                            *
#*******************************************************************************
# Change this to the S that starts the list

# Change this to the P that retrieves the list
INCLUDE "BF9E12-I.s";
INCLUDE "BF9E12-O.s";
INCLUDE "BF9E12-P.p";
INCLUDE "GenRetrieve.f";

PROCESS BF9E12Retrieve
{
    STEP Main
    {
        USES PROCESS "GenRetrieve";
        ATTRIBUTES
        {
            GetMessages = "NO";
        }

        STRINGTABLE.IDS_TITLE_BF9E12Retrieve -> Title;
#S22206 "FALSE" -> DisplayInput;       
        "BF9E12-I" -> InputS;
        "BF9E12-P" -> RetrieveP;
        "BF9E12-O" -> OutputS;
       
    }
    
    IF DisplayInput == "FALSE"
        EXIT;
            
    IF action == "ACTION_BACK"
        EXIT;
        
    BRANCH Main;
        

}
