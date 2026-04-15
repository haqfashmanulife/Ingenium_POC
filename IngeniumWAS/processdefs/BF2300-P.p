# Converted from PathFinder 2.2 to 3.0 Jun 18, 2004 3:13:51 PM EDT

#*******************************************************************************
#*  Component:   BF2300-P.p                                                    *
#*  Description:                                                               *
#*                                                                             *
#*******************************************************************************
#*  Chg#    Release  Description                                               *
#*                                                                             *
#*  014590  6.0      New for release 6.0                                       *
#*  017150  612J     Remove Currency Decimals = "2"                            *
#*                                                                             *
#*******************************************************************************

P-STEP BF2300-P
{
    ATTRIBUTES
    {
        BusinessFunctionId = "2300";
        BusinessFunctionName = "Fund Contract Master Retrieve";
        BusinessFunctionType = "Retrieve";
        MirName = "SCWM0060";
    }

    OUT LSIR-RETURN-CD;

    OUT MIR-RETRN-CD;

    IN MIR-CVG-NUM
    {
        Key;
        Mandatory;
        Length = "2";
        DBTableName = "TCVG";
        DefaultConstant = "01";
        SType = "Text";
        Label = "Coverage ";
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

    OUT MIR-CFN-STAT-CD-T[25]
    {
        Length = "40";
        FieldGroup = "Table25";
        CodeSource = "DataModel";
        CodeType = "CFN-STAT-CD";
        DBTableName = "TFS";
        SType = "Selection";
        Label = "Status";
        Index = "1";
    }

    OUT MIR-CVG-CSTAT-CD
    {
        Length = "40";
        CodeSource = "DataModel";
        CodeType = "CVG-CSTAT-CD";
        DBTableName = "TCVG";
        SType = "Text";
        Label = "Coverage-Status";
    }

    OUT MIR-DV-FND-CTR-T[25]
    {
        Length = "2";
        FieldGroup = "Table25";
        DBTableName = "Derived";
        SType = "Text";
        Label = "Fund Number";
        Index = "1";
    }

    OUT MIR-FND-ID-T[25]
    {
        Length = "40";
        FieldGroup = "Table25";
        CodeSource = "EDIT";
        CodeType = "SEGFD";
        DBTableName = "TFS";
        SType = "Selection";
        Label = "Fund ID";
        Index = "1";
    }

    OUT MIR-INV-CVG-STAT-CD
    {
        Length = "40";
        CodeSource = "DataModel";
        CodeType = "INV-CVG-CSTAT-CD";
        DBTableName = "TFC";
        SType = "Text";
        Label = "Fund-Contract-Status";
    }

    OUT MIR-POL-CSTAT-CD
    {
        Length = "40";
        CodeSource = "DataModel";
        CodeType = "POL-CSTAT-CD";
        DBTableName = "TPOL";
        SType = "Text";
        Label = "Policy-Status";
    }

}

