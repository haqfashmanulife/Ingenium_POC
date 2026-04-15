
#*******************************************************************************
#*  Component:   BF9G80Retrieve.f                                              *
#*  Description: Created for Annuity Payout Transfer Quote Screen              *
#*                                                                             *
#*******************************************************************************
#*  Chg#    Release  Description                                               *
#*                                                                             *
#*  TDM22A  02MAR20  INITIAL VERSION                                           *
#*  UY3004  STREAM3  UNISYS POST MIGRATION DUPLICATION POLICY                  *
#*                                                                             *
#*******************************************************************************

INCLUDE "BF9G80-I.s";
INCLUDE "BF9G80-P.p";
INCLUDE "BF9G80-O.s";
# UY3004 CHANGES START
INCLUDE "BF9D34List.f";
# UY3004 CHANGES END

PROCESS BF9G80Retrieve
{

    Title = STRINGTABLE.IDS_TITLE_BF9G80Input;
    TitleBar = "TitleBar";
    TitleBarSize = "70";
    ButtonBar = "ButtonBarOKCancel";
    ButtonBarSize = "40";
    MessageFrame = "MessagesDisp";
    MessageFrameSize = "70";
 
  # Display the input screen
 
     STEP KeyInput
     {         
         USES S-STEP "BF9G80-I";
         "ButtonBarOKCancel" -> ButtonBar;
         STRINGTABLE.IDS_TITLE_BF9G80Input -> Title;
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

   # UY3004 CHANGES END 
 
     IF action == "ACTION_BACK"
        EXIT;

   
  # Process the Quote Data.

     STEP QuoteProcess
     {
         USES P-STEP "BF9G80-P";
         "1" -> MIR-DV-PRCES-STATE-CD;
     }

     IF LSIR-RETURN-CD != "00"
        BRANCH KeyInput;

  # Display the output of the update process 
    
     STEP QuoteOutput
     {     
        USES S-STEP "BF9G80-O";
        STRINGTABLE.IDS_TITLE_BF9G80Output -> Title;
        "ButtonBarOKCancelReport" -> ButtonBar;
     }

     IF action == "ACTION_BACK"
     {  
        MESSAGES-T[0] = "";  
        BRANCH KeyInput;        
     }
     
   # Process the Report Data
   
      IF action == "ACTION_REPORT"
      {     
         STEP ReportProcess
        {
              USES P-STEP "BF9G80-P";
              "2" -> MIR-DV-PRCES-STATE-CD;        
        }
 
        IF LSIR-RETURN-CD != "00"
           BRANCH QuoteOutput;
      }
      
     MESSAGES-T[0] = "";  
     MIR-ANTY-STRT-DT = " ";
     MIR-ANTY-PAYO-PERI-CD = " ";
     MIR-ANUTNT-TYP-CD = " ";
     MIR-FINAL-DPOS-DED-CD = "CD";
     BRANCH KeyInput; 
 }