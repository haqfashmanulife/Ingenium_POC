#*******************************************************************************
#*  Component:   BF9C92SM.f                                                    *
#*  Description: Saving Rider Maturity Update Process                          *
#*                                                                             *
#*******************************************************************************
#*  Chg#    Release  Description                                               *
#*                                                                             *
#*  UY3066  CTS      Initial version - changes for saving rider                *
#*******************************************************************************

INCLUDE "BF9C90-P.p";
INCLUDE "BF9C92-I.s";
INCLUDE "BF9C92-P.p";
INCLUDE "BF9C90SM-O.s";
INCLUDE "BF9G99-P.p";

PROCESS BF9C92SM
    {
     
      
        Title = STRINGTABLE.IDS_TITLE_BF9C92Update;
        TitleBar = "TitleBar";
        TitleBarSize = "70";
        ButtonBar = "ButtonBarOKCancel";
        ButtonBarSize = "40";
        MessageFrame = "MessagesDisp";
        MessageFrameSize = "70";
        
    STEP BF9C90-P1
    {
      USES P-STEP "BF9C90-P";
      "SM" -> MIR-DV-POL-FUT-ACTV-TYP-CD;   	  
    }
  
    IF LSIR-RETURN-CD != "00"
    {
            EXIT;
    }
  
      ButtonBar = "ButtonBarOKCancel";
      # FTRQ Update Part 1
    STEP BF9C92-I
    {
      USES S-STEP "BF9C92SM-I";
      STRINGTABLE.IDS_TITLE_BF9C92Update1 -> Title;
    }
  
    IF action == "ACTION_BACK"
    {
  
      MESSAGES-T[0] = "";
          EXIT;
    }
  
    STEP BF9C92-P2
    {
      USES P-STEP "BF9C92-P";
      "1" -> MIR-DV-PRCES-STATE-CD;
    }
 
    IF LSIR-RETURN-CD != "00"
    {
       BRANCH BF9C92-I;
    }
  
     ButtonBar = "ButtonBarConfirmCancel";
     # FTRQ Update Part 2
    STEP BF9C90-O
    {
      USES S-STEP "BF9C90SM-O";
      STRINGTABLE.IDS_TITLE_BF9C91CreateConfirm -> Title;
    }
  
    IF action == "ACTION_BACK"
    {
      ButtonBar = "ButtonBarOKCancel";	  
      BRANCH BF9C92-I;
    }
  
    STEP BF9C92-P3
    {
       USES P-STEP "BF9C92-P";
       "2" -> MIR-DV-PRCES-STATE-CD;
    }
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

 
             temp-DTL-INFO = MIR-POL-ID-BASE + " " + MIR-POL-ID-SFX + " " + MIR-PBRQ-EFF-DT + " " + MIR-DV-POL-FUT-ACTV-TYP-CD;    
  
             STEP AUTROutput
             {
                USES P-STEP "BF9G99-P";
    
             SESSION.MIR-USER-ID -> MIR-USER-ID;
             SESSION.LSIR-BPF-ID -> MIR-BFCN-ID;

             temp-DTL-INFO ->MIR-TRNX-DTL-INFO; 
  
             "I" -> MIR-LOG-LEVL-CD;

             }
    IF LSIR-RETURN-CD != "00"
   	{
           BRANCH BF9C90-O;
    }

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

    }