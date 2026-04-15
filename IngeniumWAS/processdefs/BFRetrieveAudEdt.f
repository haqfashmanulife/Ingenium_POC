# Converted from PathFinder 2.2 to 3.0 on Jun 18, 2004 3:12:02 PM EDT

#*******************************************************************************
#*  Component:   BFRetrieveAudEdt.f                                            *
#*  Description:                                                               *
#*                                                                             *
#*******************************************************************************
#*  Chg#    Release  Description                                               *
#*                                                                             *
#*  23774A  CTS      AUDIT LOG RELATED  CHANGES                                *
#*******************************************************************************

INCLUDE "BF9G99-P.p";
PROCESS BFRetrieveAudEdt
{

    # This is the title of the process

  VARIABLES
  {
      IN Title;

    # Name of S Step that collects key of record to display

    IN InputS;


    # Name of P Step that retrieves the record

    IN RetrieveP;


    # Name of S Step that displays output record

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



    # Collect the key value 

    STEP Input
    {
        USES S-STEP InputS;
    }

    IF action == "ACTION_BACK"
        EXIT;

    # Retrieve the data for the key value

    STEP Retrieve
    {
        USES P-STEP RetrieveP;
    }

    IF LSIR-RETURN-CD != "00"
        BRANCH Input;         


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

    temp-DTL-INFO  ->MIR-TRNX-DTL-INFO;
    "I" -> MIR-LOG-LEVL-CD;
    
    }

      
    IF LSIR-RETURN-CD != "00"
        BRANCH Input; 
        
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


    ButtonBar = "ButtonBarOK";
    # Display the record retrieved

    STEP Output
    {
        USES S-STEP OutputS;
    }

}

