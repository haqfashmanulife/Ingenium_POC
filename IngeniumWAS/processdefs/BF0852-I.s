# Converted from PathFinder 2.2 to 3.0 Jun 18, 2004 3:12:30 PM EDT

#*******************************************************************************
#*  Component:   BF0852-I.s                                                    *
#*  Description:                                                               *
#*                                                                             *
#*******************************************************************************
#*  Chg#    Release  Description                                               *
#*                                                                             *
#*  014590  6.0      New for release 6.0                                       *
#*  017150  612J     Remove Currency Decimals = "2"                            *
#*  MFPF10  CLB      Remove Currency Decimals = "4" for allocation %.          *
#*  PF30    AKATO    PF 3.0 Retrofit 2004AUG09                                 *
#*  MFFALL  CLB      Modify to support allocation by amount for 2-tier,        *
#*  MFFALL           Cvg-Fund level system.                                    *
#*  M245B2  CTS      Foreign Currency Formatting 			       *
#*******************************************************************************

S-STEP BF0852-I
{
    ATTRIBUTES
    {
    BusinessFunctionType = "Update";
    FocusField = "MIR-CDI-CVG-ALLOC-AMT-T[1]";
 #  FocusField = "MIR-CDI-ALLOC-PCT-T[1]";
    FocusFrame = "ContentFrame";
    Type = "Input";
    }

    IN Title;

    IN TitleBar;

    IN TitleBarSize;

    IN ButtonBar;

    IN ButtonBarSize;

    IN MessageFrame;

    IN MessageFrameSize;

    OUT action
    {
        SType = "Hidden";
    }

    OUT index
    {
        SType = "Hidden";
    }

    INOUT MIR-CDI-CVG-ALLOC-AMT-T[139]
    {
#M245B2 CHANGES START HERE    
        CurrencyCode="MIR-POL-CRCY-CD";
#M245B2 CHANGES END HERE     
        Length = "15";
        FieldGroup = "Table139";
        SType = "Currency";
        Label = "Allocation Amount to Coverage";
        Index = "1";
    }

    INOUT MIR-CDI-ALLOC-PCT-T[139]
    {
        Length = "7";
        Decimals = "0";
    #   Decimals = "4";
        FieldGroup = "Table139";
        SType = "Percent";
        Label = "Allocation Percentage to Fund";
    #   Label = "Allocation Percentage";
        Index = "1";
    }

    INOUT MIR-CDI-TOT-ALLOC-AMT
    {
#M245B2 CHANGES START HERE    
        CurrencyCode="MIR-POL-CRCY-CD";
#M245B2 CHANGES END HERE     
        Label = "Total Allocation Amount";
        Length = "17";
        SType = "Currency";
    }

    IN MIR-CDI-EFF-DT
    {
        Key;
        DisplayOnly;
        Length = "10";
        DefaultSession = "LSIR-PRCES-DT";
        SType = "Date";
        Label = "Effective Date";
    }

    IN MIR-DV-POL-PAYO-TYP-CD
    {
        Key;
        DisplayOnly;
        Length = "40";
        CodeSource = "DataModel";
        CodeType = "DV-POL-PAYO-TYP-CD";
        SType = "Text";
        Label = "Allocation Type";
    }

    IN MIR-POL-ID-BASE
    {
        Key;
        DisplayOnly;
        Length = "9";
        DefaultSession = "MIR-POL-ID-BASE";
        SType = "Text";
        Label = "Policy Id";
    }

    IN MIR-POL-ID-SFX
    {
        Key;
        DisplayOnly;
        Length = "1";
        DefaultSession = "MIR-POL-ID-SFX";
        SType = "Text";
        Label = "Suffix";
    }

    IN MIR-CDI-STAT-CD
    {
        DisplayOnly;
        Length = "40";
        CodeSource = "DataModel";
        CodeType = "CDI-STAT-CD";
        SType = "Text";
        Label = "Allocation Status";
    }

    IN MIR-CFN-STAT-CD-T[139]
    {
        DisplayOnly;
        Length = "40";
        FieldGroup = "Table139";
        CodeSource = "DataModel";
        CodeType = "CFN-STAT-CD";
        SType = "Text";
        Label = "Status";
        Index = "1";
    }

    IN MIR-CVG-CSTAT-CD-T[139]
    {
        DisplayOnly;
        Length = "40";
        FieldGroup = "Table139";
        CodeSource = "DataModel";
        CodeType = "CVG-CSTAT-CD";
        SType = "Text";
        Label = "Coverage Status";
        Index = "1";
    }

    IN MIR-DV-FND-DESC-TXT-T[139]
    {
        DisplayOnly;
        Length = "40";
        FieldGroup = "Table139";
        KeyColumn;
        SType = "Text";
        Label = "Fund Description";
        Index = "1";
    }

    IN MIR-CVG-NUM-T[139]
    {
        Length = "2";
        FieldGroup = "Table139";
        SType = "Text";
        Label = "Coverage Number";
        Index = "1";
    }

    IN MIR-FND-ID-T[139]
    {
        Length = "40";
        FieldGroup = "Table139";
        SType = "Text";
        Label = "Fund ID";
        Index = "1";
    }

    IN MIR-PLAN-ID-T[139]
    {
        Length = "40";
        FieldGroup = "Table139";
        CodeSource = "EDIT";
        CodeType = "PLAN";  
        SType = "Text";
        Label = "Plan";
        Index = "1";
    }

    INOUT MIR-SUPRES-ALLOC-NOTI-IND
    {
        Length = "1";
        SType = "Indicator";
        Label = "Suppress Allocation Notification";
    }

    INOUT MIR-ALLOC-AUTO-DT-IND
    {
        Length = "1";
        SType = "Indicator";
        Label = "Automatic Date Setting";
    }

    IN MIR-CDI-ALLOC-AMT-T[139]
    {
#M245B2 CHANGES START HERE    
        CurrencyCode="MIR-POL-CRCY-CD";
#M245B2 CHANGES END HERE     
        Length = "15";
        FieldGroup = "Table139";
        SType = "Currency";
        Label = "Amount Allocation to Fund";
        Index = "1";
    }

    IN MIR-DV-JS-LOAD-CD-T[139]
    {
        Length = "1";
        FieldGroup = "Table139";
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
     
