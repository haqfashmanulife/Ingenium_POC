#*  Component:   BF9C93DP.f                                                    *
#*  Description: Deferment Payment Delete Process                          *
#*******************************************************************************
#*  Chg#    Release  Description                                               *
#*                                                                             *
#*  U3C120  CTS      Intial Version                                            *
#*******************************************************************************


# Retrieve Output S Step (Verify)

INCLUDE "BF9C90-P.p";

# Delete P Step

INCLUDE "BF9C90SM-O.s";

# Delete Output S Step

INCLUDE "BF9C93-P.p";
INCLUDE "BF9C93-O.s";
INCLUDE "GenDelete.f";


PROCESS BF9C93DP
{



    # Set value that will be used in the flow

    Title = STRINGTABLE.IDS_TITLE_BF9C93Delete;
    TitleBar = "TitleBar";
    TitleBarSize = "70";
    ButtonBar = "ButtonBarOKCancel";
    ButtonBarSize = "40";
    MessageFrame = "MessagesDisp";
    MessageFrameSize = "70";


     STEP MainDP
     {
        USES PROCESS "GenDelete";
        ATTRIBUTES
        {
            GetMessages = "NO";
        }        
        STRINGTABLE.IDS_TITLE_BF9C93Delete -> Title;

        "FALSE" -> DisplayInput;
        
        # Retrieve Input S Step

        "BF9C90-I" -> InputS;        

        # ENSURE THE DRIVERS BELOW ARE CORRECT
        # Retrieve Input P Step

        "BF9C90-P" -> RetrieveP;

        # Retrieve Output S Step

        "BF9C90SM-O" -> ConfirmS;
        

        # Delete P Step

        "BF9C93-P" -> DeleteP;

        # Delete Output S Step

        "BF9C93-O" -> OutputS;  
    }
    

    # Return To Main Menu

    IF action == "ACTION_BACK"
        EXIT;


    # Return To List

    IF DisplayInput == "FALSE"
        EXIT;



       

}          