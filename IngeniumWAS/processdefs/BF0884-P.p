# Converted from PathFinder 2.2 to 3.0 Jun 18, 2004 3:13:30 PM EDT

#*******************************************************************************
#*  Component:   BF0884-P.p                                                    *
#*  Description:                                                               *
#*                                                                             *
#*******************************************************************************
#*  Chg#    Release  Description                                               *
#*                                                                             *
#*  014590  6.0      New for release 6.0                                       *
#*  017150  612J     Remove Currency Decimals = "2"                            *
#*                                                                             *
#*******************************************************************************

P-STEP BF0884-P
{
    ATTRIBUTES
    {
        BusinessFunctionId = "0884";
        BusinessFunctionName = "T4RSP Receipt List";
        BusinessFunctionType = "List";
        MirName = "CCWM3800";
        Description;
    }

    OUT LSIR-RETURN-CD;

    OUT MIR-RETRN-CD;

    INOUT MIR-POL-ID-BASE
    {
        Key;
        Mandatory;
        Length = "9";
        DBTableName = "TTHST";
        DefaultSession = "MIR-POL-ID-BASE";
        SType = "Text";
        Label = "Policy Id";
    }

    INOUT MIR-POL-ID-SFX
    {
        Key;
        Length = "1";
        DBTableName = "TTHST";
        DefaultSession = "MIR-POL-ID-SFX";
        SType = "Text";
        Label = "Suffix";
    }

    INOUT MIR-T4RSP-RHST-DT
    {
        Key;
        Mandatory;
        Length = "10";
        DBTableName = "TTHST";
        DefaultSession = "LSIR-PRCES-DT";
        SType = "Date";
        Label = "Effective Date";
    }

    INOUT MIR-T4RSP-RHST-SEQ-NUM
    {
        Key;
        Mandatory;
        Length = "3";
        DBTableName = "TTHST";
        DefaultConstant = "000";
        SType = "Text";
        Label = "Sequence Number";
    }

    OUT MIR-FED-TAXWH-YTD-AMT-T[100]
    {
        Length = "15";
        FieldGroup = "Table100";
        DBTableName = "TTHST";
        SType = "Currency";
        Label = "Federal Tax Withheld";
        Index = "1";
    }

    OUT MIR-PROV-TAXWH-YTD-AMT-T[100]
    {
        Length = "15";
        FieldGroup = "Table100";
        DBTableName = "TTHST";
        SType = "Currency";
        Label = "Provincial Tax Withheld";
        Index = "1";
    }

    OUT MIR-T4RSP-RHST-DT-T[100]
    {
        Length = "10";
        FieldGroup = "Table100";
        DBTableName = "TTHST";
        SType = "Date";
        Label = "Effective Date";
        Index = "1";
    }

    OUT MIR-T4RSP-RHST-ORIG-DT-T[100]
    {
        Length = "9";
        FieldGroup = "Table100";
        DBTableName = "TTHST";
        SType = "Date";
        Label = "Original T4RSP Receipt Date";
        Index = "1";
    }

    OUT MIR-T4RSP-RHST-SEQ-NUM-T[100]
    {
        Length = "3";
        FieldGroup = "Table100";
        KeyColumn;
        DBTableName = "TTHST";
        SType = "Text";
        Label = "Sequence Number";
        Index = "1";
    }

    OUT MIR-T4RSP-RHST-STAT-CD-T[100]
    {
        Length = "1";
        FieldGroup = "Table100";
        CodeSource = "DataModel";
        CodeType = "T4RSP-RHST-STAT-CD";
        DBTableName = "TTHST";
        SType = "Text";
        Label = "Status";
        Index = "1";
    }

    OUT MIR-T4RSP-RHST-TAX-YR-T[100]
    {
        Length = "4";
        FieldGroup = "Table100";
        DBTableName = "TTHST";
        SType = "Year";
        Label = "Taxation Year Receipt Applies";
        Index = "1";
    }

}

