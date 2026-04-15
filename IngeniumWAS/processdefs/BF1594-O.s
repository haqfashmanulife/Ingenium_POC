# Converted from PathFinder 2.2 to 3.0 Jun 18, 2004 3:12:46 PM EDT

#*******************************************************************************
#*  Component:   BF1594-O.s                                                    *
#*  Description:                                                               *
#*                                                                             *
#*******************************************************************************
#*  Chg#    Release  Description                                               *
#*                                                                             *
#*  014590  6.0      New for release 6.0                                       *
#*  017150  612J     Remove Currency Decimals = "2"                            *
#*  02AD12           Add assumed interest rate                                 *
#*  P00944           Add average asset yield rate                              *
#*                                                                             *
#*******************************************************************************

S-STEP BF1594-O
{
    ATTRIBUTES
    {
        BusinessFunctionType = "List";
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

    INOUT MIR-DPOS-TRM-DY-DUR
    {
        Key;
        Mandatory;
        Length = "3";
        DefaultConstant = "000";
        SType = "Text";
        Label = "Deposit Term - Days";
    }

    INOUT MIR-DPOS-TRM-MO-DUR
    {
        Key;
        Mandatory;
        Length = "3";
        DefaultConstant = "000";
        SType = "Text";
        Label = "Deposit Term - Months";
    }

    INOUT MIR-INT-RT-EFF-DT
    {
        Key;
        Mandatory;
        Length = "10";
        DefaultSession = "LSIR-PRCES-DT";
        SType = "Date";
        Label = "Effective Date";
    }

    INOUT MIR-INT-RT-ID
    {
        Key;
        Mandatory;
        Length = "6";
        CodeSource = "EDIT";
        CodeType = "IRTS";
        SType = "Selection";
        Label = "Plan";
    }

    INOUT MIR-INT-RT-MAX-AMT
    {
        Key;
        Mandatory;
        Length = "13";
        Decimals = "0";
        DefaultConstant = "9999999999999";
        SType = "Currency";
        Label = "Maximum Amount";
    }

    IN MIR-DPOS-TRM-DY-DUR-T[12]
    {
        DisplayOnly;
        Length = "3";
        FieldGroup = "Table12";
        SType = "Text";
        Label = "Deposit Term - Days";
        Index = "1";
    }

    IN MIR-DPOS-TRM-MO-DUR-T[12]
    {
        DisplayOnly;
        Length = "3";
        FieldGroup = "Table12";
        SType = "Text";
        Label = "Deposit Term - Months";
        Index = "1";
    }

    IN MIR-INIT-DPOS-INT-PCT-T[12]
    {
        DisplayOnly;
        Length = "7";
        Decimals = "4";
        FieldGroup = "Table12";
        SType = "Percent";
        Label = "Interest Rate for Initial Deposit";
        Index = "1";
    }

    IN MIR-INT-RT-EFF-DT-T[12]
    {
        DisplayOnly;
        Length = "10";
        FieldGroup = "Table12";
        SType = "Date";
        Label = "Effective Date";
        Index = "1";
    }

    IN MIR-INT-RT-ID-T[12]
    {
        DisplayOnly;
        Length = "6";
        FieldGroup = "Table12";
        CodeSource = "EDIT";
        CodeType = "IRTS";
        SType = "Text";
        Label = "Plan";
        Index = "1";
    }

    IN MIR-INT-RT-MAX-AMT-T[12]
    {
        DisplayOnly;
        Length = "13";
        Decimals = "0";
        FieldGroup = "Table12";
        SType = "Currency";
        Label = "Maximum Amount";
        Index = "1";
    }

    IN MIR-MKTVAL-ADJ-INT-PCT-T[12]
    {
        DisplayOnly;
        Length = "7";
        Decimals = "4";
        FieldGroup = "Table12";
        SType = "Percent";
        Label = "Interest Rate for Market Value Adjustment";
        Index = "1";
    }

    IN MIR-ROLOVR-INT-PCT-T[12]
    {
        DisplayOnly;
        Signed;
        Length = "7";
        Decimals = "4";
        FieldGroup = "Table12";
        SType = "Percent";
        Label = "Interest Rate for Rollover Deposit";
        Index = "1";
    }

    IN MIR-ASSUMED-INT-PCT-T[12]
    {
        DisplayOnly;
        Signed;
        Length = "7";
        Decimals = "4";
        FieldGroup = "Table12";
        SType = "Percent";
        Label = "Assumed Interest Rate";
        Index = "1";
    }

    IN MIR-AVG-ASSET-YLD-PCT-T[12]
    {
        DisplayOnly;
        Signed;
        Length = "7";
        Decimals = "4";
        FieldGroup = "Table12";
        SType = "Percent";
        Label = "Average Asset Yield Rate";
        Index = "1";
    }

}

