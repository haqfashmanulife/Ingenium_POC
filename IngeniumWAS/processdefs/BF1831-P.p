# Converted from PathFinder 2.2 to 3.0 Jun 18, 2004 3:13:46 PM EDT

#*******************************************************************************
#*  Component:   BF1831-P.p                                                    *
#*  Description:                                                               *
#*                                                                             *
#*******************************************************************************
#*  Chg#    Release  Description                                               *
#*                                                                             *
#*  014590  6.0      New for release 6.0                                       *
#*  017150  612J     Remove Currency Decimals = "2"                            *
#*                                                                             *
#*******************************************************************************

P-STEP BF1831-P
{
    ATTRIBUTES
    {
        BusinessFunctionId = "1831";
        BusinessFunctionName = "Fund Administration Charges - Percent";
        BusinessFunctionType = "Percent";
        MirName = "SCWM0130";
    }

    OUT LSIR-RETURN-CD;

    OUT MIR-RETRN-CD;

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

    IN MIR-CIA-CLI-TRXN-AMT
    {
        Mandatory;
        Signed;
        Length = "15";
        DBTableName = "TFA";
        SType = "Currency";
        Label = "Total Premium Received";
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

    IN MIR-CIA-REASN-CD
    {
        Mandatory;
        Length = "3";
        CodeSource = "DataModel";
        CodeType = "CIA-REASN-CD";
        DBTableName = "TFA";
        SType = "Selection";
        Label = "Surrender Reason";
    }

    IN MIR-CVG-NUM
    {
        Key;
        Length = "2";
        DBTableName = "TFA";
        DefaultConstant = "01";
        SType = "Text";
        Label = "Coverage Number";
    }

    INOUT MIR-DV-OUT-ALLOC-PCT-T[25]
    {
        Mandatory;
        Length = "7";
        Decimals = "4";
        FieldGroup = "Table25";
        DBTableName = "Derived";
        SType = "Percent";
        Label = "Percentage to Allocate";
        Index = "1";
    }

    IN MIR-DV-PRCES-STATE-CD
    {
        Length = "1";
        DBTableName = "Derived";
        SType = "Hidden";
        Label = "Process code";
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

    IN MIR-SUPRES-CNFRM-IND
    {
        Length = "1";
        DBTableName = "TPOLP";
        SType = "Indicator";
        Label = "Suppress confirmation statement";
    }

}

