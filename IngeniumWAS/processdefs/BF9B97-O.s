#*******************************************************************************
#*  Component:   BF9B97-O.s                                                    *
#*  Description:                                                               *
#*                                                                             *
#*******************************************************************************
#*  Chg#    Release  Description                                               *
#*                                                                             *
#*  M319B5  CTS      CHANGES FOR AUTOMATIC PREMIUM LOAN FOR FXWL PRODUCT       *
#*  Q94522  CTS      FIX FOR THE APL INTEREST CAPITALIZATION                   *
#*******************************************************************************

S-STEP BF9B97-O
{
	ATTRIBUTES
	{
		BusinessFunctionType = "RevAplint";
		DelEmptyRows;
		FocusField = "OKButton";
		FocusFrame = "ButtonFrame";
		Type = "Output";
	}

	IN Title;

	IN TitleBar;
	IN TitleBarSize;

	IN ButtonBar;
	IN ButtonBarSize;

	IN MessageFrame;
	IN MessageFrameSize;

	OUT action
	{
		SType="Hidden";
	}

	IN MIR-APPL-CTL-PRCES-DT 
	{
		DefaultSession = "LSIR-PRCES-DT";
		DisplayOnly;
		Label = "Process Date";
		Length = "10";
		SType = "Date";
	}

	IN MIR-POL-ID-BASE 
	{
		DefaultSession = "MIR-POL-ID-BASE";
		DisplayOnly;
		Key;
		Label = "Policy Id";
		Length = "9";
		SType = "Text";
	}

	IN MIR-POL-ID-SFX 
	{
		DefaultSession = "MIR-POL-ID-SFX";
		DisplayOnly;
		Key;
		Label = "Suffix";
		Length = "1";
		SType = "Text";
	}

	IN MIR-POL-LOAN-SEQ-NUM 
	{
		DisplayOnly;
		Key;
		Label = "Sequence Number";
		Length = "3";
		SType = "Text";
	}

	IN MIR-SUPRES-CNFRM-IND 
	{
		DisplayOnly;
		Label = "Suppress confirmation statement";
		Length = "1";
		SType = "Indicator";
	}

	IN MIR-DV-OWN-CLI-NM 
	{
		DisplayOnly;
		Label = "Owner Name";
		Length = "75";
		SType = "Text";
	}

	IN MIR-JRNL-DT 
	{
		DefaultSession = "LSIR-PRCES-DT";
		DisplayOnly;
		Label = "Journal Date";
		Length = "10";
		SType = "Date";
	}

	IN MIR-APL-INT-AMT 
	{
		DisplayOnly;
		Label = "APL Interest Capitalization amount";
		Length = "15";
#M319B5 CHANGES STARTS HERE
                CurrencyCode = "MIR-POL-CRCY-CD";
#M319B5 CHANGES ENDS HERE                		
		SType = "Currency";
	}

	IN MIR-APL-AMT-AFTR 
	{
		DisplayOnly;
		Label = "APL Balance After Interest Capitalization";
		Length = "15";
#M319B5 CHANGES STARTS HERE
                CurrencyCode = "MIR-POL-CRCY-CD";
#M319B5 CHANGES ENDS HERE                			
		SType = "Currency";
	}

	IN MIR-APL-AMT-BEFORE 
	{
		DisplayOnly;
		Label = "APL Balance Before Interest Capitalization";
		Length = "15";
#M319B5 CHANGES STARTS HERE
                CurrencyCode = "MIR-POL-CRCY-CD";
#M319B5 CHANGES ENDS HERE                			
		SType = "Currency";
	}
#Q94522 CHANGES STARTS HERE	
       IN MIR-POL-CRCY-CD
        {
           Length = "2";           
           SType = "Hidden";
           Label = "Currency";
    }
#Q94522 CHANGES ENDS HERE	
}
