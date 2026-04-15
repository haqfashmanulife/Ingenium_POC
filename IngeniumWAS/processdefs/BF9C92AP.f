#*******************************************************************************
#*  Component:   BF9C92AP.f                                                    *
#*  Description: Advance Payment Update Process                                *
#*                                                                             *
#*******************************************************************************
#*  Chg#    Release  Description                                               *
#*                                                                             *
#*  UYS025  CTS      Initial Version                                            *
#*******************************************************************************

INCLUDE "BF9C90-P.p";
INCLUDE "BF9C92-I.s";
INCLUDE "BF9C92-P.p";
INCLUDE "BF9C90AP-O.s";


PROCESS BF9C92AP
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
         "AP" -> MIR-DV-POL-FUT-ACTV-TYP-CD;   	  
	}
	  
	  IF LSIR-RETURN-CD != "00"
	{
            EXIT;
	}
	  
	  ButtonBar = "ButtonBarOKCancel";
	  # FTRQ Update Part 1
	  STEP BF9C92-I
	{
	  USES S-STEP "BF9C92AP-I";
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
	  USES S-STEP "BF9C90AP-O";
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

    }