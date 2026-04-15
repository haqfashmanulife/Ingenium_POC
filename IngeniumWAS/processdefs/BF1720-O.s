# Converted from PathFinder 2.2 to 3.0 Jun 18, 2004 3:12:49 PM EDT

#*******************************************************************************
#*  Component:   BF1720-O.s                                                    *
#*  Description:                                                               *
#*                                                                             *
#*******************************************************************************
#*  Chg#    Release  Description                                               *
#*                                                                             *
#*  014590  6.0      New for release 6.0                                       *
#*  016109  6.02j    Free Fund Transfer Provision                              *
#*  017150  612J     Remove Currency Decimals = "2"                            *
#*                                                                             *
#*******************************************************************************

S-STEP BF1720-O
{
    ATTRIBUTES
    {
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

    IN MIR-PLAN-ID
    {
        Key;
        DisplayOnly;
        Length = "40";
        CodeSource = "EDIT";
        CodeType = "PLAN";
        SType = "Text";
        Label = "Plan";
    }

    IN MIR-AUTO-TRMN-MO-DUR
    {
        DisplayOnly;
        Length = "3";
        SType = "Text";
        Label = "Automatic Termination Period (months)";
    }

    IN MIR-CV-COMM-CALC-DUR
    {
        DisplayOnly;
        Length = "3";
        SType = "Text";
        Label = "Fund Value Commission Offset (months)";
    }

    IN MIR-CV-COMM-RH-ID
    {
        DisplayOnly;
        Length = "5";
        CodeSource = "EDIT";
        CodeType = "PRHDR";
        SType = "Text";
        Label = "Fund Value Commission Pointer";
    }

    IN MIR-DB-GUAR-VALU-PCT
    {
        DisplayOnly;
        Length = "7";
        Decimals = "4";
        SType = "Percent";
        Label = "Guaranteed Death Benefit Percent";
    }

    IN MIR-DPOS-COMM-RH-ID
    {
        DisplayOnly;
        Length = "4";
        CodeSource = "EDIT";
        CodeType = "PRHDR";
        SType = "Text";
        Label = "Commission Pointer";
    }

    IN MIR-GUAR-VALU-CALC-CD
    {
        DisplayOnly;
        Length = "1";
        CodeSource = "DataModel";
        CodeType = "GUAR-VALU-CALC-CD";
        SType = "Text";
        Label = "Guaranteed Value Method";
    }

    IN MIR-INT-CALC-TYP-CD
    {
        DisplayOnly;
        Length = "1";
        CodeSource = "DataModel";
        CodeType = "INT-CALC-TYP-CD";
        SType = "Text";
        Label = "Interest Method";
    }

    IN MIR-MAT-GUAR-VALU-PCT
    {
        DisplayOnly;
        Length = "7";
        Decimals = "4";
        SType = "Percent";
        Label = "Guaranteed Maturity Percent";
    }

    IN MIR-MAX-PSUR-MO-DUR
    {
        DisplayOnly;
        Length = "3";
        SType = "Text";
        Label = "Maximum Partial Surrender Period (months)";
    }

    IN MIR-MIN-ADDL-DPOS-AMT
    {
        DisplayOnly;
        Length = "15";
        SType = "Currency";
        Label = "Minimum Additional Payment";
    }

    IN MIR-MIN-AUTO-TRMN-AMT
    {
        DisplayOnly;
        Length = "15";
        SType = "Currency";
        Label = "Automatic Termination Benchmark";
    }

    IN MIR-MIN-CNFRM-NOTI-AMT
    {
        DisplayOnly;
        Length = "15";
        SType = "Currency";
        Label = "Confirmation Notice Minimum";
    }

    IN MIR-MIN-INIT-DPOS-AMT
    {
        DisplayOnly;
        Length = "15";
        SType = "Currency";
        Label = "Minimum Initial Payment";
    }

    IN MIR-MIN-INT-ELIG-AMT
    {
        DisplayOnly;
        Length = "15";
        SType = "Currency";
        Label = "Minimum Amount Needed to Credit Interest";
    }

    IN MIR-MTHV-CV-DIR-CD
    {
        DisplayOnly;
        Length = "1";
        CodeSource = "DataModel";
        CodeType = "MTHV-CV-DIR-CD";
        SType = "Text";
        Label = "Unit Price Used - Monthiversay Calculation";
    }

    IN MIR-PEND-PMT-INT-RT-ID
    {
        DisplayOnly;
        Length = "6";
        CodeSource = "EDIT";
        CodeType = "IRTS";
        SType = "Text";
        Label = "Pending Payment Interest";
    }

    IN MIR-PLAN-CV-COMM-IND
    {
        DisplayOnly;
        Length = "1";
        SType = "Indicator";
        Label = "Pay commissions on fund value";
    }

    IN MIR-PLAN-DPOS-NOTI-CD
    {
        DisplayOnly;
        Length = "1";
        CodeSource = "DataModel";
        CodeType = "PLAN-DPOS-NOTI-CD";
        SType = "Text";
        Label = "Notification Type";
    }

    IN MIR-PLAN-MAX-FND-QTY
    {
        DisplayOnly;
        Length = "3";
        SType = "Text";
        Label = "Maximum Number of Funds";
    }

    IN MIR-PLAN-MAX-PSUR-CD
    {
        DisplayOnly;
        Length = "1";
        CodeSource = "DataModel";
        CodeType = "PLAN-MAX-PSUR-CD";
        SType = "Text";
        Label = "Maximum Partial Surrender Limit";
    }

    IN MIR-PLAN-MAX-PSUR-QTY
    {
        DisplayOnly;
        Length = "3";
        SType = "Text";
        Label = "Maximum Partial Surrender Per Period";
    }

    IN MIR-PLAN-MIN-PSUR-AMT
    {
        DisplayOnly;
        Length = "15";
        SType = "Currency";
        Label = "Minimum Partial Surrender Amount";
    }

    IN MIR-PLAN-OUT-ALLOC-CD
    {
        DisplayOnly;
        Length = "1";
        CodeSource = "DataModel";
        CodeType = "PLAN-OUT-ALLOC-CD";
        SType = "Text";
        Label = "Allocation Withdrawals Method";
    }

    IN MIR-PLAN-PURCH-DIR-CD
    {
        DisplayOnly;
        Length = "1";
        CodeSource = "DataModel";
        CodeType = "PLAN-PURCH-DIR-CD";
        SType = "Text";
        Label = "Unit Price Used - Purchase Transactions";
    }

    IN MIR-PLAN-REQIR-FND-CD
    {
        DisplayOnly;
        Length = "1";
        CodeSource = "DataModel";
        CodeType = "PLAN-REQIR-FND-CD";
        SType = "Text";
        Label = "Fund Required";
    }

    IN MIR-PLAN-WTHDR-DIR-CD
    {
        DisplayOnly;
        Length = "1";
        CodeSource = "DataModel";
        CodeType = "PLAN-WTHDR-DIR-CD";
        SType = "Text";
        Label = "Unit Price Used - Withdrawal Transactions";
    }

    IN MIR-FREE-XFER-CD
    {
        DisplayOnly;
        Length = "1";
        CodeSource = "DataModel";
        CodeType = "PLAN-FREE-XFER-CD";
        SType = "Text";
        Label = "Free Transfer";
    }

    IN MIR-FREE-XFER-PERI-CD
    {
        DisplayOnly;
        Length = "1";
        CodeSource = "DataModel";
        CodeType = "FREE-XFER-PERI-CD";
        SType = "Text";
        Label = "Free Transfers - Period";
    }

    IN MIR-FREE-XFER-QTY
    {
        DisplayOnly;
        Length = "2";
        SType = "Text";
        Label = "Free Transfers - Maximum";
    }

    IN MIR-SETUP-CHRG-AMT
    {
        DisplayOnly;
        Length = "15";
        SType = "Currency";
        Label = "Set-up Charge";
    }

    IN MIR-SURR-GUAR-VALU-PCT
    {
        DisplayOnly;
        Length = "7";
        Decimals = "4";
        SType = "Percent";
        Label = "Guaranteed Surrender Percent";
    }

    IN MIR-XFER-FEE-TYP-CD
    {
        DisplayOnly;
        Length = "1";
        CodeSource = "DataModel";
        CodeType = "XFER-FEE-TYP-CD";
        SType = "Text";
        Label = "Transfer Fee Type";
    }

    IN MIR-XFER-IN-DIR-CD
    {
        DisplayOnly;
        Length = "1";
        CodeSource = "DataModel";
        CodeType = "XFER-IN-DIR-CD";
        SType = "Text";
        Label = "Unit Price Used - Transfer In Fund";
    }

    IN MIR-XFER-INT-RT-ID
    {
        DisplayOnly;
        Length = "6";
        CodeSource = "EDIT";
        CodeType = "IRTS";
        SType = "Text";
        Label = "Pending Transfer Interest";
    }

    IN MIR-XFER-OUT-DIR-CD
    {
        DisplayOnly;
        Length = "1";
        CodeSource = "DataModel";
        CodeType = "XFER-OUT-DIR-CD";
        SType = "Text";
        Label = "Unit Price Used - Transfer Out Fund";
    }

}

