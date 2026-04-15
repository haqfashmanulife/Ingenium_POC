# Converted from PathFinder 2.2 to 3.0 Jun 18, 2004 3:13:46 PM EDT

#*******************************************************************************
#*  Component:   BF1842-P.p                                                    *
#*  Description:                                                               *
#*                                                                             *
#*******************************************************************************
#*  Chg#    Release  Description                                               *
#*                                                                             *
#*  014590  6.0      New for release 6.0                                       *
#*  017150  612J     Remove Currency Decimals = "2"                            *
#*                                                                             *
#*******************************************************************************

P-STEP BF1842-P
{
    ATTRIBUTES
    {
        BusinessFunctionId = "1842";
        BusinessFunctionName = "Fund Income Allocation Record Update";
        BusinessFunctionType = "Update";
        MirName = "SCWM0140";
    }

    OUT LSIR-RETURN-CD;

    OUT MIR-RETRN-CD;

    INOUT MIR-FNDTAX-TOT-AMT
    {
        Signed;
        Length = "18";
        Decimals = "9";
        DBTableName = "TFT";
        SType = "Currency";
        Label = "Total";
    }

    INOUT MIR-UNIT-CDN-GAIN-AMT
    {
        Signed;
        Length = "18";
        Decimals = "9";
        DBTableName = "TFT";
        SType = "Currency";
        Label = "Realized Net Capital Gains - Canadian";
    }

    INOUT MIR-UNIT-ELIG-DIV-AMT
    {
        Signed;
        Length = "18";
        Decimals = "9";
        DBTableName = "TFT";
        SType = "Currency";
        Label = "Dividend Income - Eligible for Deduction";
    }

    INOUT MIR-UNIT-ELIG-INT-AMT
    {
        Signed;
        Length = "18";
        Decimals = "9";
        DBTableName = "TFT";
        SType = "Currency";
        Label = "Interest Income - Eligible for Deduction";
    }

    INOUT MIR-UNIT-FRGN-GAIN-AMT
    {
        Signed;
        Length = "18";
        Decimals = "9";
        DBTableName = "TFT";
        SType = "Currency";
        Label = "Realized Net Capital Gains - Foreign";
    }

    INOUT MIR-UNIT-INELG-DIV-AMT
    {
        Signed;
        Length = "18";
        Decimals = "9";
        DBTableName = "TFT";
        SType = "Currency";
        Label = "Dividend Income - Not Eligible for Deductions";
    }

    INOUT MIR-UNIT-INELG-INT-AMT
    {
        Signed;
        Length = "18";
        Decimals = "9";
        DBTableName = "TFT";
        SType = "Currency";
        Label = "Interest Income - Not Eligible for Deduction";
    }

    INOUT MIR-UNIT-OTHR-INCM-AMT
    {
        Signed;
        Length = "18";
        Decimals = "9";
        DBTableName = "TFT";
        SType = "Currency";
        Label = "Other Income";
    }

    IN MIR-FND-ID
    {
        Key;
        Mandatory;
        Length = "5";
        CodeSource = "EDIT";
        CodeType = "SEGFD";
        DBTableName = "TFT";
        SType = "Selection";
        Label = "Fund ID";
    }

    IN MIR-FNDTAX-EFF-DT
    {
        Key;
        Mandatory;
        Length = "10";
        DBTableName = "TFT";
        SType = "Date";
        Label = "Effective Date";
    }

    IN MIR-DV-PRCES-STATE-CD
    {
        Length = "1";
        DBTableName = "Derived";
        SType = "Hidden";
        Label = "process code";
    }

}

