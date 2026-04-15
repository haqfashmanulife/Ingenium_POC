# Converted from PathFinder 2.2 to 3.0 Jun 18, 2004 3:12:52 PM EDT

#*******************************************************************************
#*  Component:   BF1842-O.s                                                    *
#*  Description:                                                               *
#*                                                                             *
#*******************************************************************************
#*  Chg#    Release  Description                                               *
#*                                                                             *
#*  014590  6.0      New for release 6.0                                       *
#*  017150  612J     Remove Currency Decimals = "2"                            *
#*                                                                             *
#*******************************************************************************

S-STEP BF1842-O
{
    ATTRIBUTES
    {
        BusinessFunctionType = "Update";
        Type = "Output";
        DelEmptyRows;
        FocusField = "confirmButton";
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

    IN MIR-FNDTAX-TOT-AMT
    {
        DisplayOnly;
        Signed;
        Length = "18";
        Decimals = "9";
        SType = "Currency";
        Label = "Total";
    }

    IN MIR-UNIT-CDN-GAIN-AMT
    {
        DisplayOnly;
        Signed;
        Length = "18";
        Decimals = "9";
        SType = "Currency";
        Label = "Realized Net Capital Gains - Canadian";
    }

    IN MIR-UNIT-ELIG-DIV-AMT
    {
        DisplayOnly;
        Signed;
        Length = "18";
        Decimals = "9";
        SType = "Currency";
        Label = "Dividend Income - Eligible for Deduction";
    }

    IN MIR-UNIT-ELIG-INT-AMT
    {
        DisplayOnly;
        Signed;
        Length = "18";
        Decimals = "9";
        SType = "Currency";
        Label = "Interest Income - Eligible for Deduction";
    }

    IN MIR-UNIT-FRGN-GAIN-AMT
    {
        DisplayOnly;
        Signed;
        Length = "18";
        Decimals = "9";
        SType = "Currency";
        Label = "Realized Net Capital Gains - Foreign";
    }

    IN MIR-UNIT-INELG-DIV-AMT
    {
        DisplayOnly;
        Signed;
        Length = "18";
        Decimals = "9";
        SType = "Currency";
        Label = "Dividend Income - Not Eligible for Deductions";
    }

    IN MIR-UNIT-INELG-INT-AMT
    {
        DisplayOnly;
        Signed;
        Length = "18";
        Decimals = "9";
        SType = "Currency";
        Label = "Interest Income - Not Eligible for Deduction";
    }

    IN MIR-UNIT-OTHR-INCM-AMT
    {
        DisplayOnly;
        Signed;
        Length = "18";
        Decimals = "9";
        SType = "Currency";
        Label = "Other Income";
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

