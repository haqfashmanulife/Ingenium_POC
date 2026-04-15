# Converted from PathFinder 2.2 to 3.0 on Jun 18, 2004 3:12:05 PM EDT

#*******************************************************************************
#*  Component:   BF9E54Prcesdef.f                                              *
#*  Description: Deferment Processing Screen                                   *
#*                                                                             *
#*******************************************************************************
#*  Chg#    Release  Description                                               *
#*                                                                             *
#*  UY3093  02JUL23  Intial Version                                            *
#*  UY3066  04JAN24  CHANGES DONE AS PART OF SAVINGS RIDER                     *
#*******************************************************************************

INCLUDE "BF9E54-I.s";
INCLUDE "BF9E54Cli-I.s";
INCLUDE "BF9E54-O.s"; 
INCLUDE "BF9E54-P.p";

PROCESS BF9E54Prcesdef
{

    # Set value that will be used in the flow

    Title = STRINGTABLE.IDS_TITLE_BF9E54Process;
    TitleBar = "TitleBar";
    TitleBarSize = "70";
    ButtonBar = "ButtonBarOKCancel";
    ButtonBarSize = "40";
    MessageFrame = "MessagesDisp";
    MessageFrameSize = "70";

    MIR-DV-TRNXT-PAYO-MTHD-CD = "F";

    #1st screen
    STEP Input
    {
        USES S-STEP "BF9E54-I";
        STRINGTABLE.IDS_TITLE_BF9E54Phase1 -> Title;  
    }
    
    # Hitting Cancel from the first page leaves the flow

    IF action == "ACTION_BACK"
        EXIT; 

    # UY3004 CHANGES START

    UserDefinedPolicyIDBase   = MIR-POL-ID-BASE;
    
    STEP RetrieveList
    {
        USES PROCESS "BF9D34List";

        UserDefinedPolicyIDBase -> MIR-POL-ID-BASE;
        WS-POL-ID-BASE <- WS9D34-POL-ID-BASE;
        WS-POL-ID-SFX  <- WS9D34-POL-ID-SFX;
        WS-POL-COUNTER <-WS9D34-POL-COUNTER;
        WS-CANCEL-IND  <- WS9D34-CANCEL-IND;
        WS-RETURN-CD   <- WS9D34-RETURN-CD;
        UserDefinedPolicyIDBase <- WS9D34-POL-ID-BASE;
    }

    IF  WS-CANCEL-IND == "Y" || WS-RETURN-CD !="00"
       {
        BRANCH Input;
       }

    # UY3066 CHANGES START

    IF WS-POL-COUNTER <"01"
       {
       MIR-POL-ID-BASE = UserDefinedPolicyIDBase;
       }

    IF WS-POL-COUNTER >="01"
       {
       MIR-POL-ID-BASE  = WS-POL-ID-BASE;
       MIR-POL-ID-BASE  = WS-POL-ID-BASE + WS-POL-ID-SFX;
       }

   # UY3066 CHANGES END
   # UY3004 CHANGES END 
    
   # Retrieve the data for the key value

    MIR-DV-PRCES-STATE-CD="1";
         
    STEP Retrieve
    {
        USES P-STEP "BF9E54-P";
    }

    #   IF RETURN IS NOT OK IN CSOM9E43 MODULE ,
    #   THEN BRANCH TO INPUT SCREEN OTHERWISE
    #   CONTINUE THE PROCESS

    IF  LSIR-RETURN-CD != "00" 
        BRANCH Input;
        
    # If user has selected firm banking then go to FB Input screen(2nd screen), else go to 3rd screen    
    IF MIR-DV-TRNXT-PAYO-MTHD-CD == "F" 
    {  
        WS-TEMP-ID1 = MIR-POL-ID-BASE;
        MIR-POL-ID-BASE = SUBSTRING (WS-TEMP-ID1,1,7);
        # 2ND SCREEN (FIRM BANKING SCREEN)
        STEP FBNKInput
        {   
            USES S-STEP "BF9E54Cli-I";
            STRINGTABLE.IDS_TITLE_BF9E54Phase2 -> Title;
        }

        # If the user hit Cancel, return to the key input screen.
        MIR-POL-ID-BASE = WS-TEMP-ID1;    
        IF action == "ACTION_BACK"
        {
            BRANCH Input;
        }
    
        STEP FBNKEdits
        {
            USES P-STEP "BF9E54-P";
            "2" -> MIR-DV-PRCES-STATE-CD;
        }

        IF LSIR-RETURN-CD != "00" 
            BRANCH FBNKInput; 
            
        STEP DefermentPaymentInfo-P
        {
            USES P-STEP "BF9E54-P";
            "3" -> MIR-DV-PRCES-STATE-CD;
        }
       
        IF  LSIR-RETURN-CD != "00"
           BRANCH FBNKInput;

        WS-TEMP-ID1 = MIR-POL-ID-BASE;
        MIR-POL-ID-BASE = SUBSTRING (WS-TEMP-ID1,1,7);

        #3rd Screen DEFERMENT PROCESSING - CONFIRM TRANSCATION
        STEP Output
        {
            USES S-STEP "BF9E54-O";
            STRINGTABLE.IDS_TITLE_BF9E54Phase3 -> Title;
            "ButtonBarConfirmCancelBack" -> ButtonBar;
        }
        # If the user selects Cancel on the Confirm page, return to the Input page.

        MIR-POL-ID-BASE = WS-TEMP-ID1;
        IF action == "ACTION_BACK"
        {
           BRANCH Input;
        }
        
         # If the user selects Back on the Confirm page, return to the FBNKInput page.
        
        IF action == "ACTION_PREVIOUS"
        {
           BRANCH FBNKInput;
        }
        
        STEP UpdateHost-P
        {
           USES P-STEP "BF9E54-P";
            "4" -> MIR-DV-PRCES-STATE-CD;
        }
        
        IF  LSIR-RETURN-CD != "00"
            BRANCH Output;  
        
        BRANCH Input;
        
    }
    ELSE
    {
        STEP DefermentPaymentInfo-P
        {
            USES P-STEP "BF9E54-P";
            "3" -> MIR-DV-PRCES-STATE-CD;
        }
       
        IF  LSIR-RETURN-CD != "00"
           BRANCH Input;
       
        WS-TEMP-ID1 = MIR-POL-ID-BASE;
        MIR-POL-ID-BASE = SUBSTRING (WS-TEMP-ID1,1,7);
        
        #3rd Screen DEFERMENT PROCESSING - CONFIRM TRANSCATION
        STEP MCSHOutput
        {
            USES S-STEP "BF9E54-O";
            STRINGTABLE.IDS_TITLE_BF9E54Phase3 -> Title;
            "ButtonBarConfirmCancelBack" -> ButtonBar;
        }
        # If the user selects Cancel on the Confirm page, return to the Input page.

        MIR-POL-ID-BASE = WS-TEMP-ID1;
        IF action == "ACTION_BACK"
        {
           BRANCH Input;
        }
        
         # If the user selects Back on the Confirm page, return to the Input page.
        
        IF action == "ACTION_PREVIOUS"
        {
           BRANCH Input;
        }
        
        STEP UpdateHost-P
        {
           USES P-STEP "BF9E54-P";
            "4" -> MIR-DV-PRCES-STATE-CD;
        }
        
        IF  LSIR-RETURN-CD != "00"
            BRANCH MCSHOutput;  
        
        BRANCH Input;
   
    } 
}
