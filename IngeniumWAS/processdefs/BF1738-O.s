# Converted from PathFinder 2.2 to 3.0 Jun 18, 2004 3:12:49 PM EDT

#*******************************************************************************
#*  Component:   BF1738-O.s                                                    *
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

S-STEP BF1738-O
{
    ATTRIBUTES
    {
        BusinessFunctionType = "Gainloss";
        Type = "Output";
        DelEmptyRows;
        FocusField = "OKButton";
        FocusFrame = "ButtonFrame";
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

    IN MIR-CIA-EFF-DT
    {
        Key;
        DisplayOnly;
        Length = "10";
        DefaultSession = "LSIR-PRCES-DT";
        SType = "Date";
        Label = "Activity Effective Date";
    }

    IN MIR-CIA-SEQ-NUM
    {
        Key;
        DisplayOnly;
        Length = "3";
        DefaultConstant = "999";
        SType = "Text";
        Label = "Sequence Number";
    }

    IN MIR-CIA-TYP-CD
    {
        DisplayOnly;
        Length = "3";
        CodeSource = "DataModel";
        CodeType = "CIA-TYP-CD";
        SType = "Text";
        Label = "Activity Type";
    }

    IN MIR-CVG-NUM
    {
        Key;
        DisplayOnly;
        Length = "2";
        DefaultConstant = "01";
        SType = "Text";
        Label = "Coverage Number";
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

    IN MIR-CFN-STAT-CD
    {
        DisplayOnly;
        Length = "40";
        CodeSource = "DataModel";
        CodeType = "CFN-STAT-CD";
        SType = "Text";
        Label = "Status";
    }

    IN MIR-FIA-FND-GLA-AMT-T[139]
    {
 #M245B2 CHANGES START HERE    
        CurrencyCode="MIR-POL-CRCY-CD";
#M245B2 CHANGES END HERE    
        DisplayOnly;
        Signed;
        Length = "15";
        FieldGroup = "Table139";
        SType = "Currency";
        Label = "Gain / Loss - Amount Charged to Fund";
        Index = "1";
    }

    IN MIR-FIA-GLA-CD-T[139]
    {
        DisplayOnly;
        Length = "1";
        FieldGroup = "Table139";
        KeyColumn;
        CodeSource = "DataModel";
        CodeType = "FIA-GLA-CD";
        SType = "Text";
        Label = "Gain / Loss - Calculation Type";
        Index = "1";
    }

    IN MIR-FIA-GNRL-GLA-AMT-T[139]
    {
#M245B2 CHANGES START HERE    
        CurrencyCode="MIR-POL-CRCY-CD";
#M245B2 CHANGES END HERE     
        DisplayOnly;
        Signed;
        Length = "15";
        FieldGroup = "Table139";
        SType = "Currency";
        Label = "Gain / Loss - Amount Charged to General Account";
        Index = "1";
    }

    IN MIR-FIA-REVRS-GLA-CD-T[139]
    {
        DisplayOnly;
        Length = "1";
        FieldGroup = "Table139";
        CodeSource = "DataModel";
        CodeType = "FIA-REVRS-GLA-CD";
        SType = "Text";
        Label = "Gain / Loss - Calculation Type on Reversal";
        Index = "1";
    }

    IN MIR-FND-ID-T[139]
    {
        DisplayOnly;
        Length = "9";
        FieldGroup = "Table139";
        CodeSource = "EDIT";
        CodeType = "SEGFD";
        SType = "Text";
        Label = "Fund";
        Index = "1";
    }

    IN MIR-REVRS-FND-GLA-AMT-T[139]
    {
#M245B2 CHANGES START HERE    
        CurrencyCode="MIR-POL-CRCY-CD";
#M245B2 CHANGES END HERE     
        DisplayOnly;
        Signed;
        Length = "15";
        FieldGroup = "Table139";
        SType = "Currency";
        Label = "Gain / Loss - Amount Charged to Fund for Reversal";
        Index = "1";
    }

    IN MIR-REVRS-GNRL-GLA-AMT-T[139]
    {
#M245B2 CHANGES START HERE    
        CurrencyCode="MIR-POL-CRCY-CD";
#M245B2 CHANGES END HERE     
        DisplayOnly;
        Signed;
        Length = "11";
        FieldGroup = "Table139";
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

