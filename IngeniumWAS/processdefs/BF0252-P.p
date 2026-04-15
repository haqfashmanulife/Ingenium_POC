# Converted from PathFinder 2.2 to 3.0 Jun 18, 2004 3:13:18 PM EDT

#*******************************************************************************
#*  Component:   BF0252-P.p                                                    *
#*  Description:                                                               *
#*                                                                             *
#*******************************************************************************
#*  Chg#    Release  Description                                               *
#*                                                                             *
#*  014590  6.0      New for release 6.0                                       *
#*  017150  612J     Remove Currency Decimals = "2"                            *
#*                                                                             *
#*******************************************************************************

P-STEP BF0252-P
{
    ATTRIBUTES
    {
        BusinessFunctionId = "0252";
        BusinessFunctionName = "Policy Values Projections Update";
        BusinessFunctionType = "Update";
        MirName = "CCWM0196";
    }

    OUT LSIR-RETURN-CD;

    OUT MIR-RETRN-CD;

    INOUT MIR-CVG-GUAR-INT-PCT
    {
        Signed;
        Length = "7";
        Decimals = "4";
        DBTableName = "TCVG";
        SType = "Percent";
        Label = "Interest Guaranteed Period - Interest Rate";
    }

    INOUT MIR-DV-LMPSM-AMT
    {
        Length = "13";
        DBTableName = "Derived";
        SType = "Currency";
        Label = "Lump Sum Amount Added";
    }

    INOUT MIR-INIT-DPOS-INT-PCT
    {
        Length = "7";
        Decimals = "4";
        DBTableName = "TIR";
        SType = "Percent";
        Label = "Interest Rate for Initial Deposit";
    }

    INOUT MIR-PLAN-PERI-PREM-AMT
    {
        Length = "13";
        DBTableName = "TPOL";
        SType = "Currency";
        Label = "Planned Premium";
    }

    INOUT MIR-POL-BILL-MODE-CD
    {
        Length = "40";
        CodeSource = "DataModel";
        CodeType = "POL-BILL-MODE-CD";
        DBTableName = "TPOL";
        DefaultConstant = "01";
        SType = "Selection";
        Label = "Premium Mode";
    }

    INOUT MIR-POL-DB-OPT-CD
    {
        Mandatory;
        Length = "1";
        CodeSource = "DataModel";
        CodeType = "POL-DB-OPT-CD";
        DBTableName = "TPOL";
        SType = "Selection";
        Label = "Death Benefit Option";
    }

    INOUT MIR-POL-ID-BASE
    {
        Key;
        Mandatory;
        Length = "9";
        DBTableName = "TPOL";
        DefaultSession = "MIR-POL-ID-BASE";
        SType = "Text";
        Label = "Policy Id";
    }

    INOUT MIR-POL-ID-SFX
    {
        Key;
        Length = "1";
        DBTableName = "TPOL";
        DefaultSession = "MIR-POL-ID-SFX";
        SType = "Text";
        Label = "Suffix";
    }

    INOUT MIR-POL-ISS-EFF-DT
    {
        Length = "10";
        DBTableName = "TPOL";
        DefaultSession = "LSIR-PRCES-DT";
        SType = "Date";
        Label = "Policy Issue Date";
    }

    INOUT MIR-UL-INIT-PREM-AMT
    {
        Length = "13";
        DBTableName = "TPOL";
        SType = "Currency";
        Label = "Intended Initial Premium";
    }

}

