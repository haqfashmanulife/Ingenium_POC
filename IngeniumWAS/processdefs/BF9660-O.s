# Converted from PathFinder 2.2 to 3.0 Jun 18, 2004 3:13:10 PM EDT


#*******************************************************************************
#*  Component:   BF9662-O.s                                                    *
#*  Description: Benefit Support Table (BENS) Update step                      *
#*                                                                             *
#*******************************************************************************
#*  Chg#    Release  Description                                               *
#*                                                                             *
#*  MP143E  CTS      CHANGES TO DISPLAY ALTERNATE MAXIMUM CLAIM UNITS          *
#*  Q06528  CTS      RIDER MAX AND CLAIM MAX FIELDS ARE INCREASED TO           *
#*  Q06528           THEIR ACTUL LENGTH MENTIONED IN DB                        * 
#*******************************************************************************

S-STEP BF9660-O
{
	ATTRIBUTES
	{
		BusinessFunctionType = "Retrieve";
		Type = "Output";
		DelEmptyRows;
		FocusField = "OKButton";
		FocusFrame = "ButtonFrame";
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

	IN MIR-PLAN-ID 
	{
		Key;
		DisplayOnly;
		Length = "40";
		CodeSource = "EDIT";
		CodeType = "PLAN";
		SType = "Text";
		Label = "Plan Name";
	}

	IN MIR-BNFT-NM-ID 
	{
		Key;
		DisplayOnly;
		Length = "40";
		CodeSource = "EDIT";
		CodeType = "BENNM";
		SType = "Text";
		Label = "Benefit Name";
	}

	IN MIR-STBL-2-CD 
	{
		Key;
		DisplayOnly;
		Length = "40";
		CodeSource = "EDIT";
		CodeType = "STB2";
		SType = "Text";
		Label = "Sub-table 2";
	}

	IN MIR-STBL-4-CD 
	{
		Key;
		DisplayOnly;
		Length = "02";
		CodeSource = "EDIT";
		CodeType = "STB4";
		SType = "Text";
		Label = "Sub-table 4";
	}

    IN MIR-EFF-DT
    {
        Length = "10";
        DBTableName = "TBENS";
        SType = "Date";
        Label = "Effective Date";
    }

    IN MIR-BNFT-AMT-CALC-CD
    {
        Length = "30";
        CodeSource = "DataModel";
        CodeType = "BNFT-AMT-CALC-CD";
        DBTableName = "TBENS";
        SType = "Text";
        Label = "Benefit Amount Calculation Code";
    }

    IN MIR-MULTR-TYPE-CD
    {
        Length = "30";
        CodeSource = "EDIT";
        CodeType = "BNMLT";
        DBTableName = "TBENS";
        SType = "Text";
        Label = "Multiplier Type";
    }
    IN MIR-BENS-BNFT-FCT
    {
        Length = "6";
        Decimals = "2";
        DBTableName = "TBENS";
        SType = "Number";
        Label = "Benefit Factor";
    }

    IN MIR-BENS-DPND-FCT
    {
        Length = "3";
        Decimals = "2";
        DBTableName = "TBENS";
        SType = "Number";
        Label = "Dependant Factor";
    }

    IN MIR-BENS-PMT-TYP-CD
    {
        Length = "30";
        CodeSource = "DataModel";
        CodeType = "BENS-PMT-TYP-CD";
        DBTableName = "TBENS";
        SType = "Text";
        Label = "Payment Type Indicator";
    }

    IN MIR-INIT-DEDBL-UNITS
    {
        Length = "4";
        Decimals = "0";
        DBTableName = "TBENS";
        SType = "Number";
        Label = "BNFT-AMT-CALC-CD";
    }

    IN MIR-MIN-HOSP-UNITS
    {
        Length = "4";
        Decimals = "0";
        DBTableName = "TBENS";
        SType = "Number";
        Label = "Minimum Hospitalisation Units";
    }

    IN MIR-MAX-CLM-UNITS
    {
        Length = "4";
        Decimals = "0";
        DBTableName = "TBENS";
        SType = "Number";
        Label = "Maximum Claim Units";
    }

    IN MIR-MAX-RIDER-UNITS
    {
        Length = "5";
        Decimals = "0";
        DBTableName = "TBENS";
        SType = "Number";
        Label = "Maximum Rider Units";
    }

    IN MIR-SUBSEQ-HOSP-UNITS
    {
        Length = "4";
        Decimals = "0";
        DBTableName = "TBENS";
        SType = "Number";
        Label = "Subsequent Hospitalisation Units";
    }

    IN MIR-CONTNU-HOSP-UNITS
    {
        Length = "4";
        Decimals = "0";
        DBTableName = "TBENS";
        SType = "Number";
        Label = "Continuous Hospitalisation Units";
    }
    
    IN MIR-VALID-PERI-UNITS
    {
        Length = "4";
        Decimals = "0";
        DBTableName = "TBENS";
        SType = "Number";
        Label = "Valid Benefit Period Units";
    }
    
    IN MIR-WAITING-PERI-UNITS
    {
        Length = "4";
        Decimals = "0";
        DBTableName = "TBENS";
        SType = "Number";
        Label = "Waiting Period (Years)";
    }

    IN MIR-CANCER-BNFT-IND
    {
        Length = "1";
        SType = "Indicator";
        Label = "Cancer Benefit";
    }

    IN MIR-DSCHRG-ELIG-IND
    {
        Length = "1";
        SType = "Indicator";
        Label = "Discharge Benefit Eligibility";
    }

    IN MIR-INCID-TYP-CD
    {
        Length = "1";
        DBTableName = "TBENS";
        CodeSource = "DataModel";
        CodeType = "INCID-TYP-CD";        
        SType = "Text";
        Label = "Incident Type";
    }

    IN MIR-BNFT-CAT-CD
    {
        Length = "5";
        DBTableName = "TBENS";
        CodeSource = "DataModel";
        CodeType = "BNFT-CAT-CD";        
        SType = "Text";
        Label = "Benefit Category";
    }

    IN MIR-BENS-CLM-TYP-CD
    {
        Length = "5";
        DBTableName = "TBENS";
        CodeSource = "DataModel";
        CodeType = "BENS-CLM-TYP-CD";        
        SType = "Text";
        Label = "Benefit Claim Type";
    }

    IN MIR-BNFT-ID-CD
    {
        Length = "5";
        DBTableName = "TBENS";
        CodeSource = "DataModel";
        CodeType = "BNFT-ID-CD";        
        SType = "Text";
        Label = "Benefit Identifier Code";
    }

    IN MIR-VALID-PERI-DPND-CD
    {
        Length = "1";
        DBTableName = "TBENS";
        CodeSource = "DataModel";
        CodeType = "VALID-PERI-DPND-CD";        
        SType = "Text";
        Label = "Valid Benefit Period Dependency";
    }

    IN MIR-VALID-PERI-TYP-CD
    {
        Length = "1";
        DBTableName = "TBENS";
        CodeSource = "DataModel";
        CodeType = "VALID-PERI-TYP-CD";        
        SType = "Text";
        Label = "Valid Benefit Period Type";
    }

    IN MIR-AGG-RULE-CD
    {
        Length = "1";
        DBTableName = "TBENS";
        CodeSource = "DataModel";
        CodeType = "AGG-RULE-CD";        
        SType = "Text";
        Label = "Aggregation Type";
    }
    
    IN MIR-FORCE-NEW-AGG-DUR
    {
        Length = "4";
        Decimals = "0";
        DBTableName = "TBENS";
        SType = "Number";
        Label = "Force New Aggregation For Accident";
    }

    IN MIR-RDR-VERS-GR-CD
    {
        Length = "2";
        DBTableName = "TBENS";
        CodeSource = "DataModel";
        CodeType = "RDR-VERS-GR-CD";        
        SType = "Text";
        Label = "Rider Version Group Code";
    }
#* MP143E CHANGES START    
    
    IN MIR-ALT-MAX-CLM-UNITS
    {
        Length = "5";
        Decimals = "0";
        DBTableName = "TBENS";
        SType = "Number";
        Label = "Alternate Maximum Claim Units";
    }    
#* MP143E CHANGES END
 }
