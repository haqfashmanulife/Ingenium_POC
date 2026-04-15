# Converted from PathFinder 2.2 to 3.0 Jun 18, 2004 3:12:21 PM EDT

#*******************************************************************************
#*  Component:   BF0334-O.s                                                    *
#*  Description:                                                               *
#*                                                                             *
#*******************************************************************************
#*  Chg#    Release  Description                                               *
#*                                                                             *
#*  014590  6.0      New for release 6.0                                       *
#*  017150  612J     Remove Currency Decimals = "2"                            *
#*                                                                             *
#*******************************************************************************

S-STEP BF0334-O
{
    ATTRIBUTES
    {
        BusinessFunctionType = "List";
        Type = "Output";
        DelEmptyRows;
        FocusField = "MIR-DFLT-REQIR-ID";
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

    INOUT MIR-DFLT-REQIR-AGE
    {
        Key;
        Length = "3";
        Decimals = "0";
        SType = "Number";
        Label = "Maximum Age";
    }

    INOUT MIR-DFLT-REQIR-ID
    {
        Key;
        Length = "6";
        CodeSource = "EDIT";
        CodeType = "AATBL";
        SType = "Selection";
        Label = "Table Name";
    }

    INOUT MIR-DFLT-REQIR-TCR-AMT
    {
        Key;
        Length = "15";
        Decimals = "0";
        SType = "Currency";
        Label = "Maximum Coverage Amount";
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

    INOUT MIR-OCCP-CLAS-CD
    {
        Key;
        Length = "2";
        CodeSource = "EDIT";
        CodeType = "OCCCL";
        SType = "Selection";
        Label = "Occupation Class";
    }

    IN MIR-DFLT-REQIR-TCR-AMT-T[12]
    {
        DisplayOnly;
        Length = "15";
        Decimals = "0";
        FieldGroup = "Table12";
        KeyColumn;
        Link;
        SType = "Text";
        Label = "Maximum Coverage Amount";
        Action = "SelectItem";
        Index = "1";
    }

    IN MIR-REQIR-10-ID-T[12]
    {
        DisplayOnly;
        Length = "5";
        FieldGroup = "Table12";
        CodeSource = "EDIT";
        CodeType = "REQTC";
        SType = "Text";
        Label = "Requirement 10";
        Index = "1";
    }

    IN MIR-REQIR-11-ID-T[12]
    {
        DisplayOnly;
        Length = "5";
        FieldGroup = "Table12";
        CodeSource = "EDIT";
        CodeType = "REQTC";
        SType = "Text";
        Label = "Requirement 11";
        Index = "1";
    }

    IN MIR-REQIR-12-ID-T[12]
    {
        DisplayOnly;
        Length = "5";
        FieldGroup = "Table12";
        CodeSource = "EDIT";
        CodeType = "REQTC";
        SType = "Text";
        Label = "Requirement 12";
        Index = "1";
    }

    IN MIR-REQIR-13-ID-T[12]
    {
        DisplayOnly;
        Length = "5";
        FieldGroup = "Table12";
        CodeSource = "EDIT";
        CodeType = "REQTC";
        SType = "Text";
        Label = "Requirement 13";
        Index = "1";
    }

    IN MIR-REQIR-14-ID-T[12]
    {
        DisplayOnly;
        Length = "5";
        FieldGroup = "Table12";
        CodeSource = "EDIT";
        CodeType = "REQTC";
        SType = "Text";
        Label = "Requirement 14";
        Index = "1";
    }

    IN MIR-REQIR-15-ID-T[12]
    {
        DisplayOnly;
        Length = "5";
        FieldGroup = "Table12";
        CodeSource = "EDIT";
        CodeType = "REQTC";
        SType = "Text";
        Label = "Requirement 15";
        Index = "1";
    }

    IN MIR-REQIR-16-ID-T[12]
    {
        DisplayOnly;
        Length = "5";
        FieldGroup = "Table12";
        CodeSource = "EDIT";
        CodeType = "REQTC";
        SType = "Text";
        Label = "Requirement 16";
        Index = "1";
    }

    IN MIR-REQIR-17-ID-T[12]
    {
        DisplayOnly;
        Length = "5";
        FieldGroup = "Table12";
        CodeSource = "EDIT";
        CodeType = "REQTC";
        SType = "Text";
        Label = "Requirement 17";
        Index = "1";
    }

    IN MIR-REQIR-18-ID-T[12]
    {
        DisplayOnly;
        Length = "5";
        FieldGroup = "Table12";
        CodeSource = "EDIT";
        CodeType = "REQTC";
        SType = "Text";
        Label = "Requirement 18";
        Index = "1";
    }

    IN MIR-REQIR-19-ID-T[12]
    {
        DisplayOnly;
        Length = "5";
        FieldGroup = "Table12";
        CodeSource = "EDIT";
        CodeType = "REQTC";
        SType = "Text";
        Label = "Requirement 19";
        Index = "1";
    }

    IN MIR-REQIR-1-ID-T[12]
    {
        DisplayOnly;
        Length = "5";
        FieldGroup = "Table12";
        CodeSource = "EDIT";
        CodeType = "REQTC";
        SType = "Text";
        Label = "Requirement 1";
        Index = "1";
    }

    IN MIR-REQIR-20-ID-T[12]
    {
        DisplayOnly;
        Length = "5";
        FieldGroup = "Table12";
        CodeSource = "EDIT";
        CodeType = "REQTC";
        SType = "Text";
        Label = "Requirement 20";
        Index = "1";
    }

    IN MIR-REQIR-21-ID-T[12]
    {
        DisplayOnly;
        Length = "5";
        FieldGroup = "Table12";
        CodeSource = "EDIT";
        CodeType = "REQTC";
        SType = "Text";
        Label = "Requirement 21";
        Index = "1";
    }

    IN MIR-REQIR-22-ID-T[12]
    {
        DisplayOnly;
        Length = "5";
        FieldGroup = "Table12";
        CodeSource = "EDIT";
        CodeType = "REQTC";
        SType = "Text";
        Label = "Requirement 22";
        Index = "1";
    }

    IN MIR-REQIR-2-ID-T[12]
    {
        DisplayOnly;
        Length = "5";
        FieldGroup = "Table12";
        CodeSource = "EDIT";
        CodeType = "REQTC";
        SType = "Text";
        Label = "Requirement 2";
        Index = "1";
    }

    IN MIR-REQIR-3-ID-T[12]
    {
        DisplayOnly;
        Length = "5";
        FieldGroup = "Table12";
        CodeSource = "EDIT";
        CodeType = "REQTC";
        SType = "Text";
        Label = "Requirement 3";
        Index = "1";
    }

    IN MIR-REQIR-4-ID-T[12]
    {
        DisplayOnly;
        Length = "5";
        FieldGroup = "Table12";
        CodeSource = "EDIT";
        CodeType = "REQTC";
        SType = "Text";
        Label = "Requirement 4";
        Index = "1";
    }

    IN MIR-REQIR-5-ID-T[12]
    {
        DisplayOnly;
        Length = "5";
        FieldGroup = "Table12";
        CodeSource = "EDIT";
        CodeType = "REQTC";
        SType = "Text";
        Label = "Requirement 5";
        Index = "1";
    }

    IN MIR-REQIR-6-ID-T[12]
    {
        DisplayOnly;
        Length = "5";
        FieldGroup = "Table12";
        CodeSource = "EDIT";
        CodeType = "REQTC";
        SType = "Text";
        Label = "Requirement 6";
        Index = "1";
    }

    IN MIR-REQIR-7-ID-T[12]
    {
        DisplayOnly;
        Length = "5";
        FieldGroup = "Table12";
        CodeSource = "EDIT";
        CodeType = "REQTC";
        SType = "Text";
        Label = "Requirement 7";
        Index = "1";
    }

    IN MIR-REQIR-8-ID-T[12]
    {
        DisplayOnly;
        Length = "5";
        FieldGroup = "Table12";
        CodeSource = "EDIT";
        CodeType = "REQTC";
        SType = "Text";
        Label = "Requirement 8";
        Index = "1";
    }

    IN MIR-REQIR-9-ID-T[12]
    {
        DisplayOnly;
        Length = "5";
        FieldGroup = "Table12";
        CodeSource = "EDIT";
        CodeType = "REQTC";
        SType = "Text";
        Label = "Requirement 9";
        Index = "1";
    }

}

