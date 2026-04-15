# Converted from PathFinder 2.2 to 3.0 Jun 18, 2004 3:12:46 PM EDT

#*******************************************************************************
#*  Component:   BF1592-I.s                                                    *
#*  Description:                                                               *
#*                                                                             *
#*******************************************************************************
#*  Chg#    Release  Description                                               *
#*                                                                             *
#*  014590  6.0      New for release 6.0                                       *
#*  017150  612J     Remove Currency Decimals = "2"                            *
#*  02AD12           Add assumed interest rate                                 *
#*  p00944           Add average asset yield rate                              *
#*                                                                             *
#*******************************************************************************

S-STEP BF1592-I
{
    ATTRIBUTES
    {
        BusinessFunctionType = "Update";
        Type = "Input";
        FocusField = "MIR-INIT-DPOS-INT-PCT";
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

    INOUT MIR-INIT-DPOS-INT-PCT
    {
        Length = "7";
        Decimals = "4";
        SType = "Percent";
        Label = "Interest Rate for Initial Deposit";
    }

    INOUT MIR-MKTVAL-ADJ-INT-PCT
    {
        Length = "7";
        Decimals = "4";
        SType = "Percent";
        Label = "Interest Rate for Market Value Adjustment";
    }

    INOUT MIR-ROLOVR-INT-PCT
    {
        Signed;
        Length = "7";
        Decimals = "4";
        SType = "Percent";
        Label = "Interest Rate for Rollover Deposit";
    }

    INOUT MIR-ASSUMED-INT-PCT
    {
        Signed;
        Length = "7";
        Decimals = "4";
        SType = "Percent";
        Label = "Assumed Interest Rate";
    }

    INOUT MIR-AVG-ASSET-YLD-PCT
    {
        Signed;
        Length = "7";
        Decimals = "4";
        SType = "Percent";
        Label = "Average Asset Yield Rate";
    }

    IN MIR-DPOS-TRM-DY-DUR
    {
        Key;
        DisplayOnly;
        Length = "3";
        DefaultConstant = "000";
        SType = "Text";
        Label = "Deposit Term - Days";
    }

    IN MIR-DPOS-TRM-MO-DUR
    {
        Key;
        DisplayOnly;
        Length = "3";
        DefaultConstant = "000";
        SType = "Text";
        Label = "Deposit Term - Months";
    }

    IN MIR-INT-RT-EFF-DT
    {
        Key;
        DisplayOnly;
        Length = "10";
        DefaultSession = "LSIR-PRCES-DT";
        SType = "Date";
        Label = "Effective Date";
    }

    IN MIR-INT-RT-ID
    {
        Key;
        DisplayOnly;
        Length = "6";
        CodeSource = "EDIT";
        CodeType = "IRTS";
        SType = "Text";
        Label = "Plan";
    }

    IN MIR-INT-RT-MAX-AMT
    {
        Key;
        DisplayOnly;
        Length = "13";
        Decimals = "0";
        DefaultConstant = "9999999999999";
        SType = "Currency";
        Label = "Maximum Amount";
    }

}

