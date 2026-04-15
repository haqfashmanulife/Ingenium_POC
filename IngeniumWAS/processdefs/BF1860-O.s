# Converted from PathFinder 2.2 to 3.0 Jun 18, 2004 3:12:52 PM EDT

#*******************************************************************************
#*  Component:   BF1860-O.s                                                    *
#*  Description:                                                               *
#*                                                                             *
#*******************************************************************************
#*  Chg#    Release  Description                                               *
#*                                                                             *
#*  014590  6.0      New for release 6.0                                       *
#*  017150  612J     Remove Currency Decimals = "2"                            *
#*                                                                             *
#*******************************************************************************

S-STEP BF1860-O
{
    ATTRIBUTES
    {
        BusinessFunctionType = "Retrieve";
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

    IN MIR-VSELC-ID
    {
        Key;
        DisplayOnly;
        Length = "6";
        CodeSource = "EDIT";
        CodeType = "VSBK";
        SType = "Text";
        Label = "Selection Pointer";
    }

    IN MIR-PLAN-ID
    {
        DisplayOnly;
        Length = "40";
        CodeSource = "EDIT";
        CodeType = "PLAN";
        SType = "Text";
        Label = "Plan Id";
    }

    IN MIR-VALN-LBL-ID
    {
        DisplayOnly;
        Length = "6";
        SType = "Text";
        Label = "Valuation Label";
    }

    IN MIR-VSELC-CVG-PAR-CD
    {
        DisplayOnly;
        Length = "1";
        CodeSource = "DataModel";
        CodeType = "VSELC-CVG-PAR-CD";
        SType = "Text";
        Label = "Participation Code";
    }

    IN MIR-VSELC-HIGH-ISS-AGE
    {
        DisplayOnly;
        Length = "3";
        Decimals = "0";
        SType = "Number";
        Label = "High Issue Age";
    }

    IN MIR-VSELC-INS-TYP-CD
    {
        DisplayOnly;
        Length = "1";
        CodeSource = "DataModel";
        CodeType = "VSELC-INS-TYP-CD";
        SType = "Text";
        Label = "Component Type";
    }

    IN MIR-VSELC-LOW-ISS-AGE
    {
        DisplayOnly;
        Length = "3";
        Decimals = "0";
        SType = "Number";
        Label = "Low Issue Age";
    }

    IN MIR-VSELC-POL-PAR-CD
    {
        DisplayOnly;
        Length = "1";
        CodeSource = "DataModel";
        CodeType = "VSELC-POL-PAR-CD";
        SType = "Text";
        Label = "Policy Participation Digit";
    }

    IN MIR-VSELC-SEX-CD
    {
        DisplayOnly;
        Length = "1";
        CodeSource = "DataModel";
        CodeType = "VSELC-SEX-CD";
        SType = "Text";
        Label = "Sex Code";
    }

    IN MIR-VSELC-SMKR-CD
    {
        DisplayOnly;
        Length = "1";
        CodeSource = "DataModel";
        CodeType = "VSELC-SMKR-CD";
        SType = "Text";
        Label = "Smoker Code";
    }

    IN MIR-VSELC-STBL-1-CD
    {
        DisplayOnly;
        Length = "2";
        CodeSource = "EDIT";
        CodeType = "STB1";
        SType = "Text";
        Label = "Sub-table 1  (STB1)";
    }

    IN MIR-VSELC-STBL-2-CD
    {
        DisplayOnly;
        Length = "3";
        CodeSource = "EDIT";
        CodeType = "STB2";
        SType = "Text";
        Label = "Sub-table 2  (STB2)";
    }

}

