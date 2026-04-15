# Converted from PathFinder 2.2 to 3.0 Jun 18, 2004 3:13:18 PM EDT

#*******************************************************************************
#*  Component:   BF0251-P.p                                                    *
#*  Description:                                                               *
#*                                                                             *
#*******************************************************************************
#*  Chg#    Release  Description                                               *
#*                                                                             *
#*  014590  6.0      New for release 6.0                                       *
#*  017150  612J     Remove Currency Decimals = "2"                            *
#*                                                                             *
#*******************************************************************************

P-STEP BF0251-P
{
    ATTRIBUTES
    {
        BusinessFunctionId = "0251";
        BusinessFunctionName = "Policy Values Projections Refresh";
        BusinessFunctionType = "Refresh";
        MirName = "CCWM0196";
    }

    OUT LSIR-RETURN-CD;

    OUT MIR-RETRN-CD;

    IN MIR-POL-ID-BASE
    {
        Key;
        Mandatory;
        Length = "9";
        DBTableName = "TPOL";
        DefaultSession = "MIR-POL-ID-BASE";
        SType = "Text";
        Label = "Policy Id";
    }

    IN MIR-POL-ID-SFX
    {
        Key;
        Length = "1";
        DBTableName = "TPOL";
        DefaultSession = "MIR-POL-ID-SFX";
        SType = "Text";
        Label = "Suffix";
    }

    OUT MIR-CVG-GUAR-INT-PCT
    {
        Signed;
        Length = "7";
        Decimals = "4";
        DBTableName = "TCVG";
        SType = "Percent";
        Label = "Interest Guaranteed Period - Interest Rate";
    }

    OUT MIR-DV-LMPSM-AMT
    {
        Length = "13";
        DBTableName = "Derived";
        SType = "Currency";
        Label = "Lump Sum Amount Added";
    }

    OUT MIR-INIT-DPOS-INT-PCT
    {
        Length = "7";
        Decimals = "4";
        DBTableName = "TIR";
        SType = "Percent";
        Label = "Interest Rate for Initial Deposit";
    }

    OUT MIR-PLAN-PERI-PREM-AMT
    {
        Length = "13";
        DBTableName = "TPOL";
        SType = "Currency";
        Label = "Planned Premium";
    }

    OUT MIR-POL-BILL-MODE-CD
    {
        Length = "40";
        CodeSource = "DataModel";
        CodeType = "POL-BILL-MODE-CD";
        DBTableName = "TPOL";
        DefaultConstant = "01";
        SType = "Text";
        Label = "Premium Mode";
    }

    OUT MIR-POL-DB-OPT-CD
    {
        Length = "1";
        CodeSource = "DataModel";
        CodeType = "POL-DB-OPT-CD";
        DBTableName = "TPOL";
        SType = "Text";
        Label = "Death Benefit Option";
    }

    OUT MIR-POL-ISS-EFF-DT
    {
        Length = "10";
        DBTableName = "TPOL";
        DefaultSession = "LSIR-PRCES-DT";
        SType = "Date";
        Label = "Policy Issue Date";
    }

    OUT MIR-UL-INIT-PREM-AMT
    {
        Length = "13";
        DBTableName = "TPOL";
        SType = "Currency";
        Label = "Intended Initial Premium";
    }

}

