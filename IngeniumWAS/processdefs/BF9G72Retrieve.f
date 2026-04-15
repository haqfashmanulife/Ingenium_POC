
#*******************************************************************************
#*  Component:   BF9G72Retrieve.f                                              *
#*  Description: Created for Annuity Payout Quotation                          *
#*                                                                             *
#*******************************************************************************
#*  Chg#    Release  Description                                               *
#*                                                                             *
#*  UY3047  29JAN24  INITIAL VERSION                                           *
#*  UY3149  20JUN24  CHANGES MADE AS PART OF VIRTUAL QUOTE SCREEN              *
#*                                                                             *
#*******************************************************************************

INCLUDE "BF9G72-I.s";
INCLUDE "BF9G73-I.s";
INCLUDE "BF9G72-P.p";
INCLUDE "BF9G72-O.s";
INCLUDE "BF9D34List.f";
#UY3149 Changes start
INCLUDE "BF9G73VIR-I.s";
INCLUDE "BF9G73VIR-O.s";
#UY3149 Changes end

PROCESS BF9G72Retrieve
{

    Title = STRINGTABLE.IDS_TITLE_BF9G72Input;
    TitleBar = "TitleBar";
    TitleBarSize = "70";
    ButtonBar = "ButtonBarOKCancel";
    ButtonBarSize = "40";
    MessageFrame = "MessagesDisp";
    MessageFrameSize = "70";
 
  # Display the input screen
 
     STEP KeyInput
     {         
         USES S-STEP "BF9G72-I";
         "ButtonBarOKCancel" -> ButtonBar;
         STRINGTABLE.IDS_TITLE_BF9G72Input -> Title;
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
        BRANCH KeyInput;
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

 
     IF action == "ACTION_BACK"
        EXIT;
        

  # Process the Quote Data.

     STEP QuoteProcess
     {
         USES P-STEP "BF9G72-P";
         "1" -> MIR-DV-PRCES-STATE-CD;
     }

     IF LSIR-RETURN-CD != "00"
        BRANCH KeyInput;

#UY3149 Changes start
    
    IF MIR-VIR-SCREEN-IND == "Y"	
    {	
       STEP EditVir
       {
        USES S-STEP "BF9G73VIR-I";
        STRINGTABLE.IDS_TITLE_BF9G72Quote -> Title;
       }
       IF action == "ACTION_BACK"
       {
           IF DisplayInput != "FALSE"
           {
               ButtonBar = "ButtonBarOKCancel";
               MESSAGES-T[0] = "";
       
               BRANCH KeyInput;       
           }
           ELSE
               EXIT;
       }
       
       STEP RetrieveVir
         {
             USES P-STEP "BF9G72-P";
             "2" -> MIR-DV-PRCES-STATE-CD;
         }
         
       IF LSIR-RETURN-CD != "00"
          BRANCH EditVir;
          
       STEP QuoteOutputVir
       {     
	   USES S-STEP "BF9G73VIR-O";
	   STRINGTABLE.IDS_TITLE_BF9G72Result -> Title;
       }
    }
#UY3149 Changes end    
	ELSE
	
    {
       STEP Edit
       {
        USES S-STEP "BF9G73-I";
        STRINGTABLE.IDS_TITLE_BF9G72Quote -> Title;
       }
	
       IF action == "ACTION_BACK"
       {
           IF DisplayInput != "FALSE"
           {
               ButtonBar = "ButtonBarOKCancel";
               MESSAGES-T[0] = "";

               BRANCH KeyInput;

            }
            ELSE
                EXIT;
       }
	
       IF action == "ACTION_REFRESH"
          BRANCH Edit;
          
         STEP Retrieve
         {
             USES P-STEP "BF9G72-P";
             "2" -> MIR-DV-PRCES-STATE-CD;
         }
         
         IF LSIR-RETURN-CD != "00"
            BRANCH Edit;
             
  # Display the output of the update process 
         
         STEP QuoteOutput
         {     
            USES S-STEP "BF9G72-O";
            STRINGTABLE.IDS_TITLE_BF9G72Result -> Title;
         }
    }

     IF action == "ACTION_BACK"
     {  
        MESSAGES-T[0] = "";  
        BRANCH KeyInput;        
     }
     
     MESSAGES-T[0] = "";  
     BRANCH KeyInput; 
 }