# Converted from PathFinder 2.2 to 3.0 Jun 18, 2004 3:13:55 PM EDT

#*******************************************************************************
#*  Component:   BF8025-P.p                                                    *
#*  Description:                                                               *
#*                                                                             *
#*******************************************************************************
#*  Chg#    Release  Description                                               *
#*                                                                             *
#*  014590  6.0      New for release 6.0                                       *
#*  017150  612J     Remove Currency Decimals = "2"                            *
#*                                                                             *
#*******************************************************************************

P-STEP BF8025-P
{
    ATTRIBUTES
    {
        BusinessFunctionId = "8025";
        BusinessFunctionName = "Multi-Coverage Update";
        BusinessFunctionType = "Update";
        MirName = "CCWM8025";
    }

    OUT LSIR-RETURN-CD;

    OUT MIR-RETRN-CD;

    INOUT MIR-CVG-AD-FACE-AMT-T[20]
    {
        Length = "15";
        FieldGroup = "Table20";
        DBTableName = "TCVG";
        SType = "Currency";
        Label = "AD Face Amount";
        Index = "1";
    }

    INOUT MIR-CVG-FACE-AMT-T[20]
    {
        Length = "15";
        FieldGroup = "Table20";
        DBTableName = "TCVG";
        SType = "Currency";
        Label = "Face Amount";
        Index = "1";
    }

    INOUT MIR-CVG-NUM-T[20]
    {
        Key;
        Length = "2";
        FieldGroup = "Table20";
        KeyColumn;
        DBTableName = "TCVG";
        SType = "Text";
        Label = "Coverage Number";
        Index = "1";
    }

    INOUT MIR-CVG-RT-AGE-T[20]
    {
        Length = "3";
        Decimals = "0";
        FieldGroup = "Table20";
        DBTableName = "TCVG";
        SType = "Number";
        Label = "Age";
        Index = "1";
    }

    INOUT MIR-CVG-SEX-CD-T[20]
    {
        Length = "40";
        FieldGroup = "Table20";
        CodeSource = "DataModel";
        CodeType = "CVG-SEX-CD";
        DBTableName = "TCVG";
        SType = "Selection";
        Label = "Sex";
        Index = "1";
    }

    INOUT MIR-CVG-SMKR-CD-T[20]
    {
        Length = "40";
        FieldGroup = "Table20";
        CodeSource = "EDIT";
        CodeType = "SMOKE";
        DBTableName = "TCVG";
        SType = "Selection";
        Label = "Smoker";
        Index = "1";
    }

    INOUT MIR-CVG-WP-IND-T[20]
    {
        Length = "40";
        FieldGroup = "Table20";
        DBTableName = "TCVG";
        SType = "Indicator";
        Label = "WP Ind";
        Index = "1";
    }

    INOUT MIR-DV-INSRD-CLI-NM-2-T[20]
    {
        Length = "75";
        FieldGroup = "Table20";
        DBTableName = "Derived";
        SType = "Text";
        Label = "Insured's Name";
        Index = "1";
    }

    INOUT MIR-DV-INSRD-CLI-NM-T[20]
    {
        Length = "75";
        FieldGroup = "Table20";
        DBTableName = "Derived";
        SType = "Text";
        Label = "Insured's Name";
        Index = "1";
    }

    INOUT MIR-INSRD-CLI-ID-2-T[20]
    {
        Length = "10";
        FieldGroup = "Table20";
        DBTableName = "TCVGC";
        SType = "Text";
        Label = "Insured's Client Number";
        Index = "1";
    }

    INOUT MIR-INSRD-CLI-ID-T[20]
    {
        Length = "10";
        FieldGroup = "Table20";
        DBTableName = "TCVGC";
        SType = "Text";
        Label = "Insured's Client Number";
        Index = "1";
    }

    INOUT MIR-PLAN-ID-T[20]
    {
        Length = "40";
        FieldGroup = "Table20";
        CodeSource = "EDIT";
        CodeType = "PLAN";
        DBTableName = "TCVG";
        SType = "Selection";
        Label = "Plan ID";
        Index = "1";
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

    OUT MIR-PLAN-PKG-ADB-CD-T[20]
    {
        Length = "40";
        FieldGroup = "Table20";
        CodeSource = "DataModel";
        CodeType = "PLAN-PKG-ADB-CD";
        DBTableName = "TPACK";
        SType = "Text";
        Label = "Embedded ADB";
        Index = "1";
    }

    OUT MIR-PLAN-PKG-WP-CD-T[20]
    {
        Length = "40";
        FieldGroup = "Table20";
        CodeSource = "DataModel";
        CodeType = "PLAN-PKG-WP-CD";
        DBTableName = "TPACK";
        SType = "Text";
        Label = "Embedded WP";
        Index = "1";
    }

}

