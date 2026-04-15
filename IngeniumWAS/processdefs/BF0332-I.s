# Converted from PathFinder 2.2 to 3.0 Jun 18, 2004 3:12:21 PM EDT

#*******************************************************************************
#*  Component:   BF0332-I.s                                                    *
#*  Description:                                                               *
#*                                                                             *
#*******************************************************************************
#*  Chg#    Release  Description                                               *
#*                                                                             *
#*  014590  6.0      New for release 6.0                                       *
#*  017150  612J     Remove Currency Decimals = "2"                            *
#*                                                                             *
#*******************************************************************************

S-STEP BF0332-I
{
    ATTRIBUTES
    {
        Type = "Input";
        FocusField = "MIR-REQIR-1-ID-T[1]";
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

    INOUT MIR-REQIR-10-ID-T[12]
    {
        Length = "5";
        FieldGroup = "Table12";
        CodeSource = "EDIT";
        CodeType = "REQTC";
        SType = "Selection";
        Label = "Requirement 10";
        Index = "1";
    }

    INOUT MIR-REQIR-11-ID-T[12]
    {
        Length = "5";
        FieldGroup = "Table12";
        CodeSource = "EDIT";
        CodeType = "REQTC";
        SType = "Selection";
        Label = "Requirement 11";
        Index = "1";
    }

    INOUT MIR-REQIR-12-ID-T[12]
    {
        Length = "5";
        FieldGroup = "Table12";
        CodeSource = "EDIT";
        CodeType = "REQTC";
        SType = "Selection";
        Label = "Requirement 12";
        Index = "1";
    }

    INOUT MIR-REQIR-13-ID-T[12]
    {
        Length = "5";
        FieldGroup = "Table12";
        CodeSource = "EDIT";
        CodeType = "REQTC";
        SType = "Selection";
        Label = "Requirement 13";
        Index = "1";
    }

    INOUT MIR-REQIR-14-ID-T[12]
    {
        Length = "5";
        FieldGroup = "Table12";
        CodeSource = "EDIT";
        CodeType = "REQTC";
        SType = "Selection";
        Label = "Requirement 14";
        Index = "1";
    }

    INOUT MIR-REQIR-15-ID-T[12]
    {
        Length = "5";
        FieldGroup = "Table12";
        CodeSource = "EDIT";
        CodeType = "REQTC";
        SType = "Selection";
        Label = "Requirement 15";
        Index = "1";
    }

    INOUT MIR-REQIR-16-ID-T[12]
    {
        Length = "5";
        FieldGroup = "Table12";
        CodeSource = "EDIT";
        CodeType = "REQTC";
        SType = "Selection";
        Label = "Requirement 16";
        Index = "1";
    }

    INOUT MIR-REQIR-17-ID-T[12]
    {
        Length = "5";
        FieldGroup = "Table12";
        CodeSource = "EDIT";
        CodeType = "REQTC";
        SType = "Selection";
        Label = "Requirement 17";
        Index = "1";
    }

    INOUT MIR-REQIR-18-ID-T[12]
    {
        Length = "5";
        FieldGroup = "Table12";
        CodeSource = "EDIT";
        CodeType = "REQTC";
        SType = "Selection";
        Label = "Requirement 18";
        Index = "1";
    }

    INOUT MIR-REQIR-19-ID-T[12]
    {
        Length = "5";
        FieldGroup = "Table12";
        CodeSource = "EDIT";
        CodeType = "REQTC";
        SType = "Selection";
        Label = "Requirement 19";
        Index = "1";
    }

    INOUT MIR-REQIR-1-ID-T[12]
    {
        Length = "5";
        FieldGroup = "Table12";
        KeyColumn;
        CodeSource = "EDIT";
        CodeType = "REQTC";
        SType = "Selection";
        Label = "Requirement";
        Index = "1";
    }

    INOUT MIR-REQIR-20-ID-T[12]
    {
        Length = "5";
        FieldGroup = "Table12";
        CodeSource = "EDIT";
        CodeType = "REQTC";
        SType = "Selection";
        Label = "Requirement 20";
        Index = "1";
    }

    INOUT MIR-REQIR-21-ID-T[12]
    {
        Length = "5";
        FieldGroup = "Table12";
        CodeSource = "EDIT";
        CodeType = "REQTC";
        SType = "Selection";
        Label = "Requirement 21";
        Index = "1";
    }

    INOUT MIR-REQIR-22-ID-T[12]
    {
        Length = "5";
        FieldGroup = "Table12";
        CodeSource = "EDIT";
        CodeType = "REQTC";
        SType = "Selection";
        Label = "Requirement 22";
        Index = "1";
    }

    INOUT MIR-REQIR-2-ID-T[12]
    {
        Length = "5";
        FieldGroup = "Table12";
        CodeSource = "EDIT";
        CodeType = "REQTC";
        SType = "Selection";
        Label = "Requirement 2";
        Index = "1";
    }

    INOUT MIR-REQIR-3-ID-T[12]
    {
        Length = "5";
        FieldGroup = "Table12";
        CodeSource = "EDIT";
        CodeType = "REQTC";
        SType = "Selection";
        Label = "Requirement 3";
        Index = "1";
    }

    INOUT MIR-REQIR-4-ID-T[12]
    {
        Length = "5";
        FieldGroup = "Table12";
        CodeSource = "EDIT";
        CodeType = "REQTC";
        SType = "Selection";
        Label = "Requirement 4";
        Index = "1";
    }

    INOUT MIR-REQIR-5-ID-T[12]
    {
        Length = "5";
        FieldGroup = "Table12";
        CodeSource = "EDIT";
        CodeType = "REQTC";
        SType = "Selection";
        Label = "Requirement 5";
        Index = "1";
    }

    INOUT MIR-REQIR-6-ID-T[12]
    {
        Length = "5";
        FieldGroup = "Table12";
        CodeSource = "EDIT";
        CodeType = "REQTC";
        SType = "Selection";
        Label = "Requirement 6";
        Index = "1";
    }

    INOUT MIR-REQIR-7-ID-T[12]
    {
        Length = "5";
        FieldGroup = "Table12";
        CodeSource = "EDIT";
        CodeType = "REQTC";
        SType = "Selection";
        Label = "Requirement 7";
        Index = "1";
    }

    INOUT MIR-REQIR-8-ID-T[12]
    {
        Length = "5";
        FieldGroup = "Table12";
        CodeSource = "EDIT";
        CodeType = "REQTC";
        SType = "Selection";
        Label = "Requirement 8";
        Index = "1";
    }

    INOUT MIR-REQIR-9-ID-T[12]
    {
        Length = "5";
        FieldGroup = "Table12";
        CodeSource = "EDIT";
        CodeType = "REQTC";
        SType = "Selection";
        Label = "Requirement 9";
        Index = "1";
    }

    IN MIR-DFLT-REQIR-AGE
    {
        Key;
        DisplayOnly;
        Length = "3";
        Decimals = "0";
        SType = "Number";
        Label = "Maximum Age";
    }

    IN MIR-DFLT-REQIR-ID
    {
        Key;
        DisplayOnly;
        Length = "6";
        CodeSource = "EDIT";
        CodeType = "AATBL";
        SType = "Text";
        Label = "Table Name";
    }

    IN MIR-DFLT-REQIR-TCR-AMT
    {
        Key;
        DisplayOnly;
        Length = "15";
        Decimals = "0";
        SType = "Currency";
        Label = "Maximum Coverage Amount";
    }

    IN MIR-LOC-GR-ID
    {
        Key;
        DisplayOnly;
        Length = "3";
        CodeSource = "EDIT";
        CodeType = "LOCGP";
        SType = "Text";
        Label = "Location Group";
    }

    IN MIR-OCCP-CLAS-CD
    {
        Key;
        DisplayOnly;
        Length = "2";
        CodeSource = "EDIT";
        CodeType = "OCCCL";
        SType = "Text";
        Label = "Occupation Class";
    }

}

