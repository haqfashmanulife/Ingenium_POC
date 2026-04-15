# Converted from PathFinder 2.2 to 3.0 Jun 18, 2004 3:12:32 PM EDT

#*******************************************************************************
#*  Component:   BF0932-I.s                                                    *
#*  Description:                                                               *
#*                                                                             *
#*******************************************************************************
#*  Chg#    Release  Description                                               *
#*                                                                             *
#*  014590  6.0      New for release 6.0                                       *
#*  017150  612J     Remove Currency Decimals = "2"                            *
#*                                                                             *
#*******************************************************************************

S-STEP BF0932-I
{
    ATTRIBUTES
    {
        Type = "Input";
        FocusField = "MIR-DEST-CVG-NUM-T[1]";
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

    IN MIR-CDA-ROLOVR-LTR-AMT
    {
        DisplayOnly;
        Length = "11";
        SType = "Currency";
        Label = "Deposit Amount";
    }

    IN MIR-CDA-STAT-CD
    {
        DisplayOnly;
        Length = "40";
        CodeSource = "DataModel";
        CodeType = "CDA-STAT-CD";
        SType = "Text";
        Label = "Status";
    }

    IN MIR-CDA-TOT-TRXN-AMT
    {
        DisplayOnly;
        Length = "15";
        SType = "Currency";
        Label = "Total Payout Amount";
    }

    IN MIR-SRC-CF-EFF-DT
    {
        DisplayOnly;
        Length = "10";
        SType = "Date";
        Label = "Source Deposit Date";
    }

    IN MIR-SRC-CF-SEQ-NUM
    {
        DisplayOnly;
        Length = "3";
        SType = "Text";
        Label = "Source Sequence Number";
    }

    INOUT MIR-CDAD-ROLOVR-INT-RT-T[10]
    {
        Length = "7";
        Decimals = "4";
        FieldGroup = "Table10";
        SType = "Percent";
        Label = "Guaranteed Rollover Rate";
        Index = "1";
    }

    INOUT MIR-CDAD-TRXN-AMT-T[10]
    {
        Length = "15";
        FieldGroup = "Table10";
        SType = "Currency";
        Label = "Transferred Amount";
        Index = "1";
    }

    INOUT MIR-DEST-CVG-NUM-T[10]
    {
        Length = "2";
        FieldGroup = "Table10";
        KeyColumn;
        SType = "Text";
        Label = "Destination Coverage Number";
        Index = "1";
    }

    INOUT MIR-DPOS-TRM-DY-DUR-T[10]
    {
        Length = "3";
        FieldGroup = "Table10";
        SType = "Text";
        Label = "Deposit Term - Days";
        Index = "1";
    }

    INOUT MIR-DPOS-TRM-MO-DUR-T[10]
    {
        Length = "3";
        FieldGroup = "Table10";
        SType = "Text";
        Label = "Deposit Term - Months";
        Index = "1";
    }

    IN MIR-CDA-EFF-DT
    {
        Key;
        DisplayOnly;
        Length = "10";
        SType = "Date";
        Label = "Effective Date";
    }

    IN MIR-DEST-CVG-NUM
    {
        Key;
        DisplayOnly;
        Length = "2";
        SType = "Text";
        Label = "Coverage Number";
    }

    IN MIR-DEST-POL-ID-BASE
    {
        Key;
        DisplayOnly;
        Length = "9";
        DefaultSession = "MIR-POL-ID-BASE";
        SType = "Text";
        Label = "Policy Id";
    }

    IN MIR-DEST-POL-ID-SFX
    {
        Key;
        DisplayOnly;
        Length = "1";
        DefaultSession = "MIR-POL-ID-SFX";
        SType = "Text";
        Label = "Suffix";
    }

    IN MIR-DEST-SEQ-NUM
    {
        Key;
        DisplayOnly;
        Length = "3";
        SType = "Text";
        Label = "Sequence Number";
    }

}

