# Converted from PathFinder 2.2 to 3.0 Jun 18, 2004 3:12:52 PM EDT

#*******************************************************************************
#*  Component:   BF1922-I.s                                                    *
#*  Description:                                                               *
#*                                                                             *
#*******************************************************************************
#*  Chg#    Release  Description                                               *
#*                                                                             *
#*  014590  6.0      New for release 6.0                                       *
#*  017150  612J     Remove Currency Decimals = "2"                            *
#*                                                                             *
#*******************************************************************************

S-STEP BF1922-I
{
    ATTRIBUTES
    {
        BusinessFunctionType = "Update";
        Type = "Input";
        FocusField = "MIR-CLI-INDV-TITL-TXT-T[1]";
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

    INOUT MIR-CLI-INDV-GIV-NM-T[2]
    {
        Length = "25";
        FieldGroup = "TableO";
        SType = "Text";
        Label = "First Name";
        Index = "1";
    }

    INOUT MIR-CLI-INDV-MID-NM-T[2]
    {
        Length = "1";
        FieldGroup = "Table2";
        SType = "Text";
        Label = "Middle Name";
        Index = "1";
    }

    INOUT MIR-CLI-INDV-SFX-NM-T[2]
    {
        Length = "10";
        FieldGroup = "Table2";
        CodeSource = "EDIT";
        CodeType = "SUFFX";
        SType = "Selection";
        Label = "Suffix";
        Index = "1";
    }

    INOUT MIR-CLI-INDV-SUR-NM-T[2]
    {
        Length = "25";
        FieldGroup = "TableO";
        SType = "Text";
        Label = "Last Name";
        Index = "1";
    }

    INOUT MIR-CLI-INDV-TITL-TXT-T[2]
    {
        Length = "15";
        FieldGroup = "Table2";
        CodeSource = "EDIT";
        CodeType = "TITLE";
        SType = "Selection";
        Label = "Title";
        Index = "1";
    }

    INOUT MIR-ENTR-GIV-NM-T[2]
    {
        Length = "25";
        FieldGroup = "Table2";
        SType = "Text";
        Label = "First Name";
        Index = "1";
    }

    INOUT MIR-ENTR-SUR-NM-T[2]
    {
        Length = "25";
        FieldGroup = "Table2";
        SType = "Text";
        Label = "Last Name";
        Index = "1";
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

}

