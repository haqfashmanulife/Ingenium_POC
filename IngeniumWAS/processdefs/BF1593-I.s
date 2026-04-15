# Converted from PathFinder 2.2 to 3.0 Jun 18, 2004 3:12:46 PM EDT

#*******************************************************************************
#*  Component:   BF1593-I.s                                                    *
#*  Description:                                                               *
#*                                                                             *
#*******************************************************************************
#*  Chg#    Release  Description                                               *
#*                                                                             *
#*  014590  6.0      New for release 6.0                                       *
#*  017150  612J     Remove Currency Decimals = "2"                            *
#*                                                                             *
#*******************************************************************************

S-STEP BF1593-I
{
    ATTRIBUTES
    {
        Type = "Input";
        FocusField = "MIR-DPOS-TRM-DY-DUR";
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

}

