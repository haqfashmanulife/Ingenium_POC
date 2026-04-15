# Converted from PathFinder 2.2 to 3.0 on Jun 18, 2004 3:12:02 PM EDT

#*******************************************************************************
#*  Component:   GenProcess.f                                                  *
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

PROCESS GenProcess
{

    # This is the title of the process

  VARIABLES
  {
      IN Title;

    # Name of S Step that collects key

    IN InputS;


    # Name of P Step that processes the record

    IN ProcessP;


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


    # Collect the key value 

    STEP Input
    {
        USES S-STEP InputS;
    }

    IF action == "ACTION_BACK"
        EXIT;

    #UY3004 CHANGES START

    IF (MIR-POL-ID-BASE != "") 
     {
        UserDefinedPolicyIDBase   = MIR-POL-ID-BASE;
        UserDefinedPolicyIDSuffix = MIR-POL-ID-SFX;
     }
    ELSE
     {
        UserDefinedPolicyIDBase   = MIR-DEST-POL-ID-BASE;
        UserDefinedPolicyIDSuffix = MIR-DEST-POL-ID-SFX;
     }

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
# UY3049 CHANGES STARTS
        WS-STR3-PAYO-IND <- WS9D34-STR3-PAYO-IND;
        WS-10-POL-ID <- WS9D34-10-POL-ID;
# UY3049 CHANGES ENDS
    }

    IF  WS-CANCEL-IND == "Y" || WS-RETURN-CD !="00"
       {
        BRANCH Input;
       }

    IF WS-POL-COUNTER <="01"
      {
       MIR-POL-ID-BASE = UserDefinedPolicyIDBase;
       MIR-POL-ID-SFX  = UserDefinedPolicyIDSuffix;
       MIR-DEST-POL-ID-BASE = UserDefinedPolicyIDBase;
       MIR-DEST-POL-ID-SFX  = UserDefinedPolicyIDSuffix;
      }

    IF WS-POL-COUNTER >"01"
      {
       MIR-POL-ID-BASE = WS-POL-ID-BASE;
       MIR-POL-ID-SFX  = WS-POL-ID-SFX;
       MIR-DEST-POL-ID-BASE = WS-POL-ID-BASE;
       MIR-DEST-POL-ID-SFX  = WS-POL-ID-SFX;
      }

    #UY3004 CHANGES ENDS
# UY3049 CHANGES STARTS
    IF WS-STR3-PAYO-IND == "Y"
      {
          MIR-STR3-PAYO-IND = WS-STR3-PAYO-IND;
          MIR-10-POL-ID = WS-10-POL-ID;
      }
# UY3049 CHANGES ENDS
    # Process the data for the key value

    STEP Process
    {
        USES P-STEP ProcessP;
    }

    IF LSIR-RETURN-CD != "00"
        BRANCH Input;


    ButtonBar = "ButtonBarOK";


    # Display the output record 

    STEP Output
    {
        USES S-STEP OutputS;
    }

}

