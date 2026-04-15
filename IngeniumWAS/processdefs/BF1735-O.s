# Converted from PathFinder 2.2 to 3.0 Jun 18, 2004 3:12:49 PM EDT

#*******************************************************************************
#*  Component:   BF1735-O.s                                                    *
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

S-STEP BF1735-O
{
    ATTRIBUTES
    {
        BusinessFunctionType = "Accmunt";
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

    IN MIR-CFN-INTG-AUNIT-QTY-T[139]
    {
        DisplayOnly;
        Length = "13";
        Decimals = "9";
        FieldGroup = "Table139";
        SType = "Number";
        Label = "Approximate Number of Units";
        Index = "1";
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

    IN MIR-CIA-REVRS-STAT-CD-T[139]
    {
        DisplayOnly;
        Length = "1";
        FieldGroup = "Table139";
        CodeSource = "DataModel";
        CodeType = "CIA-REVRS-STAT-CD";
        SType = "Text";
        Label = "Reversal Status";
        Index = "1";
    }

    IN MIR-FIA-AUNIT-PRIC-AMT-T[139]
    {
#M245B2 CHANGES START HERE    
        CurrencyCode="MIR-POL-CRCY-CD";
#M245B2 CHANGES END HERE     
        DisplayOnly;
        Length = "17";
        Decimals = "9";
        FieldGroup = "Table139";
        SType = "Currency";
        Label = "Unit Price";
        Index = "1";
    }

    IN MIR-FIA-INTG-AUNIT-QTY-T[139]
    {
        DisplayOnly;
        Length = "13";
        Decimals = "9";
        FieldGroup = "Table139";
        SType = "Number";
        Label = "Net Unit Change";
        Index = "1";
    }

    IN MIR-FIA-UNIT-STAT-CD-T[139]
    {
        DisplayOnly;
        Length = "1";
        FieldGroup = "Table139";
        CodeSource = "DataModel";
        CodeType = "FIA-UNIT-STAT-CD";
        SType = "Text";
        Label = "Unit Status";
        Index = "1";
    }

    IN MIR-FND-ID-T[139]
    {
        DisplayOnly;
        Length = "9";
        FieldGroup = "Table139";
        KeyColumn;
        CodeSource = "EDIT";
        CodeType = "SEGFD";
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

