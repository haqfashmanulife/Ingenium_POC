# Converted from PathFinder 2.2 to 3.0 Jun 18, 2004 3:12:48 PM EDT

#*******************************************************************************
#*  Component:   BF1690-O.s                                                    *
#*  Description:                                                               *
#*                                                                             *
#*******************************************************************************
#*  Chg#    Release  Description                                               *
#*                                                                             *
#*  014590  6.0      New for release 6.0                                       *
#*  017150  612J     Remove Currency Decimals = "2"                            *
#*                                                                             *
#*******************************************************************************

S-STEP BF1690-O
{
    ATTRIBUTES
    {
        BusinessFunctionType = "Attach";
        Type = "Output";
        DelEmptyRows;
        FocusField = "confirmButton";
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

    OUT MIR-DV-PRCES-STATE-CD
    {
        Length = "1";
        SType = "Hidden";
        Label = "MIR-DV-PRCES-STATE-CD";
    }

    IN MIR-CLI-ID
    {
        DisplayOnly;
        Length = "10";
        SType = "Hidden";
        Label = "Client Number";
    }

    IN MIR-CLI-LTST-SEQ-NUM
    {
        DisplayOnly;
        Length = "3";
        SType = "Hidden";
        Label = "Sequence";
    }

    IN MIR-CLI-LTST-SUR-NM
    {
        Key;
        DisplayOnly;
        Length = "25";
        SType = "Text";
        Label = "Last Name";
    }

    IN MIR-CLI-BTH-DT
    {
        DisplayOnly;
        Length = "10";
        SType = "Date";
        Label = "Birth Date";
    }

    IN MIR-CLI-BTH-DT-T[40]
    {
        DisplayOnly;
        Length = "10";
        FieldGroup = "Table40";
        SType = "Date";
        Label = "Birth Date";
        Action = "SelectItem";
        Index = "1";
    }

    IN MIR-CLI-GIV-NM
    {
        DisplayOnly;
        Length = "25";
        SType = "Text";
        Label = "First Name";
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

    IN MIR-CLI-ID-T[40]
    {
        DisplayOnly;
        Length = "10";
        FieldGroup = "Table40";
        KeyColumn;
        SType = "Text";
        Label = "Client Number";
        Index = "1";
    }

    IN MIR-CLI-LTST-SUR-NM-T[40]
    {
        DisplayOnly;
        Length = "25";
        FieldGroup = "Table40";
        SType = "Text";
        Label = "Last Name";
        Index = "1";
    }

    IN MIR-CLI-MID-INIT-NM
    {
        DisplayOnly;
        Length = "1";
        SType = "Text";
        Label = "Initial";
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

    IN MIR-CLI-SEX-CD
    {
        DisplayOnly;
        Length = "40";
        CodeSource = "DataModel";
        CodeType = "CLI-SEX-CD";
        SType = "Text";
        Label = "Sex";
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

    IN MIR-CLI-TAX-ID
    {
        DisplayOnly;
        Length = "9";
        SType = "Text";
        Label = "Tax Identifier";
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

    IN MIR-DV-INSRD-CLI-NM-T[40]
    {
        DisplayOnly;
        Length = "75";
        FieldGroup = "Table40";
        SType = "Text";
        Label = "Insured Name";
        Index = "1";
    }

    IN MIR-LAB-GEN-REF-ID
    {
        DisplayOnly;
        Length = "20";
        SType = "Text";
        Label = "Lab Reference Number";
    }

}

