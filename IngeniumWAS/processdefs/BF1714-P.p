# Converted from PathFinder 2.2 to 3.0 Jun 18, 2004 3:13:44 PM EDT

#*******************************************************************************
#*  Component:   BF1714-P.p                                                    *
#*  Description:                                                               *
#*                                                                             *
#*******************************************************************************
#*  Chg#    Release  Description                                               *
#*                                                                             *
#*  014590  6.0      New for release 6.0                                       *
#*  017150  612J     Remove Currency Decimals = "2"                            *
#*                                                                             *
#*******************************************************************************

P-STEP BF1714-P
{
    ATTRIBUTES
    {
        BusinessFunctionId = "1714";
        BusinessFunctionName = "Pending Deposit List";
        BusinessFunctionType = "List";
        MirName = "NCWM3900";
    }

    OUT LSIR-RETURN-CD;

    OUT MIR-RETRN-CD;

    INOUT MIR-PEND-DPOS-EFF-DT
    {
        Key;
        Length = "10";
        DBTableName = "TPDEP";
        SType = "Date";
        Label = "Deposit Date";
    }

    INOUT MIR-PEND-DPOS-SEQ-NUM
    {
        Key;
        Length = "3";
        DBTableName = "TPDEP";
        SType = "Text";
        Label = "Sequence Number";
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

    OUT MIR-CVG-NUM-T[12]
    {
        Length = "2";
        FieldGroup = "Table12";
        DBTableName = "TPDEP";
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

    OUT MIR-FND-ID-T[12]
    {
        Length = "5";
        FieldGroup = "Table12";
        CodeSource = "EDIT";
        CodeType = "SEGFD";
        DBTableName = "TPDEP";
        SType = "Text";
        Label = "Fund";
        Index = "1";
    }

    OUT MIR-PEND-DPOS-AMT-T[12]
    {
        Length = "15";
        FieldGroup = "Table12";
        DBTableName = "TPDEP";
        SType = "Currency";
        Label = "Amount";
        Index = "1";
    }

    OUT MIR-PEND-DPOS-EFF-DT-T[12]
    {
        Length = "10";
        FieldGroup = "Table12";
        DBTableName = "TPDEP";
        SType = "Date";
        Label = "Deposit Date";
        Index = "1";
    }

    OUT MIR-PEND-DPOS-SEQ-NUM-T[12]
    {
        Length = "3";
        FieldGroup = "Table12";
        DBTableName = "TPDEP";
        SType = "Text";
        Label = "Sequence Number";
        Index = "1";
    }

    OUT MIR-PEND-DPOS-STAT-CD-T[12]
    {
        Length = "1";
        FieldGroup = "Table12";
        CodeSource = "DataModel";
        CodeType = "PEND-DPOS-STAT-CD";
        DBTableName = "TPDEP";
        SType = "Text";
        Label = "Deposit Status";
        Index = "1";
    }

    OUT MIR-PEND-DPOS-TAX-YR-T[12]
    {
        Length = "4";
        FieldGroup = "Table12";
        DBTableName = "TPDEP";
        SType = "Year";
        Label = "Tax Year";
        Index = "1";
    }

    OUT MIR-POL-ID-BASE-T[12]
    {
        Length = "9";
        FieldGroup = "Table12";
        DBTableName = "TPOL";
        SType = "Text";
        Label = "Policy Id";
        Index = "1";
    }

    OUT MIR-POL-ID-SFX-T[12]
    {
        Length = "1";
        FieldGroup = "Table12";
        DBTableName = "TPOL";
        SType = "Text";
        Label = "Suffix";
        Index = "1";
    }

    OUT MIR-REG-FND-SRC-CD-T[12]
    {
        Length = "1";
        FieldGroup = "Table12";
        CodeSource = "DataModel";
        CodeType = "REG-FND-SRC-CD";
        DBTableName = "TPDEP";
        SType = "Text";
        Label = "Fund Source";
        Index = "1";
    }

}

