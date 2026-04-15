# Converted from PathFinder 2.2 to 3.0 Jun 18, 2004 3:12:18 PM EDT

#*******************************************************************************
#*  Component:   BF0253Trad-O.s                                                *
#*  Description:                                                               *
#*                                                                             *
#*******************************************************************************
#*  Chg#    Release  Description                                               *
#*                                                                             *
#*  014590  6.0      New for release 6.0                                       *
#*  017150  612J     Remove Currency Decimals = "2"                            *
#*                                                                             *
#*******************************************************************************

S-STEP BF0253Trad-O
{
    ATTRIBUTES
    {
        BusinessFunctionType = "Calculate";
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

    IN MIR-POL-INS-TYP-CD
    {
        DisplayOnly;
        Length = "1";
        CodeSource = "DataModel";
        CodeType = "PLAN-INS-TYP-CD";
        SType = "Hidden";
        Label = "Type of Insurance of the Base Coverage";
    }

    IN MIR-POL-ISS-EFF-DT
    {
        DisplayOnly;
        Length = "10";
        DefaultSession = "LSIR-PRCES-DT";
        SType = "Date";
        Label = "Policy Issue Date";
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

    IN MIR-DV-CLI-AGE-T[100]
    {
        DisplayOnly;
        Length = "3";
        FieldGroup = "Table100";
        SType = "Text";
        Label = "Age";
        Index = "1";
    }

    IN MIR-DV-POL-GUAR-DB-AMT-T[100]
    {
        DisplayOnly;
        Length = "13";
        FieldGroup = "Table100";
        SType = "Currency";
        Label = "Guaranteed Death Benefit";
        Index = "1";
    }

    IN MIR-DV-POL-TRADL-APREM-AMT-T[100]
    {
        DisplayOnly;
        Length = "13";
        FieldGroup = "Table100";
        SType = "Currency";
        Label = "Traditional Annual Premium";
        Index = "1";
    }

    IN MIR-DV-POL-TRADL-CV-AMT-T[100]
    {
        DisplayOnly;
        Length = "13";
        FieldGroup = "Table100";
        SType = "Currency";
        Label = "Traditional Cash Value";
        Index = "1";
    }

    IN MIR-DV-POL-YR-CTR-T[100]
    {
        DisplayOnly;
        Length = "3";
        FieldGroup = "Table100";
        SType = "Text";
        Label = "Policy Year Counter";
        Index = "1";
    }

}

