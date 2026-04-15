# Converted to Pathfinder 3.0 on Dec 13, 2024 10:39:22 AM EDT

#*******************************************************************************
#*  Component:   BF9G78-O.s                                                    *
#*  Description:                                                               *
#*                                                                             *
#*******************************************************************************
#*  Chg#    Release  Description                                               *
#*                                                                             *
#*  UYDM36     CTS      INITIAL VERSION OF UNISYS ANNUITY POLICY INQUIRY SCREEN*
#*  S47151     CTS      FIX FOR UDS3-47151                                     *
#*******************************************************************************

S-STEP BF9G78-O
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
        SType = "Hidden";
    }

    OUT index
    {
        SType = "Hidden";
    }
    IN MIR-ANTY-TYP-CD
    {
        DisplayOnly;
        Label = "Annuity Type Code";
        Length = "3";
        DBTableName = "TU3AM";
        SType = "Text";
    }
    IN MIR-ANTY-PMT-STRT-DT 
    {
        DisplayOnly;
        Label = "Annuity Payment Start Date";
        Length = "8";
        DBTableName = "TU3AM";
        SType = "Date";
    }
#   INOUT MIR-ANTY-POL-ID 
#S47151 start here
    IN MIR-ANTY-POL-ID 
#S47151 end here
    {
        Key;
        DisplayOnly;
        DefaultSession = "MIR-ANTY-POL-ID";
        Label = "Annuity Policy Id";
        DBTableName = "TU3AM";
        Length = "10";
        SType = "Text";
    }
    IN MIR-ANTY-TYP 
    {
        DisplayOnly;
        Label = "Annuity Type";
        CodeSource = "DataModel";
        CodeType = "ANTY-TYP";
        DBTableName = "TU3AM";
        Length = "2";
        SType = "Text";
    }
    IN MIR-BNFY-NM-KANA 
    {
        DisplayOnly;
        Label = "Beneficiary Name";
        Length = "32";
        SType = "Text";
    }
    IN MIR-ANTY-MODEL 
    {
        DisplayOnly;
        Label = "Annuity Model";
        CodeSource = "DataModel";
        CodeType = "ANTY-MODEL";
        DBTableName = "TU3AM";
        Length = "2";
        SType = "Text";
    }
    IN MIR-INSRD-NM-KANA 
    {
        DisplayOnly;
        Label = "Insured Name";
        DBTableName = "TU3AM";
        Length = "32";
        SType = "Text";
    }
    IN MIR-ANTY-PMT-DUR 
    {
        DisplayOnly;
        Label = "Annuity Payment Period";
        DBTableName = "TU3AM";
        Length = "2";
        SType = "Text";
    }
    IN MIR-GUAR-DUR 
    {
        DisplayOnly;
        Label = "Guaranteed Period";
        DBTableName = "TU3AM";
        Length = "2";
        SType = "Text";
    }
    IN MIR-BASIC-ANTY-ANN-PMT 
    {
        DisplayOnly;
        Label = "Basic Annuity Annual Payment";
        DBTableName = "TU3AM";
        Length = "10";
        SType = "Text";
    }
    IN MIR-INCR-ANTY-AMT 
    {
        DisplayOnly;
        Label = "Increased Annuity Amount";
        DBTableName = "TU3AM";
        Length = "10";
        SType = "Text";
    }
    IN MIR-ANTY-FND-SETUP-DT 
    {
        DisplayOnly;
        Label = "Annuity Fund Setup Date";
        DBTableName = "TU3AM";
        Length = "8";
        SType = "Date";
    }
    IN MIR-ANTY-RESRC 
    {
        DisplayOnly;
        Label = "Annuity Resources";
        DBTableName = "TU3AM";
        Length = "10";
        SType = "Text";
    }
    IN MIR-CUM-ANTY-PMT-VALU 
    {
        DisplayOnly;
        Label = "Cumulative Annuity Payment Value";
        DBTableName = "TU3AM";
        Length = "10";
        SType = "Text";
    }
    IN MIR-BNFY-BTH-DT 
    {
        DisplayOnly;
        Label = "Benificiary Birthdate";
        DBTableName = "TU3AM";
        Length = "8";
        SType = "Date";
    }
    IN MIR-BNFY-SEX-CD 
    {
        DisplayOnly;
        Label = "Beneficiary Gender";
        DBTableName = "TU3AM";
        Length = "1";
        SType = "Text";
    }
    IN MIR-BIT-G-TRMN-CD 
    {
        DisplayOnly;
        Label = "Terminated";
        DBTableName = "TU3AM";
        Length = "1";
        SType = "Text";
    }
    IN MIR-OT-PMT-MD 
    {
        DisplayOnly;
        Label = "One Time Payment Made";
        DBTableName = "TU3AM";
        Length = "1";
        SType = "Text";
    }
    IN MIR-ANTY-MVT-NUM 
    {
        DisplayOnly;
        Label = "No Annutity Movement";
        DBTableName = "TU3AM";
        Length = "1";
        SType = "Text";
    }
    IN MIR-PERM-DISAB-CD 
    {
        DisplayOnly;
        Label = "Permanent Disability";
        DBTableName = "TU3AM";
        Length = "1";
        SType = "Text";
    }
    IN MIR-COND-CHNG-POL-ID 
    {
        DisplayOnly;
        Label = "Conditions Change Policy";
        DBTableName = "TU3AM";
        Length = "1";
        SType = "Text";
    }
    IN MIR-MVT-G-XFER-CD 
    {
        DisplayOnly;
        Label = "Transfer Code";
        DBTableName = "TU3AM";
        Length = "3";
        SType = "Text";
    }
    IN MIR-MVT-G-XFER-DT 
    {
        DisplayOnly;
        Label = "Transfer Date";
        DBTableName = "TU3AM";
        Length = "8";
        SType = "Date";
    }
    IN MIR-REQD-XPNS-RT 
    {
        DisplayOnly;
        Label = "Rate of necessary expenses";
        DBTableName = "TU3AM";
        Length = "3";
        SType = "Text";
    }
    IN MIR-NET-PREM-PD 
    {
        DisplayOnly;
        Label = "Net premium paid";
        DBTableName = "TU3AM";
        Length = "10";
        SType = "Text";
    }
    IN MIR-TOT-PREM-PD 
    {
        DisplayOnly;
        Label = "Premium Paid Total";
        DBTableName = "TU3AM";
        Length = "10";
        SType = "Text";
    }
    IN MIR-WTHLD-TXEMP-IND 
    {
        DisplayOnly;
        Label = "Non withholding Flag";
        DBTableName = "TU3AM";
        Length = "1";
        SType = "Text";
    }
    IN MIR-DEFR-DUR 
    {
        DisplayOnly;
        Label = "Period Deferred";
        DBTableName = "TU3AM";
        Length = "2";
        SType = "Text";
    }
    IN MIR-DEFR-STRT-DT 
    {
        DisplayOnly;
        Label = "Deferrance Start Date";
        DBTableName = "TU3AM";
        Length = "8";
        SType = "Date";
    }
    IN MIR-SURR-BASE-ANTY-AMT-3 
    {
        DisplayOnly;
        Label = "Base annuity amount for surrender";
        DBTableName = "TU3AM";
        Length = "10";
        SType = "Text";
    }
    IN MIR-ENH-SURR-AMT-ON-DT 
    {
        DisplayOnly;
        Label = "Enhanced annuity amount for surrender";
        DBTableName = "TU3AM";
        Length = "10";
        SType = "Text";
    }
    IN MIR-BNK-CD 
    {
        DisplayOnly;
        Label = "Bank Number";
        DBTableName = "TU3AM";
        Length = "4";
        SType = "Text";
    }
    IN MIR-BRCH-CD 
    {
        DisplayOnly;
        Label = "Branch Number";
        DBTableName = "TU3AM";
        Length = "3";
        SType = "Text";
    }
    IN MIR-BNK-ACCT-TYP 
    {
        DisplayOnly;
        Label = "Account type";
        DBTableName = "TU3AM";
        Length = "2";
        SType = "Text";
    }
    IN MIR-BNK-ACCT-NUM 
    {
        DisplayOnly;
        Label = "Bank Account ID";
        DBTableName = "TU3AM";
        Length = "10";
        SType = "Text";
    }
    IN MIR-BNK-ACCT-HLDR-NM 
    {
        DisplayOnly;
        Label = "Account Holder Name";
        DBTableName = "TU3AM";
        Length = "32";
        SType = "Text";
    }
    IN MIR-ANTY-SR-NUM-T[50]
    {
        DisplayOnly;
        Length = "2"; 
        FieldGroup = "Table100";
        SType = "Text";
        DBTableName = "TU3AH";
        Label = "Number";
        Index = "1";
    }
    IN MIR-PYMT-DT-YMD-T[50]
    {
        DisplayOnly;
        Length = "8";
        FieldGroup = "Table100";
        SType = "Date";
        DBTableName = "TU3AH";
        Label = "Date of Payment";
        Index = "1";
    }
    IN MIR-PYMT-CLAS-1-T[50]
    {
        DisplayOnly;
        CodeSource = "DataModel";
        CodeType = "PYMT-CLAS-1";
        Length = "1";
        FieldGroup = "Table100";
        SType = "Text";
        DBTableName = "TU3AH";
        Label = "Category 1";
        Index = "1";
    }
    IN MIR-PYMT-CLAS-2-T[50]
    {
        Length = "1";
        DisplayOnly;
        CodeSource = "DataModel";
        CodeType = "PYMT-CLAS-2";
        FieldGroup = "Table100";
        SType = "Text";
        DBTableName = "TU3AH";
        Label = "Category 2";
        Index = "1";
    }
    IN MIR-PYMT-FISC-YR-T[50]
    {
        Length = "2";
        DisplayOnly;
        FieldGroup = "Table100";
        SType = "Text";
        DBTableName = "TU3AH";
        Label = "Fiscal Year";
        Index = "1";
    }
    IN MIR-PYMT-FREQ-T[50]
    {
        Length = "1"; 
        DisplayOnly;
        FieldGroup = "Table100";
        SType = "Text";
        DBTableName = "TU3AH";      
        Label = "Duration";    
        Index = "1";    
    }
    IN MIR-BASE-ANTY-YR-AMT-T[50]
    {
        DisplayOnly;
        Length = "10";
        FieldGroup = "Table100";
        SType = "Text";
        DBTableName = "TU3AH";
        Label = "Annuity Amount";
        Index = "1";
    }
    IN MIR-DIV-AMT-T[50]
    {
        Length = "10";
        DisplayOnly;
        FieldGroup = "Table100";
        SType = "Text";
        DBTableName = "TU3AH";
        Label = "Dividends";
        Index = "1";
    }
    IN MIR-INC-ANTY-AMT-T[50]
    {
        Length = "10";
        DisplayOnly;
        FieldGroup = "Table100";
        SType = "Text";
        DBTableName = "TU3AH";
        Label = "Increased pension Amount";
        Index = "1";
    }
    IN MIR-INT-AMT-T[50]
    {
        Length = "8";
        DisplayOnly;
        FieldGroup = "Table100";
        SType = "Text";
        DBTableName = "TU3AH";      
        Label = "Split Interest";    
        Index = "1";
    }
    IN MIR-TAX-AMT-T[50]
    {
        Length = "10";
        DisplayOnly;
        FieldGroup = "Table100";
        SType = "Text";
        DBTableName = "TU3AH";      
        Label = "Tax Amount";    
        Index = "1"; 
    }
    IN MIR-NET-AMT-T[50]
    {
        Length = "10";
        DisplayOnly;
        FieldGroup = "Table100";
        SType = "Text";
        DBTableName = "TU3AH";      
        Label = "NET Payment Amount";    
        Index = "1";
    }
    IN MIR-PYMT-MTHD-T[50]
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