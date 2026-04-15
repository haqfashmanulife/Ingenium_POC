# Converted from PathFinder 2.2 to 3.0 Jun 18, 2004 3:12:18 PM EDT

#*******************************************************************************
#*  Component:   BF0234-O.s                                                    *
#*  Description:                                                               *
#*                                                                             *
#*******************************************************************************
#*  Chg#    Release  Description                                               *
#*                                                                             *
#*  014590  6.0      New for release 6.0                                       *
#*  017150  612J     Remove Currency Decimals = "2"                            *
#*                                                                             *
#*******************************************************************************

S-STEP BF0234-O
{
    ATTRIBUTES
    {
        BusinessFunctionType = "List";
        Type = "Output";
        DelEmptyRows;
        FocusField = "MIR-CHQ-ID";
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

    INOUT MIR-CHQ-ID
    {
        Key;
        Length = "16";
        SType = "Text";
        Label = "Reference Number";
    }

    INOUT MIR-SBSDRY-CO-ID
    {
        Key;
        Length = "40";
        CodeSource = "EDIT";
        CodeType = "SUBCO";
        SType = "Selection";
        Label = "Sub Company";
    }

    IN MIR-CHQ-AMT-T[100]
    {
        DisplayOnly;
        Length = "17";
        FieldGroup = "Table100";
        SType = "Currency";
        Label = "Amount";
        Index = "1";
    }

    IN MIR-CHQ-DT-T[100]
    {
        DisplayOnly;
        Length = "10";
        FieldGroup = "Table100";
        SType = "Date";
        Label = "Date";
        Index = "1";
    }

    IN MIR-CHQ-ID-T[100]
    {
        DisplayOnly;
        Length = "16";
        FieldGroup = "Table100";
        KeyColumn;
        Link;
        SType = "Text";
        Label = "Reference Number";
        Action = "SelectItem";
        Index = "1";
    }

    IN MIR-CHQ-MICR-NUM-T[100]
    {
        DisplayOnly;
        Length = "8";
        FieldGroup = "Table100";
        SType = "Text";
        Label = "MICR Number";
        Index = "1";
    }

    IN MIR-CHQ-PAYE-1-TXT-T[100]
    {
        DisplayOnly;
        Length = "50";
        FieldGroup = "Table100";
        SType = "Text";
        Label = "Payee (1)";
        Index = "1";
    }

    IN MIR-CHQ-STAT-CD-T[100]
    {
        DisplayOnly;
        Length = "1";
        FieldGroup = "Table100";
        CodeSource = "DataModel";
        CodeType = "CHQ-STAT-CD";
        SType = "Text";
        Label = "Status";
        Index = "1";
    }

    IN MIR-SBSDRY-CO-ID-T[100]
    {
        DisplayOnly;
        Length = "40";
        FieldGroup = "Table100";
        CodeSource = "EDIT";
        CodeType = "SUBCO";
        SType = "Text";
        Label = "Sub Company";
        Index = "1";
    }

}

