# Converted from PathFinder 2.2 to 3.0 on Jun 18, 2004 3:12:05 PM EDT

#*******************************************************************************
#*  Component:   BF9E44Prcesdef.f                                              *
#*  Description: Deferment Processing Screen                                   *
#*                                                                             *
#*******************************************************************************
#*  Chg#    Release  Description                                               *
#*                                                                             *
#*  UY3093  02JUL23  Intial Version                                            *
#*******************************************************************************

INCLUDE "BF9E44-I.s";
INCLUDE "BF9E44Cli-I.s";
INCLUDE "BF9E44-O.s"; 
INCLUDE "BF9E44-P.p";
INCLUDE "BF1281Curacct.f";
INCLUDE "BF1281-I.s";

PROCESS BF9E44Prcesdef
{

    # Set value that will be used in the flow

    Title = STRINGTABLE.IDS_TITLE_BF9E44Process;
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
        USES S-STEP "BF9E44-I";
        STRINGTABLE.IDS_TITLE_BF9E44Phase1 -> Title;  
    }
    
    # Hitting Cancel from the first page leaves the flow

    IF action == "ACTION_BACK"
        EXIT; 
        
   # Retrieve the data for the key value

    MIR-DV-PRCES-STATE-CD="1";
         
    STEP Retrieve
    {
        USES P-STEP "BF9E44-P";
    }

    #   IF RETURN IS NOT OK IN CSOM9E43 MODULE ,
    #   THEN BRANCH TO INPUT SCREEN OTHERWISE
    #   CONTINUE THE PROCESS

    IF  LSIR-RETURN-CD != "00" 
        BRANCH Input;
        
    # If user has selected firm banking then go to FB Input screen(2nd screen), else go to 3rd screen    
    IF MIR-DV-TRNXT-PAYO-MTHD-CD == "F" 
    {    
        # 2ND SCREEN (FIRM BANKING SCREEN)
        STEP FBNKInput
        {   
            USES S-STEP "BF9E44Cli-I";
            STRINGTABLE.IDS_TITLE_BF9E44Phase2 -> Title;
        }

        # If the user hit Cancel, return to the key input screen.
    
        IF action == "ACTION_BACK"
        {
            BRANCH Input;
        }
    
        STEP FBNKEdits
        {
            USES P-STEP "BF9E44-P";
            "2" -> MIR-DV-PRCES-STATE-CD;
        }

        IF LSIR-RETURN-CD != "00" 
            BRANCH FBNKInput; 
            
        STEP DefermentPaymentInfo-P
        {
            USES P-STEP "BF9E44-P";
            "3" -> MIR-DV-PRCES-STATE-CD;
        }
       
        IF  LSIR-RETURN-CD != "00" && MIR-DV-UNDO-VALID-CD != "N"
           BRANCH FBNKInput;
           
        #3rd Screen DEFERMENT PROCESSING - CONFIRM TRANSCATION
        STEP Output
        {
            USES S-STEP "BF9E44-O";
            STRINGTABLE.IDS_TITLE_BF9E44Phase3 -> Title;
            "ButtonBarConfirmCancelBack" -> ButtonBar;
        }
        # If the user selects Cancel on the Confirm page, return to the Input page.

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
           USES P-STEP "BF9E44-P";
            "4" -> MIR-DV-PRCES-STATE-CD;
        }
        
        IF  LSIR-RETURN-CD != "00"
            BRANCH Output;  
        
        BRANCH Input;
        
    }
    ELSE
    {
        #FLOW WILL GO TO GENERAL ACCOUNTING SCREEN  
        STEP Output1
        {
            USES S-STEP "BF1281-I";
        }    
    } 
}
