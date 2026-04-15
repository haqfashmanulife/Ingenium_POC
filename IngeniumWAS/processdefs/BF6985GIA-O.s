# Converted from PathFinder 2.2 to 3.0 Jun 18, 2004 3:13:01 PM EDT

#*******************************************************************************
#*  Component:   BF6985GIA-O.s                                                 *
#*  Description:                                                               *
#*                                                                             *
#*******************************************************************************
#*  Chg#    Release  Description                                               *
#*                                                                             *
#*  014590  6.0      New for release 6.0                                       *
#*  017150  612J     Remove Currency Decimals = "2"                            *
#*  MP5002  CTS      ADD FLEX-FUND-SURR-CHARGE-TYP                             *
#*  M271O1  CTS      FRA Foreign Currency Formatting 			       *
#*  TDMG24  CTS      INQUIRY SCREEN CHANGES                                    * 
#*******************************************************************************

S-STEP BF6985GIA-O
{
    ATTRIBUTES
    {
        BusinessFunctionType = "Valufnd";
        Type = "Output";
        DelEmptyRows;
        FocusField = "MIR-POL-ID-BASE";
        FocusFrame = "ContentFrame";
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

    INOUT MIR-APPL-CTL-PRCES-DT
    {
        Key;
        Length = "10";
        DefaultSession = "LSIR-PRCES-DT";
        SType = "Date";
        Label = "Process Date";
    }

    INOUT MIR-CVG-NUM
    {
        Key;
        Mandatory;
        Length = "2";
        DefaultConstant = "01";
        SType = "Text";
        Label = "Coverage Number";
    }

    INOUT MIR-POL-ID-BASE
    {
        Key;
        Mandatory;
        Length = "9";
        DefaultSession = "MIR-POL-ID-BASE";
        SType = "Text";
        Label = "Policy Id";
    }

    INOUT MIR-POL-ID-SFX
    {
        Key;
        Length = "1";
        DefaultSession = "MIR-POL-ID-SFX";
        SType = "Text";
        Label = "Suffix";
    }

    IN MIR-ACUM-INT-LTD-AMT-T[50]
    {
        DisplayOnly;
        Signed;
        Length = "15";
        FieldGroup = "Table50";
        SType = "Currency";
        Label = "Accumulated Cash Flow Interest Paid Amount";
        Index = "1";
    }

    IN MIR-CF-CLI-TRXN-AMT-T[50]
    {
#M271O1 CHANGES START HERE 
	CurrencyCode = "MIR-PREM-CRCY-CD";
#M271O1 CHANGES END HERE   
        DisplayOnly;
        Signed;
        Length = "15";
        FieldGroup = "Table50";
        SType = "Currency";
        Label = "Gross Amount";
        Index = "1";
    }

    IN MIR-CF-EFF-DT-T[50]
    {
        DisplayOnly;
        Length = "10";
        FieldGroup = "Table50";
        SType = "Date";
        Label = "Cash Flow Effective Date";
        Index = "1";
    }

    IN MIR-CF-FND-BAL-AMT-T[50]
    {
        DisplayOnly;
        Signed;
        Length = "15";
        FieldGroup = "Table50";
        SType = "Currency";
        Label = "Current Amount";
        Index = "1";
    }

    IN MIR-CF-FND-TRXN-AMT-T[50]
    {
        DisplayOnly;
        Signed;
        Length = "15";
        FieldGroup = "Table50";
        SType = "Currency";
        Label = "Net Deposit Amount";
        Index = "1";
    }

    IN MIR-CF-INT-PCT-T[50]
    {
        DisplayOnly;
        Signed;
        Length = "7";
        Decimals = "4";
        FieldGroup = "Table50";
        SType = "Percent";
        Label = "Interest Rate";
        Index = "1";
    }

    IN MIR-CF-MCV-FND-AMT-T[50]
    {
        DisplayOnly;
        Signed;
        Length = "15";
        FieldGroup = "Table50";
        SType = "Currency";
        Label = "MCV Current Fund Amount";
        Index = "1";
    }

    IN MIR-CF-MCV-INT-AMT-T[50]
    {
        DisplayOnly;
        Signed;
        Length = "15";
        FieldGroup = "Table50";
        SType = "Currency";
        Label = "MCV Interest to Next Cash Flow Amount";
        Index = "1";
    }

    IN MIR-CF-MCV-INT-LTD-AMT-T[50]
    {
        DisplayOnly;
        Signed;
        Length = "15";
        FieldGroup = "Table50";
        SType = "Currency";
        Label = "Accumulated MCV Interest Amount";
        Index = "1";
    }

    IN MIR-CF-MCV-TRXN-AMT-T[50]
    {
        DisplayOnly;
        Signed;
        Length = "15";
        FieldGroup = "Table50";
        SType = "Currency";
        Label = "MCV Net Amount";
        Index = "1";
    }

    IN MIR-CF-MKTVAL-ADJ-AMT
    {
        DisplayOnly;
        Signed;
        Length = "15";
        SType = "Currency";
        Label = "Market Value Adjustment";
    }

    IN MIR-CF-REASN-CD-T[50]
    {
        DisplayOnly;
        Length = "40";
        FieldGroup = "Table50";
        CodeSource = "DataModel";
        CodeType = "CF-REASN-CD";
        SType = "Text";
        Label = "Transaction Reason";
        Index = "1";
    }

    IN MIR-CF-SEQ-NUM-T[50]
    {
        DisplayOnly;
        Length = "3";
        FieldGroup = "Table50";
        SType = "Text";
        Label = "Cash Flow Seq Number";
        Index = "1";
    }

    IN MIR-CF-STAT-CD-T[50]
    {
        DisplayOnly;
        Length = "40";
        FieldGroup = "Table50";
        CodeSource = "DataModel";
        CodeType = "CF-STAT-CD";
        SType = "Text";
        Label = "Cash Flow Status";
        Index = "1";
    }

    IN MIR-CF-TRXN-CD-T[50]
    {
        DisplayOnly;
        Length = "40";
        FieldGroup = "Table50";
        CodeSource = "DataModel";
        CodeType = "CF-TRXN-CD";
        SType = "Text";
        Label = "Transaction Type";
        Index = "1";
    }

    IN MIR-CF-UNIT-QTY-T[50]
    {
        DisplayOnly;
        Length = "13";
        FieldGroup = "Table50";
        SType = "Text";
        Label = "Equity Products - Units Purchased";
        Index = "1";
    }

    IN MIR-CVG-CF-TYP-CD
    {
        DisplayOnly;
        Length = "1";
        SType = "Hidden";
        Label = "Coverage Cash Flow Type Code";
    }

    IN MIR-CVG-WTHDR-ORDR-CD
    {
        DisplayOnly;
        Length = "40";
        CodeSource = "DataModel";
        CodeType = "CVG-WTHDR-ORDR-CD";
        SType = "Text";
        Label = "Withdrawal Order";
    }

    IN MIR-DV-CVG-UNIT-QTY
    {
        DisplayOnly;
        Signed;
        Length = "11";
        Decimals = "5";
        SType = "Number";
        Label = "Total Units";
    }

    IN MIR-DV-MCV-ACUM-AMT
    {
        DisplayOnly;
        Signed;
        Length = "17";
        SType = "Currency";
        Label = "Minimum Contract Value Accumulated Amount";
    }

    IN MIR-DV-MTHV-ADJ-AMT
    {
#M271O1 CHANGES START HERE 
        CurrencyCode = "MIR-PREM-CRCY-CD";
#M271O1 CHANGES END HERE      
        DisplayOnly;
        Signed;
        Length = "15";
        SType = "Currency";
        Label = "Monthiversary Charge";
    }

    IN MIR-DV-OWN-CLI-NM
    {
        DisplayOnly;
        Length = "75";
        SType = "Text";
        Label = "Owner Name";
    }

    IN MIR-DV-POL-BASE-CV-AMT
    {
        DisplayOnly;
        Signed;
        Length = "17";
        SType = "Currency";
        Label = "Base Cash Value";
    }

    IN MIR-DV-POL-CSV-AMT
    {
        DisplayOnly;
        Signed;
        Length = "15";
        SType = "Currency";
        Label = "Cash Surrender Value";
    }

    IN MIR-DV-SURR-CHRG-AMT
    {
        DisplayOnly;
        Signed;
        Length = "15";
        SType = "Currency";
        Label = "Surrender Charge";
    }

    IN MIR-LOAN-AMT
    {
        DisplayOnly;
        Signed;
        Length = "15";
        SType = "Currency";
        Label = "Total Policy Loan";
    }

    IN MIR-MCV-ACUM-INT-AMT-T[50]
    {
        DisplayOnly;
        Signed;
        Length = "15";
        FieldGroup = "Table50";
        SType = "Currency";
        Label = "MCV Accumulated Interest Amount";
        Index = "1";
    }

    IN MIR-MCV-GUAR-INT-PCT-T[50]
    {
        DisplayOnly;
        Signed;
        Length = "7";
        Decimals = "5";
        FieldGroup = "Table50";
        SType = "Percent";
        Label = "MCV Guaranteed Interest Rate";
        Index = "1";
    }

    IN MIR-PLAN-ID
    {
        DisplayOnly;
        Length = "40";
        CodeSource = "EDIT";
        CodeType = "PLAN";
        SType = "Text";
        Label = "Plan";
    }

    IN MIR-POL-CSTAT-CD
    {
        DisplayOnly;
        Length = "40";
        CodeSource = "DataModel";
        CodeType = "POL-CSTAT-CD";
        SType = "Text";
        Label = "Policy Status";
    }
    
    #TDMG24 CHANGES START HERE
            IN MIR-PREM-PMT-CMPLT-IND
            {
                DisplayOnly;
                Length = "1";
                SType = "Indicator";
                Label = "Base Policy Premium Payment Completion";
        
            }    
    #TDMG24 CHANGES END HERE    


    IN MIR-POL-CVG-REC-CTR
    {
        DisplayOnly;
        Length = "40";
        SType = "Text";
        Label = "Number of Coverages";
    }

    IN MIR-ROLOVR-CF-DT-T[50]
    {
        DisplayOnly;
        Length = "10";
        FieldGroup = "Table50";
        SType = "Date";
        Label = "GIA - Rollover Date";
        Index = "1";
    }

    IN MIR-SBSDRY-CO-ID
    {
        DisplayOnly;
        Length = "2";
        CodeSource = "EDIT";
        CodeType = "SUBCO";
        SType = "Text";
        Label = "Sub Co";
    }
# MP5002 
    
    IN MIR-SURR-CHRG-TYP-CD
    {
            DisplayOnly;
            Length = "1";
            CodeSource = "EDIT";
            CodeType = "MVAL";
            DBTableName = "TPOL";
            SType = "Text";
            Label = "FlexFund Surrender Charge Type";
    } 
#M271O1 CHANGES START HERE      
         
    INOUT MIR-PREM-CRCY-CD
    {
        Length = "2";
        SType = "Hidden";
        Label = "Currency";
    }  
#M271O1 CHANGES END HERE 
}

