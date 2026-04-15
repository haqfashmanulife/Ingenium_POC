# Converted from PathFinder 2.2 to 3.0 Jun 18, 2004 3:12:31 PM EDT

#*******************************************************************************
#*  Component:   BF0884-O.s                                                    *
#*  Description:                                                               *
#*                                                                             *
#*******************************************************************************
#*  Chg#    Release  Description                                               *
#*                                                                             *
#*  014590  6.0      New for release 6.0                                       *
#*  017150  612J     Remove Currency Decimals = "2"                            *
#*                                                                             *
#*******************************************************************************

S-STEP BF0884-O
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

    INOUT MIR-T4RSP-RHST-DT
    {
        Key;
        Mandatory;
        Length = "10";
        DefaultSession = "LSIR-PRCES-DT";
        SType = "Date";
        Label = "Effective Date";
    }

    INOUT MIR-T4RSP-RHST-SEQ-NUM
    {
        Key;
        Mandatory;
        Length = "3";
        DefaultConstant = "000";
        SType = "Text";
        Label = "Sequence Number";
    }

    IN MIR-FED-TAXWH-YTD-AMT-T[100]
    {
        DisplayOnly;
        Length = "15";
        FieldGroup = "Table100";
        SType = "Currency";
        Label = "Federal Tax Withheld";
        Index = "1";
    }

    IN MIR-PROV-TAXWH-YTD-AMT-T[100]
    {
        DisplayOnly;
        Length = "15";
        FieldGroup = "Table100";
        SType = "Currency";
        Label = "Provincial Tax Withheld";
        Index = "1";
    }

    IN MIR-T4RSP-RHST-DT-T[100]
    {
        DisplayOnly;
        Length = "10";
        FieldGroup = "Table100";
        SType = "Date";
        Label = "Effective Date";
        Index = "1";
    }

    IN MIR-T4RSP-RHST-ORIG-DT-T[100]
    {
        DisplayOnly;
        Length = "9";
        FieldGroup = "Table100";
        SType = "Date";
        Label = "Original T4RSP Receipt Date";
        Index = "1";
    }

    IN MIR-T4RSP-RHST-SEQ-NUM-T[100]
    {
        DisplayOnly;
        Length = "3";
        FieldGroup = "Table100";
        KeyColumn;
        Link;
        SType = "Text";
        Label = "Sequence Number";
        Action = "SelectItem";
        Index = "1";
    }

    IN MIR-T4RSP-RHST-STAT-CD-T[100]
    {
        DisplayOnly;
        Length = "1";
        FieldGroup = "Table100";
        CodeSource = "DataModel";
        CodeType = "T4RSP-RHST-STAT-CD";
        SType = "Text";
        Label = "Status";
        Index = "1";
    }

    IN MIR-T4RSP-RHST-TAX-YR-T[100]
    {
        DisplayOnly;
        Length = "4";
        FieldGroup = "Table100";
        SType = "Year";
        Label = "Taxation Year Receipt Applies";
        Index = "1";
    }

}

