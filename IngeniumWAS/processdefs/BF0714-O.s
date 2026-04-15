# Converted from PathFinder 2.2 to 3.0 Jun 18, 2004 3:12:28 PM EDT

#*******************************************************************************
#*  Component:   BF0714-O.s                                                    *
#*  Description:                                                               *
#*                                                                             *
#*******************************************************************************
#*  Chg#    Release  Description                                               *
#*                                                                             *
#*  014590  6.0      New for release 6.0                                       *
#*  017150  612J     Remove Currency Decimals = "2"                            *
#*                                                                             *
#*******************************************************************************

S-STEP BF0714-O
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

    INOUT MIR-IA-QUOT-NUM
    {
        Key;
        Length = "6";
        DefaultSession = "MIR-IA-QUOT-NUM";
        SType = "Text";
        Label = "Quote Number";
    }

    IN MIR-ANUTNT-1-BTH-DT-T[12]
    {
        DisplayOnly;
        Length = "10";
        FieldGroup = "Table12";
        SType = "Date";
        Label = "First Annuitant - Birth Date";
        Index = "1";
    }

    IN MIR-ANUTNT-1-SEX-CD-T[12]
    {
        DisplayOnly;
        Length = "1";
        FieldGroup = "Table12";
        CodeSource = "DataModel";
        CodeType = "ANUTNT-SEX-CD";
        SType = "Text";
        Label = "First Annuitant - Sex";
        Index = "1";
    }

    IN MIR-CVG-NUM
    {
        DisplayOnly;
        Length = "2";
        SType = "Text";
        Label = "Coverage Number";
    }

    IN MIR-CVG-ORIG-CD
    {
        DisplayOnly;
        Length = "1";
        CodeSource = "EDIT";
        CodeType = "ORIG";
        SType = "Text";
        Label = "Origin of Funds";
    }

    IN MIR-DV-FILE-RQST-CD
    {
        DisplayOnly;
        Length = "1";
        SType = "Text";
        Label = "Quote Save Indicator";
    }

    IN MIR-IA-GRS-SPREM-AMT-T[12]
    {
        DisplayOnly;
        Length = "15";
        FieldGroup = "Table12";
        SType = "Currency";
        Label = "Gross Single Premium";
        Index = "1";
    }

    IN MIR-IA-GUAR-MO-DUR-T[12]
    {
        DisplayOnly;
        Length = "2";
        FieldGroup = "Table12";
        SType = "Text";
        Label = "Number of Months";
        Index = "1";
    }

    IN MIR-IA-GUAR-YR-DUR-T[12]
    {
        DisplayOnly;
        Length = "2";
        FieldGroup = "Table12";
        SType = "Text";
        Label = "Number of Years";
        Index = "1";
    }

    IN MIR-IA-QUOT-AGT-NM-TXT-T[12]
    {
        DisplayOnly;
        Length = "20";
        FieldGroup = "Table12";
        SType = "Text";
        Label = "Agent Name";
        Index = "1";
    }

    IN MIR-IA-QUOT-INCM-AMT-T[12]
    {
        DisplayOnly;
        Signed;
        Length = "13";
        FieldGroup = "Table12";
        SType = "Currency";
        Label = "Ultimate Periodic Income";
        Index = "1";
    }

    IN MIR-IA-QUOT-NUM-T[12]
    {
        DisplayOnly;
        Length = "6";
        FieldGroup = "Table12";
        KeyColumn;
        Link;
        SType = "Text";
        Label = "Quote Number";
        Action = "SelectItem";
        Index = "1";
    }

    IN MIR-IA-QUOT-STAT-CD-T[12]
    {
        DisplayOnly;
        Length = "40";
        FieldGroup = "Table12";
        CodeSource = "DataModel";
        CodeType = "IA-QUOT-STAT-CD";
        SType = "Text";
        Label = "Quote Status";
        Index = "1";
    }

    IN MIR-IA-QUOT-TYP-CD-T[12]
    {
        DisplayOnly;
        Length = "40";
        FieldGroup = "Table12";
        CodeSource = "DataModel";
        CodeType = "IA-QUOT-TYP-CD";
        SType = "Text";
        Label = "Annuity Type";
        Index = "1";
    }

    IN MIR-DV-BTH-JP-DT-DY-TXT-T[12]
    {
        DisplayOnly;
        Length = "2";
        FieldGroup = "Table12";
        SType = "Text";
        Label = "Birth Day in Emperor Format";
        Index = "1";
    }

    IN MIR-DV-BTH-JP-DT-EMPRR-NM-T[12]
    {
        DisplayOnly;
        Length = "10";
        FieldGroup = "Table12";
        SType = "Text";
        Label = "Emperor Name";
        Index = "1";
    }

    IN MIR-DV-BTH-JP-DT-MO-TXT-T[12]
    {
        DisplayOnly;
        Length = "2";
        FieldGroup = "Table12";
        SType = "Text";
        Label = "Birth Month in Emperor Format";
        Index = "1";
    }

    IN MIR-DV-BTH-JP-DT-YR-TXT-T[12]
    {
        DisplayOnly;
        Length = "2";
        FieldGroup = "Table12";
        SType = "Text";
        Label = "Birth Year in Emperor Format";
        Index = "1";
    }

    IN MIR-POL-ID-BASE
    {
        DisplayOnly;
        Length = "9";
        SType = "Text";
        Label = "Policy Id";
    }

    IN MIR-POL-ID-SFX
    {
        DisplayOnly;
        Length = "1";
        SType = "Text";
        Label = "Suffix";
    }

    IN MIR-REPL-IA-QUOT-NUM
    {
        DisplayOnly;
        Length = "6";
        SType = "Text";
        Label = "Replaced / Replacing Quote Number";
    }

}

