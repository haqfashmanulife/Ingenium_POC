# Converted from PathFinder 2.2 to 3.0 Jun 18, 2004 3:13:01 PM EDT

#*******************************************************************************
#*  Component:   BF6981Money-O.s                                               *
#*  Description:                                                               *
#*                                                                             *
#*******************************************************************************
#*  Chg#    Release  Description                                               *
#*                                                                             *
#*  016053  6.1      New for release 6.1                                       *
#*  017150  612J     Remove Currency Decimals = "2"                            *
#*  M00011  ROC      OUTSTANDING DISBURSEMENTS, ADD FIELDS:                    *
#*                      OS-DISB-SURR-AMT, OS-DISB-MAT-AMT, OS-DISB-DTH-AMT     *
#*                      OS-DISB-CLM-AMT, OS-DISB-AD-AMT                        *
#*                                                                             *
#*******************************************************************************

S-STEP BF6981Money-O
{
    ATTRIBUTES
    {
        BusinessFunctionType = "Valuepol";
        Type = "Output";
        DelEmptyRows;
        FocusField = "MIR-APPL-CTL-PRCES-DT";
        FocusFrame = "ContentFrame";
    }

    IN Title;

    IN TitleBar;

    IN TitleBarSize;

    IN ButtonBar;

    IN ButtonBarSize;

    IN MessageFrame;

    IN MessageFrameSize;

    IN FocusFieldSet;

    IN FocusFrameSet;

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
        SType = "Date";
        Label = "Process Date";
    }

    IN MIR-POL-ID-BASE
    {
        Key;
        DisplayOnly;
        Length = "9";
        DefaultSession = "MIR-POL-ID-BASE";
        SType = "Text";
        Label = "Policy Id";
    }

    IN MIR-POL-ID-SFX
    {
        Key;
        DisplayOnly;
        Length = "1";
        DefaultSession = "MIR-POL-ID-SFX";
        SType = "Text";
        Label = "Suffix";
    }

    IN MIR-CLI-ID
    {
        Key;
        DisplayOnly;
        Length = "10";
        DefaultSession = "MIR-CLI-ID";
        SType = "Text";
        Label = "Client Number";
    }

    IN MIR-CF-MKTVAL-ADJ-AMT
    {
        DisplayOnly;
        Signed;
        Length = "17";
        SType = "Currency";
        Label = "Market Value Adjustment";
    }

    IN MIR-DOD-CRNT-INT-AMT
    {
        DisplayOnly;
        Signed;
        Length = "13";
        SType = "Currency";
        Label = "Dividends on Deposit Interest";
    }

    IN MIR-DV-APL-AMT
    {
        DisplayOnly;
        Signed;
        Length = "17";
        SType = "Currency";
        Label = "APL Amount";
    }

    IN MIR-DV-APL-INT-YTD-AMT
    {
        DisplayOnly;
        Signed;
        Length = "15";
        SType = "Currency";
        Label = "APL Interest Paid / Capitalized Year to Date";
    }

    IN MIR-DV-LOAN-AMT
    {
        DisplayOnly;
        Signed;
        Length = "17";
        SType = "Currency";
        Label = "Loan Amount";
    }

    IN MIR-DV-LOAN-INT-YTD-AMT
    {
        DisplayOnly;
        Signed;
        Length = "15";
        SType = "Currency";
        Label = "Loan Interest Paid / Capitalized Year to Date";
    }

    IN MIR-DV-MAX-LOAN-AMT
    {
        DisplayOnly;
        Signed;
        Length = "17";
        SType = "Currency";
        Label = "Maximum Loan Amount Available";
    }

    IN MIR-DV-MCV-ACUM-AMT
    {
        DisplayOnly;
        Signed;
        Length = "17";
        SType = "Currency";
        Label = "Minimum Contract Value Accumulated Amount";
    }

    IN MIR-DV-MCV-CSV-AMT
    {
        DisplayOnly;
        Signed;
        Length = "17";
        SType = "Currency";
        Label = "MCV/Net Base Cash Value";
    }

    IN MIR-DV-MTHV-ADJ-AMT
    {
        DisplayOnly;
        Signed;
        Length = "17";
        SType = "Currency";
        Label = "Monthiversary Charge";
    }

    IN MIR-DV-NET-CSV-AMT
    {
        DisplayOnly;
        Signed;
        Length = "17";
        SType = "Currency";
        Label = "Net Base Cash Value";
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
        Length = "19";
        SType = "Currency";
        Label = "Base Cash Value";
    }

    IN MIR-DV-POL-BON-CSH-AMT
    {
        DisplayOnly;
        Signed;
        Length = "17";
        SType = "Currency";
        Label = "Total Bonus";
    }

    IN MIR-DV-POL-CSV-AMT
    {
        DisplayOnly;
        Signed;
        Length = "19";
        SType = "Currency";
        Label = "Cash Surrender Value";
    }

    IN MIR-DV-PREM-RFND-AMT
    {
#M271O1 CHANGES START HERE 
        CurrencyCode = "MIR-PREM-CRCY-CD";
#M271O1 CHANGES END HERE  
        DisplayOnly;
        Signed;
        Length = "17";
        SType = "Currency";
        Label = "Unearned Premium";
    }

    IN MIR-DV-OS-MPREM-AMT
    {
        DisplayOnly;
        Signed;
        Length = "17";
        SType = "Currency";
        Label = "Outstanding Premium (Loan)";
    }

    IN MIR-DV-SURR-CHRG-AMT
    {
        DisplayOnly;
        Signed;
        Length = "17";
        SType = "Currency";
        Label = "Surrender Charge";
    }

    IN MIR-DV-TRMNL-DTH-AMT
    {
        DisplayOnly;
        Signed;
        Length = "17";
        SType = "Currency";
        Label = "Terminal Bonus for Death";
    }

    IN MIR-DV-TRMNL-SURR-AMT
    {
        DisplayOnly;
        Signed;
        Length = "17";
        SType = "Currency";
        Label = "Terminal Bonus for Surrender";
    }

    IN MIR-DV-VALU-PUA-AMT
    {
        DisplayOnly;
        Signed;
        Length = "17";
        SType = "Currency";
        Label = "Paid-up Additions Cash Value";
    }

    IN MIR-PLAN-CSV-DT-TYP-CD
    {
        DisplayOnly;
        Length = "40";
        CodeSource = "DataModel";
        CodeType = "PLAN-CSV-DT-TYP-CD";
        SType = "Text";
        Label = "Cash Value Calculated Type";
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

    IN MIR-POL-CVG-REC-CTR
    {
        DisplayOnly;
        Length = "40";
        SType = "Text";
        Label = "Number of Coverages";
    }

    IN MIR-POL-DOD-ACUM-AMT
    {
        DisplayOnly;
        Signed;
        Length = "17";
        SType = "Currency";
        Label = "Dividends on Deposit";
    }

    IN MIR-POL-MISC-SUSP-AMT
    {
#M271O1 CHANGES START HERE 
        CurrencyCode = "MIR-PREM-CRCY-CD";
#M271O1 CHANGES END HERE  
        DisplayOnly;
        Signed;
        Length = "19";
        SType = "Currency";
        Label = "Miscellaneous Suspense";
    }

    IN MIR-POL-OS-DISB-AMT
    {
        DisplayOnly;
        Signed;
        Length = "19";
        SType = "Currency";
        Label = "Outstanding Disbursements";
    }

    IN MIR-OS-DISB-SURR-AMT
    {
        DisplayOnly;
        Signed;
        Length = "19";
        SType = "Currency";
        Label = "Outstanding Disbursements - Surrender";
    }

    IN MIR-OS-DISB-MAT-AMT
    {
        DisplayOnly;
        Signed;
        Length = "19";
        SType = "Currency";
        Label = "Outstanding Disbursements - Maturity";
    }

    IN MIR-OS-DISB-DTH-AMT
    {
        DisplayOnly;
        Signed;
        Length = "19";
        SType = "Currency";
        Label = "Outstanding Disbursements - Death";
    }

    IN MIR-OS-DISB-CLM-AMT
    {
        DisplayOnly;
        Signed;
        Length = "19";
        SType = "Currency";
        Label = "Outstanding Disbursements - Claims";
    }

    IN MIR-OS-DISB-AD-AMT
    {
        DisplayOnly;
        Signed;
        Length = "19";
        SType = "Currency";
        Label = "Outstanding Disbursements - Accidental Death";
    }

    IN MIR-POL-PDF-AMT
    {
#M271O1 CHANGES START HERE 
        CurrencyCode = "MIR-PREM-CRCY-CD";
#M271O1 CHANGES END HERE   
        DisplayOnly;
        Signed;
        Length = "15";
        SType = "Currency";
        Label = "Premium Deposit Funds";
    }

    IN MIR-POL-PDF-INT-AMT
    {
        DisplayOnly;
        Signed;
        Length = "13";
        SType = "Currency";
        Label = "Interest Accrued on Premium Deposit Funds";
    }

    IN MIR-POL-PREM-SUSP-AMT
    {
#M271O1 CHANGES START HERE 
        CurrencyCode = "MIR-PREM-CRCY-CD";
#M271O1 CHANGES END HERE    
        DisplayOnly;
        Signed;
        Length = "19";
        SType = "Currency";
        Label = "Premium Suspense";
    }

    IN MIR-SBSDRY-CO-ID
    {
        DisplayOnly;
        Length = "40";
        CodeSource = "EDIT";
        CodeType = "SUBCO";
        SType = "Text";
        Label = "Sub Company";
    }

    IN MIR-TRM-PREM-RFND-RT
    {
        DisplayOnly;
        Signed;
        Length = "11";
        Decimals = "4";
        SType = "Percent";
        Label = "Percentage of Premium to Refund";
    }

    IN MIR-POL-PDF-SUSP-AMT
    {
#M271O1 CHANGES START HERE 
        CurrencyCode = "MIR-PREM-CRCY-CD";
#M271O1 CHANGES END HERE  
        DisplayOnly;
        Signed;
        Length = "15";
        SType = "Currency";
        Label = "Premium Deposit Fund Suspense";
    }

    IN MIR-POL-DIV-SUSP-AMT
    {
        DisplayOnly;
        Signed;
        Length = "15";
        SType = "Currency";
        Label = "Dividend Suspense";
    }

    IN MIR-DV-LOAN-MAX-DSCNT-PCT
    {
        DisplayOnly;
        Signed;
        Length = "10";
        Decimals = "5";
        SType = "Percent";
        Label = "Loan Maximum/Discount Percentage";
    }

    IN MIR-DV-POL-SURR-AMT
    {
        DisplayOnly;
        Signed;
        Length = "17";
        SType = "Currency";
        Label = "Full Policy Surrender Value";
    }

    IN MIR-DV-POL-ACUM-AMT
    {
        DisplayOnly;
        Signed;
        Length = "17";
        SType = "Currency";
        Label = "Total Policy Accumulation Value";
    }

    IN MIR-DV-SE-XSLD-RFND-AMT
    {
        DisplayOnly;
        Signed;
        Length = "17";
        SType = "Currency";
        Label = "SEC Excess Sales Loads";
    }

    IN MIR-POL-UL-SHRT-AMT
    {
        DisplayOnly;
        Signed;
        Length = "17";
        SType = "Currency";
        Label = "UL Policy Shortage Amount";
    }

    IN MIR-CLI-SUSP-AMT
    {
        DisplayOnly;
        Signed;
        Length = "17";
        SType = "Currency";
        Label = "Suspense Amount";
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

