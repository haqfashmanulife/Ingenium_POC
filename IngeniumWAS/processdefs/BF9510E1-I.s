# Converted from PathFinder 2.2 to 3.0 on Jun 18, 2004 3:12:05 PM EDT

#*******************************************************************************
#*  Component:   BF9510Lumpsum.f                                               *
#*  Description:                                                               *
#*                                                                             *
#*******************************************************************************
#*  Chg#    Release  Description                                               *
#*                                                                             *
#*  IPMPFA  CTS      Initial version for partial/full Lumpsum Payment          *
#*  ABU120  CTS      Modified the field Account Type MIR-BNK-ACC-TYP-CD on     *
#*                   Monthly Benefit Reduction screen                          *
#*  ISLIMP  CTS      ADDED 2 NEW FIELDS AND COMMENTED OUT 2 EXISTING FIELDS AS *
#*                   PART OF INSURANCE LAW                                     *
#*******************************************************************************

S-STEP BF9510E1-I
{
	ATTRIBUTES
	{
		BusinessFunctionType = "Retrieve";
		FocusField = "MIR-POL-ID-BASE";
		FocusFrame = "ContentFrame";
		Type = "Input";
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

 
        INOUT MIR-DV-PRCES-STATE-CD
        {
               Length = "1";
               DBTableName = "Derived";
               SType = "Hidden";
               Label = "process code";
        }        

	INOUT MIR-POL-ID-BASE
	{
		DefaultSession = "MIR-POL-ID-BASE";
		Key;
		Label = "Policy Id";
		Length = "9";
		Mandatory;
		SType = "Text";
	}

	INOUT MIR-POL-ID-SFX
	{
		DefaultSession = "MIR-POL-ID-SFX";
		Key;
		Label = "Suffix";
		Length = "1";
		SType = "Text";
	}

	INOUT MIR-POL-PAYO-NUM
	{
		DisplayOnly;
		Label = "Payout Number";
		Length = "5";
		DefaultConstant = "00000";
		SType = "Hidden";
	}

	INOUT MIR-POL-PAYO-TYP-CD
	{		
		Length = "31";
	        CodeSource = "DataModel";
     	        CodeType = "POL-PAYO-TYP-CD"; 
		DisplayOnly;
		Label = "Payout Type";	
		SType = "Hidden";
	}

	INOUT MIR-NEW-MTHLY-BNFT-AMT
	{
		DisplayOnly;
		Label = "New Monthly Benefit Amount";
		Length = "15";
		SType = "Hidden";
	}

	INOUT MIR-LMPSM-WTHDR-AMT
	{		
		DisplayOnly;
		Label = "Lumpsum Withdrawal Amount";
		Length = "15";
		SType = "Hidden";
	}

	INOUT MIR-WTHLD-TAX-AMT
	{		
		DisplayOnly;
		Label = "Withholding Tax Amount";
		Length = "15";
		SType = "Hidden";
	}

	INOUT MIR-REMITTANCE-AMT
	{
		Decimals = "2";
		DisplayOnly;
		Label = "Remittance Amount";
		Length = "15";
		SType = "Hidden";
	}
	
	INOUT MIR-DLAY-INT-AMT
	{		
		DisplayOnly;
		Label = "Delay Interest";
		Length = "15";
		SType = "Hidden";
	}
	
# MP113B CHANGES STARTS HERE	
	
	INOUT MIR-LMPSM-PMT-AMT
	{		
		DisplayOnly;
		Label = "Lumpsum Payment Amount";
		Length = "15";
		SType = "Hidden";
	}
	
	INOUT MIR-MKTVAL-ADJ-RT
	{
		Decimals = "5";
		DisplayOnly;
		Label = "Market Value Adjustment Rate";
		Length = "15";
		SType = "Hidden";
	}
	
	INOUT MIR-UNPAY-SPLT-PMT-AMT
	{
		Decimals = "2";
		DisplayOnly;
		Label = "Unpaid Split Payment Amount";
		Length = "15";
		SType = "Hidden";
	}
	
	INOUT MIR-SPLT-PMT-INT-AMT
	{
		Decimals = "2";
		DisplayOnly;
		Label = "Interest for Split Payment Amount";
		Length = "15";
		SType = "Hidden";
	}	
	
# MP113B CHANGES ENDS HERE		

	INOUT MIR-FIRM-BNK-TRXN-TYP-CD
	{
		CodeSource = "DataModel";
		CodeType = "FBNK-CAT-CD";
		DisplayOnly;
		Label = "Transaction Type";
		Length = "15";
		SType = "Hidden";
	}

	INOUT MIR-BNK-ID
	{
		DisplayOnly;
		Label = "Bank Number";
		Length = "4";
		SType = "Hidden";
	}

	INOUT MIR-BNK-BR-ID
	{
		DisplayOnly;
		Label = "Branch Number";
		Length = "5";
		SType = "Hidden";
	}

#CHANGED FOR ABU120
	INOUT MIR-BNK-ACC-TYP-CD
	{
#		CodeSource = "DataModel";
                CodeSource = "EDIT";
#		CodeType = "BNK-ACCT-TYP-CD";
                CodeType = "FBACC";
                SType = "Selection";
#		DisplayOnly;
		Label = "Account Type";
#		Length = "15";
                Length = "3";
#		SType = "Hidden";
	}
#ABU120 CHANGES ENDS


	INOUT MIR-CLI-BNK-ACCT-NUM
	{
		DisplayOnly;
		Label = "Bank Account Number";
		Length = "4";
		SType = "Hidden";
	}

	INOUT MIR-BNK-NM
	{
		DisplayOnly;
		Label = "Bank Name";
		Length = "36";
		SType = "Hidden";
	}

	INOUT MIR-BNK-BR-NM
	{
		DisplayOnly;
		Label = "Branch Name";
		Length = "36";
		SType = "Hidden";
	}

	INOUT MIR-BNK-ACCT-HLDR-NM
	{
		DisplayOnly;
		Label = "Account Holder Name";
		Length = "50";
		SType = "Hidden";
	}

# ISLIMP - Changes start here
#	INOUT MIR-HO-CLM-FRM-ACPT-DT
#	{
#		Length = "10";
#		SType = "Hidden";
#	}

#	INOUT MIR-DOC-COMPLT-DT
#	{
#		Length = "10";
#		SType = "Hidden";
#	}

	INOUT MIR-CLM-CO-RECV-DT
	{
		Length = "10";
		SType = "Hidden";
	}

	INOUT MIR-FINAL-DOC-COMPLT-DT
	{
		Length = "10";
		SType = "Hidden";
	}
# ISLIMP - Changes end here

	INOUT MIR-TAX-TYP-CD
	{
		Length = "14";
		SType = "Hidden";
	}
}
