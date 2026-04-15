#*  Component:   BF9C90DP.f                                                    *
#*  Description: Deferment Payment Retrieve process                 *
#*                                                                             *
#*******************************************************************************
#*  Chg#    Release  Description                                               *
#*                                                                             *
#*  UC3120  CTS      CHANGES FOR DEFERMENT PAYMENT                                  *
#*******************************************************************************

INCLUDE "BF9C90-I.s";
INCLUDE "BF9C90-P.p";
INCLUDE "BF9C90SM-O.s";
INCLUDE "GenRetrieve.f";

PROCESS BF9C90DP
{




    # Set value that will be used in the flow

    Title = STRINGTABLE.IDS_TITLE_BF9C90Retrieve;
    TitleBar = "TitleBar";
    TitleBarSize = "70";
    ButtonBar = "ButtonBarOKCancel";
    ButtonBarSize = "40";
    MessageFrame = "MessagesDisp";
    MessageFrameSize = "70";


    STEP MainDP
    {
        USES PROCESS "GenRetrieve";
        ATTRIBUTES
        {
            GetMessages = "NO";
        }

        STRINGTABLE.IDS_TITLE_BF9C90Retrieve -> Title;
        "DP" -> MIR-DV-POL-FUT-ACTV-TYP-CD;
        "FALSE" -> DisplayInput;
        "BF9C90-I" -> InputS;        
        "BF9C90-P" -> RetrieveP;
        "BF9C90SM-O" -> OutputS;
    }

    # Collect the key value 

    # Retrieve the data for the key value

    
    IF DisplayInput == "FALSE"
        EXIT;
        
    IF action == "ACTION_BACK"
        EXIT;        
    

       
   
        
}        