# Converted from PathFinder 2.2 to 3.0 Jun 18, 2004 3:13:44 PM EDT

#*******************************************************************************
#*  Component:   BF1712-P.p                                                    *
#*  Description:                                                               *
#*                                                                             *
#*******************************************************************************
#*  Chg#    Release  Description                                               *
#*                                                                             *
#*  014590  6.0      New for release 6.0                                       *
#*  017150  612J     Remove Currency Decimals = "2"                            *
#*                                                                             *
#*******************************************************************************

P-STEP BF1712-P
{
    ATTRIBUTES
    {
        BusinessFunctionId = "1712";
        BusinessFunctionName = "Pending Deposit Reversal";
        BusinessFunctionType = "Reversal";
        MirName = "NCWM3900";
    }

    OUT LSIR-RETURN-CD;

    OUT MIR-RETRN-CD;

    INOUT MIR-DV-OS-DISB-IND
    {
        Length = "1";
        DBTableName = "Derived";
        SType = "Indicator";
        Label = "Update O/S Disbursement";
    }

    INOUT MIR-PEND-DPOS-EFF-DT
    {
        Key;
        Mandatory;
        Length = "10";
        DBTableName = "TPDEP";
        SType = "Date";
        Label = "Deposit Date";
    }

    INOUT MIR-PEND-DPOS-SEQ-NUM
    {
        Key;
        Mandatory;
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

    IN MIR-DV-PRCES-STATE-CD
    {
        Length = "1";
        DBTableName = "Derived";
        SType = "Hidden";
        Label = "Process State";
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

