# Converted from PathFinder 2.2 to 3.0 Jun 18, 2004 3:12:32 PM EDT

#*******************************************************************************
#*  Component:   BF0942ARNew-I.s                                               *
#*  Description:                                                               *
#*                                                                             *
#*******************************************************************************
#*  Chg#    Release  Description                                               *
#*                                                                             *
#*  014590  6.0      New for release 6.0                                       *
#*  017150  612J     Remove Currency Decimals = "2"                            *
#*                                                                             *
#*******************************************************************************

S-STEP BF0942ARNew-I
{
    ATTRIBUTES
    {
        BusinessFunctionType = "Update";
        Type = "Input";
        FocusField = "MIR-POL-PAYO-EFF-DT";
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

    INOUT index
    {
        SType = "Hidden";
    }

    INOUT MIR-CDI-ALLOC-AMT-T[139]
    {
        Length = "17";
        FieldGroup = "Table139";
        SType = "Text";
        Label = "Amount / Percent / No. of Units";
        Index = "1";
    }

    INOUT MIR-CDI-ALLOC-CD-T[139]
    {
        Length = "1";
        FieldGroup = "Table139";
        CodeSource = "DataModel";
        CodeType = "CDI-ALLOC-CD";
        SType = "Selection";
        Label = "Allocation Basis";
        Index = "1";
    }

    INOUT MIR-CDI-PAYO-MTHD-CD-T[139]
    {
        Length = "1";
        FieldGroup = "Table139";
        CodeSource = "DataModel";
        CodeType = "CDI-PAYO-MTHD-CD";
        SType = "Selection";
        Label = "Payout Method";
        Index = "1";
    }

    INOUT MIR-DEST-CVG-NUM-T[139]
    {
        Length = "2";
        FieldGroup = "Table139";
        SType = "Text";
        Label = "Destination Coverage Number";
        Index = "1";
    }

    INOUT MIR-DEST-FND-ID-T[139]
    {
        Length = "40";
        FieldGroup = "Table139";
        CodeSource = "EDIT";
        CodeType = "SEGFD";
        SType = "Selection";
        Label = "Fund Receiving Money";
        Index = "1";
    }

    INOUT MIR-DEST-POL-ID-BASE-T[139]
    {
        Length = "9";
        FieldGroup = "Table139";
        SType = "Text";
        Label = "Policy Id Receiving Money";
        Index = "1";
    }

    INOUT MIR-DEST-POL-ID-SFX-T[139]
    {
        Length = "1";
        FieldGroup = "Table139";
        SType = "Text";
        Label = "Suffix Receiving Money";
        Index = "1";
    }

    INOUT MIR-POL-PAYO-EFF-DT
    {
        Mandatory;
        Length = "10";
        SType = "Date";
        Label = "Efffective Date";
    }

    INOUT MIR-POL-PAYO-END-DT
    {
        Length = "10";
        SType = "Date";
        Label = "End Date";
    }

    INOUT MIR-POL-PAYO-MODE-CD
    {
        Mandatory;
        Length = "2";
        CodeSource = "DataModel";
        CodeType = "POL-PAYO-MODE-CD";
        SType = "Selection";
        Label = "Payout Mode";
    }

    INOUT MIR-POL-PAYO-STAT-CD
    {
        Length = "1";
        CodeSource = "DataModel";
        CodeType = "POL-PAYO-STAT-CD";
        SType = "Selection";
        Label = "Status";
    }

    INOUT MIR-POL-PAYO-TAXWH-IND
    {
        Length = "1";
        SType = "Indicator";
        Label = "Bypass Tax Withholding Calculations";
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

    IN MIR-POL-PAYO-NUM
    {
        Key;
        DisplayOnly;
        Length = "5";
        DefaultConstant = "00000";
        SType = "Text";
        Label = "Payout Number";
    }

    IN MIR-CDA-EFF-DT
    {
        DisplayOnly;
        Length = "10";
        SType = "Date";
        Label = "Last Payment Date";
    }

    IN MIR-DV-FND-DESC-TXT-T[139]
    {
        DisplayOnly;
        Length = "40";
        FieldGroup = "Table139";
        SType = "Text";
        Label = "Fund Description";
        Index = "1";
    }

    IN MIR-POL-PAYO-NXT-DT
    {
        DisplayOnly;
        Length = "10";
        SType = "Date";
        Label = "Next Payout Date";
    }

    IN MIR-POL-PAYO-TYP-CD
    {
        DisplayOnly;
        Length = "1";
        CodeSource = "DataModel";
        CodeType = "POL-PAYO-TYP-CD";
        SType = "Text";
        Label = "Payout Type";
    }

}

