# Converted from PathFinder 2.2 to 3.0 Jun 18, 2004 3:13:28 PM EDT

#*******************************************************************************
#*  Component:   BF0764-P.p                                                    *
#*  Description:                                                               *
#*                                                                             *
#*******************************************************************************
#*  Chg#    Release  Description                                               *
#*                                                                             *
#*  014590  6.0      New for release 6.0                                       *
#*  017150  612J     Remove Currency Decimals = "2"                            *
#*                                                                             *
#*******************************************************************************

P-STEP BF0764-P
{
    ATTRIBUTES
    {
        BusinessFunctionId = "0764";
        BusinessFunctionName = "Policy Tax Summary History";
        BusinessFunctionType = "Taxs";
        MirName = "CCWM0931";
    }

    OUT LSIR-RETURN-CD;

    OUT MIR-RETRN-CD;

    INOUT MIR-POL-ID-BASE
    {
        Key;
        Mandatory;
        Length = "9";
        DBTableName = "THI";
        DefaultSession = "MIR-POL-ID-BASE";
        SType = "Text";
        Label = "Policy Id";
    }

    INOUT MIR-POL-ID-SFX
    {
        Key;
        Length = "1";
        DBTableName = "THI";
        DefaultSession = "MIR-POL-ID-SFX";
        SType = "Text";
        Label = "Suffix";
    }

    INOUT MIR-POL-TRXN-DT
    {
        Key;
        Length = "10";
        DBTableName = "THI";
        DefaultSession = "LSIR-PRCES-DT";
        SType = "Date";
        Label = "Process Date";
    }

    INOUT MIR-POL-TRXN-EFF-DT
    {
        Key;
        Length = "10";
        DBTableName = "THI";
        DefaultSession = "LSIR-SYS-DT-EXT";
        SType = "Date";
        Label = "Effective Date";
    }

    INOUT MIR-POL-TRXN-SEQ-NUM
    {
        Key;
        Length = "3";
        DBTableName = "THI";
        DefaultConstant = "000";
        SType = "Text";
        Label = "Sequence Number";
    }

    INOUT MIR-POL-TRXN-TASK-ID
    {
        Key;
        Length = "4";
        DBTableName = "THI";
        DefaultConstant = "9999";
        SType = "Text";
        Label = "Task Number";
    }

    INOUT MIR-POL-TRXN-TIME
    {
        Key;
        Length = "7";
        DBTableName = "THI";
        DefaultSession = "LSIR-SYS-TIME";
        SType = "Text";
        Label = "Time";
    }

    OUT MIR-SBSDRY-CO-ID
    {
        Length = "40";
        CodeSource = "EDIT";
        CodeType = "SUBCO";
        DBTableName = "TPOL";
        SType = "Text";
        Label = "Sub Company";
    }

    OUT MIR-DV-OWN-CLI-NM
    {
        Length = "75";
        DBTableName = "Derived";
        SType = "Text";
        Label = "Owner Name";
    }

    OUT MIR-DV-T5-CDN-INCM-AMT-T[100]
    {
        Length = "15";
        FieldGroup = "Table100";
        DBTableName = "Derived";
        SType = "Currency";
        Label = "Other Income From Canadian Sources (Box H)";
        Index = "1";
    }

    OUT MIR-DV-T5-CDN-INT-AMT-T[100]
    {
        Length = "15";
        FieldGroup = "Table100";
        DBTableName = "Derived";
        SType = "Currency";
        Label = "Eligible Interest from Canadian Sources (Box D)";
        Index = "1";
    }

    OUT MIR-POL-TRXN-DT-T[100]
    {
        Length = "10";
        FieldGroup = "Table100";
        KeyColumn;
        DBTableName = "THI";
        SType = "Date";
        Label = "Process Date";
        Index = "1";
    }

    OUT MIR-POL-TRXN-EFF-DT-T[100]
    {
        Mandatory;
        Length = "10";
        FieldGroup = "Table100";
        DBTableName = "THI";
        SType = "Date";
        Label = "Effective Date";
        Index = "1";
    }

    OUT MIR-POL-TRXN-SEQ-NUM-T[100]
    {
        Length = "3";
        FieldGroup = "Table100";
        DBTableName = "THI";
        SType = "Text";
        Label = "Sequence Number";
        Index = "1";
    }

    OUT MIR-POL-TRXN-TASK-ID-T[100]
    {
        Length = "4";
        FieldGroup = "Table100";
        DBTableName = "THI";
        SType = "Text";
        Label = "Task Number";
        Index = "1";
    }

    OUT MIR-POL-TRXN-TIME-T[100]
    {
        Length = "7";
        FieldGroup = "Table100";
        DBTableName = "THI";
        SType = "Text";
        Label = "Time";
        Index = "1";
    }

}

