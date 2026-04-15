# Converted from PathFinder 2.2 to 3.0 Jun 18, 2004 3:13:54 PM EDT

#*******************************************************************************
#*  Component:   BF9E61-P.p                                                    *
#*  Description:                                                               *
#*                                                                             *
#*******************************************************************************
#*  Chg#    Release  Description                                               *
#*  15997A  CTS      CHANGES FOR FRA PREMIUM REDUCTION SIMULATION SCREEN       *
#*******************************************************************************


P-STEP BF9E61-P
{
    ATTRIBUTES
    {
        BusinessFunctionId = "9E61";
        BusinessFunctionName = "FRA Premium Reduction Simulation";
        BusinessFunctionType = "List";
        DelEmptyRows;
        MirName = "CCWM9E61";
    }

    OUT LSIR-RETURN-CD;

    OUT MIR-RETRN-CD;

    INOUT MIR-POL-ID-BASE
    {
        Key;
        Mandatory;
        Length = "9";
        DBTableName = "TPOL";
        SType = "Text";
        Label = "Policy ID";
    }

    INOUT MIR-POL-ID-SFX
    {
        Key;
        Length = "1";
        DBTableName = "TPOL";
        SType = "Text";
        Label = "Suffix";
    }
    
    OUT MIR-SIMULTN-DT
    {
        Length = "10";
        DBTableName = "TPOL";
        SType = "Date";
        Label = "Simulation Date";
    }
    OUT MIR-POL-CSTAT-CD
    {
        Length = "40";
        CodeSource = "DataModel";
        CodeType = "POL-CSTAT-CD";
        DBTableName = "TPOL";
        SType = "Text";
        Label = "Policy Status";
    }
    OUT MIR-SC-PREM-DUE-MO-T[12]
    {
        Length = "7";
        DisplayOnly;
        FieldGroup = "Table2";
        DBTableName = "Derived";
        SType = "Text";
        Label = "Premium Due Month";
        Index = "1";
        KeyColumn;
    }
     OUT MIR-SC-ELAPS-MO-T[12]    
     {
         Length = "2";
         DisplayOnly;
          FieldGroup = "Table2";
          SType = "Text";
          Label = "# of Elapsed Years From Iss DT"; 
          Index = "1";  
    }
     OUT MIR-SC-INSRD-AGE-T[12]
     {
      Length = "3";
      DisplayOnly;
      Decimals = "0";
      SType = "Number";
      Label = "Age";
      FieldGroup = "Table2";
      Index = "1";       
     } 
    OUT MIR-SC-PREM-YEN-AMT-T[12]
    {
        Length = "14";
        DisplayOnly;
        SType = "Currency";
        Label = "P Yen Amount";
         FieldGroup = "Table2";
         Index = "1"; 
    }
    OUT MIR-SC-ACUM-JP-PREM-AMT-T[12]
    {
        Length = "14";
        DisplayOnly;
        SType = "Currency";
        Label = "Accum. P Yen Amount";
        Index = "1";
        FieldGroup = "Table2"; 
    }    
    OUT MIR-SC-ACUM-FC-PREM-AMT-T[12]
    {
        Length = "16";
        DisplayOnly;
        SType = "Currency";
        Label = "Accum. P Amount";
        Index = "1";
        FieldGroup = "Table2"; 
        
    }    
    OUT MIR-SC-UNEARN-PREM-AMT-T[12]
    {
        Length = "16";
        DisplayOnly;
        SType = "Currency";
        Label = "Unearned P";
        Index = "1";
        FieldGroup = "Table2"; 
    }        
    OUT MIR-SC-INT-RT-T[12]
    {
        Length = "5";
        DisplayOnly;
        Decimals = "2";
        SType = "Percent";
        Label = "Interest RT";
        Index = "1";
        FieldGroup = "Table2"; 
    }    
    OUT MIR-SC-ACUM-FC-PV-AMT-T[12]
    {
        Length = "16";
        DisplayOnly;
        SType = "Currency";
        Label = "Accum. PV (FC)";
        Index = "1";
        FieldGroup = "Table2"; 
    }     
    OUT MIR-SC-FC-DB-AMT-T[12]
    {
        Length = "16";
        DisplayOnly;
        SType = "Currency";
        Label = "Death Benefit (FC)";
        Index = "1";
        FieldGroup = "Table2"; 
    }    
    OUT MIR-SC-FC-CSV-AMT-T[12]
    {
        Length = "16";
        DisplayOnly;
        SType = "Currency";
        Label = "CSV (FC)";
        Index = "1";
        FieldGroup = "Table2"; 
    }     
    OUT MIR-SC-FC-CSV-INT-RT-T[12]
    {
        Length = "5";
        DisplayOnly;
        Decimals = "1";
        SType = "Percent";
        Label = "CSV Return RT (FC)";
        Index = "1";
        FieldGroup = "Table2"; 
    }    
    OUT MIR-SC-YEN-CSV-AMT-T[12]
    {
        Length = "14";
        DisplayOnly;
        SType = "Currency";
        Label = "CSV (Yen)";
        Index = "1";
        FieldGroup = "Table2"; 
    }     
    OUT MIR-SC-YEN-CSV-INT-RT-T[12]
    {
        Length = "5";
        DisplayOnly;
        Decimals = "1";
        SType = "Percent";
        Label = "CSV Return RT (Yen)";
        Index = "1";
        FieldGroup = "Table2"; 
    }    
    IN MIR-DV-PRCES-STATE-CD
    {
        Length = "1";
        DBTableName = "Derived";
        SType = "Hidden";
        Label = "MIR-DV-PRCES-STATE-CD";
    }
    
   INOUT MIR-POL-CRCY-CD
   {   
       Length = "2";
       SType = "Hidden";
       Label = "Currency";
               
    }
    IN MIR-TRNXT-YR-MO-T[7]
    {
        Key;
        Length = "7";
        FieldGroup = "Table5";
        DBTableName = "TPOL";
        SType = "Text";
        Label = "Transaction Year & Month";
        Index = "1";        
    }
    
    IN MIR-TRNXT-TYP-CD-T[7]
    {
        Length = "40";
        DBTableName = "TPOL";
        FieldGroup = "Table5";      
        SType = "Text";
        Label = "Transaction Type";
        Index = "1";        
    }
    
    IN MIR-PREM-TRNXT-AMT-T[7]
    {
        Key;
        Length = "14";
        FieldGroup = "Table5";       
        DBTableName = "TPOL";
        SType = "Currency";
        Label = "Premium After Transaction";
        Index = "1";        
    }
    IN MIR-SC1-CRNT-RT
    {
        Length = "5";
        Decimals = "2";
        SType = "Percent";
        Label = "Same As Current Rate";
    }

    IN MIR-SC2-MIN-GUAR-RT
    {
        Length = "5";
        Decimals = "2";
        SType = "Percent";
        Label = "Minimum Guaranteed Rate";
    }

    IN MIR-SC3-OPTL-ENTR-RT
    {
        Length = "5";
        SType = "Text";
        Label = "Optional Entry Rate";
    }

    IN MIR-SC4-OPTL-ENTR-RT
    {
        Length = "5";
        SType = "Text";
        Label = "Optional Entry Rate";
    }    
    IN MIR-SC-INT-RT
    {
        Length = "5";
        SType = "Text";
        Label = "Interest RT";
    }  
    IN MIR-SC-PREM-DUE-MO
    {
        Length = "7";
        SType = "Text";
        Label = "Premium Due Month";
    }
}    
    
    
    
    
    
    
    