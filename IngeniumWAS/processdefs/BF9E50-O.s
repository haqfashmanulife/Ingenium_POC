# Converted from PathFinder 2.2 to 3.0 Jun 18, 2004 3:12:23 PM EDT

#*******************************************************************************
#*  Component:   BF9E50-O.s                                                    *
#*  Description: WL Premium Payment Completion quote                           *
#*                                                                             *
#*******************************************************************************
#*  Chg#    Release  Description                                               *
#*                                                                             *
#*  UY3064  CTS      WHOLE LIFE QUOTE CHANGES                                  *
#*******************************************************************************

S-STEP BF9E50-O
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

    INOUT MIR-POL-ID-BASE
    {
        DisplayOnly;
        Key;
        Length = "9";
        SType = "Text";
        Label = "Policy Id";
    }

    INOUT MIR-POL-ID-SFX
    {
        DisplayOnly;
        Key;
        Length = "1";
        SType = "Text";
        Label = "Suffix";
    }

    INOUT MIR-POL-CO-RECV-DT
    {
        DisplayOnly;
        Length = "10";
        SType = "Date";
        Label = "Company Received Date";
    }

    INOUT MIR-JRNL-DT 
    {
        DisplayOnly;
        Length = "10";
        SType = "Date";
        Label = "Journal Date";
    }

    INOUT MIR-POL-PREM-PMT-TYP-CD
    {
        DisplayOnly;
        Length = "1";
        CodeSource = "DataModel";
        CodeType = "MEDIC-CVG-PMT-TYP-CD";
        SType = "Text";
        Label = "Payment type of Medical Rider";
    }

    INOUT MIR-ACCU-DIV-IND
    {
        DisplayOnly;
        Length = "1";
        CodeSource = "DataModel";
        CodeType = "ACCU-DIV-IND";
        SType = "Text";
        Label = "Accumulated Dividend Amount";
    }

    INOUT MIR-INCR-PURCH-SRVBNFT-IND
    {
        DisplayOnly;
        Length = "1";
        CodeSource = "DataModel";
        CodeType = "INCR-PURCH-SRVBNFT-IND";
        SType = "Text";
        Label = "Increased purchase of survival benefit Amount";
    }

    INOUT MIR-VEST-AMT-IND
    {
        DisplayOnly;
        Length = "1";
        CodeSource = "DataModel";
        CodeType = "VEST-AMT-IND";
        SType = "Text";
        Label = "Vesting/Special dividend deferred";
    }

    INOUT MIR-HLTH-CNGLTY-BNFT-IND
    {
        DisplayOnly;
        Length = "1";
        CodeSource = "DataModel";
        CodeType = "HLTH-CNGLTY-BNFT-IND";
        SType = "Text";
        Label = "Health Congratulatory Benefit";
    }

    INOUT MIR-LOAN-REPAY-IND
    {
        DisplayOnly;
        Length = "1";
        CodeSource = "DataModel";
        CodeType = "LOAN-REPAY-IND";
        SType = "Text";
        Label = "Loan Repayment";
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

    IN MIR-POL-ISS-EFF-DT
    {
        DisplayOnly;
        Length = "10";
        SType = "Date";
        Label = "Policy Issue Effective Date";
    }

    IN MIR-PREM-PMT-CMPLT-IND
    {
        DisplayOnly;
        Length = "1";
        SType = "Indicator";
        Label = "Base policy premium payment completion indicator";
    }

    IN MIR-PREM-PMT-CMPLT-DT
    {
        DisplayOnly;
        Length = "10";
        SType = "Date";
        Label = "Base policy premium payment completion date";
    }

    IN MIR-POL-DIV-OPT-CD
    {
        DisplayOnly;
        Length = "40";
        CodeSource = "DataModel";
        CodeType = "POL-DIV-OPT-CD";
        SType = "Text";
        Label = "Policy Dividend Option";
    }

    
    IN MIR-POL-OWNR-CLI-NM
    {
        DisplayOnly;
        Length = "30";
        SType = "Text";
        Label = "Policy Owner name";
    }

    INOUT MIR-POL-CRCY-CD
    {
       Length = "2";
       SType = "Hidden";
       Label = "Currency";
    }

    IN MIR-INCR-PURCH-SRVBNFT-AMT
    {
        DisplayOnly;
        Length = "11";
        SType = "Currency";
        Label = "Increased purchase of survival benefit amount";
    }

    IN MIR-INCR-SRVBNFT-DEFER-AMT
    {
        DisplayOnly;
        Length = "11";
        SType = "Currency";
        Label = "Increased purchase of survival benefit deferred amount";
    }

    IN MIR-RDR-CSV-AMT
    {
        DisplayOnly;
        Length = "11";
        SType = "Currency";
        Label = "Rider CSV";
    }

    IN MIR-HLTH-CNGLTY-BNFT-AMT
    {
        DisplayOnly;
        Length = "11";
        SType = "Currency";
        Label = "Health Congratulatory benefit amount";
    }

    IN MIR-HLTH-BNFT-DEFER-AMT
    {
        DisplayOnly;
        Length = "11";
        SType = "Currency";
        Label = "Health congratulatory benefit Deferred amount";
    }

    IN MIR-HLTH-BNFT-DEFER-INT-AMT
    {
        DisplayOnly;
        Length = "11";
        SType = "Currency";
        Label = "Health congratulatory Deferred interest";
    }

    IN MIR-POL-ACCU-DIV-AMT
    {
        DisplayOnly;
        Length = "11";
        SType = "Currency";
        Label = "Accumulated Dividend Amount";
    }

    IN MIR-POL-SPL-DIV-AMT
    {
        DisplayOnly;
        Length = "11";
        SType = "Currency";
        Label = "Special dividend amount";
    }

    IN MIR-POL-SPL-DIV-DEFER-AMT
    {
        DisplayOnly;
        Length = "11";
        SType = "Currency";
        Label = "Special dividend deferred amount ";
    }

    IN MIR-POL-VEST-AMT
    {
        DisplayOnly;
        Length = "11";
        SType = "Currency";
        Label = "Vesting ";
    }

    IN MIR-POL-VEST-DEFER-AMT
    {
        DisplayOnly;
        Length = "11";
        SType = "Currency";
        Label = "Vesting deferred amount";
    }

    IN MIR-POL-XCES-PREM-AMT
    {
        DisplayOnly;
        Length = "11";
        SType = "Currency";
        Label = "Excess of premiums";
    }

    IN MIR-POL-LOAN-BAL-AMT
    {
        DisplayOnly;
        Length = "11";
        SType = "Currency";
        Label = "Policy Loan Amount";
    }

    IN MIR-POL-LOAN-INT-AMT
    {
        DisplayOnly;
        Length = "11";
        SType = "Currency";
        Label = "Interest on Policy Loan";
    }
	
    IN MIR-POL-APL-BAL-AMT
    {
        DisplayOnly;
        Length = "11";
        SType = "Currency";
        Label = "APL Amount";
    }

    IN MIR-POL-APL-INT-AMT
    {
        DisplayOnly;
        Length = "11";
        SType = "Currency";
        Label = "Interest on APL Amount";
    }

    IN MIR-POL-OVR-SHRT-PREM-AMT
    {
        DisplayOnly;
        Length = "11";
        SType = "Currency";
        Label = "Shortage of Premiums";
    }

    IN MIR-POL-UNEARN-PREM-AMT
    {
        DisplayOnly;
        Length = "11";
        SType = "Currency";
        Label = "Unearned Premium ";
    }

    IN MIR-POL-LUMP-SUM-AMT
    {
        DisplayOnly;
        Length = "11";
        SType = "Currency";
        Label = "Lump sum prepaid premium ";
    }

    IN MIR-POL-INSTL-AMT
    {
        DisplayOnly;
        Length = "11";
        SType = "Currency";
        Label = "Installment prepaid premium";
    }

    IN MIR-POL-NET-PAYBL-AMT
    {
        DisplayOnly;
        Length = "11";
        SType = "Currency";
        Label = "Net Payment Amount";
    }

}

