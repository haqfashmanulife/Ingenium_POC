# Converted from PathFinder 2.2 to 3.0 Jun 18, 2004 3:12:46 PM EDT

#*******************************************************************************
#*  Component:   BF1584-O.s                                                    *
#*  Description:                                                               *
#*                                                                             *
#*******************************************************************************
#*  Chg#    Release  Description                                               *
#*                                                                             *
#*  014590  6.0      New for release 6.0                                       *
#*  017150  612J     Remove Currency Decimals = "2"                            *
#*  B00477   SRO     ADD INSURED CLIENT ID TO AMEX TABLE KEY                   *
#*                                                                             *
#*******************************************************************************

S-STEP BF1584-O
{
    ATTRIBUTES
    {
        BusinessFunctionType = "List";
        Type = "Output";
        DelEmptyRows;
        FocusField = "MIR-POL-ID-BASE";
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

    INOUT MIR-AMEX-REC-TYP-CD
    {
        Key;
        Length = "2";
        CodeSource = "DataModel";
        CodeType = "AMEX-REC-TYP-CD";
        SType = "Selection";
        Label = "Record Type";
    }

    INOUT MIR-AMEX-SEQ-NUM
    {
        Key;
        Mandatory;
        Length = "2";
        DefaultConstant = "01";
        SType = "Text";
        Label = "Sequence Number";
    }

    INOUT MIR-POL-ID-BASE
    {
        Key;
        Mandatory;
        Length = "9";
        DefaultSession = "MIR-POL-ID-BASE";
        SType = "Text";
        Label = "Policy Id";
    }

    INOUT MIR-POL-ID-SFX
    {
        Key;
        Length = "1";
        DefaultSession = "MIR-POL-ID-SFX";
        SType = "Text";
        Label = "Suffix";
    }

    INOUT MIR-INSRD-CLI-ID
    {
        Key;
        Mandatory;
        Length = "10";
        SType = "Text";
        Label = "Insured Client Id";
    }

    IN MIR-AMEX-PRT-IND-T[12]
    {
        DisplayOnly;
        Length = "1";
        FieldGroup = "Table12";
        SType = "Indicator";
        Label = "Print amendment, endorsement or exclusion as part of contract";
        Index = "1";
    }

    IN MIR-AMEX-REC-RETEN-CD-T[12]
    {
        DisplayOnly;
        Length = "1";
        FieldGroup = "Table12";
        CodeSource = "DataModel";
        CodeType = "AMEX-REC-RETEN-CD";
        SType = "Text";
        Label = "Record Retention Period";
        Index = "1";
    }

    IN MIR-AMEX-REC-TYP-CD-T[12]
    {
        DisplayOnly;
        Length = "2";
        FieldGroup = "Table12";
        CodeSource = "DataModel";
        CodeType = "AMEX-REC-TYP-CD";
        SType = "Text";
        Label = "Record Type";
        Index = "1";
    }

    IN MIR-AMEX-SEQ-NUM-T[12]
    {
        DisplayOnly;
        Length = "2";
        FieldGroup = "Table12";
        SType = "Text";
        Label = "Sequence Number";
        Index = "1";
    }

    IN MIR-AMEX-TRXN-DT-T[12]
    {
        DisplayOnly;
        Length = "10";
        FieldGroup = "Table12";
        SType = "Date";
        Label = "Date Created";
        Index = "1";
    }

    IN MIR-CLI-ID-T[12]
    {
        DisplayOnly;
        Length = "10";
        FieldGroup = "Table12";
        SType = "Text";
        Label = "Client Number";
        Index = "1";
    }

    IN MIR-CVG-NUM-T[12]
    {
        DisplayOnly;
        Length = "2";
        FieldGroup = "Table12";
        SType = "Text";
        Label = "Coverage Number";
        Index = "1";
    }

    IN MIR-DOC-ID-T[12]
    {
        DisplayOnly;
        Length = "40";
        FieldGroup = "Table12";
        KeyColumn;
        CodeSource = "EDIT";
        CodeType = "DOCM";
        Link;
        SType = "Text";
        Label = "Document Name";
        Action = "SelectItem";
        Index = "1";
    }

}

