# Converted from PathFinder 2.2 to 3.0 on Jun 18, 2004 3:12:02 PM EDT

#*******************************************************************************
#*  Component:   GenDelete.f                                                   *
#*  Description:                                                               *
#*                                                                             *
#*******************************************************************************
#*  Chg#    Release  Description                                               *
#*                                                                             *
#*  014590  6.0      New for release 6.0                                       *
#*  PF30    PF 3.0   Corrected VARIABLES braces {} after converion             *
#*  UY3004  STREAM3  UNISYS POST MIGRATION DUPLICATION POLICY                  *
#*  UY3049  CTS      ANNUITY PAYMENT SCREEN                                    *
#*******************************************************************************

PROCESS GenDelete
{
  VARIABLES
  {
      IN Title;

    # Name of S Step where user enters the record key

    IN InputS;


    # Name of P Step that retrieves a record

    IN RetrieveP;


    # Name of S Step that redisplays key and confirms delete

    IN ConfirmS;


    # Name of P Step that deletes the record

    IN DeleteP;


    # Set to FALSE if you don't want InputS to be displayed

    IN DisplayInput;


    OUT action;


  }
    # ENSURE MESSAGES ARE RECEIVED FROM PREVIOUS STEPS
    # ENSURE MESSAGES ARE SENT TO OTHER STEPS

    TitleBar = "TitleBar";

    # First Button Bar Seen on the Screen

    TitleBarSize = "70";
    ButtonBar = "ButtonBarOKCancel";
    ButtonBarSize = "40";
    MessageFrame = "MessagesDisp";
    MessageFrameSize = "70";


    # Skip STEP Input if coming from a LIST Function

    IF DisplayInput == "FALSE"
        BRANCH Retrieve;


    STEP Input
    {
        USES S-STEP InputS;

        # Enter the key(s) for the value that you'd like to create

    }


    # Return to Previous Step if Cancelling Out

    IF action == "ACTION_BACK"
        EXIT;

#UY3004 CHANGES START

    UserDefinedPolicyIDBase   = MIR-POL-ID-BASE;
    UserDefinedPolicyIDSuffix = MIR-POL-ID-SFX;
    
    STEP RetrieveList
    {
        USES PROCESS "BF9D34List";

        UserDefinedPolicyIDBase -> MIR-POL-ID-BASE;
        UserDefinedPolicyIDSuffix -> MIR-POL-ID-SFX;
        WS-POL-ID-BASE <- WS9D34-POL-ID-BASE;
        WS-POL-ID-SFX  <- WS9D34-POL-ID-SFX;
        WS-POL-COUNTER <-WS9D34-POL-COUNTER;
        WS-CANCEL-IND  <- WS9D34-CANCEL-IND;
        WS-RETURN-CD   <- WS9D34-RETURN-CD;
        UserDefinedPolicyIDBase <- WS9D34-POL-ID-BASE;
        UserDefinedPolicyIDSuffix <- WS9D34-POL-ID-SFX;
#UY3049 CHANGES STARTS
        WS-STR3-PAYO-IND <- WS9D34-STR3-PAYO-IND;
        WS-10-POL-ID <- WS9D34-10-POL-ID;
#UY3049 CHANGES ENDS
    }

    IF  WS-CANCEL-IND == "Y" || WS-RETURN-CD !="00"
       {
        BRANCH Input;
       }

    IF WS-POL-COUNTER <="01"
      {
       MIR-POL-ID-BASE = UserDefinedPolicyIDBase;
       MIR-POL-ID-SFX  = UserDefinedPolicyIDSuffix ;
      }

    IF WS-POL-COUNTER >"01"
      {
       MIR-POL-ID-BASE = WS-POL-ID-BASE;
       MIR-POL-ID-SFX  = WS-POL-ID-SFX;
      }

#UY3004 CHANGES END
#UY3049 CHANGES STARTS
    IF WS-STR3-PAYO-IND == "Y"
      {
          MIR-STR3-PAYO-IND = WS-STR3-PAYO-IND;
          MIR-10-POL-ID = WS-10-POL-ID;
      }
#UY3049 CHANGES ENDS
    # Return to STEP Input if changing Language

    STEP Retrieve
    {
        USES P-STEP RetrieveP;

        # Retrieve the record 

    }


    # Return to STEP Input if a CICS Error Code Returned

    IF LSIR-RETURN-CD != "00"
        BRANCH Input;



    # New Button Bar for STEP Confirm

    ButtonBar = "ButtonBarDeleteCancel";

    STEP Confirm
    {
        USES S-STEP ConfirmS;

        # Display the key and ask for confirmation

    }


    # Actions to Take if Confirm Cancelled

    IF action == "ACTION_BACK"
    {
        IF DisplayInput != "FALSE"
        {

            # If not orignating from list, Return to STEP Input
            # Reset Button Bar to OK and CANCEL

            ButtonBar = "ButtonBarOKCancel";

            BRANCH Input;

        }
        ELSE

            # If originating from list, Exit Delete Process

            EXIT;


    }

    # Return to STEP Confirm if changing Language

    STEP Delete
    {
        USES P-STEP DeleteP;

        # Delete the record

    }


    # Return to STEP Confirm if CICS Error Code Returned

    IF LSIR-RETURN-CD != "00"
        BRANCH Confirm;

}

