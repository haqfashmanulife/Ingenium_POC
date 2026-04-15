#*******************************************************************************
#*  Component:   BF9C24-O.s                                                    *
#*  Description: TD Reinstatement Information List Screen                      *
#*                                                                             *
#*******************************************************************************
#*  Chg#    Release  Description                                               *
#*  NWLGLR  CTS      Intial Version                                            *
#*  C13892  CTS      ADDED LAPSE DATE                                          *
#*  UY3004  STREAM3  UNISYS POST MIGRATION DUPLICATION POLICY                  *
#*******************************************************************************

S-STEP BF9C24-O
{
	ATTRIBUTES
	{
		BusinessFunctionType = "List";
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
	
	OUT index
	{
		SType = "Hidden";
	}

#UY3004 CHANGES START
    INOUT Dispolval
    {
        SType = "Hidden";
    }

    INOUT Dissfxval
    {
        SType = "Hidden";
    }
#UY3004 CHANGES END

	IN MIR-POL-ID-BASE 
	{
		DisplayOnly;
		Key;
		Label = "Policy ID";
		Length = "9";
		SType = "Text";
	}

	IN MIR-POL-ID-SFX 
	{
		DisplayOnly;
		Key;
		Label = "Suffix";
		Length = "1";
		SType = "Text";
	}

	IN MIR-PRCES-DT 
	{
		DisplayOnly;
		Key;
		Label = "Processing Date";
		Length = "10";
		SType = "Date";
	}

	IN MIR-INSRD-CLI-ID-T[20] 
	{
		DisplayOnly;
		FieldGroup = "Table1";
		Index = "1";
		Label = "Insured Client Number";
		Length = "10";
		SType = "Text";
	}

	IN MIR-OVRDU-PREM-AMT-T[20] 
	{
		DisplayOnly;
		FieldGroup = "Table1";
		Index = "1";
		Label = "Delinquent Premium";
		Length = "15";
		SType = "Currency";
	}

	IN MIR-DV-INSRD-NM-T[20] 
	{
		DisplayOnly;
		FieldGroup = "Table1";
		Index = "1";
		Label = "Insured Name";
		Length = "50";
		SType = "Text";
	}

	IN MIR-OVRDU-INT-AMT-T[20] 
	{
		DisplayOnly;
		FieldGroup = "Table1";
		Index = "1";
		Label = "Delinquent Interest";
		Length = "15";
		SType = "Currency";
	}

	IN MIR-SELF-DSCLSRE-DT-T[20]
	{
		DisplayOnly;
		FieldGroup = "Table1";
		Index = "1";
		Label = "Self Disclosure Date";
		Length = "10";
		SType = "Date";
	}

	IN MIR-TOT-REQIR-AMT-T[20] 
	{
		DisplayOnly;
		FieldGroup = "Table1";
		Index = "1";
		Label = "Total Amount to be paid";
		Length = "15";
		SType = "Currency";
	}

	IN MIR-APCHD-LOC-CD-T[20] 
	{
		CodeSource = "EDIT";
		CodeType = "APLOC";
		DisplayOnly;
		FieldGroup = "Table1";
		Index = "1";
		Label = "Approached Location";
		Length = "1";
		SType = "Text";
	}

	IN MIR-PREM-DUE-MO-NUM-T[20] 
	{
		DisplayOnly;
		FieldGroup = "Table1";
		Index = "1";
		Label = "Premium Due Month";
		Length = "7";
		SType = "Text";
	}

	IN MIR-UWG-RSLT-CD-T[20] 
	{
		CodeSource = "EDIT";
		CodeType = "UWRES";
		DisplayOnly;
		FieldGroup = "Table1";
		Index = "1";
		Label = "Underwriting Result";
		Length = "1";
		SType = "Text";
	}

	IN MIR-PREM-DUE-QTY-T[20] 
	{
		DisplayOnly;
		FieldGroup = "Table1";
		Index = "1";
		Label = "Number of Premiums Due";
		Length = "3";
		SType = "Number";
	}

	IN MIR-PRCES-DT-T[20] 
	{
		DisplayOnly;
		FieldGroup = "Table1";
		Index = "1";
		Label = "Processing Date";
		Length = "10";
		SType = "Date";
	}

	IN MIR-REINST-DT-T[20] 
	{
		DisplayOnly;
		FieldGroup = "Table1";
		Index = "1";
		Label = "Reinstatement Date";
		Length = "10";
		SType = "Date";
	}

	IN MIR-INFO-STAT-CD-T[20] 
	{
		CodeSource = "EDIT";
		CodeType = "ISTAT";
		DisplayOnly;
		FieldGroup = "Table1";
		Index = "1";
		Label = "Information Status";
		Length = "1";
		SType = "Text";
	}
	
	IN MIR-UWG-DT-T[20]
	{
	     DisplayOnly;
	     FieldGroup = "Table1";
	     Index = "1";
	     Label = "Underwriting Date";
	     Length = "10";
	     SType = "Date";
	}     	     
	   
# NWLLR3 CHANGES STARTS HERE	   
#	IN MIR-DV-EXP-DT-T[20]
        IN MIR-REINST-XPRY-DT-T[20]
	{
	     DisplayOnly;
	     FieldGroup = "Table1";
	     Index = "1";
	     Label = "Expiry Date";
	     Length = "10";
	     SType = "Date";
	}
# NWLLR3 CHANGES ENDS HERE	   	
	
	IN MIR-EXCL-INFO-TXT-T[20]
	{
	     DisplayOnly;
	     FieldGroup = "Table1";
	     Index = "1";
	     Label = "Exclusion Information";
	     Length = "30";
	     SType = "Text";
	} 
# C13892 CHANGES STARTS HERE	   
        IN MIR-LAPS-DT-T[20]
	{
	     DisplayOnly;
	     FieldGroup = "Table1";
	     Index = "1";
	     Label = "Lapse Date";
	     Length = "10";
	     SType = "Date";
	}
# C13892 CHANGES ENDS HERE


}
