# Converted from PathFinder 2.2 to 3.0 Jun 18, 2004 3:12:27 PM EDT

#*******************************************************************************
#*  Component:   BF0684-O.s                                                    *
#*  Description:                                                               *
#*                                                                             *
#*******************************************************************************
#*  Chg#    Release  Description                                               *
#*                                                                             *
#*  014590  6.0      New for release 6.0                                       *
#*  017150  612J     Remove Currency Decimals = "2"                            *
#*                                                                             *
#*******************************************************************************

S-STEP BF0684-O
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

    INOUT MIR-ETBL-LANG-CD
    {
        Key;
        Length = "40";
        CodeSource = "EDIT";
        CodeType = "LANG";
        SType = "Selection";
        Label = "Language";
    }

    INOUT MIR-ETBL-TYP-ID
    {
        Key;
        Mandatory;
        Length = "5";
        SType = "Text";
        Label = "Table Name";
    }

    INOUT MIR-ETBL-DESC-TXT
    {
        Key;
        Length = "40";
        SType = "Text";
        Label = "Description";
    }

    INOUT MIR-ETBL-VALU-ID
    {
        Key;
        Length = "15";
        SType = "Text";
        Label = "Value";
    }

    IN MIR-ETBL-DESC-TXT-T[250]
    {
        DisplayOnly;
        Length = "40";
        FieldGroup = "Table250";
        SType = "Text";
        Label = "Description";
        Index = "1";
    }

    IN MIR-ETBL-LANG-CD-T[250]
    {
        DisplayOnly;
        Length = "40";
        FieldGroup = "Table250";
        CodeSource = "EDIT";
        CodeType = "LANG";
        SType = "Text";
        Label = "Language";
        Index = "1";
    }

    IN MIR-ETBL-TYP-ID-T[250]
    {
        DisplayOnly;
        Length = "5";
        FieldGroup = "Table250";
        SType = "Text";
        Label = "Table Name";
        Index = "1";
    }

    IN MIR-ETBL-VALU-ID-T[250]
    {
        DisplayOnly;
        Length = "15";
        FieldGroup = "Table250";
        Link;
        SType = "Text";
        Label = "Value";
        Action = "SelectItem";
        Index = "1";
    }

}

