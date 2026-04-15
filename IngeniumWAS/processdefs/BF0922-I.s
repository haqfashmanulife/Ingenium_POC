# Converted from PathFinder 2.2 to 3.0 Jun 18, 2004 3:12:31 PM EDT

#*******************************************************************************
#*  Component:   BF0922-I.s                                                    *
#*  Description:                                                               *
#*                                                                             *
#*******************************************************************************
#*  Chg#    Release  Description                                               *
#*                                                                             *
#*  014590  6.0      New for release 6.0                                       *
#*  017150  612J     Remove Currency Decimals = "2"                            *
#*                                                                             *
#*******************************************************************************

S-STEP BF0922-I
{
    ATTRIBUTES
    {
        Type = "Input";
        DelEmptyRows;
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

    INOUT MIR-CDI-ALLOC-AMT-T[10]
    {
        Length = "15";
        Decimals = "2";
        FieldGroup = "Table10";
        SType = "Number";
        Label = "Amount / Percent / No. of Units";
        Index = "1";
    }

    INOUT MIR-CDI-ALLOC-CD-T[10]
    {
        Length = "1";
        FieldGroup = "Table10";
        CodeSource = "DataModel";
        CodeType = "CDI-ALLOC-CD";
        SType = "Selection";
        Label = "Allocation Basis";
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
        Label = "Deposit Term (Days)";
        Index = "1";
    }

    INOUT MIR-DPOS-TRM-MO-DUR-T[10]
    {
        Length = "3";
        FieldGroup = "Table10";
        SType = "Text";
        Label = "Deposit Term (Months)";
        Index = "1";
    }

    IN MIR-CDI-EFF-DT
    {
        Key;
        DisplayOnly;
        Length = "10";
        SType = "Date";
        Label = "Effective Date";
    }

    IN MIR-CVG-NUM
    {
        Key;
        DisplayOnly;
        Length = "2";
        DefaultConstant = "01";
        SType = "Text";
        Label = "Coverage Number";
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

