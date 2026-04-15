#*******************************************************************************
#*  Component:   BF9305-P.p                                                    *
#*  Description: Created for Advance Payment Deferral Management Screen        *
#*                                                                             *
#*******************************************************************************
#*  Chg#    Release  Description                                               *
#*                                                                             *
#* M271B2   19MAR15  INITIAL VERSION                                           *
#*******************************************************************************

P-STEP BF9304-P
{
    ATTRIBUTES
    {
        BusinessFunctionId = "9304";
        BusinessFunctionName = "Advance Payment Deferral Management";
        BusinessFunctionType = "Retrieve";
        MirName = "CCWM9304";
    }

    OUT LSIR-RETURN-CD;

    OUT MIR-RETRN-CD;

    IN MIR-POL-ID-BASE
    {
        Key;
        Mandatory;
        Length = "9";
        DBTableName = "TPOL";
        DefaultSession = "MIR-POL-ID-BASE";
        SType = "Text";
        Label = "Policy ID";
    }

    IN MIR-POL-ID-SFX
    {
        Key;
        Length = "1";
        DBTableName = "TPOL";
        DefaultSession = "MIR-POL-ID-SFX";
        SType = "Text";
        Label = "Suffix";
    }

    OUT MIR-PLAN-ID
    {
        Length = "6";
        DBTableName = "TPOL";
        SType = "Text";
        CodeSource = "EDIT";
        CodeType = "PLAN";
        Label = "Plan ID";
    }

    OUT MIR-DV-OWN-CLI-NM
    {
        Length = "75";
        DBTableName = "Derived";
        SType = "Text";
        Label = "Owner Name";
    }

    INOUT  MIR-PRCES-DT
    {
        Length = "10";
        DBTableName = "Derived";
        DefaultSession = "LSIR-PRCES-DT";
        SType = "Date";
        Label = "Processing Date";
    }

    OUT MIR-ADV-PMT-CAT-CD-T[50]
    {
        FieldGroup = "Table50";
        Index = "1";
        Length = "4";
        CodeSource = "DataModel";
        CodeType = "ADV-PMT-CAT-CD";
        SType = "Text";
        Label = "Category";
    }
    
     OUT MIR-PRCES-YY-MO-DT-T[50]
     {
       FieldGroup = "Table50";
       Index = "1";
       Length = "10";
       SType = "Date";
       Label = "Processing Year, Month and Date";
    }
    
     OUT MIR-EFF-DT-T[50]
     {
       FieldGroup = "Table50";
       Index = "1";
       Length = "10";
       SType = "Date";
       Label = "Effective Date";
     }
    
     OUT MIR-GEN-AMT-T[50]
     {
       FieldGroup = "Table50";
       Index = "1";
       Signed;
       Length = "15";
       SType = "Currency";
       Label = "Generation Amount";
      }

     OUT MIR-DEFR-INT-AMT-T[50]
     {
       FieldGroup = "Table50";    
       Index = "1";    
       Signed;    
       Length = "15";    
       SType = "Currency";    
       Label = "Interest Amount";    
      }    
      
     OUT MIR-RSDUE-AMT-T[50]
     {
      FieldGroup = "Table50";
      Index = "1";
      Signed;
      Length = "15";
      SType = "Currency";
      Label = "Residuals of Advance Payment";
    }
    
     OUT MIR-NUM-MO-INT-CAP-T[50]  
     {  
      FieldGroup = "Table50";  
      Index = "1";  
      Length = "2";  
      SType = "Text";  
      Label = "Number of Months of Interest Capitalization";  
    }
    
     OUT MIR-INT-RT-T[50]
     {
       FieldGroup = "Table50";
       Index = "1";
       Length = "7";
       Decimals = "4";
       DBTableName = "TIR";
       SType = "Percent";
       Label = "Interest Rate";
     }
  
     OUT MIR-ADV-PMT-STAT-CD-T[50]
     {
      FieldGroup = "Table50";
      Index = "1";
      Length = "1";
      CodeSource = "DataModel";
      CodeType = "PCHST-STAT-CD";
      SType = "Text";
      Label = "Status";
    }
    
    OUT MIR-PRCES-DT-T[50]
    {
     FieldGroup = "Table50";
     Index = "1";
     Length = "10";
     DBTableName = "Derived";
     SType = "Date";
     Label = "Processing Date";
    }
}

