# Converted from PathFinder 2.2 to 3.0 Jun 18, 2004 3:12:52 PM EDT

#*******************************************************************************
#*  Component:   BF1920-O.s                                                    *
#*  Description:                                                               *
#*                                                                             *
#*******************************************************************************
#*  Chg#    Release  Description                                               *
#*                                                                             *
#*  014590  6.0      New for release 6.0                                       *
#*  017150  612J     Remove Currency Decimals = "2"                            *
#*                                                                             *
#*******************************************************************************

S-STEP BF1920-O
{
    ATTRIBUTES
    {
        BusinessFunctionType = "Retrieve";
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

    IN MIR-CLI-ID
    {
        Key;
        DisplayOnly;
        Length = "10";
        SType = "Text";
        Label = "Client Number";
    }

    IN MIR-CLI-INDV-SEQ-NUM
    {
        Key;
        DisplayOnly;
        Length = "3";
        SType = "Text";
        Label = "Sequence Number";
    }

    IN MIR-CLI-INDV-GIV-NM-T[2]
    {
        DisplayOnly;
        Length = "25";
        FieldGroup = "TableO";
        SType = "Text";
        Label = "First Name";
        Index = "1";
    }

    IN MIR-CLI-INDV-MID-NM-T[2]
    {
        DisplayOnly;
        Length = "1";
        FieldGroup = "Table2";
        SType = "Text";
        Label = "Middle Name";
        Index = "1";
    }

    IN MIR-CLI-INDV-SFX-NM-T[2]
    {
        DisplayOnly;
        Length = "10";
        FieldGroup = "Table2";
        CodeSource = "EDIT";
        CodeType = "SUFFX";
        SType = "Text";
        Label = "Suffix";
        Index = "1";
    }

    IN MIR-CLI-INDV-SUR-NM-T[2]
    {
        DisplayOnly;
        Length = "25";
        FieldGroup = "TableO";
        SType = "Text";
        Label = "Last Name";
        Index = "1";
    }

    IN MIR-CLI-INDV-TITL-TXT-T[2]
    {
        DisplayOnly;
        Length = "15";
        FieldGroup = "Table2";
        CodeSource = "EDIT";
        CodeType = "TITLE";
        SType = "Text";
        Label = "Title";
        Index = "1";
    }

    IN MIR-ENTR-GIV-NM-T[2]
    {
        DisplayOnly;
        Length = "25";
        FieldGroup = "Table2";
        SType = "Text";
        Label = "First Name";
        Index = "1";
    }

    IN MIR-ENTR-SUR-NM-T[2]
    {
        DisplayOnly;
        Length = "25";
        FieldGroup = "Table2";
        SType = "Text";
        Label = "Last Name";
        Index = "1";
    }

}

