# Converted from PathFinder 2.2 to 3.0 Jun 18, 2004 3:12:27 PM EDT

#*******************************************************************************
#*  Component:   BF0682-I.s                                                    *
#*  Description:                                                               *
#*                                                                             *
#*******************************************************************************
#*  Chg#    Release  Description                                               *
#*                                                                             *
#*  014590  6.0      New for release 6.0                                       *
#*  017150  612J     Remove Currency Decimals = "2"                            *
#*                                                                             *
#*******************************************************************************

S-STEP BF0682-I
{
    ATTRIBUTES
    {
        BusinessFunctionType = "Update";
        Type = "Input";
        FocusField = "MIR-ETBL-DESC-TXT-T[1]";
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

    INOUT MIR-ETBL-DESC-TXT-T[12]
    {
        Length = "40";
        FieldGroup = "Table12";
        KeyColumn;
        SType = "Text";
        Label = "Description";
        Index = "1";
    }

    IN MIR-ETBL-LANG-CD
    {
        Key;
        DisplayOnly;
        Length = "40";
        CodeSource = "EDIT";
        CodeType = "LANG";
        SType = "Text";
        Label = "Language";
    }

    IN MIR-ETBL-TYP-ID
    {
        Key;
        DisplayOnly;
        Length = "5";
        SType = "Text";
        Label = "Table Name";
    }

    IN MIR-ETBL-VALU-ID
    {
        Key;
        DisplayOnly;
        Length = "15";
        SType = "Text";
        Label = "Value";
    }

}

