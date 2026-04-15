# Converted from PathFinder 2.2 to 3.0 Jun 18, 2004 3:12:18 PM EDT

#*******************************************************************************
#*  Component:   BF0274-O.s                                                    *
#*  Description:                                                               *
#*                                                                             *
#*******************************************************************************
#*  Chg#    Release  Description                                               *
#*                                                                             *
#*  014590  6.0      New for release 6.0                                       *
#*  017150  612J     Remove Currency Decimals = "2"                            *
#*                                                                             *
#*******************************************************************************

S-STEP BF0274-O
{
    ATTRIBUTES
    {
        BusinessFunctionType = "List";
        Type = "Output";
        DelEmptyRows;
        FocusField = "MIR-CASM-ID";
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

    INOUT MIR-CASM-EFF-IDT-NUM
    {
        Key;
        Length = "10";
        SType = "Date";
        Label = "Effective Date";
    }

    INOUT MIR-CASM-ID
    {
        Key;
        Length = "6";
        CodeSource = "EDIT";
        CodeType = "ASMBP";
        SType = "Selection";
        Label = "Assembly Pointer";
    }

    INOUT MIR-CASM-REC-NUM
    {
        Key;
        Length = "2";
        SType = "Text";
        Label = "Record Number";
    }

    INOUT MIR-CASM-REC-TYP-CD
    {
        Key;
        Length = "2";
        CodeSource = "DataModel";
        CodeType = "CASM-REC-TYP-CD";
        SType = "Selection";
        Label = "Record Type";
    }

    INOUT MIR-CASM-SEQ-NUM
    {
        Key;
        Length = "3";
        SType = "Text";
        Label = "Sequence Number";
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

    INOUT MIR-SBSDRY-CO-ID
    {
        Key;
        Length = "40";
        CodeSource = "EDIT";
        CodeType = "SUBCO";
        SType = "Selection";
        Label = "Sub Company";
    }

    IN MIR-CASM-EFF-IDT-NUM-T[10]
    {
        DisplayOnly;
        Length = "10";
        FieldGroup = "Table10";
        SType = "Date";
        Label = "Effective Date";
        Index = "1";
    }

    IN MIR-CASM-ID-T[10]
    {
        DisplayOnly;
        Length = "6";
        FieldGroup = "Table10";
        CodeSource = "EDIT";
        CodeType = "ASMBP";
        SType = "Text";
        Label = "Assembly Pointer";
        Index = "1";
    }

    IN MIR-CASM-REC-NUM-T[10]
    {
        DisplayOnly;
        Length = "2";
        FieldGroup = "Table10";
        SType = "Text";
        Label = "Record Number";
        Index = "1";
    }

    IN MIR-CASM-REC-TYP-CD-T[10]
    {
        DisplayOnly;
        Length = "2";
        FieldGroup = "Table10";
        KeyColumn;
        CodeSource = "DataModel";
        CodeType = "CASM-REC-TYP-CD";
        Link;
        SType = "Text";
        Label = "Record Type";
        Action = "SelectItem";
        Index = "1";
    }

    IN MIR-CASM-SEQ-NUM-T[10]
    {
        DisplayOnly;
        Length = "3";
        FieldGroup = "Table10";
        SType = "Text";
        Label = "Sequence Number";
        Index = "1";
    }

    IN MIR-DOC-ID-T[10]
    {
        DisplayOnly;
        Length = "40";
        FieldGroup = "Table10";
        CodeSource = "EDIT";
        CodeType = "DOCM";
        SType = "Text";
        Label = "Document Name";
        Index = "1";
    }

    IN MIR-LOC-GR-ID-T[10]
    {
        DisplayOnly;
        Length = "3";
        FieldGroup = "Table10";
        CodeSource = "EDIT";
        CodeType = "LOCGP";
        SType = "Text";
        Label = "Location Group";
        Index = "1";
    }

    IN MIR-SBSDRY-CO-ID-T[10]
    {
        DisplayOnly;
        Length = "40";
        FieldGroup = "Table10";
        CodeSource = "EDIT";
        CodeType = "SUBCO";
        SType = "Text";
        Label = "Sub Company";
        Index = "1";
    }

}

