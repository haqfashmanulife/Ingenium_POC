# Converted from PathFinder 2.2 to 3.0 Jun 18, 2004 3:12:19 PM EDT

#*******************************************************************************
#*  Component:   BF0292-I.s                                                    *
#*  Description:                                                               *
#*                                                                             *
#*******************************************************************************
#*  Chg#    Release  Description                                               *
#*                                                                             *
#*  014590  6.0      New for release 6.0                                       *
#*  017150  612J     Remove Currency Decimals = "2"                            *
#*                                                                             *
#*******************************************************************************

S-STEP BF0292-I
{
    ATTRIBUTES
    {
        BusinessFunctionType = "Update";
        Type = "Input";
        FocusField = "MIR-TTBL-VALU-TXT-T[1]";
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

    INOUT MIR-TTBL-VALU-TXT-T[1]
    {
        Length = "15";
        FieldGroup = "Table1";
        SType = "Text";
        Label = "Translate Value";
        Index = "1";
    }

    IN MIR-ETBL-TYP-ID
    {
        Key;
        DisplayOnly;
        Length = "5";
        SType = "Text";
        Label = "Value Type";
    }

    IN MIR-ETBL-VALU-ID
    {
        Key;
        DisplayOnly;
        Length = "15";
        SType = "Text";
        Label = "Value";
    }

    IN MIR-ETBL-DESC-TXT-T[1]
    {
        DisplayOnly;
        Length = "40";
        FieldGroup = "Table1";
        SType = "Text";
        Label = "Description";
        Index = "1";
    }

    IN MIR-TTAB-ADMIN-APPL-ID
    {
        Key;
        DisplayOnly;
        Length = "2";
        CodeSource = "EDIT";
        CodeType = "ADMIN";
        SType = "Text";
        Label = "Administration System";
    }

}

