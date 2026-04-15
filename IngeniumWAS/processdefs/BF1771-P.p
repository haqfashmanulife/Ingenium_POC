# Converted from PathFinder 2.2 to 3.0 Jun 18, 2004 3:13:45 PM EDT

#*******************************************************************************
#*  Component:   BF1771-P.p                                                    *
#*  Description:                                                               *
#*                                                                             *
#*******************************************************************************
#*  Chg#    Release  Description                                               *
#*                                                                             *
#*  014590  6.0      New for release 6.0                                       *
#*  017150  612J     Remove Currency Decimals = "2"                            *
#*                                                                             *
#*******************************************************************************

P-STEP BF1771-P
{
    ATTRIBUTES
    {
        BusinessFunctionId = "1771";
        BusinessFunctionName = "Fund Transfer Amount to Percent";
        BusinessFunctionType = "Amtpct";
        MirName = "SCWM0070";
    }

    OUT LSIR-RETURN-CD;

    OUT MIR-RETRN-CD;

    INOUT MIR-CIA-LOAD-AMT
    {
        Signed;
        Length = "15";
        DBTableName = "TFA";
        SType = "Currency";
        Label = "Transfer Charges";
    }

    INOUT MIR-CIA-LOAD-FORCE-IND
    {
        Length = "1";
        DBTableName = "TFA";
        SType = "Indicator";
        Label = "Loads have been forced";
    }

    INOUT MIR-DV-CFN-APROX-AMT-T[25]
    {
        Signed;
        Length = "15";
        FieldGroup = "Table25";
        DBTableName = "Derived";
        SType = "Currency";
        Label = "Approximate Fund Value";
        Index = "1";
    }

    INOUT MIR-DV-FND-CTR-T[25]
    {
        Length = "3";
        FieldGroup = "Table25";
        DBTableName = "Derived";
        SType = "Text";
        Label = "Fund Number";
        Index = "1";
    }

    INOUT MIR-DV-FROM-FND-AMT-T[25]
    {
        Signed;
        Length = "15";
        FieldGroup = "Table25";
        DBTableName = "TFA";
        SType = "Currency";
        Label = "Net Amount";
        Index = "1";
    }

    INOUT MIR-FIA-IN-ALLOC-PCT-T[25]
    {
        Length = "7";
        Decimals = "4";
        FieldGroup = "Table25";
        DBTableName = "TFD";
        SType = "Percent";
        Label = "Percentage In";
        Index = "1";
    }

    INOUT MIR-FND-ID-T[25]
    {
        Length = "40";
        FieldGroup = "Table25";
        KeyColumn;
        CodeSource = "EDIT";
        CodeType = "SEGFD";
        DBTableName = "TFS";
        SType = "Text";
        Label = "Fund ID";
        Index = "1";
    }

    INOUT MIR-SUPRES-CNFRM-IND
    {
        Length = "1";
        DBTableName = "TPOLP";
        SType = "Indicator";
        Label = "Suppress confirmation statement";
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

    IN MIR-CVG-NUM
    {
        Key;
        Mandatory;
        Length = "2";
        DBTableName = "TFA";
        DefaultConstant = "01";
        SType = "Text";
        Label = "Coverage Number";
    }

    IN MIR-DV-PRCES-STATE-CD
    {
        Length = "1";
        DBTableName = "Derived";
        SType = "Hidden";
        Label = "Process State";
    }

    IN MIR-POL-ID-BASE
    {
        Key;
        Mandatory;
        Length = "9";
        DBTableName = "TFA";
        DefaultSession = "MIR-POL-ID-BASE";
        SType = "Text";
        Label = "Policy Id";
    }

    IN MIR-POL-ID-SFX
    {
        Key;
        Length = "1";
        DBTableName = "TFA";
        DefaultSession = "MIR-POL-ID-SFX";
        SType = "Text";
        Label = "Suffix";
    }

    OUT MIR-DV-OWN-CLI-NM
    {
        Length = "75";
        DBTableName = "Derived";
        SType = "Text";
        Label = "Owner Name";
    }

    OUT MIR-DV-TO-FND-AMT-T[25]
    {
        Signed;
        Length = "15";
        FieldGroup = "Table25";
        DBTableName = "TFA";
        SType = "Currency";
        Label = "Net Amount To";
        Index = "1";
    }

}

