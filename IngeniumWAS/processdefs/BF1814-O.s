# Converted from PathFinder 2.2 to 3.0 Jun 18, 2004 3:12:51 PM EDT

#*******************************************************************************
#*  Component:   BF1814-O.s                                                    *
#*  Description:                                                               *
#*                                                                             *
#*******************************************************************************
#*  Chg#    Release  Description                                               *
#*                                                                             *
#*  014590  6.0      New for release 6.0                                       *
#*  017150  612J     Remove Currency Decimals = "2"                            *
#*                                                                             *
#*******************************************************************************

S-STEP BF1814-O
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

    INOUT MIR-PLAN-ID
    {
        Key;
        Length = "40";
        CodeSource = "EDIT";
        CodeType = "PLAN";
        SType = "Selection";
        Label = "Plan";
    }

    IN MIR-APP-FORM-TYP-ID-T[13]
    {
        DisplayOnly;
        Length = "40";
        FieldGroup = "Table13";
        CodeSource = "EDIT";
        CodeType = "AFTT";
        SType = "Text";
        Label = "Application Form Type";
        Index = "1";
    }

    IN MIR-LOC-GR-COLCT-ID-T[13]
    {
        DisplayOnly;
        Length = "6";
        FieldGroup = "Table13";
        CodeSource = "EDIT";
        CodeType = "LOCPT";
        SType = "Text";
        Label = "Group Location Pointer";
        Index = "1";
    }

    IN MIR-PLAN-EFF-DT-T[13]
    {
        DisplayOnly;
        Length = "10";
        FieldGroup = "Table13";
        SType = "Date";
        Label = "Plan Effective Date";
        Index = "1";
    }

    IN MIR-PLAN-ID-T[13]
    {
        DisplayOnly;
        Length = "40";
        FieldGroup = "Table13";
        CodeSource = "EDIT";
        CodeType = "PLAN";
        SType = "Text";
        Label = "Plan";
        Index = "1";
    }

    IN MIR-PLAN-INS-TYP-CD-T[13]
    {
        DisplayOnly;
        Length = "1";
        FieldGroup = "Table13";
        CodeSource = "DataModel";
        CodeType = "PLAN-INS-TYP-CD";
        SType = "Text";
        Label = "Type of Insurance";
        Index = "1";
    }

    IN MIR-PLAN-UWG-IND-T[13]
    {
        DisplayOnly;
        Length = "40";
        FieldGroup = "Table13";
        SType = "Indicator";
        Label = "Underwriting Required Indicator";
        Index = "1";
    }

    IN MIR-PLAN-XPRY-DT-T[13]
    {
        DisplayOnly;
        Length = "10";
        FieldGroup = "Table13";
        SType = "Date";
        Label = "Plan Expiry Date";
        Index = "1";
    }

}

