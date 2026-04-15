# Converted from PathFinder 2.2 to 3.0 Jun 18, 2004 3:13:44 PM EDT

#*******************************************************************************
#*  Component:   BF1720-P.p                                                    *
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

P-STEP BF1720-P
{
    ATTRIBUTES
    {
        BusinessFunctionId = "1720";
        BusinessFunctionName = "Fund Plan Extension Record Retrieve";
        BusinessFunctionType = "Retrieve";
        MirName = "SCWM0010";
    }

    OUT LSIR-RETURN-CD;

    OUT MIR-RETRN-CD;

    IN MIR-PLAN-ID
    {
        Key;
        Mandatory;
        Length = "40";
        CodeSource = "EDIT";
        CodeType = "PLAN";
        DBTableName = "TFX";
        SType = "Selection";
        Label = "Plan";
    }

    OUT MIR-AUTO-TRMN-MO-DUR
    {
        Length = "3";
        DBTableName = "TFX";
        SType = "Text";
        Label = "Automatic Termination Period (months)";
    }

    OUT MIR-CV-COMM-CALC-DUR
    {
        Length = "3";
        DBTableName = "TFX";
        SType = "Text";
        Label = "Fund Value Commission Offset (months)";
    }

    OUT MIR-CV-COMM-RH-ID
    {
        Length = "5";
        CodeSource = "EDIT";
        CodeType = "PRHDR";
        DBTableName = "TFX";
        SType = "Text";
        Label = "Fund Value Commission Pointer";
    }

    OUT MIR-DB-GUAR-VALU-PCT
    {
        Length = "7";
        Decimals = "4";
        DBTableName = "TFX";
        SType = "Percent";
        Label = "Guaranteed Death Benefit Percent";
    }

    OUT MIR-DPOS-COMM-RH-ID
    {
        Length = "4";
        CodeSource = "EDIT";
        CodeType = "PRHDR";
        DBTableName = "TFX";
        SType = "Text";
        Label = "Commission Pointer";
    }

    OUT MIR-GUAR-VALU-CALC-CD
    {
        Length = "1";
        CodeSource = "DataModel";
        CodeType = "GUAR-VALU-CALC-CD";
        DBTableName = "TFX";
        SType = "Text";
        Label = "Guaranteed Value Method";
    }

    OUT MIR-INT-CALC-TYP-CD
    {
        Length = "1";
        CodeSource = "DataModel";
        CodeType = "INT-CALC-TYP-CD";
        DBTableName = "TFX";
        SType = "Text";
        Label = "Interest Method";
    }

    OUT MIR-MAT-GUAR-VALU-PCT
    {
        Length = "7";
        Decimals = "4";
        DBTableName = "TFX";
        SType = "Percent";
        Label = "Guaranteed Maturity Percent";
    }

    OUT MIR-MAX-PSUR-MO-DUR
    {
        Length = "3";
        DBTableName = "TFX";
        SType = "Text";
        Label = "Maximum Partial Surrender Period (months)";
    }

    OUT MIR-MIN-ADDL-DPOS-AMT
    {
        Length = "15";
        DBTableName = "TFX";
        SType = "Currency";
        Label = "Minimum Additional Payment";
    }

    OUT MIR-MIN-AUTO-TRMN-AMT
    {
        Length = "15";
        DBTableName = "TFX";
        SType = "Currency";
        Label = "Automatic Termination Benchmark";
    }

    OUT MIR-MIN-CNFRM-NOTI-AMT
    {
        Length = "15";
        DBTableName = "TFX";
        SType = "Currency";
        Label = "Confirmation Notice Minimum";
    }

    OUT MIR-MIN-INIT-DPOS-AMT
    {
        Length = "15";
        DBTableName = "TFX";
        SType = "Currency";
        Label = "Minimum Initial Payment";
    }

    OUT MIR-MIN-INT-ELIG-AMT
    {
        Length = "15";
        DBTableName = "TFX";
        SType = "Currency";
        Label = "Minimum Amount Needed to Credit Interest";
    }

    OUT MIR-MTHV-CV-DIR-CD
    {
        Length = "1";
        CodeSource = "DataModel";
        CodeType = "MTHV-CV-DIR-CD";
        DBTableName = "TFX";
        SType = "Text";
        Label = "Unit Price Used - Monthiversay Calculation";
    }

    OUT MIR-PEND-PMT-INT-RT-ID
    {
        Length = "6";
        CodeSource = "EDIT";
        CodeType = "IRTS";
        DBTableName = "TFX";
        SType = "Text";
        Label = "Pending Payment Interest";
    }

    OUT MIR-PLAN-CV-COMM-IND
    {
        Length = "1";
        DBTableName = "TFX";
        SType = "Indicator";
        Label = "Pay commissions on fund value";
    }

    OUT MIR-PLAN-DPOS-NOTI-CD
    {
        Length = "1";
        CodeSource = "DataModel";
        CodeType = "PLAN-DPOS-NOTI-CD";
        DBTableName = "TFX";
        SType = "Text";
        Label = "Notification Type";
    }

    OUT MIR-PLAN-MAX-FND-QTY
    {
        Length = "3";
        DBTableName = "TFX";
        SType = "Text";
        Label = "Maximum Number of Funds";
    }

    OUT MIR-PLAN-MAX-PSUR-CD
    {
        Length = "1";
        CodeSource = "DataModel";
        CodeType = "PLAN-MAX-PSUR-CD";
        DBTableName = "TFX";
        SType = "Text";
        Label = "Maximum Partial Surrender Limit";
    }

    OUT MIR-PLAN-MAX-PSUR-QTY
    {
        Length = "3";
        DBTableName = "TFX";
        SType = "Text";
        Label = "Maximum Partial Surrender Per Period";
    }

    OUT MIR-PLAN-MIN-PSUR-AMT
    {
        Length = "15";
        DBTableName = "TFX";
        SType = "Currency";
        Label = "Minimum Partial Surrender Amount";
    }

    OUT MIR-PLAN-OUT-ALLOC-CD
    {
        Length = "1";
        CodeSource = "DataModel";
        CodeType = "PLAN-OUT-ALLOC-CD";
        DBTableName = "TFX";
        SType = "Text";
        Label = "Allocation Withdrawals Method";
    }

    OUT MIR-PLAN-PURCH-DIR-CD
    {
        Length = "1";
        CodeSource = "DataModel";
        CodeType = "PLAN-PURCH-DIR-CD";
        DBTableName = "TFX";
        SType = "Text";
        Label = "Unit Price Used - Purchase Transactions";
    }

    OUT MIR-PLAN-REQIR-FND-CD
    {
        Length = "1";
        CodeSource = "DataModel";
        CodeType = "PLAN-REQIR-FND-CD";
        DBTableName = "TFX";
        SType = "Text";
        Label = "Fund Required";
    }

    OUT MIR-PLAN-WTHDR-DIR-CD
    {
        Length = "1";
        CodeSource = "DataModel";
        CodeType = "PLAN-WTHDR-DIR-CD";
        DBTableName = "TFX";
        SType = "Text";
        Label = "Unit Price Used - Withdrawal Transactions";
    }

    OUT MIR-FREE-XFER-CD
    {
        Length = "1";
        CodeSource = "DataModel";
        CodeType = "PLAN-FREE-XFER-CD";
        DBTableName = "TFX";
        SType = "Text";
        Label = "Free Transfer";
    }

    OUT MIR-FREE-XFER-PERI-CD
    {
        Length = "1";
        CodeSource = "DataModel";
        CodeType = "FREE-XFER-PERI-CD";
        DBTableName = "TFX";
        SType = "Text";
        Label = "Free Transfers - Period";
    }

    OUT MIR-FREE-XFER-QTY
    {
        Length = "2";
        DBTableName = "TFX";
        SType = "Text";
        Label = "Free Transfers - Maximum";
    }

    OUT MIR-SETUP-CHRG-AMT
    {
        Length = "15";
        DBTableName = "TFX";
        SType = "Currency";
        Label = "Set-up Charge";
    }

    OUT MIR-SURR-GUAR-VALU-PCT
    {
        Length = "7";
        Decimals = "4";
        DBTableName = "TFX";
        SType = "Percent";
        Label = "Guaranteed Surrender Percent";
    }

    OUT MIR-XFER-FEE-TYP-CD
    {
        Length = "1";
        CodeSource = "DataModel";
        CodeType = "XFER-FEE-TYP-CD";
        DBTableName = "TFX";
        SType = "Text";
        Label = "Transfer Fee Type";
    }

    OUT MIR-XFER-IN-DIR-CD
    {
        Length = "1";
        CodeSource = "DataModel";
        CodeType = "XFER-IN-DIR-CD";
        DBTableName = "TFX";
        SType = "Text";
        Label = "Unit Price Used - Transfer In Fund";
    }

    OUT MIR-XFER-INT-RT-ID
    {
        Length = "6";
        CodeSource = "EDIT";
        CodeType = "IRTS";
        DBTableName = "TFX";
        SType = "Text";
        Label = "Pending Transfer Interest";
    }

    OUT MIR-XFER-OUT-DIR-CD
    {
        Length = "1";
        CodeSource = "DataModel";
        CodeType = "XFER-OUT-DIR-CD";
        DBTableName = "TFX";
        SType = "Text";
        Label = "Unit Price Used - Transfer Out Fund";
    }

}

