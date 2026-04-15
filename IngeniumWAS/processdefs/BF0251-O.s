# Converted from PathFinder 2.2 to 3.0 Jun 18, 2004 3:12:18 PM EDT

#*******************************************************************************
#*  Component:   BF0251-O.s                                                    *
#*  Description:                                                               *
#*                                                                             *
#*******************************************************************************
#*  Chg#    Release  Description                                               *
#*                                                                             *
#*  014590  6.0      New for release 6.0                                       *
#*  017150  612J     Remove Currency Decimals = "2"                            *
#*                                                                             *
#*******************************************************************************

S-STEP BF0251-O
{
    ATTRIBUTES
    {
        BusinessFunctionType = "Refresh";
        Type = "Output";
        DelEmptyRows;
        FocusField = "calculateButton";
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

    IN MIR-POL-ID-BASE
    {
        Key;
        DisplayOnly;
        Length = "9";
        DefaultSession = "MIR-POL-ID-BASE";
        SType = "Text";
        Label = "Policy Id";
    }

    IN MIR-POL-ID-SFX
    {
        Key;
        DisplayOnly;
        Length = "1";
        DefaultSession = "MIR-POL-ID-SFX";
        SType = "Text";
        Label = "Suffix";
    }

    IN MIR-CVG-GUAR-INT-PCT
    {
        DisplayOnly;
        Signed;
        Length = "7";
        Decimals = "4";
        SType = "Percent";
        Label = "Interest Guaranteed Period - Interest Rate";
    }

    IN MIR-DV-LMPSM-AMT
    {
        DisplayOnly;
        Length = "13";
        SType = "Currency";
        Label = "Lump Sum Amount Added";
    }

    IN MIR-INIT-DPOS-INT-PCT
    {
        DisplayOnly;
        Length = "7";
        Decimals = "4";
        SType = "Percent";
        Label = "Interest Rate for Initial Deposit";
    }

    IN MIR-PLAN-PERI-PREM-AMT
    {
        DisplayOnly;
        Length = "13";
        SType = "Currency";
        Label = "Planned Premium";
    }

    IN MIR-POL-BILL-MODE-CD
    {
        DisplayOnly;
        Length = "40";
        CodeSource = "DataModel";
        CodeType = "POL-BILL-MODE-CD";
        DefaultConstant = "01";
        SType = "Text";
        Label = "Premium Mode";
    }

    IN MIR-POL-DB-OPT-CD
    {
        DisplayOnly;
        Length = "1";
        CodeSource = "DataModel";
        CodeType = "POL-DB-OPT-CD";
        SType = "Text";
        Label = "Death Benefit Option";
    }

    IN MIR-POL-ISS-EFF-DT
    {
        DisplayOnly;
        Length = "10";
        DefaultSession = "LSIR-PRCES-DT";
        SType = "Date";
        Label = "Policy Issue Date";
    }

    IN MIR-UL-INIT-PREM-AMT
    {
        DisplayOnly;
        Length = "13";
        SType = "Currency";
        Label = "Intended Initial Premium";
    }

}

