# Converted from PathFinder 2.2 to 3.0 Jun 18, 2004 3:13:30 PM EDT

#*******************************************************************************
#*  Component:   BF0874-P.p                                                    *
#*  Description:                                                               *
#*                                                                             *
#*******************************************************************************
#*  Chg#    Release  Description                                               *
#*                                                                             *
#*  014590  6.0      New for release 6.0                                       *
#*  017150  612J     Remove Currency Decimals = "2"                            *
#*                                                                             *
#*******************************************************************************

P-STEP BF0874-P
{
    ATTRIBUTES
    {
        BusinessFunctionId = "0874";
        BusinessFunctionName = "RRSP Receipt List";
        BusinessFunctionType = "List";
        MirName = "CCWM3700";
        Description = "<p>To browse through existing RRSP Receipt History records on a policy:Type the policy number in the POLICY field, and the suffix in the SUFFIX field, if applicable.Type B in the ENTER field.Press the Enter key.RRSP Receipt History records will be listed starting with the most recent record.  If you have specified the DATE, SEQ, and TYPE fields, records will be listed starting with the values in those fields.</p>";
    }

    OUT LSIR-RETURN-CD;

    OUT MIR-RETRN-CD;

    INOUT MIR-POL-ID-BASE
    {
        Key;
        Mandatory;
        Length = "9";
        DBTableName = "TRHST";
        DefaultSession = "MIR-POL-ID-BASE";
        SType = "Text";
        Label = "Policy Id";
    }

    INOUT MIR-POL-ID-SFX
    {
        Key;
        Length = "1";
        DBTableName = "TRHST";
        DefaultSession = "MIR-POL-ID-SFX";
        SType = "Text";
        Label = "Suffix";
    }

    INOUT MIR-RRSP-RHST-DT
    {
        Key;
        Length = "10";
        DBTableName = "TRHST";
        DefaultSession = "LSIR-PRCES-DT";
        SType = "Date";
        Label = "Effective Date";
    }

    INOUT MIR-RRSP-RHST-SEQ-NUM
    {
        Key;
        Mandatory;
        Length = "3";
        DBTableName = "TRHST";
        DefaultConstant = "000";
        SType = "Text";
        Label = "Sequence Number";
    }

    INOUT MIR-RRSP-RHST-TYP-CD
    {
        Length = "1";
        CodeSource = "DataModel";
        CodeType = "RRSP-RHST-TYP-CD";
        DBTableName = "TRHST";
        SType = "Selection";
        Label = "Receipt Printed For";
    }

    OUT MIR-RRSP-RECPT-NUM-T[100]
    {
        Length = "7";
        FieldGroup = "Table100";
        KeyColumn;
        DBTableName = "TRHST";
        SType = "Text";
        Label = "Receipt Number";
        Index = "1";
    }

    OUT MIR-RRSP-RHST-1-AMT-T[100]
    {
        Length = "13";
        FieldGroup = "Table100";
        DBTableName = "TRHST";
        SType = "Currency";
        Label = "Receipts (March - December)";
        Index = "1";
    }

    OUT MIR-RRSP-RHST-2-AMT-T[100]
    {
        Length = "13";
        FieldGroup = "Table100";
        DBTableName = "TRHST";
        SType = "Currency";
        Label = "Receipts (January - February)";
        Index = "1";
    }

    OUT MIR-RRSP-RHST-DT-T[100]
    {
        Length = "10";
        FieldGroup = "Table100";
        DBTableName = "TRHST";
        SType = "Date";
        Label = "Effective Date";
        Index = "1";
    }

    OUT MIR-RRSP-RHST-ORIG-DT-T[100]
    {
        Length = "10";
        FieldGroup = "Table100";
        DBTableName = "TRHST";
        SType = "Date";
        Label = "Date Receipt Originally Printed";
        Index = "1";
    }

    OUT MIR-RRSP-RHST-SEQ-NUM-T[100]
    {
        Length = "3";
        FieldGroup = "Table100";
        DBTableName = "TRHST";
        SType = "Text";
        Label = "Sequence Number";
        Index = "1";
    }

    OUT MIR-RRSP-RHST-STAT-CD-T[100]
    {
        Length = "1";
        FieldGroup = "Table100";
        CodeSource = "DataModel";
        CodeType = "RRSP-RHST-STAT-CD";
        DBTableName = "TRHST";
        SType = "Text";
        Label = "Status of Receipt";
        Index = "1";
    }

    OUT MIR-RRSP-RHST-TAX-YR-T[100]
    {
        Length = "4";
        FieldGroup = "Table100";
        DBTableName = "TRHST";
        SType = "Year";
        Label = "Tax Year Receipt Applicable";
        Index = "1";
    }

    OUT MIR-RRSP-RHST-TYP-CD-T[100]
    {
        Length = "1";
        FieldGroup = "Table100";
        CodeSource = "DataModel";
        CodeType = "RRSP-RHST-TYP-CD";
        DBTableName = "TRHST";
        SType = "Text";
        Label = "Receipt Printed For";
        Index = "1";
    }

}

