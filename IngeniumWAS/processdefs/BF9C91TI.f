#*******************************************************************************
#*  Component:   BF9C91TI.f                                                    *
#*  Description: Survivorship Benefit Create Process                           *
#*                                                                             *
#*******************************************************************************
#*  Chg#    Release  Description                                               *
#*                                                                             *
#*  MP142F  CTS      Initial version                                           *
#*  Q07043  CTS      Displaying Ok dutton in 2nd update screen                 *
#*  R15582  CTS      AUDIT LOG RELATED CHANGES                                 *
#*  123718  CTS      BUG FIX FOR AUDIT LOG RELATED CHANGES                     *
#*******************************************************************************

# R15582 CHANGES BEGIN
INCLUDE "BF9G99-P.p";
# R15582 CHANGES END

PROCESS BF9C91TI
{
 

        Title = STRINGTABLE.IDS_TITLE_BF9C91Create;
        TitleBar = "TitleBar";
        TitleBarSize = "70";
        ButtonBar = "ButtonBarOKCancel";
        ButtonBarSize = "40";
        MessageFrame = "MessagesDisp";
        MessageFrameSize = "70";

        
        
        STEP BF9C91-P1
	{
	  USES P-STEP "BF9C91-P";
          "TI" -> MIR-DV-POL-FUT-ACTV-TYP-CD;	  
	  "1" -> MIR-DV-PRCES-STATE-CD;
	}
	
	IF LSIR-RETURN-CD != "00"
 	{
          EXIT;
	}
	
	
	
	ButtonBar = "ButtonBarOKCancel";
	
	# FTRQ Create Part 2
	
	STEP BF9C91SM-I
	{
	  USES S-STEP "BF9C91SM-I";
	  "P" -> MIR-POL-FUT-ACTV-STAT-CD;
	}
	
	IF action == "ACTION_BACK"
	{
	   MESSAGES-T[0] = "";
	   
          EXIT;
	}
	
	STEP BF9C91-P2
	{
	  USES P-STEP "BF9C91-P";
	  "2" -> MIR-DV-PRCES-STATE-CD;
	}
	
	IF LSIR-RETURN-CD != "00"
	{
	  BRANCH BF9C91SM-I;
	}
	
	ButtonBar = "ButtonBarConfirmCancel";
	# FTRQ Create Part 3
	STEP BF9C90SM-O
	{
	  USES S-STEP "BF9C90SM-O";
	  STRINGTABLE.IDS_TITLE_BF9C91CreateConfirm -> Title;
	}
	
	IF action == "ACTION_BACK"
	{
	  ButtonBar = "ButtonBarOKCancel";	
	  BRANCH BF9C91SM-I;
	}
	
	STEP BF9C91-P3
	{
	   USES P-STEP "BF9C91-P";
	  "3" -> MIR-DV-PRCES-STATE-CD;
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
    
             }
             IF LSIR-RETURN-CD != "00"
 	     {
                BRANCH BF9C90SM-O;
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
        EXIT;

}	        