# Converted from PathFinder 2.2 to 3.0 Jun 18, 2004 3:13:30 PM EDT

#*******************************************************************************
#*  Component:   BF0851-P.p                                                    *
#*  Description:                                                               *
#*                                                                             *
#*******************************************************************************
#*  Chg#    Release  Description                                               *
#*                                                                             *
#*  014590  6.0      New for release 6.0                                       *
#*  017150  612J     Remove Currency Decimals = "2"                            *
#*  MFFALL  CLB      Modify to support allocation by amount for 2-tier,        *
#*  MFFALL           Cvg-Fund level system.                                    *
#*  M245B2  CTS      Foreign Currency Formatting 			       *
#*******************************************************************************

P-STEP BF0851-P
{
    ATTRIBUTES
    {
        BusinessFunctionId = "0851";
        BusinessFunctionName = "Coverage Allocation Create";
     #  BusinessFunctionName = "Policy Allocation Create";
        BusinessFunctionType = "Create";
        MirName = "CCWM3240";
    }

    OUT LSIR-RETURN-CD;

    OUT MIR-RETRN-CD;

    OUT MIR-CDI-ALLOC-PCT-T[139]
    {
        Length = "7";
        Decimals = "0";
        FieldGroup = "Table139";
        DBTableName = "TCDSI";
        SType = "Percent";
        Label = "Allocation Percentage to Fund";
        Index = "1";
    }

    OUT MIR-CVG-NUM-T[139]
    {
        Length = "2";
        FieldGroup = "Table139";
        DBTableName = "TCDSI";
        SType = "Text";
        Label = "Coverage Number";
        Index = "1";
    }

    OUT MIR-FND-ID-T[139]
    {
        Length = "40";
        FieldGroup = "Table139";
        DBTableName = "TFS";
        SType = "Text";
        Label = "Fund ID";
        Index = "1";
    }

    INOUT MIR-CDI-EFF-DT
  # IN MIR-CDI-EFF-DT
    {
        Key;
        Mandatory;
        Length = "10";
        DBTableName = "TCDSI";
        DefaultSession = "LSIR-PRCES-DT";
        SType = "Date";
        Label = "Effective Date";
    }

    IN MIR-DV-POL-PAYO-TYP-CD
    {
        Key;
        Mandatory;
        Length = "40";
        CodeSource = "DataModel";
        CodeType = "DV-POL-PAYO-TYP-CD";
        DBTableName = "Derived";
        SType = "Selection";
        Label = "Allocation Type";
    }

    IN MIR-POL-ID-BASE
    {
        Key;
        Mandatory;
        Length = "9";
        DBTableName = "TCAIN";
        DefaultSession = "MIR-POL-ID-BASE";
        SType = "Text";
        Label = "Policy Id";
    }

    IN MIR-POL-ID-SFX
    {
        Key;
        Length = "1";
        DBTableName = "TCAIN";
        DefaultSession = "MIR-POL-ID-SFX";
        SType = "Text";
        Label = "Suffix";
    }

    OUT MIR-CDI-STAT-CD
    {
        Length = "40";
        CodeSource = "DataModel";
        CodeType = "CDI-STAT-CD";
        DBTableName = "TCAIN";
        SType = "Text";
        Label = "Allocation Status";
    }

    OUT MIR-CDI-TOT-ALLOC-AMT
    {
        Length = "17";
        DBTableName = "TCAIN";
        SType = "Currency";
        Label = "Total Allocation Amount";
    }

    OUT MIR-CFN-STAT-CD-T[139]
    {
        Length = "40";
        FieldGroup = "Table139";
        CodeSource = "DataModel";
        CodeType = "CFN-STAT-CD";
        DBTableName = "TFS";
        SType = "Text";
        Label = "Status";
        Index = "1";
    }

    OUT MIR-CVG-CSTAT-CD-T[139]
    {
        Length = "40";
        FieldGroup = "Table139";
        CodeSource = "DataModel";
        CodeType = "CVG-CSTAT-CD";
        DBTableName = "TCVG";
        SType = "Text";
        Label = "Coverage Status";
        Index = "1";
    }

    OUT MIR-DV-FND-DESC-TXT-T[139]
    {
        Length = "40";
        FieldGroup = "Table139";
        KeyColumn;
        DBTableName = "Derived";
        SType = "Text";
        Label = "Fund Name";
        Index = "1";
    }

    INOUT MIR-SUPRES-ALLOC-NOTI-IND
    {
        Length = "1";
        DBTableName = "TPOLP";
        SType = "Indicator";
        Label = "Suppress Allocation Notification";
    }

    INOUT MIR-ALLOC-AUTO-DT-IND
    {
        Length = "1";
        DBTableName = "TPOLP";
        SType = "Indicator";
        Label = "Automatic Date Setting";
    }

    OUT MIR-PLAN-ID-T[139]
    {
        Length = "40";
        FieldGroup = "Table139";
        CodeSource = "EDIT";
        CodeType = "PLAN";
        DBTableName = "TCVG";
        SType = "Text";
        Label = "Plan";
        Index = "1";
    }

    OUT MIR-CDI-CVG-ALLOC-AMT-T[139]
    {
        Length = "15";
        FieldGroup = "Table139";
        DBTableName = "TCDSI";
        SType = "Currency";
        Label = "Allocation Amount to Coverage";
        Index = "1";
    }

    OUT MIR-CDI-ALLOC-AMT-T[139]
    {
        Length = "15";
        FieldGroup = "Table139";
        DBTableName = "TCDSI";
        SType = "Currency";
        Label = "Amount Allocation to Fund";
        Index = "1";
    }
     
    OUT MIR-DV-JS-LOAD-CD-T[139]
    {
        Length = "1";
        FieldGroup = "Table139";
        DBTableName = "Derived";
        SType = "Text";
        Label = "Java Script Load Code";
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

