#*******************************************************************************
#*  Component:   BF9C91AP.f                                                    *
#*  Description: Advance Payment Create Process                                *
#*                                                                             *
#*******************************************************************************
#*  Chg#    Release  Description                                               *
#*                                                                             *
#*  UYS025  CTS      Initial version                                           *
#*******************************************************************************


PROCESS BF9C91AP
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
	  ATTRIBUTES
	  {
	     GetMessages = "MERGE";
	                     
          }
          "AP" -> MIR-DV-POL-FUT-ACTV-TYP-CD;	  
	  "1" -> MIR-DV-PRCES-STATE-CD;
	}
	
	IF LSIR-RETURN-CD != "00"
 	{
          EXIT;
	}
	
	
	
	ButtonBar = "ButtonBarOKCancel";
	
	# FTRQ Create Part 2
	
	STEP BF9C91AP-I
	{
	  USES S-STEP "BF9C91AP-I";
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
	  BRANCH BF9C91AP-I;
	}
	
	ButtonBar = "ButtonBarConfirmCancel";
	# FTRQ Create Part 3
	STEP BF9C90AP-O
	{
	  USES S-STEP "BF9C90AP-O";
	  STRINGTABLE.IDS_TITLE_BF9C91CreateConfirm -> Title;
	}
	
	IF action == "ACTION_BACK"
	{
	  ButtonBar = "ButtonBarOKCancel";	
	  BRANCH BF9C91AP-I;
	}
	
	STEP BF9C91-P3
	{
	   USES P-STEP "BF9C91-P";
	  "3" -> MIR-DV-PRCES-STATE-CD;
	}
	
        EXIT;

}	        