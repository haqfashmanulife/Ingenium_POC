# Converted from PathFinder 2.2 to 3.0 Jun 18, 2004 3:12:34 PM EDT

#*******************************************************************************
#*  Component:   BF1133-O.s                                                    *
#*  Description:                                                               *
#*                                                                             *
#*******************************************************************************
#*  Chg#    Release  Description                                               *
#*                                                                             *
#*  014590  6.0      New for release 6.0                                       *
#*  017150  612J     Remove Currency Decimals = "2"                            *
#*                                                                             *
#*  MP245K  CTS      CHANGES DONE FOR FA-REDUCTION AND SURRENDER               *
#*******************************************************************************

S-STEP BF1133-O
{
    ATTRIBUTES
    {
        BusinessFunctionType = "Summaryw";
        Type = "List";
        DelEmptyRows;
        FocusField = "moreButton";
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

    INOUT MIR-CDA-EFF-IDT-NUM
    {
        Key;
        Length = "10";
        DefaultSession = "LSIR-PRCES-DT";
        SType = "Date";
        Label = "Withdrawal Transaction Effective Date";
    }

    INOUT MIR-CDA-SEQ-NUM
    {
        Key;
        Length = "3";
        DefaultConstant = "999";
        SType = "Text";
        Label = "Withdrawal Sequence Number";
    }

    INOUT MIR-POL-PAYO-NUM
    {
        Key;
        Length = "5";
        DefaultConstant = "99999";
        SType = "Text";
        Label = "Withdrawal Payout Number";
    }

    INOUT MIR-POL-ID-BASE
    {
        Key;
        Length = "9";
        DefaultSession = "MIR-POL-ID-BASE";
        SType = "Text";
        Label = "Policy Id";
    }

    INOUT MIR-POL-ID-SFX
    {
        Key;
        Length = "1";
        DefaultSession = "MIR-POL-ID-SFX";
        SType = "Text";
        Label = "Suffix";
    }

    IN MIR-CDA-EFF-IDT-NUM-T[12]
    {
        DisplayOnly;
        Length = "10";
        FieldGroup = "Table12";
        KeyColumn;
        SType = "Date";
        Label = "Withdrawal Effective Date";
        Index = "1";
    }

    IN MIR-CDA-SEQ-NUM-T[12]
    {
        DisplayOnly;
        Length = "3";
        FieldGroup = "Table12";
        SType = "Text";
        Label = "Sequence Number";
        Index = "1";
    }

    IN MIR-CDA-STAT-CD-T[12]
    {
        DisplayOnly;
        Length = "40";
        FieldGroup = "Table12";
        CodeSource = "DataModel";
        CodeType = "CDA-STAT-CD";
        SType = "Text";
        Label = "Status";
        Index = "1";
    }

    IN MIR-CDA-TOT-DWCHRG-AMT-T[12]
    {
        DisplayOnly;
        Length = "15";
        FieldGroup = "Table12";
        SType = "Currency";
        Label = "Surrender Charge";
        Index = "1";
    }

    IN MIR-CDA-TOT-TRXN-AMT-T[12]
    {
        DisplayOnly;
        CurrencyCode="MIR-POL-CRCY-CD-T[]";        
        Length = "15";
        FieldGroup = "Table12";
        SType = "Currency";
        Label = "Total Amount";
        Index = "1";
    }

    IN MIR-POL-PAYO-NUM-T[12]
    {
        DisplayOnly;
        Length = "5";
        FieldGroup = "Table12";
        SType = "Text";
        Label = "Payout Number";
        Index = "1";
    }

    IN MIR-WTHDR-CHRG-INCL-CD-T[12]
    {
        DisplayOnly;
        Length = "40";
        FieldGroup = "Table12";
        CodeSource = "DataModel";
        CodeType = "WTHDR-CHRG-INCL-CD";
        SType = "Text";
        Label = "Withdrawal Reason";
        Index = "1";
    }

    IN MIR-WTHDR-OVRID-IND-T[12]
    {
        DisplayOnly;
        Length = "1";
        FieldGroup = "Table12";
        SType = "Indicator";
        Label = "Withdrawal Override Indicator";
        Index = "1";
    }

    IN MIR-DV-OWN-CLI-NM
    {
        DisplayOnly;
        Length = "75";
        SType = "Text";
        Label = "Owner Name";
    }
#MP245K CHANGES START HERE    
    IN MIR-TOT-TRXN-AMT-YEN-T[12]
    {
        DisplayOnly;
        CurrencyCode="MIR-PAYO-CRCY-CD-T[]";
        Length = "15";
        FieldGroup = "Table12";
        SType = "Currency";
        Label = "Total Amount";
        Index = "1";
    }
    IN MIR-CRCY-XCHNG-RT-T[12]
    { 
        Length = "7";
        Decimals = "2";
        DBTableName = "TFBNK";
        SType = "Text";
        Label = "Currency Exchange rate";     
    } 
   IN MIR-PAYO-CRCY-CD-T[12] 
   {
     Length = "2";
     FieldGroup = "Table1";
     Index = "1";
     SType = "Hidden";
     Label = "Remittance Currency Code";
  }     
   IN MIR-POL-CRCY-CD-T[12] 
   {
     Length = "2";
     FieldGroup = "Table1";
     Index = "1";
     SType = "Hidden";
     Label = "Remittance Currency Code";
  }   
#MP245K CHANGES ENDS HERE    

}

