# Converted from PathFinder 2.2 to 3.0 on Jun 18, 2004 3:12:05 PM EDT

#*******************************************************************************
#*  Component:   BF9E41Prcesmat.f                                              *
#*  Description: Maturity Processing Screen                                    *
#*                                                                             *
#*******************************************************************************
#*  Chg#    Release  Description                                               *
#*                                                                             *
#*  23802E  13APR22  Intial Version                                            *
#*  UY3048  06MAY23  CTS    ENHANCMENT FOR MATURITY DEFERMENT                  *
#*******************************************************************************

INCLUDE "BF9E41-I.s";
INCLUDE "BF9E41-O.s";
INCLUDE "BF9E41Cli-I.s";
INCLUDE "BF9E41FA-I.s"; 
INCLUDE "BF9E41FA-O.s"; 
INCLUDE "BF9E41-P.p";

PROCESS BF9E41Prcesmat
{

    # Set value that will be used in the flow

    Title = STRINGTABLE.IDS_TITLE_BF9E41Process;
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
        USES S-STEP "BF9E41-I";
        STRINGTABLE.IDS_TITLE_BF9E41Phase1 -> Title;
        
    }
    
    # Hitting Cancel from the first page leaves the flow

    IF action == "ACTION_BACK"
    {
        MESSAGES-T[0] = "";
        EXIT;
    }
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

    # UY3004 CHANGES END         
   # Retrieve the data for the key value

    MIR-DV-PRCES-STATE-CD="1";
         
    STEP Retrieve
    {
        USES P-STEP "BF9E41-P";
    }

    #   IF RETURN IS NOT OK IN SSOM9E39 MODULE ,
    #   THEN BRANCH TO INPUT SCREEN OTHERWISE
    #   CONTINUE THE PROCESS

    IF  LSIR-RETURN-CD != "00" 
        BRANCH Input;
        
#2nd screen  
#UY3048 CHANGES STARTS      
    IF  MIR-EVNT-ACTV-CD != "D"
    {
        STEP FBNKInput
        {   
        USES S-STEP "BF9E41Cli-I";
        STRINGTABLE.IDS_TITLE_BF9E41Phase2 -> Title;
        }
    
        # If the user hit Cancel, return to the key input screen.
    
        IF action == "ACTION_BACK"
        {
            MESSAGES-T[0] = "";
            BRANCH Input;
    
        }
        
        STEP FBNKEdits
        {
            USES P-STEP "BF9E41-P";
        "2" -> MIR-DV-PRCES-STATE-CD;
        }
    
        IF LSIR-RETURN-CD != "00" 
            BRANCH FBNKInput;  
    }   
#UY3048 CHANGES ENDS    
    #   IF THE USER SELECT CHANGE TO SINGLE PREMIUM VI 
    #   THEN BRANCH TO FundAllocation-S (3rd SCREEN)
    #   3RD Screens - Maturity Processing - Fund Allocation

    IF MIR-EVNT-ACTV-CD == "S"
    {
       STEP FundAllocation-S
       {
           USES S-STEP "BF9E41FA-I";
           STRINGTABLE.IDS_TITLE_BF9E41Phase3 -> Title;
       }
# If the user selects Cancel on the Confirm page, return to the Input page.

       IF action == "ACTION_BACK"
       {
           MESSAGES-T[0] = "";
           BRANCH Input;
       }

       STEP FundAllocation-P
       {
           USES P-STEP "BF9E41-P";
           "3" -> MIR-DV-PRCES-STATE-CD;
       }

       IF  LSIR-RETURN-CD != "00" && MIR-DV-UNDO-VALID-CD != "N"
           BRANCH FundAllocation-S;
       
       STEP ResultFund-S
       {
           USES S-STEP "BF9E41FA-O";
           STRINGTABLE.IDS_TITLE_BF9E41Phase4 -> Title;
           "ButtonBarConfirmCancelBack" -> ButtonBar;
       }
    # If the user selects Cancel on the Confirm page, return to the Input page.

    IF action == "ACTION_BACK"
    {
        MESSAGES-T[0] = "";
        BRANCH Input;
    }

    # If the user selects Back on the Confirm page, return to the FBNKInput page.

    IF action == "ACTION_PREVIOUS"
    {
        MESSAGES-T[0] = "";
        BRANCH FundAllocation-S;
    }

      STEP ResultFund-P
       {
           USES P-STEP "BF9E41-P";
           "4" -> MIR-DV-PRCES-STATE-CD;
       }

       IF  LSIR-RETURN-CD != "00"
           BRANCH ResultFund-S;
        
       BRANCH Input;
     
    }
    ELSE
    {
       STEP MaturityPaymentInfo-P
       {
           USES P-STEP "BF9E41-P";
           "3" -> MIR-DV-PRCES-STATE-CD;
       }
       IF  LSIR-RETURN-CD != "00" && MIR-DV-UNDO-VALID-CD != "N" 
       && MIR-EVNT-ACTV-CD == "D"
           BRANCH Input;
           
       IF  LSIR-RETURN-CD != "00" && MIR-DV-UNDO-VALID-CD != "N"
           BRANCH FBNKInput;
 
# 4TH SCREEN - MATURITY PROCESSING - CONFIRM TRANSCATION

       STEP Result
       {
           USES S-STEP "BF9E41-O";
           STRINGTABLE.IDS_TITLE_BF9E41Phase4 -> Title;
           "ButtonBarConfirmCancelBack" -> ButtonBar;
       } 
    # If the user selects Cancel on the Confirm page, return to the Input page.

       IF action == "ACTION_BACK"
       {
          MESSAGES-T[0] = "";
          BRANCH Input;
       }

    # If the user selects Back on the Confirm page, return to the FBNKInput page.

       IF action == "ACTION_PREVIOUS" && MIR-EVNT-ACTV-CD != "D"
       {
          MESSAGES-T[0] = "";
          BRANCH FBNKInput;
       }
	   
       IF action == "ACTION_PREVIOUS" && MIR-EVNT-ACTV-CD == "D"
       {
          MESSAGES-T[0] = "";
          BRANCH Input;
       }

       STEP UpdateHost-P
       {
          USES P-STEP "BF9E41-P";
           "4" -> MIR-DV-PRCES-STATE-CD;
       }
    
       IF  LSIR-RETURN-CD != "00"
           BRANCH Result;  
       
       BRANCH Input;
       
    }
}
