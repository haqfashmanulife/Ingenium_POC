# Converted from PathFinder 2.2 to 3.0 Jun 18, 2004 3:13:44 PM EDT

#*******************************************************************************
#*  Component:   BF1760-P.p                                                    *
#*  Description:                                                               *
#*                                                                             *
#*******************************************************************************
#*  Chg#    Release  Description                                               *
#*                                                                             *
#*  014590  6.0      New for release 6.0                                       *
#*  017150  612J     Remove Currency Decimals = "2"                            *
#*  UY3060  CTS       Added 2 new fields                                       *
#*******************************************************************************

P-STEP BF1760-P
{
    ATTRIBUTES
    {
        BusinessFunctionId = "1760";
        BusinessFunctionName = "Bonus/Dividend History Retrieve";
        BusinessFunctionType = "Retrieve";
        MirName = "CCWM4340";
    }

    OUT LSIR-RETURN-CD;

    OUT MIR-RETRN-CD;

    IN MIR-BON-DIV-IDT-NUM
    {
        Key;
        Mandatory;
        Length = "10";
        DBTableName = "TBNDV";
        DefaultSession = "LSIR-PRCES-DT";
        SType = "Date";
        Label = "Declaration Date";
    }

    IN MIR-BON-DIV-SEQ-NUM
    {
        Key;
        Mandatory;
        Length = "3";
        DBTableName = "TBNDV";
        DefaultConstant = "999";
        SType = "Text";
        Label = "Sequence Number";
    }

    IN MIR-BON-DIV-TYP-CD
    {
        Key;
        Mandatory;
        Length = "1";
        CodeSource = "DataModel";
        CodeType = "BON-DIV-TYP-CD";
        DBTableName = "TBNDV";
        SType = "Selection";
        Label = "Record Type";
    }

    IN MIR-CVG-NUM
    {
        Key;
        Mandatory;
        Length = "2";
        DBTableName = "TCVG";
        DefaultConstant = "01";
        SType = "Text";
        Label = "Coverage Number";
    }

    IN MIR-POL-ID-BASE
    {
        Key;
        Mandatory;
        Length = "9";
        DBTableName = "TPOL";
        DefaultSession = "MIR-POL-ID-BASE";
        SType = "Text";
        Label = "Policy Id";
    }

    IN MIR-POL-ID-SFX
    {
        Key;
        Length = "1";
        DBTableName = "TPOL";
        DefaultSession = "MIR-POL-ID-SFX";
        SType = "Text";
        Label = "Suffix";
    }

    OUT MIR-BON-DIV-PUA-AMT
    {
        Length = "15";
        DBTableName = "TBNDV";
        SType = "Currency";
        Label = "Bonus Paid Up Additions Face Amount";
    }

    OUT MIR-BON-DIV-STAT-CD
    {
        Length = "1";
        CodeSource = "DataModel";
        CodeType = "BON-DIV-STAT-CD";
        DBTableName = "TBNDV";
        SType = "Text";
        Label = "Status";
    }

    OUT MIR-BON-DIV-TRXN-AMT
    {
        Signed;
        Length = "15";
        DBTableName = "TBNDV";
        SType = "Currency";
        Label = "Cash Amount";
    }

    OUT MIR-BON-DIV-TRXN-CD
    {
        Length = "1";
        CodeSource = "DataModel";
        CodeType = "BON-DIV-TRXN-CD";
        DBTableName = "TBNDV";
        SType = "Text";
        Label = "Sub Type";
    }

    OUT MIR-DV-OWN-CLI-NM
    {
        Length = "75";
        DBTableName = "Derived";
        SType = "Text";
        Label = "Owner Name";
    }

    OUT MIR-EFF-IDT-NUM
    {
        Length = "10";
        DBTableName = "TBNDV";
        SType = "Date";
        Label = "Bonus / Dividend Effective Date";
    }
#UY3060 Changes Starts    
    OUT MIR-BON-DIV-ACUM-AMT
    {
        Signed;
        Length = "15";
        DBTableName = "TBNDV";
        SType = "Currency";
        Label = "Accumulated Dividend Amount";
    }
    
    OUT MIR-BON-DIV-ACUM-INT-AMT
    {
        Signed;
        Length = "15";
        DBTableName = "TBNDV";
        SType = "Currency";
        Label = "Accumulated Interest Amount";
    }
#UY3060 Changes ENDS
}

