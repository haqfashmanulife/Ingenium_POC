# Converted from PathFinder 2.2 to 3.0 Jun 18, 2004 3:12:36 PM EDT

#*******************************************************************************
#*  Component:   BF1214-O.s                                                    *
#*  Description:                                                               *
#*                                                                             *
#*******************************************************************************
#*  Chg#    Release  Description                                               *
#*                                                                             *
#*  014590  6.0      New for release 6.0                                       *
#*  017150  612J     Remove Currency Decimals = "2"                            *
#*                                                                             *
#*******************************************************************************

S-STEP BF1214-O
{
    ATTRIBUTES
    {
        BusinessFunctionType = "List";
        Type = "Output";
        DelEmptyRows;
        FocusField = "MIR-RTBL-ID";
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

    INOUT MIR-DPOS-TRM-DY-DUR
    {
        Key;
        Length = "3";
        DefaultConstant = "000";
        SType = "Text";
        Label = "Deposit Term - Days";
    }

    INOUT MIR-DPOS-TRM-MO-DUR
    {
        Key;
        Length = "3";
        DefaultConstant = "000";
        SType = "Text";
        Label = "Deposit Term - Months";
    }

    INOUT MIR-LOC-GR-ID
    {
        Length = "3";
        CodeSource = "EDIT";
        CodeType = "LOCGP";
        SType = "Selection";
        Label = "Location Group";
    }

    INOUT MIR-RTBL-AGE
    {
        Key;
        Length = "3";
        SType = "Text";
        Label = "Issue or Attained Age";
    }

    INOUT MIR-RTBL-DB-OPT-CD
    {
        Key;
        Length = "1";
        CodeSource = "DataModel";
        CodeType = "RTBL-DB-OPT-CD";
        SType = "Selection";
        Label = "Death Benefit Option";
    }

    INOUT MIR-RTBL-ID
    {
        Key;
        Length = "6";
        CodeSource = "EDIT";
        CodeType = "RLTB";
        SType = "Selection";
        Label = "Rate Load Table ID";
    }

    INOUT MIR-RTBL-IDT-NUM
    {
        Key;
        Length = "10";
        DefaultSession = "LSIR-PRCES-DT";
        SType = "Date";
        Label = "Effective Date";
    }

    INOUT MIR-RTBL-JNT-LIFE-CD
    {
        Key;
        Length = "1";
        CodeSource = "DataModel";
        CodeType = "RTBL-JNT-LIFE-CD";
        SType = "Selection";
        Label = "Joint Life Type";
    }

    INOUT MIR-RTBL-PAR-CD
    {
        Key;
        Length = "1";
        CodeSource = "DataModel";
        CodeType = "RTBL-PAR-CD";
        SType = "Selection";
        Label = "Dividend Option";
    }

    INOUT MIR-RTBL-PNSN-QUALF-CD
    {
        Key;
        Length = "1";
        CodeSource = "DataModel";
        CodeType = "RTBL-PNSN-QUALF-CD";
        SType = "Selection";
        Label = "Pension Qualifier Code";
    }

    INOUT MIR-RTBL-RT-TYP-CD
    {
        Key;
        Length = "5";
        CodeSource = "EDIT";
        CodeType = "RTTYP";
        SType = "Selection";
        Label = "Rate Type";
    }

    INOUT MIR-RTBL-SEX-CD
    {
        Key;
        Length = "1";
        CodeSource = "DataModel";
        CodeType = "RTBL-SEX-CD";
        SType = "Selection";
        Label = "Sex";
    }

    INOUT MIR-RTBL-SMKR-CD
    {
        Key;
        Length = "1";
        CodeSource = "DataModel";
        CodeType = "RTBL-SMKR-CD";
        SType = "Selection";
        Label = "Smoker Status";
    }

    INOUT MIR-RTBL-STBL-1-CD
    {
        Key;
        Length = "2";
        CodeSource = "EDIT";
        CodeType = "STB1";
        SType = "Selection";
        Label = "Sub-table 1";
    }

    INOUT MIR-RTBL-STBL-2-CD
    {
        Key;
        Length = "3";
        CodeSource = "EDIT";
        CodeType = "STB2";
        SType = "Selection";
        Label = "Sub-table 2";
    }

    INOUT MIR-RTBL-STBL-3-CD
    {
        Key;
        Length = "5";
        CodeSource = "EDIT";
        CodeType = "STB3";
        SType = "Selection";
        Label = "Sub-table 3";
    }

    INOUT MIR-RTBL-STBL-4-CD
    {
        Key;
        Length = "2";
        CodeSource = "EDIT";
        CodeType = "STB4";
        SType = "Selection";
        Label = "Sub-table 4";
    }

    IN MIR-DPOS-TRM-DY-DUR-T[30]
    {
        DisplayOnly;
        Length = "3";
        FieldGroup = "Table11";
        SType = "Text";
        Label = "Deposit Term - Days";
        Index = "1";
    }

    IN MIR-DPOS-TRM-MO-DUR-T[30]
    {
        DisplayOnly;
        Length = "3";
        FieldGroup = "Table11";
        SType = "Text";
        Label = "Deposit Term - Months";
        Index = "1";
    }

    IN MIR-DV-END-RTBL-AGE-DUR-T[30]
    {
        DisplayOnly;
        Length = "3";
        Decimals = "0";
        FieldGroup = "Table11";
        SType = "Number";
        Label = "End Age / Duration";
        Index = "1";
    }

    IN MIR-LOC-GR-ID-T[30]
    {
        DisplayOnly;
        Length = "40";
        FieldGroup = "Table11";
        CodeSource = "EDIT";
        CodeType = "LOCGP";
        SType = "Text";
        Label = "Location Group";
        Index = "1";
    }

    IN MIR-RTBL-AGE-DUR-T[30]
    {
        DisplayOnly;
        Length = "3";
        Decimals = "0";
        FieldGroup = "Table11";
        SType = "Number";
        Label = "Start Age / Duration";
        Index = "1";
    }

    IN MIR-RTBL-AGE-T[30]
    {
        DisplayOnly;
        Length = "3";
        FieldGroup = "Table11";
        SType = "Text";
        Label = "Issue or Attained Age";
        Index = "1";
    }

    IN MIR-RTBL-DB-OPT-CD-T[30]
    {
        DisplayOnly;
        Length = "1";
        FieldGroup = "Table11";
        CodeSource = "DataModel";
        CodeType = "RTBL-DB-OPT-CD";
        SType = "Text";
        Label = "Death Benefit Option";
        Index = "1";
    }

    IN MIR-RTBL-ID-T[30]
    {
        DisplayOnly;
        Length = "6";
        FieldGroup = "Table11";
        KeyColumn;
        CodeSource = "EDIT";
        CodeType = "RLTB";
        Link;
        SType = "Text";
        Label = "Rate Load Table ID";
        Action = "SelectItem";
        Index = "1";
    }

    IN MIR-RTBL-IDT-NUM-T[30]
    {
        DisplayOnly;
        Length = "10";
        FieldGroup = "Table11";
        SType = "Date";
        Label = "Effective Date";
        Index = "1";
    }

    IN MIR-RTBL-JNT-LIFE-CD-T[30]
    {
        DisplayOnly;
        Length = "1";
        FieldGroup = "Table11";
        CodeSource = "DataModel";
        CodeType = "RTBL-JNT-LIFE-CD";
        SType = "Text";
        Label = "Joint Life Type";
        Index = "1";
    }

    IN MIR-RTBL-PAR-CD-T[30]
    {
        DisplayOnly;
        Length = "1";
        FieldGroup = "Table11";
        CodeSource = "DataModel";
        CodeType = "RTBL-PAR-CD";
        SType = "Text";
        Label = "Dividend Option";
        Index = "1";
    }

    IN MIR-RTBL-PNSN-QUALF-CD-T[30]
    {
        DisplayOnly;
        Length = "1";
        FieldGroup = "Table11";
        CodeSource = "DataModel";
        CodeType = "RTBL-PNSN-QUALF-CD";
        SType = "Text";
        Label = "Pension Qualifier Code";
        Index = "1";
    }

    IN MIR-RTBL-RT-TYP-CD-T[30]
    {
        DisplayOnly;
        Length = "5";
        FieldGroup = "Table11";
        CodeSource = "EDIT";
        CodeType = "RTTYP";
        SType = "Text";
        Label = "Rate Type";
        Index = "1";
    }

    IN MIR-RTBL-SEX-CD-T[30]
    {
        DisplayOnly;
        Length = "1";
        FieldGroup = "Table11";
        CodeSource = "DataModel";
        CodeType = "RTBL-SEX-CD";
        SType = "Text";
        Label = "Sex";
        Index = "1";
    }

    IN MIR-RTBL-SMKR-CD-T[30]
    {
        DisplayOnly;
        Length = "1";
        FieldGroup = "Table11";
        CodeSource = "DataModel";
        CodeType = "RTBL-SMKR-CD";
        SType = "Text";
        Label = "Smoker Status";
        Index = "1";
    }

    IN MIR-RTBL-STBL-1-CD-T[30]
    {
        DisplayOnly;
        Length = "2";
        FieldGroup = "Table11";
        CodeSource = "EDIT";
        CodeType = "STB1";
        SType = "Text";
        Label = "Sub-table 1";
        Index = "1";
    }

    IN MIR-RTBL-STBL-2-CD-T[30]
    {
        DisplayOnly;
        Length = "3";
        FieldGroup = "Table11";
        CodeSource = "EDIT";
        CodeType = "STB2";
        SType = "Text";
        Label = "Sub-table 2";
        Index = "1";
    }

    IN MIR-RTBL-STBL-3-CD-T[30]
    {
        DisplayOnly;
        Length = "5";
        FieldGroup = "Table11";
        CodeSource = "EDIT";
        CodeType = "STB3";
        SType = "Text";
        Label = "Sub-table 3";
        Index = "1";
    }

    IN MIR-RTBL-STBL-4-CD-T[30]
    {
        DisplayOnly;
        Length = "2";
        FieldGroup = "Table11";
        CodeSource = "EDIT";
        CodeType = "STB4";
        SType = "Text";
        Label = "Sub-table 4";
        Index = "1";
    }

}

