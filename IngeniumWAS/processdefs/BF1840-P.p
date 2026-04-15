# Converted from PathFinder 2.2 to 3.0 Jun 18, 2004 3:13:46 PM EDT

#*******************************************************************************
#*  Component:   BF1840-P.p                                                    *
#*  Description:                                                               *
#*                                                                             *
#*******************************************************************************
#*  Chg#    Release  Description                                               *
#*                                                                             *
#*  014590  6.0      New for release 6.0                                       *
#*  017150  612J     Remove Currency Decimals = "2"                            *
#*                                                                             *
#*******************************************************************************

P-STEP BF1840-P
{
    ATTRIBUTES
    {
        BusinessFunctionId = "1840";
        BusinessFunctionName = "Fund Income Allocation Record Retrieve";
        BusinessFunctionType = "Retrieve";
        MirName = "SCWM0140";
    }

    OUT LSIR-RETURN-CD;

    OUT MIR-RETRN-CD;

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

    OUT MIR-FNDTAX-TOT-AMT
    {
        Signed;
        Length = "18";
        Decimals = "9";
        DBTableName = "TFT";
        SType = "Currency";
        Label = "Total";
    }

    OUT MIR-UNIT-CDN-GAIN-AMT
    {
        Signed;
        Length = "18";
        Decimals = "9";
        DBTableName = "TFT";
        SType = "Currency";
        Label = "Realized Net Capital Gains - Canadian";
    }

    OUT MIR-UNIT-ELIG-DIV-AMT
    {
        Signed;
        Length = "18";
        Decimals = "9";
        DBTableName = "TFT";
        SType = "Currency";
        Label = "Dividend Income - Eligible for Deduction";
    }

    OUT MIR-UNIT-ELIG-INT-AMT
    {
        Signed;
        Length = "18";
        Decimals = "9";
        DBTableName = "TFT";
        SType = "Currency";
        Label = "Interest Income - Eligible for Deduction";
    }

    OUT MIR-UNIT-FRGN-GAIN-AMT
    {
        Signed;
        Length = "18";
        Decimals = "9";
        DBTableName = "TFT";
        SType = "Currency";
        Label = "Realized Net Capital Gains - Foreign";
    }

    OUT MIR-UNIT-INELG-DIV-AMT
    {
        Signed;
        Length = "18";
        Decimals = "9";
        DBTableName = "TFT";
        SType = "Currency";
        Label = "Dividend Income - Not Eligible for Deductions";
    }

    OUT MIR-UNIT-INELG-INT-AMT
    {
        Signed;
        Length = "18";
        Decimals = "9";
        DBTableName = "TFT";
        SType = "Currency";
        Label = "Interest Income - Not Eligible for Deduction";
    }

    OUT MIR-UNIT-OTHR-INCM-AMT
    {
        Signed;
        Length = "18";
        Decimals = "9";
        DBTableName = "TFT";
        SType = "Currency";
        Label = "Other Income";
    }

}

