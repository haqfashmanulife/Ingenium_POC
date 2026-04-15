# Converted from PathFinder 2.2 to 3.0 Jun 18, 2004 3:13:02 PM EDT

#*******************************************************************************
#*  Component:   BF9E61-O.s                                                    *
#*  Description:                                                               *
#*                                                                             *
#*******************************************************************************
#*  Chg#    Release  Description                                               *
#*  15997A  CTS      CHANGES FOR FRA PREMIUM REDUCTION SIMULATION SCREEN       *
#*******************************************************************************

S-STEP BF9E61-O
{
    ATTRIBUTES
    {
        BusinessFunctionType = "List";
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

    IN MIR-POL-ID-BASE
    {
        DisplayOnly;
        Length = "9";
        DBTableName = "TPOL";
        SType = "Text";
        Label = "Policy ID";
    }

    IN MIR-POL-ID-SFX
    {
        Length = "1";
        DisplayOnly;
        DBTableName = "TPOL";
        SType = "Text";
        Label = "Suffix";
    }
    
    IN MIR-SIMULTN-DT
    {
        Length = "10";
        DisplayOnly;
        DBTableName = "TPOL";
        SType = "Date";
        Label = "Simulation Date";
    }
    IN MIR-POL-CSTAT-CD
    {
        Length = "40";
        DisplayOnly;
        CodeSource = "DataModel";
        CodeType = "POL-CSTAT-CD";
        DBTableName = "TPOL";
        SType = "Text";
        Label = "Policy Status";
    }
    IN MIR-SC-PREM-DUE-MO-T[12]
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
     IN MIR-SC-ELAPS-MO-T[12]    
     {
         Length = "2";
         DisplayOnly;
          FieldGroup = "Table2";
          SType = "Text";
          Label = "# of Elapsed Years From Iss DT"; 
          Index = "1";  
    }
     IN MIR-SC-INSRD-AGE-T[12]
     {
      Length = "3";
      DisplayOnly;
      Decimals = "0";
      SType = "Number";
      Label = "Age";
      FieldGroup = "Table2";
      Index = "1";       
     } 
    IN MIR-SC-PREM-YEN-AMT-T[12]
    {
        Length = "14";
        DisplayOnly;
        SType = "Currency";
        Label = "P Yen Amount";
         FieldGroup = "Table2";
         Index = "1"; 
    }
    IN MIR-SC-ACUM-JP-PREM-AMT-T[12]
    {
        Length = "14";
        DisplayOnly;
        SType = "Currency";
        Label = "Accum. P Yen Amount";
        Index = "1";
        FieldGroup = "Table2"; 
    }    
    IN MIR-SC-ACUM-FC-PREM-AMT-T[12]
    {
        Length = "16";
        DisplayOnly;
        CurrencyCode = "MIR-POL-CRCY-CD";
        SType = "Currency";
        Label = "Accum. P Amount";
        Index = "1";
        FieldGroup = "Table2"; 
        
    }    
    IN MIR-SC-UNEARN-PREM-AMT-T[12]
    {
        Length = "16";
        DisplayOnly;
        SType = "Currency";
        Label = "Unearned P";
        Index = "1";
        FieldGroup = "Table2"; 
    }        
    IN MIR-SC-INT-RT-T[12]
    {
        Length = "5";
        DisplayOnly;
        Decimals = "2";
        SType = "Percent";
        Label = "Interest RT";
        Index = "1";
        FieldGroup = "Table2"; 
    }    
    IN MIR-SC-ACUM-FC-PV-AMT-T[12]
    {
        Length = "16";
        DisplayOnly;
        CurrencyCode = "MIR-POL-CRCY-CD";
        SType = "Currency";
        Label = "Accum. PV (FC)";
        Index = "1";
        FieldGroup = "Table2"; 
    }     
    IN MIR-SC-FC-DB-AMT-T[12]
    {
        Length = "16";
        DisplayOnly;
        SType = "Currency";
        CurrencyCode = "MIR-POL-CRCY-CD";
        Label = "Death Benefit (FC)";
        Index = "1";
        FieldGroup = "Table2"; 
    }    
    IN MIR-SC-FC-CSV-AMT-T[12]
    {
        Length = "16";
        DisplayOnly;
        CurrencyCode = "MIR-POL-CRCY-CD";
        SType = "Currency";
        Label = "CSV (FC)";
        Index = "1";
        FieldGroup = "Table2"; 
    }     
    IN MIR-SC-FC-CSV-INT-RT-T[12]
    {
        Length = "5";
        DisplayOnly;
        Decimals = "1";
        SType = "Percent";
        Label = "CSV Return RT (FC)";
        Index = "1";
        FieldGroup = "Table2"; 
    }    
    IN MIR-SC-YEN-CSV-AMT-T[12]
    {
        Length = "14";
        DisplayOnly;
        SType = "Currency";
        Label = "CSV (Yen)";
        Index = "1";
        FieldGroup = "Table2"; 
    }     
    IN MIR-SC-YEN-CSV-INT-RT-T[12]
    {
        Length = "5";
        DisplayOnly;
        Decimals = "1";
        SType = "Percent";
        Label = "CSV Return RT (Yen)";
        Index = "1";
        FieldGroup = "Table2"; 
    }  
     INOUT MIR-POL-CRCY-CD
   {   
       Length = "2";
       SType = "Hidden";
       Label = "Currency";
               
    }
       
    
}    
    
