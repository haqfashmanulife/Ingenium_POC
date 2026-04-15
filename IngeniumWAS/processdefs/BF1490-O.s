# Converted from PathFinder 2.2 to 3.0 Jun 18, 2004 3:12:44 PM EDT

#*******************************************************************************
#*  Component:   BF1490-O.s                                                    *
#*  Description:                                                               *
#*                                                                             *
#*******************************************************************************
#*  Chg#    Release  Description                                               *
#*                                                                             *
#*  014590  6.0      New for release 6.0                                       *
#*  017150  612J     Remove Currency Decimals = "2"                            *
#*  B00272  BMB      Adjust display field to show spaces                       *
#*                   Note: The HTML element that matches this has special      *
#*                   formatting for online letter writing. Do not use UIGEN.   *
#*                                                                             *
#*******************************************************************************

S-STEP BF1490-O
{
    ATTRIBUTES
    {
        BusinessFunctionType = "Retrieve";
        Type = "Output";
        FocusField = "prevButton";
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

    IN MIR-POL-ID-BASE
    {
        Key;
        DisplayOnly;
        Length = "9";
        DefaultSession = "MIR-POL-ID-BASE";
        SType = "Text";
        Label = "Policy Id";
    }

    IN MIR-POL-ID-SFX
    {
        Key;
        DisplayOnly;
        Length = "1";
        DefaultSession = "MIR-POL-ID-SFX";
        SType = "Text";
        Label = "Suffix";
    }

    IN MIR-CVG-NUM
    {
        Key;
        DisplayOnly;
        Length = "2";
        SType = "Text";
        Label = "Coverage Number";
    }

    IN MIR-DOC-ID
    {
        Key;
        DisplayOnly;
        Length = "40";
        CodeSource = "EDIT";
        CodeType = "DOCM";
        SType = "Text";
        Label = "Document Name";
    }

    IN MIR-DV-PG-FRMT-TST-AMT
    {
        Key;
        DisplayOnly;
        Length = "15";
        SType = "Currency";
        Label = "Amount";
    }

    IN MIR-DV-DOC-PG-NUM
    {
        DisplayOnly;
        Length = "3";
        SType = "Text";
        Label = "Page";
    }

    IN MIR-DV-DOC-MAX-PG-NUM
    {
        DisplayOnly;
        Length = "3";
        SType = "Text";
        Label = "Max Page";
    }

    INOUT MIR-DV-PG-LN-TXT-T[40]
    {
        DisplayOnly;
        Length = "79";
        FieldGroup = "Table40";
        SType = "Text";
        Label = "Face page text";
        Index = "1";
    }

}

