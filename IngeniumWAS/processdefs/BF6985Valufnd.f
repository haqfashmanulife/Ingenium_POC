# Converted from PathFinder 2.2 to 3.0 on Jun 18, 2004 3:12:02 PM EDT

#*******************************************************************************
#*  Component:   BF6985Valufnd.f                                               *
#*  Description:                                                               *
#*                                                                             *
#*******************************************************************************
#*  Chg#    Release  Description                                               *
#*                                                                             *
#*  014590  6.0      New for release 6.0                                       *
#*  PF30    PF 3.0   Corrected VARIABLES braces {} after converion             *
#*  UY3004  STREAM3  UNISYS POST MIGRATION DUPLICATION POLICY                  *
#*  23774A  CTS      AUDIT LOG RELATED  CHANGES                                *
#*  UY3063  CTS      STREAM 3 VARIABLE LIFE BENEFIT CHANGES                    *
#*******************************************************************************

INCLUDE "BF6985-P.p";
INCLUDE "BF6985-I.s";
INCLUDE "BF6985GIA-O.s";
INCLUDE "BF6985DIA-O.s";
INCLUDE "BF6985EQT-O.s";
# 23774A CHANGES BEGIN
INCLUDE "BF9G99-P.p";
# 23774A CHANGES END

PROCESS BF6985Valufnd
{

    # Set to FALSE if you don't want InputS to be displayed

  VARIABLES
  {
    IN DisplayInput;


    # the action that will be returned to the wrapper flow

    OUT action;
  }

    Title = STRINGTABLE.IDS_TITLE_BF6985Valufnd;
    InputS = "BF6985-I";
    OutputS = "BF6985DIA-O";
    RetrieveP = "BF6985-P";
    TitleBar = "TitleBar";
    TitleBarSize = "70";
    ButtonBar = "ButtonBarOKCancel";
    ButtonBarSize = "40";
    MessageFrame = "MessagesDisp";
    MessageFrameSize = "70";


    # Collect the key value 

    IF DisplayInput == "FALSE"
        BRANCH Retrieve;


    STEP Input
    {
        USES S-STEP InputS;
    }

    IF action == "ACTION_BACK"
        EXIT;

    # UY3004 CHANGES START

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
    }

    IF  WS-CANCEL-IND == "Y" || WS-RETURN-CD !="00"
       {
        BRANCH Input;
       }

    IF WS-POL-COUNTER <"01"
      {
       MIR-POL-ID-BASE = UserDefinedPolicyIDBase;
       MIR-POL-ID-SFX  = UserDefinedPolicyIDSuffix ;
      }

    IF WS-POL-COUNTER >="01"
      {
       MIR-POL-ID-BASE = WS-POL-ID-BASE;
       MIR-POL-ID-SFX  = WS-POL-ID-SFX;
      }

    # UY3004 CHANGES END 

    # Retrieve the data for the key value

    STEP Retrieve
    {
        USES P-STEP RetrieveP;
    }

    IF LSIR-RETURN-CD != "00"
        BRANCH Input;

#* 23774A CHANGES BEGIN

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
    
    temp-DTL-INFO  = MIR-POL-ID-BASE + " " + MIR-POL-ID-SFX + " " + MIR-CVG-NUM + " " + MIR-APPL-CTL-PRCES-DT;    
    
   STEP AUTROutput
    {
        USES P-STEP "BF9G99-P";
    
    SESSION.MIR-USER-ID -> MIR-USER-ID;
    SESSION.LSIR-BPF-ID  -> MIR-BFCN-ID;  

    temp-DTL-INFO  ->MIR-TRNX-DTL-INFO;
    "C" -> MIR-LOG-LEVL-CD;
    
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
      
#* 23774A CHANGES END

    ButtonBar = "ButtonBarOK";


    # Display the record retrieved

    IF MIR-CVG-CF-TYP-CD == "A" || MIR-CVG-CF-TYP-CD == "I"
        OutputS = "BF6985GIA-O";

    IF MIR-CVG-CF-TYP-CD == "D" || MIR-CVG-CF-TYP-CD == "M"
        OutputS = "BF6985DIA-O";

    IF MIR-CVG-CF-TYP-CD == "E" || MIR-CVG-CF-TYP-CD == "P"
        OutputS = "BF6985EQT-O";

#*UY3063 CHANGES STARTS HERE
    IF MIR-CVG-CF-TYP-CD == "V" 
        OutputS = "BF6985DIA-O";
#*UY3063 CHANGES ENDS HERE

    STEP Output
    {
        USES S-STEP OutputS;
        "ButtonBarLists" -> ButtonBar;
    }

    IF action == "ACTION_BACK"
        EXIT;


    # If the user has pressed the more button, go back and reget the list

    IF action == "ACTION_MORE" || action == "ACTION_NEXT"
        BRANCH Retrieve;

}

