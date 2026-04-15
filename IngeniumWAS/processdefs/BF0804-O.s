# Converted from PathFinder 2.2 to 3.0 Jun 18, 2004 3:12:29 PM EDT

#*******************************************************************************
#*  Component:   BF0804-O.s                                                    *
#*  Description:                                                               *
#*                                                                             *
#*******************************************************************************
#*  Chg#    Release  Description                                               *
#*                                                                             *
#*  014590  6.0      New for release 6.0                                       *
#*  017150  612J     Remove Currency Decimals = "2"                            *
#*                                                                             *
#*******************************************************************************

S-STEP BF0804-O
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

    INOUT MIR-LOC-GR-ID
    {
        Key;
        Length = "3";
        CodeSource = "EDIT";
        CodeType = "LOCGP";
        SType = "Selection";
        Label = "Location Group";
    }

    INOUT MIR-PLAN-BILL-MODE-CD
    {
        Key;
        Length = "2";
        CodeSource = "DataModel";
        CodeType = "PLAN-BILL-MODE-CD";
        SType = "Selection";
        Label = "Billing Mode";
    }

    INOUT MIR-PLAN-BILL-TYP-CD
    {
        Key;
        Length = "1";
        CodeSource = "DataModel";
        CodeType = "PLAN-BILL-TYP-CD";
        SType = "Selection";
        Label = "Billing Type";
    }

    INOUT MIR-PLAN-ID
    {
        Key;
        Mandatory;
        Length = "40";
        CodeSource = "EDIT";
        CodeType = "PLAN";
        SType = "Selection";
        Label = "Plan";
    }

    IN MIR-LOC-GR-ID-T[12]
    {
        DisplayOnly;
        Length = "40";
        FieldGroup = "Table12";
        KeyColumn;
        CodeSource = "EDIT";
        CodeType = "LOCGP";
        Link;
        SType = "Text";
        Label = "Location Group";
        Action = "SelectItem";
        Index = "1";
    }

    IN MIR-PLAN-BILL-DFLT-IND-T[12]
    {
        DisplayOnly;
        Length = "1";
        FieldGroup = "Table12";
        SType = "Indicator";
        Label = "Default";
        Index = "1";
    }

    IN MIR-PLAN-BILL-MODE-CD-T[12]
    {
        DisplayOnly;
        Length = "40";
        FieldGroup = "Table12";
        CodeSource = "DataModel";
        CodeType = "PLAN-BILL-MODE-CD";
        SType = "Text";
        Label = "Billing Mode";
        Index = "1";
    }

    IN MIR-PLAN-BILL-TYP-CD-T[12]
    {
        DisplayOnly;
        Length = "40";
        FieldGroup = "Table12";
        CodeSource = "DataModel";
        CodeType = "PLAN-BILL-TYP-CD";
        SType = "Text";
        Label = "Billing Type";
        Index = "1";
    }

}

