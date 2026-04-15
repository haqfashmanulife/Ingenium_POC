# Converted from PathFinder 2.2 to 3.0 Jun 18, 2004 3:13:22 PM EDT

#*******************************************************************************
#*  Component:   BF9E51-P.p                                                    *
#*  Description: WL Premium Payment Completion quote                           *
#*                                                                             *
#*******************************************************************************
#*  Chg#    Release  Description                                               *
#*                                                                             *
#*  UY3064  CTS      WHOLE LIFE QUOTE CHANGES                                  *
#*******************************************************************************

P-STEP BF9E51-P
{
    ATTRIBUTES
    {
        BusinessFunctionId = "9E50";
        BusinessFunctionName = "Whole life premium Quote screen";
        BusinessFunctionType = "Wholelife";
        MirName = "CCWM9E50";
    }

    OUT LSIR-RETURN-CD;

    OUT MIR-RETRN-CD;

    INOUT MIR-POL-ID-BASE
    {
        Key;
        Mandatory;
        Length = "9";
        SType = "Text";
        Label = "Policy Id";
    }

    INOUT MIR-POL-ID-SFX
    {
        Key;
        Length = "1";
        SType = "Text";
        Label = "Suffix";
    }

    INOUT MIR-POL-CO-RECV-DT
    {
        Length = "10";
        SType = "Date";
        Label = "Company Received Date";
    }

    INOUT MIR-JRNL-DT 
    {
        Length = "10";
        SType = "Date";
        Label = "Journal Date";
    }

    INOUT MIR-DV-PRCES-STATE-CD
    {
        Length = "1";
        SType = "Hidden";
        Label = "MIR-DV-PRCES-STATE-CD";
    }

    INOUT MIR-POL-CRCY-CD
    {
       
       Length = "2";
       SType = "Hidden";
       Label = "Currency";
    }

    INOUT MIR-POL-PREM-PMT-TYP-CD
    {
        Length = "1";
        CodeSource = "DataModel";
        CodeType = "MEDIC-CVG-PMT-TYP-CD";
        SType = "Text";
        Label = "Payment type of Medical Rider";
    }

    INOUT MIR-ACCU-DIV-IND
    {
        Length = "1";
        CodeSource = "DataModel";
        CodeType = "ACCU-DIV-IND";
        SType = "Text";
        Label = "Accumulated Dividend Amount";
    }

    INOUT MIR-INCR-PURCH-SRVBNFT-IND
    {
        Length = "1";
        CodeSource = "DataModel";
        CodeType = "INCR-PURCH-SRVBNFT-IND";
        SType = "Text";
        Label = "Increased purchase of survival benefit amount";
    }

    INOUT MIR-VEST-AMT-IND
    {
        Length = "1";
        CodeSource = "DataModel";
        CodeType = "VEST-AMT-IND";
        SType = "Text";
        Label = "Vesting/Special dividend deferred";
    }

    INOUT MIR-HLTH-CNGLTY-BNFT-IND
    {
        Length = "1";
        CodeSource = "DataModel";
        CodeType = "HLTH-CNGLTY-BNFT-IND";
        SType = "Text";
        Label = "Health Congratulatory Benefit";
    }

    INOUT MIR-LOAN-REPAY-IND
    {
        Length = "1";
        CodeSource = "DataModel";
        CodeType = "LOAN-REPAY-IND";
        SType = "Text";
        Label = "Loan Repayment";
    }

    OUT MIR-PLAN-ID
    {
        Length = "40";
        CodeSource = "EDIT";
        CodeType = "PLAN";
        SType = "Text";
        Label = "Plan";
    }

    OUT MIR-POL-ISS-EFF-DT
    {
        Length = "10";
        SType = "Date";
        Label = "Policy Issue Effective Date";
    }

    OUT MIR-PREM-PMT-CMPLT-IND
    {
        Length = "1";
        SType = "Indicator";
        Label = "Base policy premium payment completion indicator";
    }

    OUT MIR-PREM-PMT-CMPLT-DT
    {
        Length = "10";
        SType = "Date";
        Label = "Base policy premium payment completion date";
    }

    OUT MIR-POL-DIV-OPT-CD
    {
        Length = "40";
        CodeSource = "DataModel";
        CodeType = "POL-DIV-OPT-CD";
        SType = "Text";
        Label = "Policy Dividend Option";
    }

    OUT MIR-POL-OWNR-CLI-NM
    {
        Length = "30";
        SType = "Text";
        Label = "Policy Owner name";
    }

    OUT MIR-INCR-PURCH-SRVBNFT-AMT
    {
        CurrencyCode = "MIR-POL-CRCY-CD";
        Length = "11";
        SType = "Currency";
        Label = "Increased purchase of survival benefit amount";
    }

    OUT MIR-INCR-SRVBNFT-DEFER-AMT
    {
        CurrencyCode = "MIR-POL-CRCY-CD";
        Length = "11";
        SType = "Currency";
        Label = "Increased purchase of survival benefit deferred amount";
    }

    OUT MIR-RDR-CSV-AMT
    {
        CurrencyCode = "MIR-POL-CRCY-CD";
        Length = "11";
        SType = "Currency";
        Label = "Rider CSV";
    }

    OUT MIR-HLTH-CNGLTY-BNFT-AMT
    {
        CurrencyCode = "MIR-POL-CRCY-CD";
        Length = "11";
        SType = "Currency";
        Label = "Health Congratulatory benefit amount";
    }

    OUT MIR-HLTH-BNFT-DEFER-AMT
    {
        CurrencyCode = "MIR-POL-CRCY-CD";
        Length = "11";
        SType = "Currency";
        Label = "Health congratulatory benefit Deferred amount";
    }

    OUT MIR-HLTH-BNFT-DEFER-INT-AMT
    {
        CurrencyCode = "MIR-POL-CRCY-CD";
        Length = "11";
        SType = "Currency";
        Label = "Health congratulatory Deferred interest";
    }

    OUT MIR-POL-ACCU-DIV-AMT
    {
        CurrencyCode = "MIR-POL-CRCY-CD";
        Length = "11";
        SType = "Currency";
        Label = "Accumulated Dividend Amount";
    }

    OUT MIR-POL-SPL-DIV-AMT
    {
        CurrencyCode = "MIR-POL-CRCY-CD";
        Length = "11";
        SType = "Currency";
        Label = "Special dividend amount";
    }

    OUT MIR-POL-SPL-DIV-DEFER-AMT
    {
        CurrencyCode = "MIR-POL-CRCY-CD";
        Length = "11";
        SType = "Currency";
        Label = "Special dividend deferred amount ";
    }

    OUT MIR-POL-VEST-AMT
    {
        CurrencyCode = "MIR-POL-CRCY-CD";
        Length = "11";
        SType = "Currency";
        Label = "Vesting ";
    }

    OUT MIR-POL-VEST-DEFER-AMT
    {
        CurrencyCode = "MIR-POL-CRCY-CD";
        Length = "11";
        SType = "Currency";
        Label = "Vesting deferred amount";
    }

    OUT MIR-POL-XCES-PREM-AMT
    {
        CurrencyCode = "MIR-POL-CRCY-CD";
        Length = "11";
        SType = "Currency";
        Label = "Excess of premiums";
    }

    OUT MIR-POL-LOAN-BAL-AMT
    {
        CurrencyCode = "MIR-POL-CRCY-CD";
        Length = "11";
        SType = "Currency";
        Label = "Policy Loan Amount";
    }

    OUT MIR-POL-LOAN-INT-AMT
    {
        CurrencyCode = "MIR-POL-CRCY-CD";
        Length = "11";
        SType = "Currency";
        Label = "Interest on Policy Loan";
    }

    OUT MIR-POL-APL-BAL-AMT
    {
        CurrencyCode = "MIR-POL-CRCY-CD";
        Length = "11";
        SType = "Currency";
        Label = "APL Amount";
    }

    OUT MIR-POL-APL-INT-AMT
    {
        CurrencyCode = "MIR-POL-CRCY-CD";
        Length = "11";
        SType = "Currency";
        Label = "Interest on APL Amount";
    }
	
    OUT MIR-POL-OVR-SHRT-PREM-AMT
    {
        CurrencyCode = "MIR-POL-CRCY-CD";
        Length = "11";
        SType = "Currency";
        Label = "Shortage of premiums";
    }

    OUT MIR-POL-UNEARN-PREM-AMT
    {
        CurrencyCode = "MIR-POL-CRCY-CD";
        Length = "11";
        SType = "Currency";
        Label = "Unearned Premium ";
    }

    OUT MIR-POL-LUMP-SUM-AMT
    {
        CurrencyCode = "MIR-POL-CRCY-CD";
        Length = "11";
        SType = "Currency";
        Label = "Lump sum prepaid Premium ";
    }

    OUT MIR-POL-INSTL-AMT
    {
        CurrencyCode = "MIR-POL-CRCY-CD";
        Length = "11";
        SType = "Currency";
        Label = "Installment prepaid premium";
    }

    OUT MIR-POL-NET-PAYBL-AMT
    {
        CurrencyCode = "MIR-POL-CRCY-CD";
        Length = "11";
        SType = "Currency";
        Label = "Net Payment Amount";
    }

}