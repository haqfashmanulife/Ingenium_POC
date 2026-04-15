# Converted from PathFinder 2.2 to 3.0 Jun 18, 2004 3:13:40 PM EDT

#*******************************************************************************
#*  Component:   BF1504-P.p                                                    *
#*  Description:                                                               *
#*                                                                             *
#*******************************************************************************
#*  Chg#    Release  Description                                               *
#*                                                                             *
#*  014590  6.0      New for release 6.0                                       *
#*  017150  612J     Remove Currency Decimals = "2"                            *
#*  UY3049  CTS      STREAM 3 ANNUITY PAYOUT                                   *
#*******************************************************************************

P-STEP BF1504-P
{
    ATTRIBUTES
    {
        BusinessFunctionId = "1504";
        BusinessFunctionName = "Automatic Payout History List";
        BusinessFunctionType = "List";
        MirName = "CCWM4310";
    }

    OUT LSIR-RETURN-CD;

    OUT MIR-RETRN-CD;

    INOUT MIR-POL-PAYO-TYP-CD
    {
        Key;
        Length = "1";
        CodeSource = "DataModel";
        CodeType = "POL-PAYO-TYP-CD";
        DBTableName = "TPOLP";
        SType = "Selection";
        Label = "Payout Type";
    }

    INOUT MIR-CDA-EFF-DT
    {
        Key;
        Length = "10";
        DBTableName = "TCDSA";
        DefaultSession = "LSIR-PRCES-DT";
        SType = "Date";
        Label = "Payout Date";
    }

    INOUT MIR-CDA-SEQ-NUM
    {
        Key;
        Length = "3";
        DBTableName = "TCDSA";
        DefaultConstant = "999";
        SType = "Text";
        Label = "Sequence Number";
    }

    IN MIR-POL-ID-BASE
    {
        Key;
        Mandatory;
        Length = "9";
        DBTableName = "TCDSA";
        DefaultSession = "MIR-POL-ID-BASE";
        SType = "Text";
        Label = "Policy Id";
    }

    IN MIR-POL-ID-SFX
    {
        Key;
        Length = "1";
        DBTableName = "TCDSA";
        DefaultSession = "MIR-POL-ID-SFX";
        SType = "Text";
        Label = "Suffix";
    }

    INOUT MIR-POL-PAYO-NUM
    {
        Key;
        Mandatory;
        Length = "5";
        DBTableName = "TCDSA";
        DefaultConstant = "00000";
        SType = "Text";
        Label = "Payout Number";
    }

    OUT MIR-CDA-EFF-DT-T[12]
    {
        Length = "10";
        FieldGroup = "Table12";
        KeyColumn;
        DBTableName = "TCDSA";
        SType = "Date";
        Label = "Payout Date";
        Index = "1";
    }

    OUT MIR-CDA-SEQ-NUM-T[12]
    {
        Length = "3";
        FieldGroup = "Table12";
        DBTableName = "TCDSA";
        SType = "Text";
        Label = "Sequence Number";
        Index = "1";
    }

    OUT MIR-CDA-STAT-CD-T[12]
    {
        Length = "40";
        FieldGroup = "Table12";
        CodeSource = "DataModel";
        CodeType = "CDA-STAT-CD";
        DBTableName = "TCDSA";
        SType = "Text";
        Label = "Status";
        Index = "1";
    }

    OUT MIR-CDA-TOT-TRXN-AMT-T[12]
    {
        Length = "15";
        FieldGroup = "Table12";
        DBTableName = "TCDSA";
        SType = "Currency";
        Label = "Total Payout Amount";
        Index = "1";
    }

    OUT MIR-POL-PAYO-NUM-T[12]
    {
        Length = "5";
        FieldGroup = "Table12";
        DBTableName = "TCDSA";
        SType = "Text";
        Label = "Payout Number";
        Index = "1";
    }

    OUT MIR-POL-PAYO-TYP-CD-T[12]
    {
        Length = "1";
        FieldGroup = "Table12";
        CodeSource = "DataModel";
        CodeType = "POL-PAYO-TYP-CD";
        DBTableName = "TPOLP";
        SType = "Text";
        Label = "Payout Type";
        Index = "1";
    }
#UY3049 CHANGES STARTS HERE 
    INOUT MIR-YEAR-NUM-T[12]
    {
        Length = "3";
        FieldGroup = "Table12";
        DBTableName = "TCDSA";
        SType = "Text";
        Label = "Year Number";
        Index = "1";
    }

    INOUT MIR-INSTL-NUM-T[12]
    {
        Length = "3";
        FieldGroup = "Table12";
        DBTableName = "TCDSA";
        SType = "Text";
        Label = "Installment Number";
        Index = "1";
    }
    INOUT MIR-PRCES-DT-T[12]
    {
        DisplayOnly;
        Length = "10";
        FieldGroup = "Table12";
        SType = "Text";
        Label = "Process Date";
        Index = "1";
    }
    IN MIR-10-POL-ID
    {
        Length = "10";
        SType = "Hidden";
        Label = "Policy Id";
    }     
    IN MIR-STR3-PAYO-IND
    {
        Length = "1";
        SType = "Hidden";
    }
#UY3049 CHANGES ENDS HERE
}

