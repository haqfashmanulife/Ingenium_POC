# Converted from PathFinder 2.2 to 3.0 Jun 18, 2004 3:12:45 PM EDT

#*******************************************************************************
#*  Component:   BF1554-O.s                                                    *
#*  Description:                                                               *
#*                                                                             *
#*******************************************************************************
#*  Chg#    Release  Description                                               *
#*                                                                             *
#*  014590  6.0      New for release 6.0                                       *
#*  017150  612J     Remove Currency Decimals = "2"                            *
#*                                                                             *
#*******************************************************************************

S-STEP BF1554-O
{
    ATTRIBUTES
    {
        BusinessFunctionType = "List";
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

    IN MIR-CLI-LTST-DT
    {
        Length = "10";
        SType = "Date";
        Label = "Date Test Performed";
    }

    IN MIR-CLI-LTST-SEQ-NUM
    {
        Key;
        DisplayOnly;
        Length = "3";
        SType = "Text";
        Label = "Sequence";
    }

    INOUT MIR-LTST-ID
    {
        Length = "4";
        CodeSource = "EDIT";
        CodeType = "TSTNO";
        SType = "Selection";
        Label = "Test Number";
    }

    INOUT MIR-CLI-ID
    {
        Length = "10";
        DefaultSession = "MIR-CLI-ID";
        SType = "Text";
        Label = "Client Number";
    }

    IN MIR-ALPHA-RESP-ETBL-ID-T[11]
    {
        DisplayOnly;
        Length = "40";
        FieldGroup = "Table11";
        SType = "Text";
        Label = "Alpha Result Edit Pointer";
        Index = "1";
    }

    IN MIR-CLI-LTST-DT-T[11]
    {
        DisplayOnly;
        Length = "10";
        FieldGroup = "Table11";
        SType = "Date";
        Label = "Date Test Performed";
        Index = "1";
    }

    IN MIR-CLI-LTST-RSLT-CD-T[11]
    {
        DisplayOnly;
        Length = "8";
        FieldGroup = "Table11";
        CodeSource = "EDIT";
        CodeType = "TSTRS";
        SType = "Text";
        Label = "Test Range Result";
        Index = "1";
    }

    IN MIR-CLI-LTST-SEQ-NUM-T[11]
    {
        DisplayOnly;
        Length = "3";
        FieldGroup = "Table11";
        SType = "Text";
        Label = "Sequence";
        Index = "1";
    }

    IN MIR-CLI-LTST-STAT-CD-T[11]
    {
        DisplayOnly;
        Length = "1";
        FieldGroup = "Table11";
        CodeSource = "DataModel";
        CodeType = "CLI-LTST-STAT-CD";
        SType = "Text";
        Label = "Test Status";
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

    IN MIR-CO-MAX-NRNG-QTY-T[11]
    {
        DisplayOnly;
        Length = "7";
        FieldGroup = "Table11";
        SType = "Text";
        Label = "Maximum - Company";
        Index = "1";
    }

    IN MIR-CO-MIN-NRNG-QTY-T[11]
    {
        DisplayOnly;
        Length = "7";
        FieldGroup = "Table11";
        SType = "Text";
        Label = "Minimum - Company";
        Index = "1";
    }

    INOUT MIR-DOC-ID
    {
        Length = "5";
        CodeSource = "EDIT";
        CodeType = "DOCM";
        SType = "Selection";
        Label = "Document Name";
    }

    IN MIR-DV-CLI-INSRD-AGE
    {
        DisplayOnly;
        Length = "3";
        Decimals = "0";
        SType = "Number";
        Label = "Age";
    }

    IN MIR-DV-INSRD-CLI-NM
    {
        DisplayOnly;
        Length = "75";
        SType = "Text";
        Label = "Insured Name";
    }

    IN MIR-LTST-ID-T[11]
    {
        DisplayOnly;
        Length = "4";
        FieldGroup = "Table11";
        KeyColumn;
        CodeSource = "EDIT";
        CodeType = "TSTNO";
        Link;
        SType = "Text";
        Label = "Test Number";
        Action = "SelectItem";
        Index = "1";
    }

    IN MIR-RSLT-REC-CREAT-CD-T[11]
    {
        DisplayOnly;
        Length = "1";
        FieldGroup = "Table11";
        CodeSource = "DataModel";
        CodeType = "RSLT-REC-CREAT-CD";
        SType = "Text";
        Label = "Test Creation Type";
        Index = "1";
    }

    IN MIR-STAT-CHNG-REASN-CD-T[11]
    {
        DisplayOnly;
        Length = "1";
        FieldGroup = "Table11";
        CodeSource = "EDIT";
        CodeType = "TSTRE";
        SType = "Text";
        Label = "Reason Status Changed";
        Index = "1";
    }

}

