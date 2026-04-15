# Converted from PathFinder 2.2 to 3.0 on Jun 18, 2004 3:12:04 PM EDT

#*******************************************************************************
#*  Component:   BF9280Retrieve.f                                              *
#*  Description: Address code search by postal code or address                 *
#*                                                                             *
#*******************************************************************************
#*  Chg#    Release  Description                                               *
#*                                                                             *
#*  P02506  FB       New for Address Code Search                               *
#*  P02506  CLB      Change flow to meet requirements.                         *
#*******************************************************************************

INCLUDE "BF9280-P.p";
INCLUDE "BF9280-I.s";
INCLUDE "BF9280-O.s";

PROCESS BF9280Retrieve
{
    TitleBar = "TitleBar";
    Title = STRINGTABLE.IDS_TITLE_BF9280Retrieve;
    TitleBarSize = "70";
    ButtonBar = "ButtonBarOKCancel";
    ButtonBarSize = "40";
    MessageFrame = "MessagesDisp";
    MessageFrameSize = "70";

    IF DisplayInput == "FALSE"
        BRANCH Retrieve;
     
    # Clear the messages before displaying the s-step for the first time
     
    MESSAGES-T[0] = "";

    # Collect the key value 
           
    STEP Input
    {
        USES S-STEP "BF9280-I";
    }

    IF action == "ACTION_BACK"
        EXIT;
          
    # Retrieve the data for the key value

    STEP Retrieve
    {
        USES P-STEP "BF9280-P";
    }

    IF LSIR-RETURN-CD != "00"
        BRANCH Input;

    # Display the record retrieved
    # If there are more records to scroll down, display the button bar with the "More" button

    ButtonBar = "ButtonBarOKCancelMore";
      
    # If there are no more records, display this button bar
      
    IF MIR-LST-ADDR-LOC-CD == ""   
       ButtonBar = "ButtonBarOKCancel";

    STEP Output
    {
        USES S-STEP "BF9280-O";
    }
      
    # When the CANCEL button is pressed, return to the Main navigation menu  
      
    IF action == "ACTION_BACK"
        EXIT;

    # When the MORE button is pressed, scroll to the next set of records
      
    IF action == "ACTION_MORE"
        BRANCH Retrieve;

    # When the OK button is pressed, return to the input screen

    IF action == "ACTION_NEXT"
        MESSAGES-T[0] = "";
        MIR-LST-ADDR-LOC-CD = "";
        BRANCH Input;

    EXIT;
}

