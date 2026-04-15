# Converted from PathFinder 2.2 to 3.0 Jun 18, 2004 3:13:30 PM EDT

#*******************************************************************************
#*  Component:   BF0872-P.p                                                    *
#*  Description:                                                               *
#*                                                                             *
#*******************************************************************************
#*  Chg#    Release  Description                                               *
#*                                                                             *
#*  014590  6.0      New for release 6.0                                       *
#*  017150  612J     Remove Currency Decimals = "2"                            *
#*                                                                             *
#*******************************************************************************

P-STEP BF0872-P
{
    ATTRIBUTES
    {
        BusinessFunctionId = "0872";
        BusinessFunctionName = "RRSP Receipt History Update";
        BusinessFunctionType = "Update";
        MirName = "CCWM3700";
    }

    OUT LSIR-RETURN-CD;

    OUT MIR-RETRN-CD;

    OUT MIR-CLI-ADDR-TYP-CD
    {
        Length = "40";
        CodeSource = "EDIT";
        CodeType = "ADTYP";
        DBTableName = "TRHST";
        SType = "Selection";
        Label = "Address Type";
    }

    INOUT MIR-RRSP-REG-1-AMT
    {
        Length = "13";
        DBTableName = "TRHST";
        SType = "Currency";
        Label = "Contribution (March - December)";
    }

    INOUT MIR-RRSP-REG-2-AMT
    {
        Length = "13";
        DBTableName = "TRHST";
        SType = "Currency";
        Label = "Contribution (January - February)";
    }

    INOUT MIR-RRSP-REG-SPCL-AMT
    {
        Length = "13";
        DBTableName = "TRHST";
        SType = "Currency";
        Label = "Special Receipt Amount";
    }

    INOUT MIR-RRSP-RHST-1-AMT
    {
        Length = "13";
        DBTableName = "TRHST";
        SType = "Currency";
        Label = "Receipts (March - December)";
    }

    INOUT MIR-RRSP-RHST-2-AMT
    {
        Length = "13";
        DBTableName = "TRHST";
        SType = "Currency";
        Label = "Receipts (January - February)";
    }

    INOUT MIR-RRSP-RHST-DT
    {
        Key;
        Mandatory;
        Length = "10";
        DBTableName = "TRHST";
        DefaultSession = "LSIR-PRCES-DT";
        SType = "Date";
        Label = "Effective Date";
    }

    IN MIR-POL-ID-BASE
    {
        Key;
        Mandatory;
        Length = "9";
        DBTableName = "TRHST";
        DefaultSession = "MIR-POL-ID-BASE";
        SType = "Text";
        Label = "Policy Id";
    }

    IN MIR-POL-ID-SFX
    {
        Key;
        Length = "1";
        DBTableName = "TRHST";
        DefaultSession = "MIR-POL-ID-SFX";
        SType = "Text";
        Label = "Suffix";
    }

    IN MIR-RRSP-RHST-SEQ-NUM
    {
        Key;
        Mandatory;
        Length = "3";
        DBTableName = "TRHST";
        DefaultConstant = "000";
        SType = "Text";
        Label = "Sequence Number";
    }

    OUT MIR-RRSP-RHST-TYP-CD
    {
        Length = "1";
        CodeSource = "DataModel";
        CodeType = "RRSP-RHST-TYP-CD";
        DBTableName = "TRHST";
        SType = "Selection";
        Label = "Receipt Printed For";
    }

    OUT MIR-CLI-ADDR-LN-3-TXT-T[4]
    {
        Length = "25";
        FieldGroup = "Table4";
        DBTableName = "TRHST";
        SType = "Text";
        Label = "Address";
        Index = "1";
    }

    OUT MIR-CLI-TAX-ID
    {
        Length = "9";
        DBTableName = "TCLI";
        SType = "Text";
        Label = "Tax Identification Number";
    }

    OUT MIR-DV-ANUTNT-CLI-NM
    {
        Length = "75";
        DBTableName = "Derived";
        SType = "Text";
        Label = "Annuitant Name";
    }

    OUT MIR-DV-SPOUS-CLI-NM
    {
        Length = "75";
        DBTableName = "Derived";
        SType = "Text";
        Label = "Spouse's Name";
    }

    OUT MIR-PLAN-ID
    {
        Length = "40";
        CodeSource = "EDIT";
        CodeType = "PLAN";
        DBTableName = "TRHST";
        SType = "Text";
        Label = "Plan";
    }

    OUT MIR-POL-REG-CD
    {
        Length = "1";
        CodeSource = "DataModel";
        CodeType = "POL-REG-CD";
        DBTableName = "TRHST";
        SType = "Text";
        Label = "Registered Status";
    }

    OUT MIR-POL-REG-DT
    {
        Length = "10";
        DBTableName = "TRHST";
        SType = "Date";
        Label = "Date Policy Registered";
    }

    OUT MIR-RRSP-FND-SRC-CD
    {
        Length = "1";
        CodeSource = "DataModel";
        CodeType = "REG-FND-SRC-CD";
        DBTableName = "TRHST";
        SType = "Text";
        Label = "Fund Source";
    }

    OUT MIR-RRSP-RECPT-NUM
    {
        Length = "7";
        DBTableName = "TRHST";
        SType = "Text";
        Label = "Receipt Number";
    }

    OUT MIR-RRSP-RHST-ORIG-DT
    {
        Length = "10";
        DBTableName = "TRHST";
        SType = "Date";
        Label = "Date Receipt Originally Printed";
    }

    OUT MIR-RRSP-RHST-STAT-CD
    {
        Length = "1";
        CodeSource = "DataModel";
        CodeType = "RRSP-RHST-STAT-CD";
        DBTableName = "TRHST";
        SType = "Text";
        Label = "Status of Receipt";
    }

    OUT MIR-RRSP-RHST-TAX-YR
    {
        Length = "4";
        DBTableName = "TRHST";
        SType = "Year";
        Label = "Tax Year Receipt Applicable";
    }

    OUT MIR-SPOUS-SIN-ID
    {
        Length = "9";
        DBTableName = "TRHST";
        SType = "Text";
        Label = "Spouse's SIN / SSN";
    }

}

