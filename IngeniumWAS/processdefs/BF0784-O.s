# Converted from PathFinder 2.2 to 3.0 Jun 18, 2004 3:12:29 PM EDT

#*******************************************************************************
#*  Component:   BF0784-O.s                                                    *
#*  Description:                                                               *
#*                                                                             *
#*******************************************************************************
#*  Chg#    Release  Description                                               *
#*                                                                             *
#*  014590  6.0      New for release 6.0                                       *
#*  017150  612J     Remove Currency Decimals = "2"                            *
#*                                                                             *
#*******************************************************************************

S-STEP BF0784-O
{
    ATTRIBUTES
    {
        BusinessFunctionType = "List";
        Type = "Output";
        DelEmptyRows;
        FocusField = "MIR-LOC-GR-COLCT-ID";
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

    INOUT MIR-LOC-GR-COLCT-ID
    {
        Key;
        Mandatory;
        Length = "6";
        CodeSource = "EDIT";
        CodeType = "LOCPT";
        SType = "Selection";
        Label = "Group Location Pointer";
    }

    INOUT MIR-LOC-GR-EFF-IDT-NUM
    {
        Key;
        Length = "10";
        SType = "Date";
        Label = "Effective Date";
    }

    INOUT MIR-LOC-GR-LOC-CD
    {
        Key;
        Length = "2";
        CodeSource = "EDIT";
        CodeType = "LOCAT";
        SType = "Selection";
        Label = "Location";
    }

    INOUT MIR-LOC-GR-TYP-CD
    {
        Key;
        Length = "5";
        CodeSource = "DataModel";
        CodeType = "LOC-GR-TYP-CD";
        SType = "Selection";
        Label = "Type";
    }

    IN MIR-LOC-GR-EFF-IDT-NUM-T[12]
    {
        DisplayOnly;
        Length = "10";
        FieldGroup = "Table12";
        SType = "Date";
        Label = "Effective Date";
        Index = "1";
    }

    IN MIR-LOC-GR-ID-T[12]
    {
        DisplayOnly;
        Length = "3";
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

    IN MIR-LOC-GR-LOC-CD-T[12]
    {
        DisplayOnly;
        Length = "2";
        FieldGroup = "Table12";
        CodeSource = "EDIT";
        CodeType = "LOCAT";
        SType = "Text";
        Label = "Location";
        Index = "1";
    }

    IN MIR-LOC-GR-TYP-CD-T[12]
    {
        DisplayOnly;
        Length = "5";
        FieldGroup = "Table12";
        CodeSource = "DataModel";
        CodeType = "LOC-GR-TYP-CD";
        SType = "Text";
        Label = "Type";
        Index = "1";
    }

}

