# Converted from PathFinder 2.2 to 3.0 Jun 18, 2004 3:14:02 PM EDT

#*******************************************************************************
#*  Component:   BF9888-P.p                                                    *
#*  Description: Protected Claim Details Retrieve                              *
#*                                                                             *
#*******************************************************************************
#*  Chg#    Release  Description                                               *
#*                                                                             *
#*  HCL104B HIN/IH   Initial version                                           *
#*  RP2CLA   CTS   CHANGES FOR CANCER LUMPSUM AUTOMATION                       *
#*                                                                             *
#*******************************************************************************

P-STEP BF9888-P
{
    ATTRIBUTES
    {
        BusinessFunctionId = "9888";
        BusinessFunctionName = "Protected Claim Summary";
        BusinessFunctionType = "Retrieve";
        MirName = "CCWM9888";
    }

    OUT LSIR-RETURN-CD;

    OUT MIR-RETRN-CD;

    INOUT MIR-CLM-ID
    {
        Key;
        Mandatory;
        Length = "8";
        DefaultSession = "MIR-CLM-ID";
        DBTableName = "TCLMA";
        SType = "Text";
        Label = "Master Claim ID";
    }
    INOUT MIR-POL-ID
    {
        Length = "10";
        FieldGroup = "Table1";
        DBTableName = "TPOL";
        SType = "Text";
        Label = "Policy ID";
        Index = "1";
    }
    INOUT MIR-CVG-NUM
    {
        Length = "2";
        FieldGroup = "Table1";
        DBTableName = "TCVG";
        SType = "Text";
        Label = "Coverage Number";
        Index = "1";
    }
    INOUT MIR-PLAN-ID
    {
        FieldGroup = "Table1";
        Length = "40";
        CodeSource = "EDIT";
        CodeType = "PLAN";
        DBTableName = "TCVG";
        SType = "Text";
        Label = "Rider Name";
        Index = "1";
    }
    INOUT MIR-BNFT-NM-ID
    {
        KeyColumn;
        Length = "40";
        FieldGroup = "Table1";
        CodeSource = "EDIT";
        CodeType = "BENNM";
        DBTableName = "TCLBN";
        SType = "Text";
        Label = "Benefit Name";
        Index = "1";
    }
     INOUT MIR-CVG-FACE-AMT
    {
        Signed;
        Length = "16";
        FieldGroup = "Table1";
        SType = "Currency";
        Label = "Face Amount";
    }
    INOUT MIR-BNFT-PAYBL-AMT
    {
        Signed;
        Length = "16";
        FieldGroup = "Table1";
        DBTableName = "Derived";
        SType = "Currency";
        Label = "Payable Amount";
    }

    OUT MIR-DV-INS-CLI-NM
    {
        Length = "75";
        FieldGroup = "Table1";
        DBTableName = "Derived";
        SType = "Text";
        Label = "Insured Name";
    }
    OUT MIR-CLMA-CLM-STAT-CD
    {
        Length = "40";
        FieldGroup = "Table1";
        CodeSource = "DataModel";
        CodeType = "CLMA-CLM-STAT-CD";
        DBTableName = "TCLMA";
        SType = "Text";
        Label = "Master Claim Status";
    }
    OUT MIR-CLMA-INSRD-CLI-ID
    {
        Length = "10";
        FieldGroup = "Table1";
        DBTableName = "TCLMA";
        SType = "Text";
        Label = "Insured Client ID";
    }
    OUT MIR-CLI-BTH-DT
    {
        Length = "10";
        FieldGroup = "Table1";
        DBTableName = "TCLI";
        SType = "Date";
        Label = "Birth Date";
    }
    OUT MIR-CLI-SEX-CD
    {
        Length = "40";
        FieldGroup = "Table1";
        CodeSource = "DataModel";
        CodeType = "CLI-SEX-CD";
        DBTableName = "TCLI";
        SType = "Text";
        Label = "Sex";
    }
    OUT MIR-INS-MORAL-RISK-IND   
    {
        Length = "1";
        FieldGroup = "Table1";
        DBTableName = "Derived";
        SType = "Indicator";
        Label = "Insured Moral Risk";
    }
    OUT MIR-CLAIM-NOTE-IND     
    {
        Length = "1";
        FieldGroup = "Table1";
        DBTableName = "Derived";
        SType = "Indicator";
        Label = "Claim Note";
    }
    OUT MIR-LIFE-INS-CLM-IND
    {
        Length = "1";
        FieldGroup = "Table1";
        DBTableName = "TCLMA";
        SType = "Indicator";
        Label = "Life Insurance Claim In Progress";
    }
    INOUT MIR-SERV-BR-ID
    {
        Length = "5";
        FieldGroup = "Table1";
        DBTableName = "TPOL";
        SType = "Text";
        Label = "Servicing Branch";
        Index = "1";
    }
    INOUT MIR-BNFT-STAT-CD
    {
        Length = "4";
        FieldGroup = "Table1";
        CodeSource = "DataModel";
        CodeType = "CLBN-BNFT-STAT-CD";
        DBTableName = "TCLBN";
        SType = "Text";
        Label = "Benefit Claim Status";
    }
    OUT MIR-CLMA-ASSOC-CLM-ID
    {
        Length = "8";
        FieldGroup = "Table1";
        DBTableName = "TCLMA";
        SType = "Text";
        Label = "Associated Master Claim";
    }
    OUT MIR-CLMA-HIST-CLM-IND
    {
        Length = "1";
        FieldGroup = "Table1";
        DBTableName = "TCLMA";
        SType = "Indicator";
        Label = "Historical Claim";
    }


    INOUT MIR-CLBN-KEY
    {
        DisplayOnly;
	Length = "27";
        FieldGroup = "Table1";
	SType = "Text";
	Label = "CLBN Record Key";
    }
    INOUT MIR-BNFT-PMT-TYP-CD 
    {
        Length = "1";
        FieldGroup = "Table1";
        CodeSource = "DataModel";
        CodeType = "BENS-PMT-TYP-CD";
        SType = "Text";
        Label = "Unit Category";
    }
    INOUT MIR-BNFT-PAYBL-UNIT-QTY 
    {
        Length = "6";
        FieldGroup = "Table1";
        Decimals = "0";
        SType = "Number";
        Label = "Payable Units";
    }
    INOUT MIR-BNFT-MULTR-FCT 
    {
#*RP2CLA-Changed Decimals ="1"    
        Length = "6";
        FieldGroup = "Table1";
        Decimals = "1";
        SType = "Number";
        Label = "Multiplier";
    }

    INOUT MIR-SUMM-AGG-NUM-T[50]
    {
        Length = "4";
        Decimals = "0";
        FieldGroup = "Table2";
        DBTableName = "Derived";
        SType = "Number";
        Label = "Agg. No.";
        Index = "1";
    }
    INOUT MIR-TOT-BEFORE-AGG-QTY-T[50]
    {
#*RP2CLA-Changed Decimals ="1"    
        Length = "6";
        Decimals = "1";
        FieldGroup = "Table2";
        DBTableName = "Derived";
        SType = "Number";
        Label = "Total Before Aggregation";
        Index = "1";
    }
    INOUT MIR-TOT-AGG-QTY-T[50]
    {
        Length = "6";
        Decimals = "0";
        FieldGroup = "Table2";
        DBTableName = "Derived";
        SType = "Number";
        Label = "Aggregated Total";
        Index = "1";
    }
    INOUT MIR-OVERLAP-QTY-T[50]
    {
        Length = "6";
        Decimals = "0";
        FieldGroup = "Table2";
        DBTableName = "Derived";
        SType = "Number";
        Label = "Overlap Units";
        Index = "1";
    }
    INOUT MIR-BELOW-MIN-HOSP-QTY-T[50]
    {
        Length = "6";
        Decimals = "0";
        FieldGroup = "Table2";
        DBTableName = "Derived";
        SType = "Number";
        Label = "Below Min. Hospital";
        Index = "1";
    }
    INOUT MIR-OTHR-EXCL-QTY-T[50]
    {
        Length = "6";
        Decimals = "0";
        FieldGroup = "Table2";
        DBTableName = "Derived";
        SType = "Number";
        Label = "Other Excluded Units";
        Index = "1";
    }
    INOUT MIR-EXCL-INIT-DED-QTY-T[50]
    {
        Length = "6";
        Decimals = "0";
        FieldGroup = "Table2";
        DBTableName = "Derived";
        SType = "Number";
        Label = "Initial Deductible Units";
        Index = "1";
    }
    INOUT MIR-EXCL-XCES-QTY-T[50]
    {
        Length = "6";
        Decimals = "0";
        FieldGroup = "Table2";
        DBTableName = "Derived";
        SType = "Number";
        Label = "Excess Units";
        Index = "1";
    }
    INOUT MIR-INELIG-XCES-QTY-T[50]
    {
        Length = "6";
        Decimals = "0";
        FieldGroup = "Table2";
        DBTableName = "Derived";
        SType = "Number";
        Label = "Excess Units";
        Index = "1";
    }
    INOUT MIR-ALREADY-PD-QTY-T[50]
    {
#*RP2CLA-Changed Decimals ="1"    
        Length = "6";
        Decimals = "1";
        FieldGroup = "Table2";
        DBTableName = "Derived";
        SType = "Number";
        Label = "Already Paid";
        Index = "1";
    }
    INOUT MIR-MULTR-TO-PAY-QTY-T[50]
    {
#*RP2CLA-Changed Decimals ="1"    
        Length = "6";
        Decimals = "1";
        FieldGroup = "Table2";
        DBTableName = "Derived";
        SType = "Number";
        Label = "Multiplier To Be Paid";
        Index = "1";
    }
    INOUT MIR-SUMM-PAYBL-AMT-T[50]
    {
        Signed;
        Length = "16";
        FieldGroup = "Table2";
        DBTableName = "Derived";
        SType = "Currency";
        Label = "Payable Amount";
        Index = "1";
    }
    INOUT MIR-PD-CLM-END-DT-T[50]
    {
        Length = "10";
        FieldGroup = "Table2";
        DBTableName = "Derived";
        SType = "Date";
        Label = "Paid Claim End Date";
        Index = "1";
    }


    INOUT MIR-DTL-BCD-MAX-INDX 
    {
	Length = "03";
	FieldGroup = "Table3";
	SType = "Text";
	Label = "Num Benefit Rcds"; 
    } 
    INOUT MIR-DTL-BCD-KEY-T[100] 
    {
	Length = "27";
	FieldGroup = "Table3";
	SType = "Text";
	Label = "CLBD Record Key";
	Index = "1";
    }
    INOUT MIR-DTL-STRT-DT-T[100]
    {
        Length = "10";
        FieldGroup = "Table3";
        DBTableName = "Derived";
        SType = "Date";
        Label = "Start Date";
        Index = "1";
    }
    INOUT MIR-DTL-END-DT-T[100]
    {
        Length = "10";
        FieldGroup = "Table3";
        DBTableName = "Derived";
        SType = "Date";
        Label = "End Date";
        Index = "1";
    }
    INOUT MIR-DTL-END-STAT-CD-T[100]
    {
        Length = "1";
        FieldGroup = "Table3";
        CodeSource = "DataModel";
        CodeType = "CLEV-HOSP-STAT-CD";
        DBTableName = "TCLEV";
        SType = "Text";
        Label = "End Date Status";
        Index = "1";
    }
    INOUT MIR-DTL-AGG-NUM-T[100]
    {
        Length = "4";
        Decimals = "0";
        FieldGroup = "Table3";
        DBTableName = "Derived";
        SType = "Number";
        Label = "Agg. No.";
        Index = "1";
    }
    INOUT MIR-DTL-SEQ-NUM-T[100]
    {
        Length = "4";
        FieldGroup = "Table3";
        DBTableName = "Derived";
        SType = "Number";
        Label = "No.";
        Index = "1";
        Decimals = "0";
    }
    INOUT MIR-DTL-HOSP-DAYS-QTY-T[100]
    {
        Length = "6";
        Decimals = "0";
        FieldGroup = "Table3";
        DBTableName = "Derived";
        SType = "Number";
        Label = "Hosp Days";
        Index = "1";
    }
    INOUT MIR-DTL-DAYS-SINCE-QTY-T[100]
    {
        Length = "6";
        Decimals = "0";
        FieldGroup = "Table3";
        DBTableName = "Derived";
        SType = "Number";
        Label = "Days Since Disch. Or Acc";
        Index = "1";
    }
    INOUT MIR-DTL-EXCL-QTY-T[100]
    {
        Length = "6";
        Decimals = "0";
        FieldGroup = "Table3";
        DBTableName = "Derived";
        SType = "Number";
        Label = "Excluded Units";
        Index = "1";
    }
    INOUT MIR-DTL-REASN-CD-T[100]
    {
        Length = "15";
	FieldGroup = "Table3";
        CodeSource = "EDIT";
        CodeType = "CLBRN";
        DBTableName = "TCLBD";
        SType = "Text";
        Label = "Reason";
        Index = "1";
    }
    INOUT MIR-DTL-PAYBL-QTY-T[100]
    {
        Length = "6";
        Decimals = "0";
        FieldGroup = "Table3";
        DBTableName = "Derived";
        SType = "Number";
        Label = "Payable Units";
        Index = "1";
    }
    INOUT MIR-DTL-MULTR-FCT-T[100]
    {
#*RP2CLA-Changed Decimals ="1"    
        Length = "6";
        Decimals = "1";
        FieldGroup = "Table3";
        DBTableName = "Derived";
        SType = "Number";
        Label = "Multiplier";
        Index = "1";
    }
    INOUT MIR-DTL-PAYBL-AMT-T[100]
    {
        Signed;
        Length = "16";
        FieldGroup = "Table3";
        DBTableName = "Derived";
        SType = "Currency";
        Label = "Payable Amount";
        Index = "1";
    }
}
