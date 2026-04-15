# Converted from PathFinder 2.2 to 3.0 Jun 18, 2004 3:12:52 PM EDT

#*******************************************************************************
#*  Component:   BF1842Data-I.s                                                *
#*  Description:                                                               *
#*                                                                             *
#*******************************************************************************
#*  Chg#    Release  Description                                               *
#*                                                                             *
#*  014590  6.0      New for release 6.0                                       *
#*  017150  612J     Remove Currency Decimals = "2"                            *
#*                                                                             *
#*******************************************************************************

S-STEP BF1842Data-I
{
    ATTRIBUTES
    {
        BusinessFunctionType = "Update";
        Type = "Input";
        DelEmptyRows;
        FocusField = "MIR-UNIT-ELIG-INT-AMT";
        FocusFrame = "ContentFrame";
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

    INOUT MIR-FNDTAX-TOT-AMT
    {
        Signed;
        Length = "18";
        Decimals = "9";
        SType = "Currency";
        Label = "Total";
    }

    INOUT MIR-UNIT-CDN-GAIN-AMT
    {
        Signed;
        Length = "18";
        Decimals = "9";
        SType = "Currency";
        Label = "Realized Net Capital Gains - Canadian";
    }

    INOUT MIR-UNIT-ELIG-DIV-AMT
    {
        Signed;
        Length = "18";
        Decimals = "9";
        SType = "Currency";
        Label = "Dividend Income - Eligible for Deduction";
    }

    INOUT MIR-UNIT-ELIG-INT-AMT
    {
        Signed;
        Length = "18";
        Decimals = "9";
        SType = "Currency";
        Label = "Interest Income - Eligible for Deduction";
    }

    INOUT MIR-UNIT-FRGN-GAIN-AMT
    {
        Signed;
        Length = "18";
        Decimals = "9";
        SType = "Currency";
        Label = "Realized Net Capital Gains - Foreign";
    }

    INOUT MIR-UNIT-INELG-DIV-AMT
    {
        Signed;
        Length = "18";
        Decimals = "9";
        SType = "Currency";
        Label = "Dividend Income - Not Eligible for Deductions";
    }

    INOUT MIR-UNIT-INELG-INT-AMT
    {
        Signed;
        Length = "18";
        Decimals = "9";
        SType = "Currency";
        Label = "Interest Income - Not Eligible for Deduction";
    }

    INOUT MIR-UNIT-OTHR-INCM-AMT
    {
        Signed;
        Length = "18";
        Decimals = "9";
        SType = "Currency";
        Label = "Other Income";
    }

    INOUT MIR-DV-PRCES-STATE-CD
    {
        Length = "1";
        SType = "Hidden";
        Label = "process code";
    }

    IN MIR-FND-ID
    {
        Key;
        DisplayOnly;
        Length = "5";
        CodeSource = "EDIT";
        CodeType = "SEGFD";
        SType = "Text";
        Label = "Fund ID";
    }

    IN MIR-FNDTAX-EFF-DT
    {
        Key;
        DisplayOnly;
        Length = "10";
        SType = "Date";
        Label = "Effective Date";
    }

}

