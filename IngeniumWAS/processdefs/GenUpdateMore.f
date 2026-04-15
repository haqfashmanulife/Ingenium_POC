# Converted from PathFinder 2.2 to 3.0 on Jun 18, 2004 3:12:02 PM EDT

#*******************************************************************************
#*  Component:   GenUpdateMore.f                                               *
#*  Description:                                                               *
#*                                                                             *
#*******************************************************************************
#*  Chg#    Release  Description                                               *
#*                                                                             *
#*  P00205  EKM      NEW FOR MANUFLEX                                          *
#*  PF30    PF 3.0   Corrected VARIABLES braces {} after converion             *
#*  23774A  CTS      Audit Log Related Changes                                 *
#*                                                                             *
#*******************************************************************************

PROCESS GenUpdateMore
{

    # Title for the process

  VARIABLES
  {
    IN Title;

    # Name of S Step where user enters the record key

    IN InputS;


    # Name of P Step that retrieves a record

    IN RetrieveP;


    # Name of S Step that edits a record

    IN EditS;


    # Name of P Step that updates a record

    IN UpdateP;


    # Name of S Step that displays output of an update P

    IN OutputS;


    # Set to FALSE if you don't want InputS to be displayed

    IN DisplayInput;



    # the action that will be returned to the wrapper flow

    OUT action;

#23774A CHANGES START    
    
    OUT AuditWriteInd;
#23774A CHANGES END    


  }
    TitleBar = "TitleBar";
    TitleBarSize = "70";
    ButtonBar = "ButtonBarOKCancel";
    ButtonBarSize = "40";
    MessageFrame = "MessagesDisp";
    MessageFrameSize = "70";
#23774A CHANGES START    
    AuditWriteInd = "N";
#23774A CHANGES END    


    IF DisplayInput == "FALSE"
        BRANCH Retrieve;



    # Enter the key(s) for the value that you'd like to create

    STEP Input
    {
        USES S-STEP InputS;
    }

    IF action == "ACTION_BACK"
        EXIT;

    IF action == "ACTION_REFRESH"
        BRANCH Input;



    # Retrieve the record 

    STEP Retrieve
    {
        USES P-STEP RetrieveP;
    }

    IF LSIR-RETURN-CD != "00"
        BRANCH Input;


    ButtonBar = "ButtonBarOKCancelMore";

    STEP Edit
    {
        USES S-STEP EditS;
    }

    IF action == "ACTION_BACK"
        EXIT;

    IF action == "ACTION_REFRESH"
        BRANCH Edit;

    IF action == "ACTION_MORE"
        BRANCH Retrieve;



    # Update the record who's data was just entered.

    STEP Update
    {
        USES P-STEP UpdateP;
    }

    IF LSIR-RETURN-CD != "00"
        BRANCH Edit;
        
#23774A CHANGES START    

    AuditWriteInd = "Y";

#23774A CHANGES END    

    ButtonBar = "ButtonBarOK";


    # Display the output of the update process

    STEP Output
    {
        USES S-STEP OutputS;
    }

}

