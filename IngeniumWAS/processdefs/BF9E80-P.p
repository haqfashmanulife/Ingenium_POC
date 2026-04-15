# Converted from PathFinder 2.2 to 3.0 Jun 18, 2004 3:13:22 PM EDT

#*******************************************************************************
#*  Component:   BF9E80-P.p                                                    *
#*  Description:                                                               *
#*                                                                             *
#*******************************************************************************
#*  Chg#    Release  Description                                               *
#*                                                                             *
#*  UY3064  CTS     Whole life premium payment completion Inquiry              *
#*******************************************************************************

P-STEP BF9E80-P
{
    ATTRIBUTES
    {
        BusinessFunctionId = "9E80";
        BusinessFunctionName = "Whole life premium payment completion Inquiry";
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
        Label = "Policy ID";
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

    INOUT MIR-POL-CRCY-CD
    {
       Length = "2";
       SType = "Hidden";
       Label = "Currency";
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
        Label = "Policy Issue Date";
    }

    OUT MIR-PREM-PMT-CMPLT-IND
    {
        Length = "1";
        SType = "Indicator";
        Label = "Base policy premium payment completion";
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

    OUT MIR-RDR-CSV-AMT
    {
        Length = "11";
        SType = "Currency";
        Label = "Rider CSV";
    }

    OUT MIR-HLTH-CNGLTY-BNFT-AMT
    {
        Length = "11";
        SType = "Currency";
        Label = "Health Congratulatory benefit amount";
    }

    OUT MIR-HLTH-BNFT-DEFER-AMT
    {
        Length = "11";
        SType = "Currency";
        Label = "Health congratulatory benefit Deferred amount";
    }

    OUT MIR-HLTH-BNFT-DEFER-INT-AMT
    {
        Length = "11";
        SType = "Currency";
        Label = "Health congratulatory benefit deferred interest";
    }

    OUT MIR-INCR-PURCH-SRVBNFT-AMT
    {
        Length = "11";
        SType = "Currency";
        Label = "Increased purchase of survival benefit amount";
    }

    OUT MIR-INCR-SRVBNFT-DEFER-AMT
    {
        Length = "11";
        SType = "Currency";
        Label = "Increased purchase of survival benefit deferred amount";
    }

    OUT MIR-POL-ACCU-DIV-AMT
    {
        Length = "11";
        SType = "Currency";
        Label = "Accumulated Dividend Amount";
    }

    OUT MIR-POL-SPL-DIV-AMT
    {
        Length = "11";
        SType = "Currency";
        Label = "Special dividend amount";
    }

    OUT MIR-POL-SPL-DIV-DEFER-AMT
    {
        Length = "11";
        SType = "Currency";
        Label = "Special dividend deferred amount ";
    }

    OUT MIR-POL-VEST-AMT
    {
        Length = "11";
        SType = "Currency";
        Label = "Vesting ";
    }

    OUT MIR-POL-VEST-DEFER-AMT
    {
        Length = "11";
        SType = "Currency";
        Label = "Vesting deferred amount";
    }

    OUT MIR-POL-XCES-PREM-AMT
    {
        Length = "11";
        SType = "Currency";
        Label = "Excess of premium";
    }

    OUT MIR-POL-LOAN-BAL-AMT
    {
         Length = "11";
         SType = "Currency";
         Label = "Policy Loan Balance";
    }

    OUT MIR-POL-LOAN-INT-AMT
    {
         Length = "11";
         SType = "Currency";
         Label = "Policy Loan Interest";
    }
    OUT MIR-POL-APL-BAL-AMT
    {
        Length = "11";
        SType = "Currency";
        Label = "APL balance";
    }

    OUT MIR-POL-APL-INT-AMT
    {
        Length = "11";
        SType = "Currency";
        Label = "APL Interest";
    }

    OUT MIR-POL-OVR-SHRT-PREM-AMT
    {
        Length = "11";
        SType = "Currency";
        Label = "Over/Short Premium";
    }

    OUT MIR-POL-UNEARN-PREM-AMT
    {
        Length = "11";
        SType = "Currency";
        Label = "Unearned Premium";
    }

    OUT MIR-POL-LUMP-SUM-AMT
    {
         Length = "11";
         SType = "Currency";
         Label = "Lumpsum Prepaid Premium";
    }

    OUT MIR-POL-INSTL-AMT
    {
        Length = "11";
        SType = "Currency";
        Label = "Installment Prepaid Premium";
    }

    OUT MIR-POL-NET-PAYBL-AMT
    {
        Length = "11";
        SType = "Currency";
        Label = "Net Payment Amount";
    }

}
