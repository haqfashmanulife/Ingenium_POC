# Converted from PathFinder 2.2 to 3.0 on Jun 18, 2004 3:12:02 PM EDT

#*******************************************************************************
#*  Component:   BFUpdateAudEdt.f                                             *
#*  Description:                                                               *
#*                                                                             *
#*******************************************************************************
#*  Chg#    Release  Description                                               *
#*                                                                             *
#*  23774A  CTS      AUDIT LOG RELATED CHANGES                                 *
#*                                                                             *
#*******************************************************************************

INCLUDE "BF9G99-P.p";
PROCESS BFUpdateAudEdt
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

  }
    TitleBar = "TitleBar";
    TitleBarSize = "70";
    ButtonBar = "ButtonBarOKCancel";
    ButtonBarSize = "40";
    MessageFrame = "MessagesDisp";
    MessageFrameSize = "70";

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


    STEP Edit
    {
        USES S-STEP EditS;
    }


    # If user selects Cancel and did not come from a list, then clear messages 
    # and branch back 1 step;
    # otherwise, exit to list.

    IF action == "ACTION_BACK"
    {
        IF DisplayInput != "FALSE"
        {
            ButtonBar = "ButtonBarOKCancel";
            MESSAGES-T[0] = "";

            BRANCH Input;

        }
        ELSE
            EXIT;


    }
    IF action == "ACTION_REFRESH"
        BRANCH Edit;



    # Update the record who's data was just entered.

    STEP Update
    {
        USES P-STEP UpdateP;
    }

    IF LSIR-RETURN-CD != "00"
        BRANCH Edit;
        
        temp-MSGS-T[1] = MESSAGES-T[1];
        temp-MSGS-T[2] = MESSAGES-T[2];
        temp-MSGS-T[3] = MESSAGES-T[3];
        temp-MSGS-T[4] = MESSAGES-T[4];
        temp-MSGS-T[5] = MESSAGES-T[5];
        temp-MSGS-T[6] = MESSAGES-T[6];
        temp-MSGS-T[7] = MESSAGES-T[7];
        temp-MSGS-T[8] = MESSAGES-T[8];
        temp-MSGS-T[9] = MESSAGES-T[9];
        temp-MSGS-T[10] = MESSAGES-T[10];
     
    temp-DTL-INFO  = MIR-ETBL-TYP-ID  + " " + MIR-ETBL-LANG-CD;               
    
    STEP AudOutput
    {
        USES P-STEP "BF9G99-P";
    
    SESSION.MIR-USER-ID -> MIR-USER-ID;
    SESSION.LSIR-BPF-ID  -> MIR-BFCN-ID;
    
    temp-DTL-INFO  -> MIR-TRNX-DTL-INFO;
    "I" -> MIR-LOG-LEVL-CD;
    
    }
	
    MESSAGES-T[1] = temp-MSGS-T[1];
    MESSAGES-T[2] = temp-MSGS-T[2];
    MESSAGES-T[3] = temp-MSGS-T[3];
    MESSAGES-T[4] = temp-MSGS-T[4];
    MESSAGES-T[5] = temp-MSGS-T[5];
    MESSAGES-T[6] = temp-MSGS-T[6];
    MESSAGES-T[7] = temp-MSGS-T[7];
    MESSAGES-T[8] = temp-MSGS-T[8];
    MESSAGES-T[9] = temp-MSGS-T[9];
    MESSAGES-T[10] = temp-MSGS-T[10]; 
        
    IF LSIR-RETURN-CD != "00"
        BRANCH Edit;

    ButtonBar = "ButtonBarOK";


    # Display the output of the update process

    STEP Output
    {
        USES S-STEP OutputS;
    }

}

