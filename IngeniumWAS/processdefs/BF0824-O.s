# Converted from PathFinder 2.2 to 3.0 Jun 18, 2004 3:12:30 PM EDT

#*******************************************************************************
#*  Component:   BF0824-O.s                                                    *
#*  Description:                                                               *
#*                                                                             *
#*******************************************************************************
#*  Chg#    Release  Description                                               *
#*                                                                             *
#*  014590  6.0      New for release 6.0                                       *
#*  017150  612J     Remove Currency Decimals = "2"                            *
#*                                                                             *
#*******************************************************************************

S-STEP BF0824-O
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

    INOUT MIR-PLAN-NFO-CD
    {
        Key;
        Length = "1";
        CodeSource = "DataModel";
        CodeType = "PLAN-NFO-CD";
        SType = "Selection";
        Label = "Non-Forfeiture Option";
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

    IN MIR-PLAN-NFO-CD-T[12]
    {
        DisplayOnly;
        Length = "40";
        FieldGroup = "Table12";
        CodeSource = "DataModel";
        CodeType = "PLAN-NFO-CD";
        SType = "Text";
        Label = "Non-Forfeiture Option";
        Index = "1";
    }

    IN MIR-PLAN-NFO-DFLT-IND-T[12]
    {
        DisplayOnly;
        Length = "1";
        FieldGroup = "Table12";
        SType = "Indicator";
        Label = "Non-Forfeiture Default Indicator";
        Index = "1";
    }

}

