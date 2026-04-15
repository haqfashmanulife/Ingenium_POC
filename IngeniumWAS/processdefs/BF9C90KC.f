#*  Component:   BF9C90KC.f                                                    *
#*  Description: FAMILY KATA CHANGE RETRIEVE PROCESS                           *
#*                                                                             *
#*******************************************************************************
#*  Chg#    Release  Description                                               *
#*                                                                             *
#*  S15287  CTS      FAMILY KATA CHANGE                                        *
#*******************************************************************************

INCLUDE "BF9C90-I.s";
INCLUDE "BF9C90-P.p";
INCLUDE "BF9C91KC-O.s";
INCLUDE "GenRetrieve.f";

PROCESS BF9C90KC
{

    # Set value that will be used in the flow

    Title = STRINGTABLE.IDS_TITLE_BF9C90Retrieve;
    TitleBar = "TitleBar";
    TitleBarSize = "70";
    ButtonBar = "ButtonBarOKCancel";
    ButtonBarSize = "40";
    MessageFrame = "MessagesDisp";
    MessageFrameSize = "70";


    STEP MainKC
    {
        USES PROCESS "GenRetrieve";
        ATTRIBUTES
        {
            GetMessages = "NO";
        }

        STRINGTABLE.IDS_TITLE_BF9C90Retrieve -> Title;
        "KC" -> MIR-DV-POL-FUT-ACTV-TYP-CD;
        "FALSE" -> DisplayInput;
        "BF9C90-I" -> InputS;        
        "BF9C90-P" -> RetrieveP;
        "BF9C91KC-O" -> OutputS;
    }

    # Collect the key value 

    # Retrieve the data for the key value

    
    IF DisplayInput == "FALSE"
        EXIT;
        
    IF action == "ACTION_BACK"
        EXIT;        
    

       
   
        
}        