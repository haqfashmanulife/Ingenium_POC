#*******************************************************************************
#*  Component:   BF9C92TI.f                                                    *
#*  Description: Term type process changes                                     *
#*                                                                             *
#*******************************************************************************
#*  Chg#    Release  Description                                               *
#*                                                                             *
#*  MP142F  CTS      Initial version                                           *
#*  Q07043  CTS      Displaying Ok dutton in 2nd update screen                 *
#*  R15582  CTS      AUDIT LOG RELATED CHANGES                                 *
#*  123718  CTS      BUG FIX FOR AUDIT LOG RELATED CHANGES                     *
#*  23774A  CTS      AUDIT LOG RELATED  CHANGES                                *
#*******************************************************************************

INCLUDE "BF9C90-P.p";
INCLUDE "BF9C92-I.s";
INCLUDE "BF9C92-P.p";
INCLUDE "BF9C90SM-O.s";
#R15582 CHANGES BEGIN
INCLUDE "BF9G99-P.p";
#R15582 CHANGES END

PROCESS BF9C92TI
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
         "TI" -> MIR-DV-POL-FUT-ACTV-TYP-CD;   	  
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
#123718 CHANGES BEGIN
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
#123718 CHANGES END
#R15582 CHANGES BEGIN

             temp-DTL-INFO = MIR-POL-ID-BASE + " " + MIR-POL-ID-SFX + " " + MIR-PBRQ-EFF-DT + " " + MIR-DV-POL-FUT-ACTV-TYP-CD;    
  
             STEP AUTROutput
             {
                USES P-STEP "BF9G99-P";
    
             SESSION.MIR-USER-ID -> MIR-USER-ID;
             SESSION.LSIR-BPF-ID -> MIR-BFCN-ID;

             temp-DTL-INFO ->MIR-TRNX-DTL-INFO; 

# 23774A CHANGES BEGIN
             "I" -> MIR-LOG-LEVL-CD;
# 23774A CHANGES END      
             }
 
  	IF LSIR-RETURN-CD != "00"
   	{
           BRANCH BF9C90-O;
	}
#R15582 CHANGES END	
#123718 CHANGES BEGIN
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
#123718 CHANGES END

    }