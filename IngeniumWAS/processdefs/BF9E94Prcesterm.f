# Converted from PathFinder 2.2 to 3.0 on Jun 18, 2004 3:12:05 PM EDT

#*******************************************************************************
#*  Component:   BF9E94Prcesterm.f                                             *
#*  Description: TERM TYPE Processing Screen                                   *
#*                                                                             *
#*******************************************************************************
#*  Chg#    Release  Description                                               *
#*                                                                             *
#*  UY3094  13DEC23  Intial Version                                            *
#*******************************************************************************

INCLUDE "BF9E94-I.s";
INCLUDE "BF9E94-O.s";
INCLUDE "BF9E94Cli-I.s";
INCLUDE "BF9E94-P.p";
INCLUDE "BF9G99-P.p";

PROCESS BF9E94Prcesterm
{

    # Set value that will be used in the flow

    Title = STRINGTABLE.IDS_TITLE_BF9E94Prcesterm;
    TitleBar = "TitleBar";
    TitleBarSize = "70";
    ButtonBar = "ButtonBarOKCancel";
    ButtonBarSize = "40";
    MessageFrame = "MessagesDisp";
    MessageFrameSize = "70";

    # Clear the messages before displaying the s-step for the first time
     
    MESSAGES-T[0] = "";

    MIR-DV-TRNXT-PAYO-MTHD-CD = "F";

#1st screen
    STEP Input
    {
        USES S-STEP "BF9E94-I";
        STRINGTABLE.IDS_TITLE_BF9E94Prcesterm -> Title;
        
    }
    
    # Hitting Cancel from the first page leaves the flow

    IF action == "ACTION_BACK"
    {
        MESSAGES-T[0] = "";
        EXIT;
    }

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
        BRANCH KeyFields-S;
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
        
   # Retrieve the data for the key value

    MIR-DV-PRCES-STATE-CD="1";
         
    STEP Retrieve
    {
        USES P-STEP "BF9E94-P";
    }

    #   IF RETURN IS NOT OK IN CSOM9E93 MODULE ,
    #   THEN BRANCH TO INPUT SCREEN OTHERWISE
    #   CONTINUE THE PROCESS
    
    IF  LSIR-RETURN-CD != "00" 
        BRANCH Input;

    
    #2nd screen  
    IF  MIR-DV-TRNXT-PAYO-MTHD-CD == "F"
    {
        STEP FBNKInput
        {
        USES S-STEP "BF9E94Cli-I";
        STRINGTABLE.IDS_TITLE_BF9E94Prcesterm1 -> Title;
        }
   
        # If the user hit Cancel, return to the key input screen.
        IF action == "ACTION_BACK"
        {
            MESSAGES-T[0] = "";
            BRANCH Input;
        }
        STEP FBNKEdits
        {
            USES P-STEP "BF9E94-P";
            "2" -> MIR-DV-PRCES-STATE-CD;
        }
        IF LSIR-RETURN-CD != "00" 
           BRANCH FBNKInput;  
    }

# 4TH SCREEN - TERM TYPE PROCESSING - CONFIRM TRANSCATION
       STEP UpdateInfo-P
       {
           USES P-STEP "BF9E94-P";
           "3" -> MIR-DV-PRCES-STATE-CD;
       }
       IF  LSIR-RETURN-CD != "00" 
           BRANCH Input;
           
       IF  LSIR-RETURN-CD != "00" 
           BRANCH FBNKInput;
		   
    STEP Result
    {
        USES S-STEP "BF9E94-O";
        STRINGTABLE.IDS_TITLE_BF9E94Prcesterm2 -> Title;
        "ButtonBarConfirmCancelBack" -> ButtonBar;
    } 

    IF action == "ACTION_BACK"
    {
       MESSAGES-T[0] = "";
       BRANCH Input;
    }

    # If the user selects Back on the Confirm page, return to the FBNKInput page.

    IF action == "ACTION_PREVIOUS" && MIR-DV-TRNXT-PAYO-MTHD-CD == "F"
    {
       MESSAGES-T[0] = "";
       BRANCH FBNKInput;
    }
    
       IF action == "ACTION_PREVIOUS" && MIR-DV-TRNXT-PAYO-MTHD-CD == "M"
       {
          MESSAGES-T[0] = "";
          BRANCH Input;
       }

    STEP TermtypePaymentInfo-P
    {
        USES P-STEP "BF9E94-P";
        "4" -> MIR-DV-PRCES-STATE-CD;
    }

    IF  LSIR-RETURN-CD != "00" 
        BRANCH Result;
	
    BRANCH Input;
        
    
    # If the user selects Cancel on the Confirm page, return to the Input page.
    temp-DTL-INFO  = MIR-POL-ID-BASE + " " + MIR-POL-ID-SFX;   
    STEP AudOutput
    {
        USES P-STEP "BF9G99-P";
 
    SESSION.MIR-USER-ID -> MIR-USER-ID;
    SESSION.LSIR-BPF-ID  -> MIR-BFCN-ID;
    temp-DTL-INFO ->MIR-TRNX-DTL-INFO; 
    "C" -> MIR-LOG-LEVL-CD;
    }
 
 
    IF LSIR-RETURN-CD != "00"
        BRANCH Edit;
 
    ButtonBar = "ButtonBarOK";
 
 
    # Display the output of the update process
 
    
}
