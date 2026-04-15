#*******************************************************************************
#*  Component:   BF9C92KC.f                                                    *
#*  Description: Kata Change Update Process                                    *
#*                                                                             *
#*******************************************************************************
#*  Chg#    Release  Description                                               *
#*                                                                             *
#*  S15287  CTS     Initial version - FAMILY KATA CHANGE                       *
#*******************************************************************************

INCLUDE "BF9C92-P.p";

PROCESS BF9C92KC
    {
     
      
        Title = STRINGTABLE.IDS_TITLE_BF9C92Update;
        TitleBar = "TitleBar";
        TitleBarSize = "70";
        ButtonBar = "ButtonBarOKCancel";
        ButtonBarSize = "40";
        MessageFrame = "MessagesDisp";
        MessageFrameSize = "70";
        
        STEP BF9C92-P1
	{
	  USES P-STEP "BF9C92-P";
      "KC" -> MIR-DV-POL-FUT-ACTV-TYP-CD;   	  
	}
	  
	  IF LSIR-RETURN-CD != "00"
	{
            EXIT;
	}
	  
    }