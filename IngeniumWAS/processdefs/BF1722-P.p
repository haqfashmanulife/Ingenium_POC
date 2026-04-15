# Converted from PathFinder 2.2 to 3.0 Jun 18, 2004 3:13:44 PM EDT

#*******************************************************************************
#*  Component:   BF1722-P.p                                                    *
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

P-STEP BF1722-P
{
    ATTRIBUTES
    {
        BusinessFunctionId = "1722";
        BusinessFunctionName = "Fund Plan Extension Record Update";
        BusinessFunctionType = "Update";
        MirName = "SCWM0010";
    }

    OUT LSIR-RETURN-CD;

    OUT MIR-RETRN-CD;

    INOUT MIR-AUTO-TRMN-MO-DUR
    {
        Length = "3";
        DBTableName = "TFX";
        SType = "Text";
        Label = "Automatic Termination Period (months)";
    }

    INOUT MIR-CV-COMM-CALC-DUR
    {
        Length = "3";
        DBTableName = "TFX";
        SType = "Text";
        Label = "Fund Value Commission Offset (months)";
    }

    INOUT MIR-CV-COMM-RH-ID
    {
        Length = "5";
        CodeSource = "EDIT";
        CodeType = "PRHDR";
        DBTableName = "TFX";
        SType = "Selection";
        Label = "Fund Value Commission Pointer";
    }

    INOUT MIR-DB-GUAR-VALU-PCT
    {
        Length = "7";
        Decimals = "4";
        DBTableName = "TFX";
        SType = "Percent";
        Label = "Guaranteed Death Benefit Percent";
    }

    INOUT MIR-DPOS-COMM-RH-ID
    {
        Length = "4";
        CodeSource = "EDIT";
        CodeType = "PRHDR";
        DBTableName = "TFX";
        SType = "Selection";
        Label = "Commission Pointer";
    }

    INOUT MIR-GUAR-VALU-CALC-CD
    {
        Length = "1";
        CodeSource = "DataModel";
        CodeType = "GUAR-VALU-CALC-CD";
        DBTableName = "TFX";
        SType = "Selection";
        Label = "Guaranteed Value Method";
    }

    INOUT MIR-INT-CALC-TYP-CD
    {
        Length = "1";
        CodeSource = "DataModel";
        CodeType = "INT-CALC-TYP-CD";
        DBTableName = "TFX";
        SType = "Selection";
        Label = "Interest Method";
    }

    INOUT MIR-MAT-GUAR-VALU-PCT
    {
        Length = "7";
        Decimals = "4";
        DBTableName = "TFX";
        SType = "Percent";
        Label = "Guaranteed Maturity Percent";
    }

    INOUT MIR-MAX-PSUR-MO-DUR
    {
        Length = "3";
        DBTableName = "TFX";
        SType = "Text";
        Label = "Maximum Partial Surrender Period (months)";
    }

    INOUT MIR-MIN-ADDL-DPOS-AMT
    {
        Length = "15";
        DBTableName = "TFX";
        SType = "Currency";
        Label = "Minimum Additional Payment";
    }

    INOUT MIR-MIN-AUTO-TRMN-AMT
    {
        Length = "15";
        DBTableName = "TFX";
        SType = "Currency";
        Label = "Automatic Termination Benchmark";
    }

    INOUT MIR-MIN-CNFRM-NOTI-AMT
    {
        Length = "15";
        DBTableName = "TFX";
        SType = "Currency";
        Label = "Confirmation Notice Minimum";
    }

    INOUT MIR-MIN-INIT-DPOS-AMT
    {
        Length = "15";
        DBTableName = "TFX";
        SType = "Currency";
        Label = "Minimum Initial Payment";
    }

    INOUT MIR-MIN-INT-ELIG-AMT
    {
        Length = "15";
        DBTableName = "TFX";
        SType = "Currency";
        Label = "Minimum Amount Needed to Credit Interest";
    }

    INOUT MIR-MTHV-CV-DIR-CD
    {
        Length = "1";
        CodeSource = "DataModel";
        CodeType = "MTHV-CV-DIR-CD";
        DBTableName = "TFX";
        SType = "Selection";
        Label = "Unit Price Used - Monthiversay Calculation";
    }

    INOUT MIR-PEND-PMT-INT-RT-ID
    {
        Length = "6";
        CodeSource = "EDIT";
        CodeType = "IRTS";
        DBTableName = "TFX";
        SType = "Selection";
        Label = "Pending Payment Interest";
    }

    INOUT MIR-PLAN-CV-COMM-IND
    {
        Length = "1";
        DBTableName = "TFX";
        SType = "Indicator";
        Label = "Pay commissions on fund value";
    }

    INOUT MIR-PLAN-DPOS-NOTI-CD
    {
        Length = "1";
        CodeSource = "DataModel";
        CodeType = "PLAN-DPOS-NOTI-CD";
        DBTableName = "TFX";
        SType = "Selection";
        Label = "Notification Type";
    }

    INOUT MIR-PLAN-MAX-FND-QTY
    {
        Length = "3";
        DBTableName = "TFX";
        SType = "Text";
        Label = "Maximum Number of Funds";
    }

    INOUT MIR-PLAN-MAX-PSUR-CD
    {
        Length = "1";
        CodeSource = "DataModel";
        CodeType = "PLAN-MAX-PSUR-CD";
        DBTableName = "TFX";
        SType = "Selection";
        Label = "Maximum Partial Surrender Limit";
    }

    INOUT MIR-PLAN-MAX-PSUR-QTY
    {
        Length = "3";
        DBTableName = "TFX";
        SType = "Text";
        Label = "Maximum Partial Surrender Per Period";
    }

    INOUT MIR-PLAN-MIN-PSUR-AMT
    {
        Length = "15";
        DBTableName = "TFX";
        SType = "Currency";
        Label = "Minimum Partial Surrender Amount";
    }

    INOUT MIR-PLAN-OUT-ALLOC-CD
    {
        Length = "1";
        CodeSource = "DataModel";
        CodeType = "PLAN-OUT-ALLOC-CD";
        DBTableName = "TFX";
        SType = "Selection";
        Label = "Allocation Withdrawals Method";
    }

    INOUT MIR-PLAN-PURCH-DIR-CD
    {
        Length = "1";
        CodeSource = "DataModel";
        CodeType = "PLAN-PURCH-DIR-CD";
        DBTableName = "TFX";
        SType = "Selection";
        Label = "Unit Price Used - Purchase Transactions";
    }

    INOUT MIR-PLAN-REQIR-FND-CD
    {
        Length = "1";
        CodeSource = "DataModel";
        CodeType = "PLAN-REQIR-FND-CD";
        DBTableName = "TFX";
        SType = "Selection";
        Label = "Fund Required";
    }

    INOUT MIR-PLAN-WTHDR-DIR-CD
    {
        Length = "1";
        CodeSource = "DataModel";
        CodeType = "PLAN-WTHDR-DIR-CD";
        DBTableName = "TFX";
        SType = "Selection";
        Label = "Unit Price Used - Withdrawal Transactions";
    }

    INOUT MIR-FREE-XFER-CD
    {
        Length = "1";
        CodeSource = "DataModel";
        CodeType = "PLAN-FREE-XFER-CD";
        DBTableName = "TFX";
        SType = "Selection";
        Label = "Free Transfer";
    }

    INOUT MIR-FREE-XFER-PERI-CD
    {
        Length = "1";
        CodeSource = "DataModel";
        CodeType = "FREE-XFER-PERI-CD";
        DBTableName = "TFX";
        SType = "Selection";
        Label = "Free Transfers - Period";
    }

    INOUT MIR-FREE-XFER-QTY
    {
        Length = "1";
        DBTableName = "TFX";
        SType = "Selection";
        Label = "Free Transfer - Maximum";
    }

    INOUT MIR-SETUP-CHRG-AMT
    {
        Length = "15";
        DBTableName = "TFX";
        SType = "Currency";
        Label = "Set-up Charge";
    }

    INOUT MIR-SURR-GUAR-VALU-PCT
    {
        Length = "7";
        Decimals = "4";
        DBTableName = "TFX";
        SType = "Percent";
        Label = "Guaranteed Surrender Percent";
    }

    INOUT MIR-XFER-FEE-TYP-CD
    {
        Length = "1";
        CodeSource = "DataModel";
        CodeType = "XFER-FEE-TYP-CD";
        DBTableName = "TFX";
        SType = "Selection";
        Label = "Transfer Fee Type";
    }

    INOUT MIR-XFER-IN-DIR-CD
    {
        Length = "1";
        CodeSource = "DataModel";
        CodeType = "XFER-IN-DIR-CD";
        DBTableName = "TFX";
        SType = "Selection";
        Label = "Unit Price Used - Transfer In Fund";
    }

    INOUT MIR-XFER-INT-RT-ID
    {
        Length = "6";
        CodeSource = "EDIT";
        CodeType = "IRTS";
        DBTableName = "TFX";
        SType = "Selection";
        Label = "Pending Transfer Interest";
    }

    INOUT MIR-XFER-OUT-DIR-CD
    {
        Length = "1";
        CodeSource = "DataModel";
        CodeType = "XFER-OUT-DIR-CD";
        DBTableName = "TFX";
        SType = "Selection";
        Label = "Unit Price Used - Transfer Out Fund";
    }

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

}

