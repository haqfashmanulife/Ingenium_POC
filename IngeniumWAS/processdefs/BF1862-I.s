# Converted from PathFinder 2.2 to 3.0 Jun 18, 2004 3:12:52 PM EDT

#*******************************************************************************
#*  Component:   BF1862-I.s                                                    *
#*  Description:                                                               *
#*                                                                             *
#*******************************************************************************
#*  Chg#    Release  Description                                               *
#*                                                                             *
#*  014590  6.0      New for release 6.0                                       *
#*  017150  612J     Remove Currency Decimals = "2"                            *
#*                                                                             *
#*******************************************************************************

S-STEP BF1862-I
{
    ATTRIBUTES
    {
        Type = "Input";
        FocusField = "MIR-PLAN-ID";
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

    INOUT MIR-PLAN-ID
    {
        Mandatory;
        Length = "40";
        CodeSource = "EDIT";
        CodeType = "PLAN";
        SType = "Selection";
        Label = "Plan/Rate Scale";
    }

    INOUT MIR-VALN-LBL-ID
    {
        Length = "6";
        CodeSource = "EDIT";
        CodeType = "RLBL";
        SType = "Selection";
        Label = "Valuation Label";
    }

    INOUT MIR-VSELC-CVG-PAR-CD
    {
        Length = "1";
        CodeSource = "DataModel";
        CodeType = "VSELC-CVG-PAR-CD";
        SType = "Selection";
        Label = "Participation Code";
    }

    INOUT MIR-VSELC-HIGH-ISS-AGE
    {
        Length = "3";
        Decimals = "0";
        SType = "Number";
        Label = "High Issue Age";
    }

    INOUT MIR-VSELC-INS-TYP-CD
    {
        Length = "1";
        CodeSource = "DataModel";
        CodeType = "VSELC-INS-TYP-CD";
        SType = "Selection";
        Label = "Component Type";
    }

    INOUT MIR-VSELC-LOW-ISS-AGE
    {
        Length = "3";
        Decimals = "0";
        SType = "Number";
        Label = "Low Issue Age";
    }

    INOUT MIR-VSELC-POL-PAR-CD
    {
        Length = "1";
        CodeSource = "DataModel";
        CodeType = "VSELC-POL-PAR-CD";
        SType = "Selection";
        Label = "Policy Participation Digit";
    }

    INOUT MIR-VSELC-SEX-CD
    {
        Length = "1";
        CodeSource = "DataModel";
        CodeType = "VSELC-SEX-CD";
        SType = "Selection";
        Label = "Sex Code";
    }

    INOUT MIR-VSELC-SMKR-CD
    {
        Length = "1";
        CodeSource = "DataModel";
        CodeType = "VSELC-SMKR-CD";
        SType = "Selection";
        Label = "Smoker Code";
    }

    INOUT MIR-VSELC-STBL-1-CD
    {
        Length = "2";
        CodeSource = "EDIT";
        CodeType = "STB1";
        SType = "Selection";
        Label = "Sub-table 1  (STB1)";
    }

    INOUT MIR-VSELC-STBL-2-CD
    {
        Length = "3";
        CodeSource = "EDIT";
        CodeType = "STB2";
        SType = "Selection";
        Label = "Sub-table 2  (STB2)";
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

}

