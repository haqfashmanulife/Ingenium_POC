# Converted from PathFinder 2.2 to 3.0 Jun 18, 2004 3:12:23 PM EDT

#*******************************************************************************
#*  Component:   BF0512-I.s                                                    *
#*  Description:                                                               *
#*                                                                             *
#*******************************************************************************
#*  Chg#    Release  Description                                               *
#*                                                                             *
#*  014590  6.0      New for release 6.0                                       *
#*  017150  612J     Remove Currency Decimals = "2"                            *
#*  017673  612J     Change Amount/Percent decimals to 2                       *
#*                                                                             *
#*******************************************************************************

S-STEP BF0512-I
{
    ATTRIBUTES
    {
        BusinessFunctionType = "Update";
        Type = "Input";
        FocusField = "MIR-MTHV-FND-STAT-CD";
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

    INOUT MIR-CVG-NUM-T[20]
    {
        Length = "2";
        Decimals = "0";
        FieldGroup = "Table20";
        KeyColumn;
        SType = "Text";
        Label = "Coverage Number";
        Index = "1";
    }

    INOUT MIR-MTHV-FND-STAT-CD
    {
        Mandatory;
        Length = "40";
        CodeSource = "DataModel";
        CodeType = "MTHV-FND-STAT-CD";
        SType = "Selection";
        Label = "Selection Status";
    }

    INOUT MIR-MTHV-FND-WTHDR-AMT-T[20]
    {
        Length = "17";
        Decimals = "2";
        FieldGroup = "Table20";
        SType = "Number";
        Label = "Withdrawal Amount/Percent";
        Index = "1";
    }

    INOUT MIR-MTHV-FND-WTHDR-CD-T[20]
    {
        Length = "40";
        FieldGroup = "Table20";
        CodeSource = "DataModel";
        CodeType = "MTHV-FND-WTHDR-CD";
        SType = "Selection";
        Label = "Withdrawal Method";
        Index = "1";
    }

    INOUT MIR-MTHV-FND-WTHDR-NUM-T[20]
    {
        Length = "3";
        Decimals = "0";
        FieldGroup = "Table20";
        SType = "Text";
        Label = "Sequence Number";
        Index = "1";
    }

    IN MIR-MTHV-FND-EFF-DT
    {
        Key;
        DisplayOnly;
        Length = "10";
        DefaultSession = "LSIR-PRCES-DT";
        SType = "Date";
        Label = "Effective Date";
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

}

