# Converted from PathFinder 2.2 to 3.0 Jun 18, 2004 3:13:59 PM EDT

#*******************************************************************************
#*  Component:   BF9275-P.p                                                    *
#*  Description: Adjudicator Inquiry Summary                                   *
#*                                                                             *
#*******************************************************************************
#*  Chg#    Release  Description                                               *
#*  CS0008  CTS      CSA IMPROVEMENTS-MEDICAL CLAIM CHANGES                    *
#*  UYSDMC  CTS      USYS CLAIM IND ADDITION                                   *
#*  S20982  CTS      CHANGES FOR BUG ID 982 - MEDICAL CLAIM                    *
#*  UY3001  CTS      STREAM 3 CHANGES                                          * 
#*******************************************************************************

P-STEP BF9275-P
{
    ATTRIBUTES
    {
        BusinessFunctionId = "9275";
        BusinessFunctionName = "Adjudicator Inquiry Details";
        BusinessFunctionType = "Retrieve";
        MirName = "CCWM9275";
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
    INOUT MIR-DV-INS-CLI-NM
    {
        Key;
        Length = "75";
        DBTableName = "Derived";
        SType = "Text";
        Label = "Insured Name";
    }
    INOUT MIR-CLMA-CLM-STAT-CD
    {
        Key;
        Length = "40";
        CodeSource = "DataModel";
        CodeType = "CLMA-CLM-STAT-CD";
        DBTableName = "TCLMA";
        SType = "Text";
        Label = "Master Claim Status";
    }
    INOUT MIR-CLMA-INSRD-CLI-ID
    {
        Key;
        Length = "10";
        DBTableName = "TCLMA";
        SType = "Text";
        Label = "Insured Client ID";
    }
    INOUT MIR-CLI-BTH-DT
    {
        Key;
        Length = "10";
        DBTableName = "TCLI";
        SType = "Date";
        Label = "Birth Date";
    }
    INOUT MIR-CLI-SEX-CD
    {
        Key;
        Length = "40";
        CodeSource = "DataModel";
        CodeType = "CLI-SEX-CD";
        DBTableName = "TCLI";
        SType = "Text";
        Label = "Sex";
    }
    INOUT MIR-INS-MORAL-RISK-IND   
    {
        Key;
        Length = "1";
        DBTableName = "Derived";
        SType = "Indicator";
        Label = "Insured Moral Risk";
    }
    INOUT MIR-CLAIM-NOTE-IND     
    {
        Key;
        Length = "1";
        DBTableName = "Derived";
        SType = "Indicator";
        Label = "Claim Note";
    }
    INOUT MIR-LIFE-INS-CLM-IND
    {
        Key;
        Length = "1";
        DBTableName = "TCLMA";
        SType = "Indicator";
        Label = "Life Insurance Claim In Progress";
    }
    INOUT MIR-CLMA-ASSOC-CLM-ID
    {
        Key;
        Length = "8";
        DBTableName = "TCLMA";
        SType = "Text";
        Label = "Associated Master Claim";
    }
    INOUT MIR-CLMA-HIST-CLM-IND
    {
        Key;
        Length = "1";
        DBTableName = "TCLMA";
        SType = "Indicator";
        Label = "Historical Claim";
    }
#UYSDMC CHANGES STARTS HERE
    INOUT MIR-CLMA-USYS-CLM-IND
    {
        Length = "1";
        DBTableName = "TCLMA";
        SType = "Indicator";
        Label = "Unisys Claim";
    }
#UYSDMC CHANGES ENDS HERE
    INOUT MIR-POL-ID
    {
        Key;
        Length = "10";
        DBTableName = "TPOL";
        SType = "Text";
        Label = "Policy ID";
    }
#UY3001 CHANGES STARTS
	INOUT MIR-LRG-PROD-CD
    {
        Key;
        Length = "03";
        DBTableName = "TPOL";
        SType = "Text";
        Label = "Large Product Type";
    }
#UY3001 CHANGES ENDS
    INOUT MIR-CVG-NUM
    {
        Key;
        Length = "2";
        DBTableName = "TCVG";
        SType = "Text";
        Label = "Coverage Number";
    }
    INOUT MIR-PLAN-ID
    {
        Key;
        Length = "40";
        CodeSource = "EDIT";
        CodeType = "PLAN";
        DBTableName = "TCVG";
        SType = "Text";
        Label = "Rider Name";
    }
    INOUT MIR-BNFT-NM-ID
    {
        Key;
        Length = "40";
        CodeSource = "EDIT";
        CodeType = "BENNM";
        DBTableName = "TCLBN";
        SType = "Text";
        Label = "Benefit Name";
    }
    INOUT MIR-BNFT-STAT-CD
    {
        Key;
        Length = "4";
        CodeSource = "DataModel";
        CodeType = "CLBN-BNFT-STAT-CD";
        DBTableName = "TCLBN";
        SType = "Text";
        Label = "Benefit Claim Status";
    }
    OUT MIR-SEQ-NUM-1-T[100]
    {
        Length = "4";
        FieldGroup = "Table2";
        DBTableName = "Derived";
        SType = "Number";
        Label = "#";
        Index = "1";
        Decimals = "0";
    }
    OUT MIR-SEQ-NUM-2-T[100]
    {
        Length = "4";
        FieldGroup = "Table2";
        DBTableName = "Derived";
        SType = "Number";
        Label = "#";
        Index = "1";
        Decimals = "0";
    } 
    OUT MIR-NON-PMT-REASN-TXT-T[100] 
    {
        Length = "08";  
        CodeSource = "DataModel";
        FieldGroup = "Table2";
        CodeType = "NON-PMT-REASN-TXT";
        DBTableName = "TCLBD";
        SType = "Text";
        Label = "Non-payment reason code";
        Index = "1";
      }
   OUT MIR-NON-PMT-SURGY-NM-T[100]
    {
        Length = "200";
        FieldGroup = "Table2";
        DBTableName = "Derived";
        SType = "Text";
        Label = "Surgery Name";
        Index = "1";
    }
#* S20982 Changes Start      
    OUT MIR-SUMM-AGG-NUM-T[80]
    {
        Length = "4";
        Decimals = "0";
        FieldGroup = "Table1";
        DBTableName = "Derived";
        SType = "Number";
        Label = "Agg. No.";
        Index = "1";
    }
    OUT MIR-TOT-BEFORE-AGG-QTY-T[80]
    {
        Length = "6";
        Decimals = "1";
        FieldGroup = "Table1";
        DBTableName = "Derived";
        SType = "Number";
        Label = "Total Before Aggregation";
        Index = "1";
    }
    OUT MIR-TOT-AGG-QTY-T[80]
    {
        Length = "6";
        Decimals = "0";
        FieldGroup = "Table1";
        DBTableName = "Derived";
        SType = "Number";
        Label = "Aggregated Total";
        Index = "1";
    }
    OUT MIR-OVERLAP-QTY-T[80]
    {
        Length = "6";
        Decimals = "0";
        FieldGroup = "Table1";
        DBTableName = "Derived";
        SType = "Number";
        Label = "Overlap Units";
        Index = "1";
    }
    OUT MIR-BELOW-MIN-HOSP-QTY-T[80]
    {
        Length = "6";
        Decimals = "0";
        FieldGroup = "Table1";
        DBTableName = "Derived";
        SType = "Number";
        Label = "Below Min. Hospital";
        Index = "1";
    }
    OUT MIR-OTHR-EXCL-QTY-T[80]
    {
        Length = "6";
        Decimals = "0";
        FieldGroup = "Table1";
        DBTableName = "Derived";
        SType = "Number";
        Label = "Other Excluded Units";
        Index = "1";
    }
    OUT MIR-EXCL-INIT-DED-QTY-T[80]
    {
        Length = "6";
        Decimals = "0";
        FieldGroup = "Table1";
        DBTableName = "Derived";
        SType = "Number";
        Label = "Initial Deductible Units";
        Index = "1";
    }
    OUT MIR-EXCL-XCES-QTY-T[80]
    {
        Length = "6";
        Decimals = "0";
        FieldGroup = "Table1";
        DBTableName = "Derived";
        SType = "Number";
        Label = "Excess Units";
        Index = "1";
    }
    OUT MIR-INELIG-XCES-QTY-T[80]
    {
        Length = "6";
        Decimals = "0";
        FieldGroup = "Table1";
        DBTableName = "Derived";
        SType = "Number";
        Label = "Excess Units";
        Index = "1";
    }
    OUT MIR-ALREADY-PD-QTY-T[80]
    {
        Length = "6";
        Decimals = "1";
        FieldGroup = "Table1";
        DBTableName = "Derived";
        SType = "Number";
        Label = "Already Paid";
        Index = "1";
    }
    OUT MIR-MULTR-TO-PAY-QTY-T[80]
    {
        Length = "6";
        Decimals = "1";
        FieldGroup = "Table1";
        DBTableName = "Derived";
        SType = "Number";
        Label = "Multiplier To Be Paid";
        Index = "1";
    }
    OUT MIR-SUMM-PAYBL-AMT-T[80]
    {
        Signed;
        Length = "16";
        FieldGroup = "Table1";
        DBTableName = "Derived";
        SType = "Currency";
        Label = "Payable Amount";
        Index = "1";
    }
    OUT MIR-PD-CLM-END-DT-T[80]
    {
        Length = "10";
        FieldGroup = "Table1";
        DBTableName = "Derived";
        SType = "Date";
        Label = "Paid Claim End Date";
        Index = "1";
    }
#* S20982 Changes End
}
