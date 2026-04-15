# Converted from PathFinder 2.2 to 3.0 Jun 18, 2004 3:12:19 PM EDT

#*******************************************************************************
#*  Component:   BF0290-O.s                                                    *
#*  Description:                                                               *
#*                                                                             *
#*******************************************************************************
#*  Chg#    Release  Description                                               *
#*                                                                             *
#*  014590  6.0      New for release 6.0                                       *
#*  017150  612J     Remove Currency Decimals = "2"                            *
#*                                                                             *
#*******************************************************************************

S-STEP BF0290-O
{
    ATTRIBUTES
    {
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

    IN MIR-ETBL-DESC-TXT-T[12]
    {
        DisplayOnly;
        Length = "40";
        FieldGroup = "Table12";
        SType = "Text";
        Label = "Description";
        Index = "1";
    }

    IN MIR-TTBL-VALU-TXT-T[12]
    {
        DisplayOnly;
        Length = "15";
        FieldGroup = "Table12";
        KeyColumn;
        SType = "Text";
        Label = "Translate Value";
        Index = "1";
    }

}

