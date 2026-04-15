# Converted from PathFinder 2.2 to 3.0 Jun 18, 2004 3:12:48 PM EDT

#*******************************************************************************
#*  Component:   BF1694-O.s                                                    *
#*  Description:                                                               *
#*                                                                             *
#*******************************************************************************
#*  Chg#    Release  Description                                               *
#*                                                                             *
#*  014590  6.0      New for release 6.0                                       *
#*  017150  612J     Remove Currency Decimals = "2"                            *
#*                                                                             *
#*******************************************************************************

S-STEP BF1694-O
{
    ATTRIBUTES
    {
        BusinessFunctionType = "List";
        Type = "Output";
        DelEmptyRows;
        FocusField = "MIR-CLI-LTST-SUR-NM";
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

    INOUT MIR-CLI-LTST-SEQ-NUM
    {
        Length = "3";
        SType = "Hidden";
        Label = "Sequence";
    }

    INOUT MIR-CLI-LTST-SUR-NM
    {
        Key;
        Length = "25";
        SType = "Text";
        Label = "Last Name";
    }

    IN MIR-CLI-BTH-DT-T[40]
    {
        DisplayOnly;
        Length = "10";
        FieldGroup = "Table40";
        SType = "Date";
        Label = "Birth Date";
        Index = "1";
    }

    IN MIR-CLI-GIV-NM-T[40]
    {
        DisplayOnly;
        Length = "25";
        FieldGroup = "Table40";
        SType = "Text";
        Label = "First Name";
        Index = "1";
    }

    IN MIR-CLI-LTST-SEQ-NUM-T[40]
    {
        DisplayOnly;
        Length = "3";
        FieldGroup = "Table40";
        SType = "Hidden";
        Label = "Sequence";
        Index = "1";
    }

    IN MIR-CLI-LTST-SUR-NM-T[40]
    {
        DisplayOnly;
        Length = "25";
        FieldGroup = "Table40";
        KeyColumn;
        Link;
        SType = "Text";
        Label = "Last Name";
        Index = "1";
    }

    IN MIR-CLI-MID-INIT-NM-T[40]
    {
        DisplayOnly;
        Length = "1";
        FieldGroup = "Table40";
        SType = "Text";
        Label = "Initial";
        Index = "1";
    }

    IN MIR-CLI-SEX-CD-T[40]
    {
        DisplayOnly;
        Length = "40";
        FieldGroup = "Table40";
        SType = "Text";
        Label = "Sex";
        Index = "1";
    }

    IN MIR-CLI-TAX-ID-T[40]
    {
        DisplayOnly;
        Length = "9";
        FieldGroup = "Table40";
        SType = "Text";
        Label = "Tax Identifier";
        Index = "1";
    }

    IN MIR-LAB-ID-T[40]
    {
        DisplayOnly;
        Length = "3";
        FieldGroup = "Table40";
        SType = "Text";
        Label = "Laboratory";
        Index = "1";
    }

}

