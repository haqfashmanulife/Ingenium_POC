# Converted from PathFinder 2.2 to 3.0 Jun 18, 2004 3:13:44 PM EDT

#*******************************************************************************
#*  Component:   BF1764-P.p                                                    *
#*  Description:                                                               *
#*                                                                             *
#*******************************************************************************
#*  Chg#    Release  Description                                               *
#*                                                                             *
#*  014590  6.0      New for release 6.0                                       *
#*  017150  612J     Remove Currency Decimals = "2"                            *
#*                                                                             *
#*******************************************************************************

P-STEP BF1764-P
{
    ATTRIBUTES
    {
        BusinessFunctionId = "1764";
        BusinessFunctionName = "Bonus/Dividend History List";
        BusinessFunctionType = "List";
        MirName = "CCWM4340";
    }

    OUT LSIR-RETURN-CD;

    OUT MIR-RETRN-CD;

    INOUT MIR-BON-DIV-IDT-NUM
    {
        Key;
        Length = "10";
        DBTableName = "TBNDV";
        DefaultSession = "LSIR-PRCES-DT";
        SType = "Date";
        Label = "Declaration Date";
    }

    INOUT MIR-BON-DIV-SEQ-NUM
    {
        Key;
        Mandatory;
        Length = "3";
        DBTableName = "TBNDV";
        DefaultConstant = "999";
        SType = "Text";
        Label = "Sequence Number";
    }

    INOUT MIR-BON-DIV-TYP-CD
    {
        Mandatory;
        Length = "1";
        CodeSource = "DataModel";
        CodeType = "BON-DIV-TYP-CD";
        DBTableName = "TBNDV";
        SType = "Selection";
        Label = "Record Type";
    }

    INOUT MIR-CVG-NUM
    {
        Key;
        Length = "2";
        DBTableName = "TCVG";
        SType = "Text";
        Label = "Coverage Number";
    }

    INOUT MIR-POL-ID-BASE
    {
        Key;
        Mandatory;
        Length = "9";
        DBTableName = "TPOL";
        DefaultSession = "MIR-POL-ID-BASE";
        SType = "Text";
        Label = "Policy Id";
    }

    INOUT MIR-POL-ID-SFX
    {
        Key;
        Length = "1";
        DBTableName = "TPOL";
        DefaultSession = "MIR-POL-ID-SFX";
        SType = "Text";
        Label = "Suffix";
    }

    OUT MIR-BON-DIV-IDT-NUM-T[12]
    {
        Length = "10";
        FieldGroup = "Table12";
        DBTableName = "TBNDV";
        SType = "Date";
        Label = "Declaration Date";
        Index = "1";
    }

    OUT MIR-BON-DIV-PUA-AMT-T[12]
    {
        Length = "15";
        FieldGroup = "Table12";
        DBTableName = "TBNDV";
        SType = "Currency";
        Label = "Bonus Paid Up Additions Face Amount";
        Index = "1";
    }

    OUT MIR-BON-DIV-SEQ-NUM-T[12]
    {
        Length = "3";
        FieldGroup = "Table12";
        DBTableName = "TBNDV";
        SType = "Text";
        Label = "Sequence Number";
        Index = "1";
    }

    OUT MIR-BON-DIV-STAT-CD-T[12]
    {
        Length = "1";
        FieldGroup = "Table12";
        CodeSource = "DataModel";
        CodeType = "BON-DIV-STAT-CD";
        DBTableName = "TBNDV";
        SType = "Text";
        Label = "Status";
        Index = "1";
    }

    OUT MIR-BON-DIV-TRXN-CD-T[12]
    {
        Length = "1";
        FieldGroup = "Table12";
        CodeSource = "DataModel";
        CodeType = "BON-DIV-TRXN-CD";
        DBTableName = "TBNDV";
        SType = "Text";
        Label = "Sub Type";
        Index = "1";
    }

    OUT MIR-BON-DIV-TYP-CD-T[12]
    {
        Length = "1";
        FieldGroup = "Table12";
        CodeSource = "DataModel";
        CodeType = "BON-DIV-TYP-CD";
        DBTableName = "TBNDV";
        SType = "Text";
        Label = "Record Type";
        Index = "1";
    }

    OUT MIR-CVG-NUM-T[12]
    {
        Length = "2";
        FieldGroup = "Table12";
        KeyColumn;
        DBTableName = "TCVG";
        SType = "Text";
        Label = "Coverage Number";
        Index = "1";
    }

    OUT MIR-DV-OWN-CLI-NM
    {
        Length = "75";
        DBTableName = "Derived";
        SType = "Text";
        Label = "Owner Name";
    }

}

