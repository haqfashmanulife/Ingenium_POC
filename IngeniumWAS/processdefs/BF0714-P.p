# Converted from PathFinder 2.2 to 3.0 Jun 18, 2004 3:13:27 PM EDT

#*******************************************************************************
#*  Component:   BF0714-P.p                                                    *
#*  Description:                                                               *
#*                                                                             *
#*******************************************************************************
#*  Chg#    Release  Description                                               *
#*                                                                             *
#*  014590  6.0      New for release 6.0                                       *
#*  017150  612J     Remove Currency Decimals = "2"                            *
#*                                                                             *
#*******************************************************************************

P-STEP BF0714-P
{
    ATTRIBUTES
    {
        BusinessFunctionId = "0714";
        BusinessFunctionName = "Immediate Annuity Quote List";
        BusinessFunctionType = "List";
        MirName = "CCWM0851";
    }

    OUT LSIR-RETURN-CD;

    OUT MIR-RETRN-CD;

    INOUT MIR-IA-QUOT-NUM
    {
        Key;
        Length = "6";
        DBTableName = "TQT";
        DefaultSession = "MIR-IA-QUOT-NUM";
        SType = "Text";
        Label = "Quote Number";
    }

    OUT MIR-ANUTNT-1-BTH-DT-T[12]
    {
        Length = "10";
        FieldGroup = "Table12";
        DBTableName = "TQT";
        SType = "Date";
        Label = "First Annuitant - Birth Date";
        Index = "1";
    }

    OUT MIR-ANUTNT-1-SEX-CD-T[12]
    {
        Length = "1";
        FieldGroup = "Table12";
        CodeSource = "DataModel";
        CodeType = "ANUTNT-SEX-CD";
        DBTableName = "TQT";
        SType = "Text";
        Label = "First Annuitant - Sex";
        Index = "1";
    }

    OUT MIR-CVG-NUM
    {
        Length = "2";
        DBTableName = "TQT";
        SType = "Text";
        Label = "Coverage Number";
    }

    OUT MIR-CVG-ORIG-CD
    {
        Length = "1";
        CodeSource = "EDIT";
        CodeType = "ORIG";
        DBTableName = "TCVG";
        SType = "Text";
        Label = "Origin of Funds";
    }

    OUT MIR-DV-FILE-RQST-CD
    {
        Length = "1";
        DBTableName = "Derived";
        SType = "Text";
        Label = "Quote Save Indicator";
    }

    OUT MIR-IA-GRS-SPREM-AMT-T[12]
    {
        Length = "15";
        FieldGroup = "Table12";
        DBTableName = "TQT";
        SType = "Currency";
        Label = "Gross Single Premium";
        Index = "1";
    }

    OUT MIR-IA-GUAR-MO-DUR-T[12]
    {
        Length = "2";
        FieldGroup = "Table12";
        DBTableName = "TQT";
        SType = "Text";
        Label = "Number of Months";
        Index = "1";
    }

    OUT MIR-IA-GUAR-YR-DUR-T[12]
    {
        Length = "2";
        FieldGroup = "Table12";
        DBTableName = "TQT";
        SType = "Text";
        Label = "Number of Years";
        Index = "1";
    }

    OUT MIR-IA-QUOT-AGT-NM-TXT-T[12]
    {
        Length = "20";
        FieldGroup = "Table12";
        DBTableName = "TQT";
        SType = "Text";
        Label = "Agent Name";
        Index = "1";
    }

    OUT MIR-IA-QUOT-INCM-AMT-T[12]
    {
        Signed;
        Length = "13";
        FieldGroup = "Table12";
        DBTableName = "TQT";
        SType = "Currency";
        Label = "Ultimate Periodic Income";
        Index = "1";
    }

    OUT MIR-IA-QUOT-NUM-T[12]
    {
        Length = "6";
        FieldGroup = "Table12";
        KeyColumn;
        DBTableName = "TQT";
        SType = "Text";
        Label = "Quote Number";
        Index = "1";
    }

    OUT MIR-IA-QUOT-STAT-CD-T[12]
    {
        Length = "40";
        FieldGroup = "Table12";
        CodeSource = "DataModel";
        CodeType = "IA-QUOT-STAT-CD";
        DBTableName = "TQT";
        SType = "Text";
        Label = "Quote Status";
        Index = "1";
    }

    OUT MIR-IA-QUOT-TYP-CD-T[12]
    {
        Length = "40";
        FieldGroup = "Table12";
        CodeSource = "DataModel";
        CodeType = "IA-QUOT-TYP-CD";
        DBTableName = "TQT";
        SType = "Text";
        Label = "Annuity Type";
        Index = "1";
    }

    OUT MIR-POL-ID-BASE
    {
        Length = "9";
        DBTableName = "TQT";
        SType = "Text";
        Label = "Policy Id";
    }

    OUT MIR-POL-ID-SFX
    {
        Length = "1";
        DBTableName = "TQT";
        SType = "Text";
        Label = "Suffix";
    }

    OUT MIR-REPL-IA-QUOT-NUM
    {
        Length = "6";
        DBTableName = "TQT";
        SType = "Text";
        Label = "Replaced / Replacing Quote Number";
    }

}

