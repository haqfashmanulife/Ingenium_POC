# Converted from PathFinder 2.2 to 3.0 Jun 18, 2004 3:13:34 PM EDT

#*******************************************************************************
#*  Component:   BF1148-P.p                                                    *
#*  Description:                                                               *
#*                                                                             *
#*******************************************************************************
#*  Chg#    Release  Description                                               *
#*                                                                             *
#*  014590  6.0      New for release 6.0                                       *
#*  017150  612J     Remove Currency Decimals = "2"                            *
#*                                                                             *
#*******************************************************************************

P-STEP BF1148-P
{
    ATTRIBUTES
    {
        BusinessFunctionId = "1148";
        BusinessFunctionName = "Policy Transaction";
        BusinessFunctionType = "Amtpct";
        MirName = "CCWM8220";
    }

    OUT LSIR-RETURN-CD;

    OUT MIR-RETRN-CD;

    INOUT MIR-CVG-NUM-T[139]
    {
        Length = "2";
        FieldGroup = "Table139";
        KeyColumn;
        DBTableName = "TCVG";
        SType = "Text";
        Label = "Coverage Number";
        Index = "1";
    }

    INOUT MIR-FND-ID-T[139]
    {
        Length = "40";
        FieldGroup = "Table139";
        CodeSource = "EDIT";
        CodeType = "SEGFD";
        DBTableName = "TFS";
        SType = "Selection";
        Label = "Fund ID";
        Index = "1";
    }

    INOUT MIR-SUPRES-CNFRM-IND
    {
        Length = "1";
        CodeSource = "DataModel";
        CodeType = "SUPRES-CNFRM-IND";
        DBTableName = "TPOLP";
        SType = "Selection";
        Label = "Confirmation";
    }

    IN MIR-CIA-EFF-DT
    {
        Key;
        Mandatory;
        Length = "10";
        DBTableName = "TFA";
        DefaultSession = "LSIR-PRCES-DT";
        SType = "Date";
        Label = "Activity Effective Date";
    }

    IN MIR-DV-FROM-FND-AMT-T[139]
    {
        Length = "15";
        FieldGroup = "Table139";
        DBTableName = "Derived";
        SType = "Currency";
        Label = "Net Amount";
        Index = "1";
    }

    IN MIR-DV-PRCES-STATE-CD
    {
        Length = "1";
        DBTableName = "Derived";
        SType = "Hidden";
        Label = "Process code";
    }

    IN MIR-FIA-IN-ALLOC-PCT-T[139]
    {
        Length = "7";
        Decimals = "4";
        FieldGroup = "Table139";
        DBTableName = "TFD";
        SType = "Percent";
        Label = "Percentage In";
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

    OUT MIR-DV-CFN-APROX-AMT-T[139]
    {
        Signed;
        Length = "15";
        FieldGroup = "Table139";
        DBTableName = "Derived";
        SType = "Currency";
        Label = "Approximate Fund Value";
        Index = "1";
    }

    OUT MIR-DV-OWN-CLI-NM
    {
        Length = "75";
        DBTableName = "Derived";
        SType = "Text";
        Label = "Owner Name";
    }

    OUT MIR-DV-TO-FND-AMT-T[139]
    {
        Length = "15";
        FieldGroup = "Table139";
        DBTableName = "Derived";
        SType = "Currency";
        Label = "Net Amount";
        Index = "1";
    }

    OUT MIR-FIA-OUT-ALLOC-PCT-T[139]
    {
        Length = "7";
        Decimals = "4";
        FieldGroup = "Table139";
        DBTableName = "TFD";
        SType = "Percent";
        Label = "Fund out";
        Index = "1";
    }

    OUT MIR-PLAN-ID-T[139]
    {
        Length = "40";
        FieldGroup = "Table139";
        CodeSource = "EDIT";
        CodeType = "PLAN";
        DBTableName = "TCVG";
        SType = "Text";
        Label = "Type of Plan";
        Index = "1";
    }

    OUT MIR-DV-FND-DESC-TXT-T[139]
    {
        Length = "40";
        FieldGroup = "Table139";
        KeyColumn;
        DBTableName = "Derived";
        SType = "Text";
        Label = "Fund Description";
        Index = "1";
    }

}

