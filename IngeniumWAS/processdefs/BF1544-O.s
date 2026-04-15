# Converted from PathFinder 2.2 to 3.0 Jun 18, 2004 3:12:45 PM EDT

#*******************************************************************************
#*  Component:   BF1544-O.s                                                    *
#*  Description:                                                               *
#*                                                                             *
#*******************************************************************************
#*  Chg#    Release  Description                                               *
#*                                                                             *
#*  014590  6.0      New for release 6.0                                       *
#*  017150  612J     Remove Currency Decimals = "2"                            *
#*                                                                             *
#*******************************************************************************

S-STEP BF1544-O
{
    ATTRIBUTES
    {
        BusinessFunctionType = "List";
        Type = "Output";
        DelEmptyRows;
        FocusField = "MIR-LAB-ID";
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

    INOUT MIR-LAB-ID
    {
        Key;
        Length = "3";
        CodeSource = "EDIT";
        CodeType = "LABCD";
        SType = "Selection";
        Label = "Laboratory";
    }

    INOUT MIR-LTST-ID
    {
        Key;
        Length = "4";
        CodeSource = "EDIT";
        CodeType = "TSTNO";
        SType = "Selection";
        Label = "Lab Test Number";
    }

    INOUT MIR-LTST-STD-AGE-QTY
    {
        Key;
        Length = "3";
        SType = "Text";
        Label = "Highest Age for Test";
    }

    INOUT MIR-LTST-STD-SEX-CD
    {
        Key;
        Length = "1";
        CodeSource = "DataModel";
        CodeType = "LTST-STD-SEX-CD";
        SType = "Selection";
        Label = "Sex";
    }

    IN MIR-ALPHA-RESP-ETBL-ID-T[12]
    {
        DisplayOnly;
        Length = "5";
        FieldGroup = "Table12";
        CodeSource = "EDIT";
        CodeType = "EDIT";
        SType = "Text";
        Label = "Alpha Result Edit Pointer";
        Index = "1";
    }

    IN MIR-CO-MAX-NRNG-QTY-T[12]
    {
        DisplayOnly;
        Length = "8";
        FieldGroup = "Table12";
        SType = "Text";
        Label = "Company Maximum Range";
        Index = "1";
    }

    IN MIR-CO-MIN-NRNG-QTY-T[12]
    {
        DisplayOnly;
        Length = "8";
        FieldGroup = "Table12";
        SType = "Text";
        Label = "Company Minimum Range";
        Index = "1";
    }

    IN MIR-LAB-MAX-NRNG-QTY-T[12]
    {
        DisplayOnly;
        Length = "8";
        FieldGroup = "Table12";
        SType = "Text";
        Label = "Lab Maximum Range";
        Index = "1";
    }

    IN MIR-LAB-MIN-NRNG-QTY-T[12]
    {
        DisplayOnly;
        Length = "8";
        FieldGroup = "Table12";
        SType = "Text";
        Label = "Lab Minimum Range";
        Index = "1";
    }

    IN MIR-LTST-ID-T[12]
    {
        DisplayOnly;
        Length = "4";
        FieldGroup = "Table12";
        KeyColumn;
        CodeSource = "EDIT";
        CodeType = "TSTNO";
        Link;
        SType = "Text";
        Label = "Lab Test Number";
        Action = "SelectItem";
        Index = "1";
    }

    IN MIR-LTST-STD-AGE-QTY-T[12]
    {
        DisplayOnly;
        Length = "3";
        FieldGroup = "Table12";
        SType = "Text";
        Label = "Highest Age for Test";
        Index = "1";
    }

    IN MIR-LTST-STD-SEX-CD-T[12]
    {
        DisplayOnly;
        Length = "1";
        FieldGroup = "Table12";
        CodeSource = "DataModel";
        CodeType = "LTST-STD-SEX-CD";
        SType = "Text";
        Label = "Sex";
        Index = "1";
    }

    IN MIR-RSLT-PRECSN-QTY-T[12]
    {
        DisplayOnly;
        Length = "1";
        FieldGroup = "Table12";
        SType = "Text";
        Label = "Test Precision";
        Index = "1";
    }

}

