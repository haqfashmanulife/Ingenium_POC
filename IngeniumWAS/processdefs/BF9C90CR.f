#*  Component:   BF9C90CR.f                                                    *
#*  Description:                                                               *
#*                                                                             *
#*******************************************************************************
#*  Chg#    Release  Description                                               *
#*                                                                             *
#*  M142U2  CTS      Initial Version                                           *
#*                   RIDER SWITCH ENHANCEMENTS                                 *
#*******************************************************************************

INCLUDE "BF9C90-I.s";
INCLUDE "BF9C90-P.p";
INCLUDE "BF9C90CR-O.s";
INCLUDE "GenRetrieve.f";

PROCESS BF9C90CR
{




    # Set value that will be used in the flow

    Title = STRINGTABLE.IDS_TITLE_BF9C90Retrieve;
    TitleBar = "TitleBar";
    TitleBarSize = "70";
    ButtonBar = "ButtonBarOKCancel";
    ButtonBarSize = "40";
    MessageFrame = "MessagesDisp";
    MessageFrameSize = "70";


    STEP MainCR
    {
        USES PROCESS "GenRetrieve";
        ATTRIBUTES
        {
            GetMessages = "NO";
        }

        STRINGTABLE.IDS_TITLE_BF9C90Retrieve -> Title;
        "CV" -> MIR-DV-POL-FUT-ACTV-TYP-CD;
        "FALSE" -> DisplayInput;
        "BF9C90-I" -> InputS;        
        "BF9C90-P" -> RetrieveP;
        "BF9C90CR-O" -> OutputS;
    }

    # Collect the key value 

    # Retrieve the data for the key value

    
    IF DisplayInput == "FALSE"
        EXIT;
        
    IF action == "ACTION_BACK"
        EXIT;        
    

       
   
        
}        