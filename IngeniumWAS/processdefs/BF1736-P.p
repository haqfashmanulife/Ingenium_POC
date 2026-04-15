# Converted from PathFinder 2.2 to 3.0 Jun 18, 2004 3:13:44 PM EDT

#*******************************************************************************
#*  Component:   BF1736-P.p                                                    *
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

P-STEP BF1736-P
{
    ATTRIBUTES
    {
        BusinessFunctionId = "1736";
        BusinessFunctionName = "Fund Inquiry - Initial Units";
        BusinessFunctionType = "Initunt";
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

    OUT MIR-CFN-INTG-IUNIT-QTY-T[139]
    {
        Length = "13";
        Decimals = "9";
        FieldGroup = "Table139";
        DBTableName = "TFD";
        SType = "Number";
        Label = "Total Units";
        Index = "1";
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

    OUT MIR-CIA-REVRS-STAT-CD-T[139]
    {
        Length = "1";
        FieldGroup = "Table139";
        CodeSource = "DataModel";
        CodeType = "CIA-REVRS-STAT-CD";
        DBTableName = "TFA";
        SType = "Text";
        Label = "Reversal Status";
        Index = "1";
    }

    OUT MIR-FIA-INTG-IUNIT-QTY-T[139]
    {
        Length = "13";
        Decimals = "9";
        FieldGroup = "Table139";
        DBTableName = "TFD";
        SType = "Number";
        Label = "Net Unit Change";
        Index = "1";
    }

    OUT MIR-FIA-IUNIT-PRIC-AMT-T[139]
    {
        Length = "17";
        Decimals = "9";
        FieldGroup = "Table139";
        DBTableName = "TFD";
        SType = "Currency";
        Label = "Unit Price";
        Index = "1";
    }

    OUT MIR-FIA-UNIT-STAT-CD-T[139]
    {
        Length = "1";
        FieldGroup = "Table139";
        CodeSource = "DataModel";
        CodeType = "FIA-UNIT-STAT-CD";
        DBTableName = "TFD";
        SType = "Text";
        Label = "Unit Status";
        Index = "1";
    }

    OUT MIR-FND-ID-T[139]
    {
        Length = "9";
        FieldGroup = "Table139";
        KeyColumn;
        CodeSource = "EDIT";
        CodeType = "SEGFD";
        DBTableName = "TFD";
        SType = "Text";
        Label = "Fund";
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

