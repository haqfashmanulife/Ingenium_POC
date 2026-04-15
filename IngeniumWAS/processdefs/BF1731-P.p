# Converted from PathFinder 2.2 to 3.0 Jun 18, 2004 3:13:44 PM EDT

#*******************************************************************************
#*  Component:   BF1731-P.p                                                    *
#*  Description:                                                               *
#*                                                                             *
#*******************************************************************************
#*  Chg#    Release  Description                                               *
#*                                                                             *
#*  014590  6.0      New for release 6.0                                       *
#*  017150  612J     Remove Currency Decimals = "2"                            *
#*                                                                             *
#*******************************************************************************

P-STEP BF1731-P
{
    ATTRIBUTES
    {
        BusinessFunctionId = "1731";
        BusinessFunctionName = "Fund Inquiry - Activity";
        BusinessFunctionType = "Actv";
        MirName = "SCWM0020";
    }

    OUT LSIR-RETURN-CD;

    OUT MIR-RETRN-CD;

    INOUT MIR-CIA-EFF-DT
    {
        Key;
        Mandatory;
        Length = "10";
        DBTableName = "TFA";
        DefaultSession = "LSIR-PRCES-DT";
        SType = "Date";
        Label = "Activity Effective Date";
    }

    INOUT MIR-CIA-SEQ-NUM
    {
        Key;
        Mandatory;
        Length = "3";
        DBTableName = "TFA";
        DefaultConstant = "999";
        SType = "Text";
        Label = "Sequence Number";
    }

    INOUT MIR-CIA-TYP-CD
    {
        Length = "3";
        CodeSource = "DataModel";
        CodeType = "CIA-TYP-CD";
        DBTableName = "TFA";
        SType = "Selection";
        Label = "Activity Type";
    }

    IN MIR-CVG-NUM
    {
        Key;
        Mandatory;
        Length = "2";
        DBTableName = "TFA";
        DefaultConstant = "01";
        SType = "Text";
        Label = "Coverage Number";
    }

    IN MIR-POL-ID-BASE
    {
        Key;
        Mandatory;
        Length = "9";
        DBTableName = "TFA";
        DefaultSession = "MIR-POL-ID-BASE";
        SType = "Text";
        Label = "Policy Id";
    }

    IN MIR-POL-ID-SFX
    {
        Key;
        Length = "1";
        DBTableName = "TFA";
        DefaultSession = "MIR-POL-ID-SFX";
        SType = "Text";
        Label = "Suffix";
    }

    OUT MIR-CFN-STAT-CD
    {
        Length = "40";
        CodeSource = "DataModel";
        CodeType = "CFN-STAT-CD";
        DBTableName = "TFS";
        SType = "Selection";
        Label = "Status";
    }

    OUT MIR-CIA-CLI-TRXN-AMT-T[50]
    {
        Signed;
        Length = "15";
        FieldGroup = "Table50";
        DBTableName = "TFA";
        SType = "Currency";
        Label = "Total Premium Received";
        Index = "1";
    }

    OUT MIR-CIA-EFF-DT-T[50]
    {
        Length = "10";
        FieldGroup = "Table50";
        DBTableName = "TFA";
        SType = "Date";
        Label = "Activity Effective Date";
        Index = "1";
    }

    OUT MIR-CIA-FND-TRXN-AMT-T[50]
    {
        Signed;
        Length = "15";
        FieldGroup = "Table50";
        DBTableName = "TFA";
        SType = "Currency";
        Label = "Net Amount";
        Index = "1";
    }

    OUT MIR-CIA-LOAD-AMT-T[50]
    {
        Signed;
        Length = "15";
        FieldGroup = "Table50";
        DBTableName = "TFA";
        SType = "Currency";
        Label = "Transfer Charges";
        Index = "1";
    }

    OUT MIR-CIA-REASN-CD-T[50]
    {
        Length = "3";
        FieldGroup = "Table50";
        CodeSource = "DataModel";
        CodeType = "CIA-REASN-CD";
        DBTableName = "TFA";
        SType = "Text";
        Label = "Surrender Reason";
        Index = "1";
    }

    OUT MIR-CIA-REVRS-PRCES-DT-T[50]
    {
        Length = "9";
        FieldGroup = "Table50";
        DBTableName = "TFA";
        SType = "Date";
        Label = "Effective Date of Reversal";
        Index = "1";
    }

    OUT MIR-CIA-SEQ-NUM-T[50]
    {
        Length = "2";
        FieldGroup = "Table50";
        DBTableName = "TFA";
        SType = "Text";
        Label = "Sequence Number";
        Index = "1";
    }

    OUT MIR-CIA-TYP-CD-T[50]
    {
        Length = "3";
        FieldGroup = "Table50";
        KeyColumn;
        CodeSource = "DataModel";
        CodeType = "CIA-TYP-CD";
        DBTableName = "TFA";
        SType = "Text";
        Label = "Activity Type";
        Index = "1";
    }

}

