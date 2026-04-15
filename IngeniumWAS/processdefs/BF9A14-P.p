# Converted from PathFinder 2.2 to 3.0 Jun 18, 2004 3:13:44 PM EDT

#*******************************************************************************
#*  Component:   BF9A14-P.p                                                    *
#*  Description:                                                               *
#*                                                                             *
#*******************************************************************************
#*  Chg#    Release  Description                                               *
#*                                                                             *
#*  MPCR15  CTS      Lumpsum Payout History list - Search Results Screen       *
#*  UY3049  CTS      ANNUITY PAYMENT SCREEN                                    *
#*                                                                             *
#*******************************************************************************

P-STEP BF9A14-P
{
    ATTRIBUTES
    {
        BusinessFunctionId = "9A14";
        BusinessFunctionName = "Lump Sum Payout History List";
        BusinessFunctionType = "List";
        MirName = "CCWM9A14";
    }

    OUT LSIR-RETURN-CD;

    OUT MIR-RETRN-CD;


    IN MIR-POL-ID-BASE
    {
        Key;
        Mandatory;
        Length = "9";
        DBTableName = "TPAHS";
        DefaultSession = "MIR-POL-ID-BASE";
        SType = "Text";
        Label = "Policy ID";
    }

    IN MIR-POL-ID-SFX
    {
        Key;
        Length = "1";
        DBTableName = "TPAHS";
        DefaultSession = "MIR-POL-ID-SFX";
        SType = "Text";
        Label = "Suffix";
    }


    INOUT MIR-POL-PAYO-NUM
    {
        Key;
        Mandatory;
        Length = "5";
        DBTableName = "TPAHS";
        DefaultConstant = "00000";
        SType = "Text";
        Label = "Payout Number";
    }

    OUT MIR-POL-PAYO-NUM-T[12]
    {
        Key;
        Mandatory;
        Length = "9";
        FieldGroup = "Table12";
        DBTableName = "TPAHS";
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
        DBTableName = "TPAHS";
        SType = "Text";
        Label = "Transaction Type";
        Index = "1";
    }

    OUT MIR-EFF-DT-T[12]
    {
        Length = "10";
        FieldGroup = "Table12";
        DBTableName = "TPAHS";
        SType = "Date";
        Label = "Effective Date";
        Index = "1";
    }

    OUT MIR-NEW-MTHLY-BNFT-AMT-T[12]
    {
        Length = "15";
        FieldGroup = "Table12";
        DBTableName = "TPAHS";
        SType = "Currency";
        Label = "New Monthly Benefit Amount";
        Index = "1";
    }

    OUT MIR-TRXN-STAT-CD-T[12]
    {
        Length = "40";
        FieldGroup = "Table12";
        CodeSource = "DataModel";
        CodeType = "TRXN-STAT-CD";
        DBTableName = "TPAHS";
        SType = "Text";
        Label = "Status";
        Index = "1";
    }
#UY3049 CHANGES STARTS    
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
#UY3049 CHANGES ENDS
}

