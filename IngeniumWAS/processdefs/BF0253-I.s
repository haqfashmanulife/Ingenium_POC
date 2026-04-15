# Converted from PathFinder 2.2 to 3.0 Jun 18, 2004 3:12:18 PM EDT

#*******************************************************************************
#*  Component:   BF0253-I.s                                                    *
#*  Description:                                                               *
#*                                                                             *
#*******************************************************************************
#*  Chg#    Release  Description                                               *
#*                                                                             *
#*  014590  6.0      New for release 6.0                                       *
#*  017150  612J     Remove Currency Decimals = "2"                            *
#*                                                                             *
#*******************************************************************************

S-STEP BF0253-I
{
    ATTRIBUTES
    {
        BusinessFunctionType = "Calculate";
        Type = "Input";
        FocusField = "MIR-CVG-GUAR-INT-PCT";
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

    INOUT MIR-CVG-GUAR-INT-PCT
    {
        Signed;
        Length = "9";
        Decimals = "6";
        SType = "Percent";
        Label = "Interest Guaranteed Period - Interest Rate";
    }

    INOUT MIR-DV-LMPSM-AMT
    {
        Length = "13";
        SType = "Currency";
        Label = "Lump Sum Amount Added";
    }

    INOUT MIR-INIT-DPOS-INT-PCT
    {
        Length = "7";
        Decimals = "4";
        SType = "Percent";
        Label = "Interest Rate for Initial Deposit";
    }

    INOUT MIR-PLAN-PERI-PREM-AMT
    {
        Length = "13";
        SType = "Currency";
        Label = "Planned Premium";
    }

    INOUT MIR-POL-BILL-MODE-CD
    {
        Length = "40";
        CodeSource = "DataModel";
        CodeType = "POL-BILL-MODE-CD";
        DefaultConstant = "01";
        SType = "Text";
        Label = "Premium Mode";
    }

    INOUT MIR-POL-DB-OPT-CD
    {
        Length = "1";
        CodeSource = "DataModel";
        CodeType = "POL-DB-OPT-CD";
        SType = "Text";
        Label = "Death Benefit Option";
    }

    INOUT MIR-POL-INS-TYP-CD
    {
        Length = "1";
        CodeSource = "DataModel";
        CodeType = "PLAN-INS-TYP-CD";
        SType = "Hidden";
        Label = "Type of Insurance of the Base Coverage";
    }

    INOUT MIR-POL-ISS-EFF-DT
    {
        Length = "10";
        DefaultSession = "LSIR-PRCES-DT";
        SType = "Date";
        Label = "Policy Issue Date";
    }

    INOUT MIR-UL-INIT-PREM-AMT
    {
        Length = "13";
        SType = "Currency";
        Label = "Intended Initial Premium";
    }

    INOUT MIR-POL-ID-BASE
    {
        Key;
        Mandatory;
        Length = "9";
        DefaultSession = "MIR-POL-ID-BASE";
        SType = "Text";
        Label = "Policy Id";
    }

    INOUT MIR-POL-ID-SFX
    {
        Key;
        Length = "1";
        DefaultSession = "MIR-POL-ID-SFX";
        SType = "Text";
        Label = "Suffix";
    }

}

