# Converted from PathFinder 2.2 to 3.0 Jun 18, 2004 3:13:34 PM EDT

#*******************************************************************************
#*  Component:   BF1133-P.p                                                    *
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

P-STEP BF1133-P
{
    ATTRIBUTES
    {
        BusinessFunctionId = "1133";
        BusinessFunctionName = "Withdrawal History Summary";
        BusinessFunctionType = "Summaryw";
        MirName = "CCWM8120";
    }

    OUT LSIR-RETURN-CD;

    OUT MIR-RETRN-CD;

    INOUT MIR-CDA-EFF-IDT-NUM
    {
        Key;
        Length = "10";
        DBTableName = "TCDSA";
        DefaultSession = "LSIR-PRCES-DT";
        SType = "Date";
        Label = "Withdrawal Transaction Effective Date";
    }

    INOUT MIR-CDA-SEQ-NUM
    {
        Key;
        Length = "3";
        DBTableName = "TCDSA";
        DefaultConstant = "999";
        SType = "Text";
        Label = "Withdrawal Sequence Number";
    }

    INOUT MIR-POL-PAYO-NUM
    {
        Key;
        Length = "5";
        DBTableName = "TCDSA";
        DefaultConstant = "99999";
        SType = "Text";
        Label = "Withdrawal Payout Number";
    }

    IN MIR-POL-ID-BASE
    {
        Key;
        Mandatory;
        Length = "9";
        DBTableName = "TCDSA";
        DefaultSession = "MIR-POL-ID-BASE";
        SType = "Text";
        Label = "Policy Id";
    }

    IN MIR-POL-ID-SFX
    {
        Key;
        Length = "1";
        DBTableName = "TCDSA";
        DefaultSession = "MIR-POL-ID-SFX";
        SType = "Text";
        Label = "Suffix";
    }

    OUT MIR-CDA-EFF-IDT-NUM-T[12]
    {
        Length = "10";
        FieldGroup = "Table12";
        KeyColumn;
        DBTableName = "TCDSA";
        SType = "Date";
        Label = "Withdrawal Effective Date";
        Index = "1";
    }

    OUT MIR-CDA-SEQ-NUM-T[12]
    {
        Length = "3";
        FieldGroup = "Table12";
        DBTableName = "TCDSA";
        SType = "Text";
        Label = "Sequence Number";
        Index = "1";
    }

    OUT MIR-CDA-STAT-CD-T[12]
    {
        Length = "40";
        FieldGroup = "Table12";
        CodeSource = "DataModel";
        CodeType = "CDA-STAT-CD";
        DBTableName = "TCDSA";
        SType = "Text";
        Label = "Status";
        Index = "1";
    }

    OUT MIR-CDA-TOT-DWCHRG-AMT-T[12]
    {
        Length = "15";
        FieldGroup = "Table12";
        DBTableName = "TCDSA";
        SType = "Currency";
        Label = "Surrender Charge";
        Index = "1";
    }

    OUT MIR-CDA-TOT-TRXN-AMT-T[12]
    {
        Length = "15";
        FieldGroup = "Table12";
        DBTableName = "TCDSA";
        SType = "Currency";
        Label = "Total Amount";
        Index = "1";
    }

    OUT MIR-POL-PAYO-NUM-T[12]
    {
        Length = "5";
        FieldGroup = "Table12";
        DBTableName = "TCDSA";
        SType = "Text";
        Label = "Payout Number";
        Index = "1";
    }

    OUT MIR-WTHDR-CHRG-INCL-CD-T[12]
    {
        Length = "40";
        FieldGroup = "Table12";
        CodeSource = "DataModel";
        CodeType = "WTHDR-CHRG-INCL-CD";
        DBTableName = "TCDSA";
        SType = "Text";
        Label = "Withdrawal Reason";
        Index = "1";
    }
#MP245K CHANGES START HERE  
    OUT MIR-TOT-TRXN-AMT-YEN-T[12]
    {
        Length = "15";
        FieldGroup = "Table12";
        DBTableName = "TFBNK";
        SType = "Currency";
        Label = "Total Amount";
        Index = "1";
    }
    OUT MIR-CRCY-XCHNG-RT-T[12]
    { 
        Length = "7";
        Decimals = "2";
        DBTableName = "TFBNK";
        SType = "Text";
        Label = "Currency Exchange rate";     
    }
   OUT MIR-POL-CRCY-CD-T[12] 
   {
     Length = "2";
     FieldGroup = "Table1";
     Index = "1";
     SType = "Hidden";
     Label = "Remittance Currency Code";
  } 
   OUT MIR-PAYO-CRCY-CD-T[12] 
   {
     Length = "2";
     FieldGroup = "Table1";
     Index = "1";
     SType = "Hidden";
     Label = "Remittance Currency Code";
  }   
#MP245K CHANGES ENDS HERE      
    OUT MIR-WTHDR-OVRID-IND-T[12]
    {
        Length = "1";
        FieldGroup = "Table12";
        DBTableName = "TCDSA";
        SType = "Indicator";
        Label = "Withdrawal Override Indicator";
        Index = "1";
    }

    OUT MIR-DV-OWN-CLI-NM
    {
        Length = "75";
        DBTableName = "Derived";
        SType = "Text";
        Label = "Owner Name";
    }

}

