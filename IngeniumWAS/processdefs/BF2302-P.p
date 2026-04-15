# Converted from PathFinder 2.2 to 3.0 Jun 18, 2004 3:13:51 PM EDT

#*******************************************************************************
#*  Component:   BF2302-P.p                                                    *
#*  Description:                                                               *
#*                                                                             *
#*******************************************************************************
#*  Chg#    Release  Description                                               *
#*                                                                             *
#*  014590  6.0      New for release 6.0                                       *
#*  017150  612J     Remove Currency Decimals = "2"                            *
#*                                                                             *
#*******************************************************************************

P-STEP BF2302-P
{
    ATTRIBUTES
    {
        BusinessFunctionId = "2302";
        BusinessFunctionName = "Fund Contract Master Update";
        BusinessFunctionType = "Update";
        MirName = "SCWM0060";
    }

    OUT LSIR-RETURN-CD;

    OUT MIR-RETRN-CD;

    INOUT MIR-CFN-STAT-CD-T[25]
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

    INOUT MIR-FND-ID-T[25]
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

    OUT MIR-DV-FND-CTR-T[25]
    {
        Length = "2";
        FieldGroup = "Table25";
        DBTableName = "Derived";
        SType = "Text";
        Label = "Fund Number";
        Index = "1";
    }

}

