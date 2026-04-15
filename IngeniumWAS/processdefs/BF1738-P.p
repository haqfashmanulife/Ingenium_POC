# Converted from PathFinder 2.2 to 3.0 Jun 18, 2004 3:13:44 PM EDT

#*******************************************************************************
#*  Component:   BF1738-P.p                                                    *
#*  Description:                                                               *
#*                                                                             *
#*******************************************************************************
#*  Chg#    Release  Description                                               *
#*                                                                             *
#*  014590  6.0      New for release 6.0                                       *
#*  017150  612J     Remove Currency Decimals = "2"                            *
#*                                                                             *
#*  M245B2  CTS      Foreign Currency Formatting                               *
#*******************************************************************************

P-STEP BF1738-P
{
    ATTRIBUTES
    {
        BusinessFunctionId = "1738";
        BusinessFunctionName = "Fund Inquiry - Gain Loss Information";
        BusinessFunctionType = "Gainloss";
        MirName = "SCWM0020";
    }

    OUT LSIR-RETURN-CD;

    OUT MIR-RETRN-CD;

    INOUT MIR-CIA-EFF-DT
    {
        Key;
        Mandatory;
        Length = "10";
        DBTableName = "TFA";
        DefaultSession = "LSIR-PRCES-DT";
        SType = "Date";
        Label = "Activity Effective Date";
    }

    INOUT MIR-CIA-SEQ-NUM
    {
        Key;
        Mandatory;
        Length = "3";
        DBTableName = "TFA";
        DefaultConstant = "999";
        SType = "Text";
        Label = "Sequence Number";
    }

    INOUT MIR-CIA-TYP-CD
    {
        Length = "3";
        CodeSource = "DataModel";
        CodeType = "CIA-TYP-CD";
        DBTableName = "TFA";
        SType = "Selection";
        Label = "Activity Type";
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

    OUT MIR-CFN-STAT-CD
    {
        Length = "40";
        CodeSource = "DataModel";
        CodeType = "CFN-STAT-CD";
        DBTableName = "TFS";
        SType = "Selection";
        Label = "Status";
    }

    OUT MIR-FIA-FND-GLA-AMT-T[139]
    {
        Signed;
        Length = "15";
        FieldGroup = "Table139";
        DBTableName = "TFD";
        SType = "Currency";
        Label = "Gain / Loss - Amount Charged to Fund";
        Index = "1";
    }

    OUT MIR-FIA-GLA-CD-T[139]
    {
        Length = "1";
        FieldGroup = "Table139";
        KeyColumn;
        CodeSource = "DataModel";
        CodeType = "FIA-GLA-CD";
        DBTableName = "TFD";
        SType = "Text";
        Label = "Gain / Loss - Calculation Type";
        Index = "1";
    }

    OUT MIR-FIA-GNRL-GLA-AMT-T[139]
    {
        Signed;
        Length = "15";
        FieldGroup = "Table139";
        DBTableName = "TFD";
        SType = "Currency";
        Label = "Gain / Loss - Amount Charged to General Account";
        Index = "1";
    }

    OUT MIR-FIA-REVRS-GLA-CD-T[139]
    {
        Length = "1";
        FieldGroup = "Table139";
        CodeSource = "DataModel";
        CodeType = "FIA-REVRS-GLA-CD";
        DBTableName = "TFD";
        SType = "Text";
        Label = "Gain / Loss - Calculation Type on Reversal";
        Index = "1";
    }

    OUT MIR-FND-ID-T[139]
    {
        Length = "9";
        FieldGroup = "Table139";
        CodeSource = "EDIT";
        CodeType = "SEGFD";
        DBTableName = "TFD";
        SType = "Text";
        Label = "Fund";
        Index = "1";
    }

    OUT MIR-REVRS-FND-GLA-AMT-T[139]
    {
        Signed;
        Length = "15";
        FieldGroup = "Table139";
        DBTableName = "TFD";
        SType = "Currency";
        Label = "Gain / Loss - Amount Charged to Fund for Reversal";
        Index = "1";
    }

    OUT MIR-REVRS-GNRL-GLA-AMT-T[139]
    {
        Signed;
        Length = "11";
        FieldGroup = "Table139";
        DBTableName = "TFD";
        SType = "Currency";
        Label = "Gain / Loss - Amount Charged to General Account for Reversal";
        Index = "1";
    }

#M245B2 CHANGES START HERE  
    INOUT MIR-POL-CRCY-CD
        {
         
             Length = "2";
             SType = "Hidden";
             Label = "Currency";
        } 
#M245B2 CHANGES END HERE       
}

