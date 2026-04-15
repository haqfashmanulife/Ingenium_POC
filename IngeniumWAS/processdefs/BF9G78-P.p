# Converted to Pathfinder 3.0 on Dec 13, 2024 10:39:22 AM EDT

#*******************************************************************************
#*  Component:   BF9G78-P.p                                                    *
#*  Description:                                                               *
#*                                                                             *
#*******************************************************************************
#*  Chg#    Release  Description                                               *
#*                                                                             *
#*  UYDM36   CTS      INITIAL VERSION OF UNISYS ANNUITY POLICY INQUIRY SCREEN  *
#*******************************************************************************

P-STEP BF9G78-P
{
    ATTRIBUTES
    {
        BusinessFunctionId = "9G78";
        BusinessFunctionName = "UNISYS ANNUITY POLICY INQUIRY SCREEN";
        BusinessFunctionType = "Inquiry";
        MirName = "CCWM9G78";
    }

    OUT LSIR-RETURN-CD;

    OUT MIR-RETRN-CD;

    INOUT MIR-ANTY-POL-ID 
    {
        DisplayOnly;
        Key;
        Mandatory;
        Label = "Annuity Policy Id";
        DefaultSession = "MIR-ANTY-POL-ID";
        Length = "10";
        DBTableName = "TU3AM";
        SType = "Text";
    }
    OUT MIR-ANTY-TYP-CD
    {
        DisplayOnly;
        Label = "Annuity Type Code";
        Length = "3";
        DBTableName = "TU3AM";
        SType = "Text";
    }
    OUT MIR-ANTY-PMT-STRT-DT 
    {
        DisplayOnly;
        Label = "Annuity Payment Start Date";
        Length = "8";
        DBTableName = "TU3AM";
        SType = "Date";
    }
    OUT MIR-ANTY-TYP 
    {
        DisplayOnly;
        CodeSource = "DataModel";
        CodeType = "ANTY-TYP";
        Label = "Annuity Type";
        Length = "2";
        DBTableName = "TU3AM";
        SType = "Text";
    }
    OUT MIR-BNFY-NM-KANA 
    {
        DisplayOnly;
        Label = "Beneficiary Name";
        Length = "32";
        DBTableName = "TU3AM";
        SType = "Text";
    }
    OUT MIR-ANTY-MODEL 
    {
        DisplayOnly;
        CodeSource = "DataModel";
        CodeType = "ANTY-MODEL";
        Label = "Annuity Model";
        Length = "2";
        DBTableName = "TU3AM";
        SType = "Text";
    }
    OUT MIR-INSRD-NM-KANA 
    {   
        DisplayOnly;
        Label = "Insured Name";
        DBTableName = "TU3AM";
        Length = "32";
        SType = "Text";
    }
    OUT MIR-ANTY-PMT-DUR 
    {
        DisplayOnly;
        Label = "Annuity Payment Period";
        Length = "2";
        DBTableName = "TU3AM";
        SType = "Text";
    }
    OUT MIR-GUAR-DUR 
    {
        DisplayOnly;
        Label = "Guaranteed Period";
        Length = "2";
        DBTableName = "TU3AM";
        SType = "Text";
    }
    OUT MIR-BASIC-ANTY-ANN-PMT 
    {
        DisplayOnly;
        Label = "Basic Annuity Annual Payment";
        Length = "10";
        DBTableName = "TU3AM";
        SType = "Text";
    }
    OUT MIR-INCR-ANTY-AMT 
    {
        DisplayOnly;
        Label = "Increased Annuity Amount";
        Length = "10";
        DBTableName = "TU3AM";
        SType = "Text";
    }
    OUT MIR-ANTY-FND-SETUP-DT 
    {
        DisplayOnly;
        Label = "Annuity Fund Setup Date";
        Length = "8";
        DBTableName = "TU3AM";
        SType = "Date";
    }
    OUT MIR-ANTY-RESRC 
    {
        DisplayOnly;
        Label = "Annuity Resources";
        Length = "10";
        DBTableName = "TU3AM";
        SType = "Text";
    }
    OUT MIR-CUM-ANTY-PMT-VALU 
    {
        DisplayOnly;
        Label = "Cumulative Annuity Payment Value";
        Length = "10";
        DBTableName = "TU3AM";
        SType = "Text";
    }
    OUT MIR-BNFY-BTH-DT 
    {
        DisplayOnly;
        Label = "Benificiary Birthdate";
        Length = "8";
        DBTableName = "TU3AM";
        SType = "Date";
    }
    OUT MIR-BNFY-SEX-CD 
    {
        DisplayOnly;
        Label = "Beneficiary Gender";
        Length = "1";
        DBTableName = "TU3AM";
        SType = "Text";
    }
    OUT MIR-BIT-G-TRMN-CD 
    {
        DisplayOnly;
        Label = "Terminated";
        Length = "1";
        DBTableName = "TU3AM";
        SType = "Text";
    }
    OUT MIR-OT-PMT-MD 
    {
        DisplayOnly;
        Label = "One Time Payment Made";
        Length = "1";
        DBTableName = "TU3AM";
        SType = "Text";
    }
    OUT MIR-ANTY-MVT-NUM 
    {
        DisplayOnly;
        Label = "No Annutity Movement";
        Length = "1";
        DBTableName = "TU3AM";
        SType = "Text";
    }
    OUT MIR-PERM-DISAB-CD 
    {
        DisplayOnly;
        Label = "Permanent Disability";
        Length = "1";
        DBTableName = "TU3AM";
        SType = "Text";
    }
    OUT MIR-COND-CHNG-POL-ID 
    {
        DisplayOnly;
        Label = "Conditions Change Policy";
        Length = "1";
        DBTableName = "TU3AM";
        SType = "Text";
    }
    OUT MIR-MVT-G-XFER-CD 
    {
        DisplayOnly;
        Label = "Transfer Code";
        Length = "3";
        DBTableName = "TU3AM";
        SType = "Text";
    }
    OUT MIR-MVT-G-XFER-DT 
    {
        DisplayOnly;
        Label = "Transfer Date";
        Length = "8";
        DBTableName = "TU3AM";
        SType = "Date";
    }
    OUT MIR-REQD-XPNS-RT 
    {
        DisplayOnly;
        Label = "Rate of necessary expenses";
        Length = "3";
        DBTableName = "TU3AM";
        SType = "Text";
    }
    OUT MIR-NET-PREM-PD 
    {
        DisplayOnly;
        Label = "Net premium paid";
        Length = "10";
        DBTableName = "TU3AM";
        SType = "Text";
    }
    OUT MIR-TOT-PREM-PD 
    {
        DisplayOnly;
        Label = "Premium Paid Total";
        Length = "10";
        DBTableName = "TU3AM";
        SType = "Text";
    }
    OUT MIR-WTHLD-TXEMP-IND 
    {
        DisplayOnly;
        Label = "Non withholding Flag";
        Length = "1";
        DBTableName = "TU3AM";
        SType = "Text";
    }
    OUT MIR-DEFR-DUR 
    {
        DisplayOnly;
        Label = "Period Deferred";
        Length = "2";
        DBTableName = "TU3AM";
        SType = "Text";
    }
    OUT MIR-DEFR-STRT-DT 
    {
        DisplayOnly;
        Label = "Deferrance Start Date";
        Length = "8";
        DBTableName = "TU3AM";
        SType = "Date";
    }
    OUT MIR-SURR-BASE-ANTY-AMT-3 
    {
        DisplayOnly;
        Label = "Base annuity amount for surrender";
        Length = "10";
        DBTableName = "TU3AM";
        SType = "Text";
    }
    OUT MIR-ENH-SURR-AMT-ON-DT 
    {
        DisplayOnly;
        Label = "Enhanced annuity amount for surrender";
        Length = "10";
        DBTableName = "TU3AM";
        SType = "Text";
    }
    OUT MIR-BNK-CD 
    {
        DisplayOnly;
        Label = "Bank Number";
        Length = "4";
        DBTableName = "TU3AM";
        SType = "Text";
    }
    OUT MIR-BRCH-CD 
    {
        DisplayOnly;
        Label = "Branch Number";
        Length = "3";
        DBTableName = "TU3AM";
        SType = "Text";
    }
     OUT MIR-BNK-ACCT-TYP 
    {
        DisplayOnly;
        Label = "Account type";
        Length = "2";
        DBTableName = "TU3AM";
        SType = "Text";
    }
    OUT MIR-BNK-ACCT-NUM 
    {
        DisplayOnly;
        Label = "Bank Account ID";
        Length = "10";
        DBTableName = "TU3AM";
        SType = "Text";
    }
    OUT MIR-BNK-ACCT-HLDR-NM 
    {
        DisplayOnly;
        Label = "Account Holder Name";
        Length = "32";
        DBTableName = "TU3AM";
        SType = "Text";
    }
    INOUT MIR-RECORD-CTR1
    {
        Length = "1";
        SType = "Hidden";
        Label = "Rec Count";
    }
    OUT MIR-ANTY-SR-NUM-T[50]
    {
        DisplayOnly;
        Length = "2"; 
        FieldGroup = "Table100";
        SType = "Text";
        Label = "Number";
        DBTableName = "TU3AH";
        Index = "1";
    }
    OUT MIR-PYMT-DT-YMD-T[50]
    {
        DisplayOnly;
        Length = "8";
        FieldGroup = "Table100";
        SType = "Date";
        Label = "Date of Payment";
        DBTableName = "TU3AH";
        Index = "1";
    }
    OUT MIR-PYMT-CLAS-1-T[50]
    {
        DisplayOnly;
        CodeSource = "DataModel";
        CodeType = "PYMT-CLAS-1";
        Length = "1";
        FieldGroup = "Table100";
        SType = "Text";
        Label = "Category 1";
        DBTableName = "TU3AH";
        Index = "1";
    }
    OUT MIR-PYMT-CLAS-2-T[50]
    {
        Length = "1";
        CodeSource = "DataModel";
        CodeType = "PYMT-CLAS-2";
        DisplayOnly;
        FieldGroup = "Table100";
        SType = "Text";
        Label = "Category 2";
        DBTableName = "TU3AH";
        Index = "1";
    }
    OUT MIR-PYMT-FISC-YR-T[50]
    {
        Length = "2";
        DisplayOnly;
        FieldGroup = "Table100";
        SType = "Text";
        Label = "Fiscal Year";
        DBTableName = "TU3AH";
        Index = "1";
    }
    OUT MIR-PYMT-FREQ-T[50]
    {
        Length = "1"; 
        DisplayOnly;
        FieldGroup = "Table100";
        SType = "Text";    
        Label = "Duration";
        DBTableName = "TU3AH";      
        Index = "1";    
    }
    OUT MIR-BASE-ANTY-YR-AMT-T[50]
    {
        DisplayOnly;
        Length = "10";
        FieldGroup = "Table100";
        SType = "Text";
        DBTableName = "TU3AH";
        Label = "Annuity Amount";
        Index = "1";
    }
    OUT MIR-DIV-AMT-T[50]
    {
        Length = "10";
        DisplayOnly;
        FieldGroup = "Table100";
        SType = "Text";
        DBTableName = "TU3AH";
        Label = "Dividends";
        Index = "1";
    }
    OUT MIR-INC-ANTY-AMT-T[50]
    {
        Length = "10";
        DisplayOnly;
        FieldGroup = "Table100";
        SType = "Text";
        DBTableName = "TU3AH";
        Label = "Increased pension Amount";
        Index = "1";
    }
    OUT MIR-INT-AMT-T[50]
    {
        Length = "8";
        DisplayOnly;
        FieldGroup = "Table100";
        SType = "Text";
        DBTableName = "TU3AH";      
        Label = "Split Interest";    
        Index = "1";
    }
    OUT MIR-TAX-AMT-T[50]
    {
        Length = "10";
        DisplayOnly;
        FieldGroup = "Table100";
        SType = "Text";
        DBTableName = "TU3AH";      
        Label = "Tax Amount";    
        Index = "1"; 
    }
    OUT MIR-NET-AMT-T[50]
    {
        Length = "10";
        DisplayOnly;
        FieldGroup = "Table100";
        SType = "Text";
        DBTableName = "TU3AH";      
        Label = "NET Payment Amount";
        Index = "1";
    }
    OUT MIR-PYMT-MTHD-T[50]
    {
        Length = "1";
        DisplayOnly;
        FieldGroup = "Table100";
        SType = "Text";
        DBTableName = "TU3AH";      
        Label = "Payout Method";    
        Index = "1";
    }
}