# Converted from PathFinder 2.2 to 3.0 Jun 18, 2004 3:12:21 PM EDT

#*******************************************************************************
#*  Component:   BF0370-O.s                                                    *
#*  Description:                                                               *
#*                                                                             *
#*******************************************************************************
#*  Chg#    Release  Description                                               *
#*                                                                             *
#*  014590  6.0      New for release 6.0                                       *
#*  017150  612J     Remove Currency Decimals = "2"                            *
#*                                                                             *
#*******************************************************************************

S-STEP BF0370-O
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

    IN MIR-FLD-ID
    {
        Key;
        DisplayOnly;
        Length = "10";
        SType = "Text";
        Label = "Defined Field Name";
    }

    IN MIR-FLD-DCML-LEN-T[12]
    {
        DisplayOnly;
        Length = "2";
        FieldGroup = "Table12";
        SType = "Text";
        Label = "Number OF Decimal Places";
        Index = "1";
    }

    IN MIR-FLD-DESC-TXT-T[12]
    {
        DisplayOnly;
        Length = "40";
        FieldGroup = "Table12";
        SType = "Text";
        Label = "Defined Field Description";
        Index = "1";
    }

    IN MIR-FLD-FILE-CD-T[12]
    {
        DisplayOnly;
        Length = "4";
        FieldGroup = "Table12";
        KeyColumn;
        CodeSource = "DataModel";
        CodeType = "FLD-FILE-CD";
        SType = "Text";
        Label = "File Resides";
        Index = "1";
    }

    IN MIR-FLD-LEN-T[12]
    {
        DisplayOnly;
        Length = "3";
        FieldGroup = "Table12";
        SType = "Text";
        Label = "Defined Field Length";
        Index = "1";
    }

    IN MIR-FLD-OFFST-LEN-T[12]
    {
        DisplayOnly;
        Length = "4";
        FieldGroup = "Table12";
        SType = "Text";
        Label = "Byte-offset";
        Index = "1";
    }

    IN MIR-FLD-TYP-CD-T[12]
    {
        DisplayOnly;
        Length = "1";
        FieldGroup = "Table12";
        CodeSource = "DataModel";
        CodeType = "FLD-TYP-CD";
        SType = "Text";
        Label = "Defined Field Type";
        Index = "1";
    }

}

