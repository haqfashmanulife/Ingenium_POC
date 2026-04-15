# Converted from PathFinder 2.2 to 3.0 Jun 18, 2004 3:12:20 PM EDT

#*******************************************************************************
#*  Component:   BF0294-O.s                                                    *
#*  Description:                                                               *
#*                                                                             *
#*******************************************************************************
#*  Chg#    Release  Description                                               *
#*                                                                             *
#*  014590  6.0      New for release 6.0                                       *
#*  017150  612J     Remove Currency Decimals = "2"                            *
#*                                                                             *
#*******************************************************************************

S-STEP BF0294-O
{
    ATTRIBUTES
    {
        BusinessFunctionType = "List";
        Type = "Output";
        DelEmptyRows;
        FocusField = "MIR-ETBL-TYP-ID";
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

    INOUT MIR-ETBL-TYP-ID
    {
        Key;
        Mandatory;
        Length = "5";
        SType = "Text";
        Label = "Value Type";
    }

    INOUT MIR-ETBL-VALU-ID
    {
        Key;
        Length = "15";
        SType = "Text";
        Label = "Value";
    }

    INOUT MIR-TTAB-ADMIN-APPL-ID
    {
        Key;
        Length = "2";
        CodeSource = "EDIT";
        CodeType = "ADMIN";
        SType = "Selection";
        Label = "Administration System";
    }

    IN MIR-ETBL-DESC-TXT-T[12]
    {
        DisplayOnly;
        Length = "40";
        FieldGroup = "Table12";
        SType = "Text";
        Label = "Description";
        Index = "1";
    }

    IN MIR-ETBL-TYP-ID-T[12]
    {
        DisplayOnly;
        Length = "5";
        FieldGroup = "Table12";
        KeyColumn;
        Link;
        SType = "Text";
        Label = "Value Type";
        Action = "SelectItem";
        Index = "1";
    }

    IN MIR-ETBL-VALU-ID-T[12]
    {
        DisplayOnly;
        Length = "15";
        FieldGroup = "Table12";
        SType = "Text";
        Label = "Value";
        Index = "1";
    }

    IN MIR-TTAB-ADMIN-APPL-ID-T[12]
    {
        DisplayOnly;
        Length = "2";
        FieldGroup = "Table12";
        CodeSource = "EDIT";
        CodeType = "ADMIN";
        SType = "Text";
        Label = "Administration System";
        Index = "1";
    }

    IN MIR-TTBL-VALU-TXT-T[12]
    {
        DisplayOnly;
        Length = "15";
        FieldGroup = "Table12";
        SType = "Text";
        Label = "Translate Value";
        Index = "1";
    }

}

