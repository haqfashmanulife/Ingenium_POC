# Converted from PathFinder 2.2 to 3.0 Jun 18, 2004 3:13:35 PM EDT

#*******************************************************************************
#*  Component:   BF1214-P.p                                                    *
#*  Description:                                                               *
#*                                                                             *
#*******************************************************************************
#*  Chg#    Release  Description                                               *
#*                                                                             *
#*  014590  6.0      New for release 6.0                                       *
#*  017150  612J     Remove Currency Decimals = "2"                            *
#*                                                                             *
#*******************************************************************************

P-STEP BF1214-P
{
    ATTRIBUTES
    {
        BusinessFunctionId = "1214";
        BusinessFunctionName = "Rate List";
        BusinessFunctionType = "List";
        MirName = "CCWM1214";
    }

    OUT LSIR-RETURN-CD;

    OUT MIR-RETRN-CD;

    INOUT MIR-DPOS-TRM-DY-DUR
    {
        Key;
        Length = "3";
        DBTableName = "TRT";
        DefaultConstant = "000";
        SType = "Text";
        Label = "Deposit Term - Days";
    }

    INOUT MIR-DPOS-TRM-MO-DUR
    {
        Key;
        Length = "3";
        DBTableName = "TRT";
        DefaultConstant = "000";
        SType = "Text";
        Label = "Deposit Term - Months";
    }

    INOUT MIR-LOC-GR-ID
    {
        Length = "3";
        CodeSource = "EDIT";
        CodeType = "LOCGP";
        DBTableName = "TRT";
        SType = "Selection";
        Label = "Location Group";
    }

    INOUT MIR-RTBL-AGE
    {
        Key;
        Length = "3";
        DBTableName = "TRT";
        SType = "Text";
        Label = "Issue or Attained Age";
    }

    INOUT MIR-RTBL-DB-OPT-CD
    {
        Key;
        Length = "1";
        CodeSource = "DataModel";
        CodeType = "RTBL-DB-OPT-CD";
        DBTableName = "TRT";
        SType = "Selection";
        Label = "Death Benefit Option";
    }

    INOUT MIR-RTBL-ID
    {
        Key;
        Length = "6";
        CodeSource = "EDIT";
        CodeType = "RLTB";
        DBTableName = "TRT";
        SType = "Selection";
        Label = "Rate Load Table ID";
    }

    INOUT MIR-RTBL-IDT-NUM
    {
        Key;
        Length = "10";
        DBTableName = "TRT";
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
        DBTableName = "TRT";
        SType = "Selection";
        Label = "Joint Life Type";
    }

    INOUT MIR-RTBL-PAR-CD
    {
        Key;
        Length = "1";
        CodeSource = "DataModel";
        CodeType = "RTBL-PAR-CD";
        DBTableName = "TRT";
        SType = "Selection";
        Label = "Dividend Option";
    }

    INOUT MIR-RTBL-PNSN-QUALF-CD
    {
        Key;
        Length = "1";
        CodeSource = "DataModel";
        CodeType = "RTBL-PNSN-QUALF-CD";
        DBTableName = "TRT";
        SType = "Selection";
        Label = "Pension Qualifier Code";
    }

    INOUT MIR-RTBL-RT-TYP-CD
    {
        Key;
        Length = "5";
        CodeSource = "EDIT";
        CodeType = "RTTYP";
        DBTableName = "TRT";
        SType = "Selection";
        Label = "Rate Type";
    }

    INOUT MIR-RTBL-SEX-CD
    {
        Key;
        Length = "1";
        CodeSource = "DataModel";
        CodeType = "RTBL-SEX-CD";
        DBTableName = "TRT";
        SType = "Selection";
        Label = "Sex";
    }

    INOUT MIR-RTBL-SMKR-CD
    {
        Key;
        Length = "1";
        CodeSource = "DataModel";
        CodeType = "RTBL-SMKR-CD";
        DBTableName = "TRT";
        SType = "Selection";
        Label = "Smoker Status";
    }

    INOUT MIR-RTBL-STBL-1-CD
    {
        Key;
        Length = "2";
        CodeSource = "EDIT";
        CodeType = "STB1";
        DBTableName = "TRT";
        SType = "Selection";
        Label = "Sub-table 1";
    }

    INOUT MIR-RTBL-STBL-2-CD
    {
        Key;
        Length = "3";
        CodeSource = "EDIT";
        CodeType = "STB2";
        DBTableName = "TRT";
        SType = "Selection";
        Label = "Sub-table 2";
    }

    INOUT MIR-RTBL-STBL-3-CD
    {
        Key;
        Length = "5";
        CodeSource = "EDIT";
        CodeType = "STB3";
        DBTableName = "TRT";
        SType = "Selection";
        Label = "Sub-table 3";
    }

    INOUT MIR-RTBL-STBL-4-CD
    {
        Key;
        Length = "2";
        CodeSource = "EDIT";
        CodeType = "STB4";
        DBTableName = "TRT";
        SType = "Selection";
        Label = "Sub-table 4";
    }

    OUT MIR-DPOS-TRM-DY-DUR-T[30]
    {
        Length = "3";
        FieldGroup = "Table11";
        DBTableName = "TRT";
        SType = "Text";
        Label = "Deposit Term - Days";
        Index = "1";
    }

    OUT MIR-DPOS-TRM-MO-DUR-T[30]
    {
        Length = "3";
        FieldGroup = "Table11";
        DBTableName = "TRT";
        SType = "Text";
        Label = "Deposit Term - Months";
        Index = "1";
    }

    OUT MIR-DV-END-RTBL-AGE-DUR-T[30]
    {
        Length = "3";
        Decimals = "0";
        FieldGroup = "Table11";
        DBTableName = "TRT";
        SType = "Number";
        Label = "End Age / Duration";
        Index = "1";
    }

    OUT MIR-LOC-GR-ID-T[30]
    {
        Length = "40";
        FieldGroup = "Table11";
        CodeSource = "EDIT";
        CodeType = "LOCGP";
        DBTableName = "TRT";
        SType = "Text";
        Label = "Location Group";
        Index = "1";
    }

    OUT MIR-RTBL-AGE-DUR-T[30]
    {
        Length = "3";
        Decimals = "0";
        FieldGroup = "Table11";
        DBTableName = "TRT";
        SType = "Number";
        Label = "Start Age / Duration";
        Index = "1";
    }

    OUT MIR-RTBL-AGE-T[30]
    {
        Length = "3";
        FieldGroup = "Table11";
        DBTableName = "TRT";
        SType = "Text";
        Label = "Issue or Attained Age";
        Index = "1";
    }

    OUT MIR-RTBL-DB-OPT-CD-T[30]
    {
        Length = "1";
        FieldGroup = "Table11";
        CodeSource = "DataModel";
        CodeType = "RTBL-DB-OPT-CD";
        DBTableName = "TRT";
        SType = "Text";
        Label = "Death Benefit Option";
        Index = "1";
    }

    OUT MIR-RTBL-ID-T[30]
    {
        Length = "6";
        FieldGroup = "Table11";
        KeyColumn;
        CodeSource = "EDIT";
        CodeType = "RLTB";
        DBTableName = "TRT";
        SType = "Text";
        Label = "Rate Load Table ID";
        Index = "1";
    }

    OUT MIR-RTBL-IDT-NUM-T[30]
    {
        Length = "10";
        FieldGroup = "Table11";
        DBTableName = "TRT";
        SType = "Date";
        Label = "Effective Date";
        Index = "1";
    }

    OUT MIR-RTBL-JNT-LIFE-CD-T[30]
    {
        Length = "1";
        FieldGroup = "Table11";
        CodeSource = "DataModel";
        CodeType = "RTBL-JNT-LIFE-CD";
        DBTableName = "TRT";
        SType = "Text";
        Label = "Joint Life Type";
        Index = "1";
    }

    OUT MIR-RTBL-PAR-CD-T[30]
    {
        Length = "1";
        FieldGroup = "Table11";
        CodeSource = "DataModel";
        CodeType = "RTBL-PAR-CD";
        DBTableName = "TRT";
        SType = "Text";
        Label = "Dividend Option";
        Index = "1";
    }

    OUT MIR-RTBL-PNSN-QUALF-CD-T[30]
    {
        Length = "1";
        FieldGroup = "Table11";
        CodeSource = "DataModel";
        CodeType = "RTBL-PNSN-QUALF-CD";
        DBTableName = "TRT";
        SType = "Text";
        Label = "Pension Qualifier Code";
        Index = "1";
    }

    OUT MIR-RTBL-RT-TYP-CD-T[30]
    {
        Length = "5";
        FieldGroup = "Table11";
        CodeSource = "EDIT";
        CodeType = "RTTYP";
        DBTableName = "TRT";
        SType = "Text";
        Label = "Rate Type";
        Index = "1";
    }

    OUT MIR-RTBL-SEX-CD-T[30]
    {
        Length = "1";
        FieldGroup = "Table11";
        CodeSource = "DataModel";
        CodeType = "RTBL-SEX-CD";
        DBTableName = "TRT";
        SType = "Text";
        Label = "Sex";
        Index = "1";
    }

    OUT MIR-RTBL-SMKR-CD-T[30]
    {
        Length = "1";
        FieldGroup = "Table11";
        CodeSource = "DataModel";
        CodeType = "RTBL-SMKR-CD";
        DBTableName = "TRT";
        SType = "Text";
        Label = "Smoker Status";
        Index = "1";
    }

    OUT MIR-RTBL-STBL-1-CD-T[30]
    {
        Length = "2";
        FieldGroup = "Table11";
        CodeSource = "EDIT";
        CodeType = "STB1";
        DBTableName = "TRT";
        SType = "Text";
        Label = "Sub-table 1";
        Index = "1";
    }

    OUT MIR-RTBL-STBL-2-CD-T[30]
    {
        Length = "3";
        FieldGroup = "Table11";
        CodeSource = "EDIT";
        CodeType = "STB2";
        DBTableName = "TRT";
        SType = "Text";
        Label = "Sub-table 2";
        Index = "1";
    }

    OUT MIR-RTBL-STBL-3-CD-T[30]
    {
        Length = "5";
        FieldGroup = "Table11";
        CodeSource = "EDIT";
        CodeType = "STB3";
        DBTableName = "TRT";
        SType = "Text";
        Label = "Sub-table 3";
        Index = "1";
    }

    OUT MIR-RTBL-STBL-4-CD-T[30]
    {
        Length = "2";
        FieldGroup = "Table11";
        CodeSource = "EDIT";
        CodeType = "STB4";
        DBTableName = "TRT";
        SType = "Text";
        Label = "Sub-table 4";
        Index = "1";
    }

}

