# Converted from PathFinder 2.2 to 3.0 Jun 18, 2004 3:12:31 PM EDT

#*******************************************************************************
#*  Component:   BF0874-O.s                                                    *
#*  Description:                                                               *
#*                                                                             *
#*******************************************************************************
#*  Chg#    Release  Description                                               *
#*                                                                             *
#*  014590  6.0      New for release 6.0                                       *
#*  017150  612J     Remove Currency Decimals = "2"                            *
#*                                                                             *
#*******************************************************************************

S-STEP BF0874-O
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

    INOUT MIR-RRSP-RHST-DT
    {
        Key;
        Length = "10";
        DefaultSession = "LSIR-PRCES-DT";
        SType = "Date";
        Label = "Effective Date";
    }

    INOUT MIR-RRSP-RHST-SEQ-NUM
    {
        Key;
        Mandatory;
        Length = "3";
        DefaultConstant = "000";
        SType = "Text";
        Label = "Sequence Number";
    }

    INOUT MIR-RRSP-RHST-TYP-CD
    {
        Length = "1";
        CodeSource = "DataModel";
        CodeType = "RRSP-RHST-TYP-CD";
        SType = "Selection";
        Label = "Receipt Printed For";
    }

    IN MIR-RRSP-RECPT-NUM-T[100]
    {
        DisplayOnly;
        Length = "7";
        FieldGroup = "Table100";
        KeyColumn;
        Link;
        SType = "Text";
        Label = "Receipt Number";
        Action = "SelectItem";
        Index = "1";
    }

    IN MIR-RRSP-RHST-1-AMT-T[100]
    {
        DisplayOnly;
        Length = "13";
        FieldGroup = "Table100";
        SType = "Currency";
        Label = "Receipts (March - December)";
        Index = "1";
    }

    IN MIR-RRSP-RHST-2-AMT-T[100]
    {
        DisplayOnly;
        Length = "13";
        FieldGroup = "Table100";
        SType = "Currency";
        Label = "Receipts (January - February)";
        Index = "1";
    }

    IN MIR-RRSP-RHST-DT-T[100]
    {
        DisplayOnly;
        Length = "10";
        FieldGroup = "Table100";
        SType = "Date";
        Label = "Effective Date";
        Index = "1";
    }

    IN MIR-RRSP-RHST-ORIG-DT-T[100]
    {
        DisplayOnly;
        Length = "10";
        FieldGroup = "Table100";
        SType = "Date";
        Label = "Date Receipt Originally Printed";
        Index = "1";
    }

    IN MIR-RRSP-RHST-SEQ-NUM-T[100]
    {
        DisplayOnly;
        Length = "3";
        FieldGroup = "Table100";
        SType = "Text";
        Label = "Sequence Number";
        Index = "1";
    }

    IN MIR-RRSP-RHST-STAT-CD-T[100]
    {
        DisplayOnly;
        Length = "1";
        FieldGroup = "Table100";
        CodeSource = "DataModel";
        CodeType = "RRSP-RHST-STAT-CD";
        SType = "Text";
        Label = "Status of Receipt";
        Index = "1";
    }

    IN MIR-RRSP-RHST-TAX-YR-T[100]
    {
        DisplayOnly;
        Length = "4";
        FieldGroup = "Table100";
        SType = "Year";
        Label = "Tax Year Receipt Applicable";
        Index = "1";
    }

    IN MIR-RRSP-RHST-TYP-CD-T[100]
    {
        DisplayOnly;
        Length = "1";
        FieldGroup = "Table100";
        CodeSource = "DataModel";
        CodeType = "RRSP-RHST-TYP-CD";
        SType = "Text";
        Label = "Receipt Printed For";
        Index = "1";
    }

}

