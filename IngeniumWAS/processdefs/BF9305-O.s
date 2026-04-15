#*******************************************************************************
#*  Component:   BF9305-O.s                                                    *
#*  Description: Created for Advance Payment Management Screen                 *
#*                                                                             *
#*******************************************************************************
#*  Chg#    Release  Description                                               *
#*  NWLPP6  CTS      INITIAL VERSION                                           *
#*  M319B1  CTS      CHANGES AS PART OF FXWL                                   *
#*  M319O1  CTS      CHANGES AS PART OF FXWL-Currency   Handling               *
#*  UYS025  CTS      ADVANCE PAYMENT RESERVE AMOUNT FIELD                      *
#*  UY3153  CTS      CR148 DHY ANNUITY CSV                                     *
#*******************************************************************************

S-STEP BF9305-O
{
	ATTRIBUTES
	{
		BusinessFunctionType = "Retrieve";
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

	IN MIR-POL-ID-BASE 
	{
		DefaultSession = "MIR-POL-ID-BASE";
		DisplayOnly;
		Key;
		Label = "Policy ID";
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

	IN MIR-PLAN-ID 
	{
		CodeSource = "EDIT";
		CodeType = "PLAN";
		DisplayOnly;
		Label = "Plan ID";
		Length = "6";
		SType = "Text";
	}

	IN MIR-DV-OWN-CLI-NM 
	{
		DisplayOnly;
		Label = "Owner Name";
		Length = "75";
		SType = "Text";
	}

	IN MIR-PRCES-DT 
	{
		DefaultSession = "LSIR-PRCES-DT";
		DisplayOnly;
		Label = "Processing Date";
		Length = "10";
		SType = "Date";
	}

	IN MIR-TRAD-PD-DUR-NUM 
	{
		DisplayOnly;
		Label = "Trad Paid Duration";
		Length = "6";
		SType = "Text";
	}

	IN MIR-TRAD-PD-TO-MO-NUM 
	{
		DisplayOnly;
		Label = "Trad Paid to Month";
		Length = "7";
		SType = "Text";
	}

	IN MIR-POL-PD-DUR-NUM 
	{
		DisplayOnly;
		Label = "Trad Actual Paid Duration";
		Length = "6";
		SType = "Text";
	}

	IN MIR-POL-PD-TO-MO-NUM 
	{
		DisplayOnly;
		Label = "Trad Actual Paid to Month";
		Length = "7";
		SType = "Text";
	}

#UYS025 CHANGES START HERE
    IN MIR-ADV-PMT-RSRV-AMT
    {    
        DisplayOnly;
        Signed;
        Length = "15";
        SType = "Currency";
        Label = "Advance Payment Reserve Amount";
    } 
#UYS025 CHANGES ENDS HERE

	IN MIR-SURR-AMT 
	{
		DisplayOnly;
		Label = "Surrender Amount";
		Length = "15";
		SType = "Currency";
#M319O1-AS PART OF FXWL CHNAGES STARTS HERE
		CurrencyCode = "MIR-PREM-CRCY-CD";
#M319O1-AS PART OF FXWL CHNAGES ENDS HERE
		Signed;
	}

	IN MIR-ADV-PMT-CAT-CD-T[50] 
	{
		CodeSource = "DataModel";
		CodeType = "ADV-PMT-CAT-CD";
		DisplayOnly;
		FieldGroup = "Table50";
		Index = "1";
		Label = "Category";
		Length = "4";
		SType = "Text";
	}

	IN MIR-PRCES-DT-T[50] 
	{
		DisplayOnly;
		FieldGroup = "Table50";
		Index = "1";
		Label = "Processing Year, Month and Date";
		Length = "10";
		SType = "Date";
	}

	IN MIR-APROP-YR-MO-T[50] 
	{
		DisplayOnly;
		FieldGroup = "Table50";
		Index = "1";
		Label = "Appropriation Year and Month";
		Length = "7";
		SType = "Text";
	}

	IN MIR-COLCT-AMT-T[50] 
	{
		DisplayOnly;
		FieldGroup = "Table50";
		Index = "1";
		Label = "Collection Amount";
		Length = "15";
		SType = "Currency";
#M319B1-AS PART OF FXWL CHNAGES STARTS HERE
		CurrencyCode = "MIR-PREM-CRCY-CD";
#M319B1-AS PART OF FXWL CHNAGES ENDS HERE
		Signed;
	}

	IN MIR-APROP-AMT-T[50] 
	{
		DisplayOnly;
		FieldGroup = "Table50";
		Index = "1";
		Label = "Amount Appropriated";
		Length = "15";
		SType = "Currency";
#M319B1-AS PART OF FXWL CHNAGES STARTS HERE
		CurrencyCode = "MIR-PREM-CRCY-CD";
#M319B1-AS PART OF FXWL CHNAGES ENDS HERE
		Signed;
	}

	IN MIR-RSDUE-AMT-T[50] 
	{
		DisplayOnly;
		FieldGroup = "Table50";
		Index = "1";
		Label = "Residuals of Advance Payment";
		Length = "15";
		SType = "Currency";
#M319B1-AS PART OF FXWL CHNAGES STARTS HERE
		CurrencyCode = "MIR-PREM-CRCY-CD";
#M319B1-AS PART OF FXWL CHNAGES ENDS HERE
		Signed;
	}

	IN MIR-NUM-MO-INT-CAP-T[50] 
	{
		DisplayOnly;
		FieldGroup = "Table50";
		Index = "1";
		Label = "Number of Months of Interest Capitalization";
		Length = "2";
		SType = "Text";
	}

	IN MIR-ADV-PMT-DUR-YYMM-T[50] 
	{
		DisplayOnly;
		FieldGroup = "Table50";
		Index = "1";
		Label = "Year and Month of Advance Payment";
		Length = "5";
		SType = "Text";
	}

	IN MIR-NXT-APROP-YR-MO-T[50] 
	{
		DisplayOnly;
		FieldGroup = "Table50";
		Index = "1";
		Label = "Next Appropriation Year and Month";
		Length = "7";
		SType = "Text";
	}

	IN MIR-INT-RT-T[50] 
	{
		Decimals = "4";
		DisplayOnly;
		FieldGroup = "Table50";
		Index = "1";
		Label = "Interest Rate";
		Length = "7";
		SType = "Percent";
	}

	IN MIR-ADV-PMT-END-YR-MO-T[50] 
	{
		DisplayOnly;
		FieldGroup = "Table50";
		Index = "1";
		Label = "Advance Payment End Year and Month";
		Length = "7";
		SType = "Text";
	}

	IN MIR-ADV-PMT-TYP-CD-T[50] 
	{
		CodeSource = "DataModel";
		CodeType = "ADV-PMT-TYP-CD";
		DisplayOnly;
		FieldGroup = "Table50";
		Index = "1";
		Label = "Prepayment/Lump-sum";
		Length = "1";
		SType = "Text";
	}

	IN MIR-ADV-PMT-STAT-CD-T[50] 
	{
		CodeSource = "DataModel";
		CodeType = "PCHST-STAT-CD";
		DisplayOnly;
		FieldGroup = "Table50";
		Index = "1";
		Label = "Status";
		Length = "1";
		SType = "Text";
	}

	IN MIR-PCHST-EFF-DT 
	{
		DisplayOnly;
		Length = "10";
		SType = "Hidden";
	}

	IN MIR-PCHST-SEQ-NUM 
	{
		DisplayOnly;
		Length = "3";
		SType = "Hidden";
	}

	IN MIR-TH-PREM-PD-DT-NUM 
	{
		DisplayOnly;
		Length = "10";
		SType = "Hidden";
	}

	IN MIR-HID-ADV-PMT-STRT-DT
	{
		Length = "10";
		SType = "Hidden";
	}

	IN MIR-HID-ADV-PMT-DUR
	{
		Length = "3";
		SType = "Hidden";
	}

	IN MIR-HID-ADV-PMT-END-DT
	{
		Length = "10";
		SType = "Hidden";
	}

	IN MIR-HID-ADV-PMT-TYP-CD
	{
		Length = "1";
		SType = "Hidden";
	}

	IN MIR-HID-RSDUE-AMT
	{
		Length = "15";
		SType = "Hidden";
	}

	IN MIR-HID-SURR-AMT
	{
		Length = "15";
		SType = "Hidden";
	}
#M319B1 CHANGES START HERE	
	IN MIR-PREM-CRCY-CD
	{
	     Length = "2";
	     SType = "Text";
	     Label = "Currency";
        }
#M319B1 CHANGES END HERE   
#UY3153 CHANGES START HERE
    IN MIR-ANN-PRE-BAL-AMT
    {    
        DisplayOnly;
        Signed;
        Length = "15";
        SType = "Currency";
        Label = "Annuity Prepayment Balance Amount";
    } 
    IN MIR-ANN-ADV-PAY-AMT
    {    
        DisplayOnly;
        Signed;
        Length = "15";
        SType = "Currency";
        Label = "Individual Annuity Advance Payment Balance";
    }     
#UY3153 CHANGES ENDS HERE
}
