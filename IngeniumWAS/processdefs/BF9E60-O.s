
# Converted from PathFinder 2.2 to 3.0 Jun 18, 2004 3:13:02 PM EDT

#*******************************************************************************
#*  Component:   BF9E60-O.s                                                    *
#*  Description:                                                               *
#*                                                                             *
#*******************************************************************************
#*  Chg#    Release  Description                                               *
#*  15997A  CTS      CHANGES FOR FRA PREMIUM REDUCTION SIMULATION SCREEN       **
#*  15997D  CTS      CR01 & CR03 CHANGES FOR FRA PREMIUM REDUCTION SIMULATION  *
#*                   SCREEN                                                    *
#*  M2025A  CTS      CHANGES AS PART OF PREMIUM REDUCTION SIMULATION FRA-2025  *    
#*******************************************************************************

S-STEP BF9E60-O
{
    ATTRIBUTES
    {
        BusinessFunctionType = "Retrieve";
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
        Mandatory;
        Length = "9";
        DisplayOnly;
        DBTableName = "TPOL";
        SType = "Text";
        Label = "Policy ID";
    }

    IN MIR-POL-ID-SFX
    {
        Length = "1";
        DBTableName = "TPOL";
        DisplayOnly;
        SType = "Text";
        Label = "Suffix";
    }
    
    IN MIR-SIMULTN-DT
    {
        Length = "10";
        DBTableName = "TPOL";
        DisplayOnly;
        SType = "Date";
        Label = "Simulation Date";
    }
    IN MIR-POL-CSTAT-CD
    {
        Length = "40";
        CodeSource = "DataModel";
        CodeType = "POL-CSTAT-CD";
        DisplayOnly;
        DBTableName = "TPOL";
        SType = "Text";
        Label = "Policy Status";
    }
    IN MIR-SEQ-NO-T[7]
    {
        Length = "1";
        FieldGroup = "Table1";
        DBTableName = "TPOL";
        DisplayOnly;
        SType = "Text";
        Label = "#";
        Index = "1";        
    }


    IN MIR-TRNXT-YR-MO-T[7]
    {
        Length = "7";
        FieldGroup = "Table1";
        DBTableName = "TPOL";
        DisplayOnly;
        SType = "Text";
        Label = "Transaction Year & Month";
        Index = "1";        
    }

    IN MIR-TRNXT-TYP-CD-T[7]
    {
        Length = "40";
        DBTableName = "TPOL";
        FieldGroup = "Table1";
        DisplayOnly;
        CodeSource = "DataModel";
        CodeType = "POL-TRNXT-TYP-CD";        
        SType = "Text";
        Label = "Transaction Type";
        Index = "1";        
    }

    IN MIR-PREM-TRNXT-AMT-T[7]
    {
        Signed;
        Length = "14";
        DBTableName = "TPOL";
        DisplayOnly;
        FieldGroup = "Table1";        
        SType = "Currency";
        Label = "Premium After Transaction";
        Index = "1";        
    }

    IN MIR-SC1-CRNT-RT
    {
        Length = "5";
        DisplayOnly;
        Decimals = "2";
        SType = "Percent";
        Label = "Same As Current Rate";
    }

    IN MIR-SC2-MIN-GUAR-RT
    {
        Length = "5";
        Decimals = "2";
        DisplayOnly;
        SType = "Percent";
        Label = "Minimum Guaranteed Rate";
    }

    IN MIR-SC3-OPTL-ENTR-RT
    {
        Length = "5";
        DisplayOnly;
        SType = "Text";
        Label = "Optional Entry Rate";
    }

    IN MIR-SC4-OPTL-ENTR-RT
    {
        Length = "5";
        DisplayOnly;
        SType = "Text";
        Label = "Optional Entry Rate";
    }
    
    IN MIR-NO-OF-EXT-YR
    {
        Length = "1";
        DBTableName = "TPOL";
        DisplayOnly;
        SType = "Text";
        Label = "# of Extension years";
    }

    IN MIR-SEND-MTHD-CD
    {
        Length = "40";
        DisplayOnly;
        DBTableName = "TPOL";
        CodeSource = "DataModel";
        CodeType = "SEND-MTHD-CD";        
        SType = "Text";
        Label = "Send Method";
    }

    IN MIR-SEND-TO-LAST-NM
    {
        Length = "25";
        DisplayOnly;
        DBTableName = "TPOL";
        SType = "Text";
        Label = "Send To Last Name";
    }

    IN MIR-SEND-TO-FIRST-NM
    {
        Length = "25";
        DisplayOnly;
        DBTableName = "TPOL";
        SType = "Text";
        Label = "Send To First Name";
    }

#15997D CHANGES STARTS HERE
    IN MIR-SEND-TO-CO-NM
    {
        Length = "50";
        DisplayOnly;
        DBTableName = "TPOL";
        SType = "Text";
        Label = "Send To Company Name";
    }
#15997D CHANGES ENDS HERE

    IN MIR-SEND-TO-PSTL-CD
    {
        Length = "9";
        DisplayOnly;
        DBTableName = "TPOL";
        SType = "Text";
        Label = "Send To Postal Code";
    }
    IN MIR-SEND-TO-ADDR-TXT     
    {
        MixedCase;
        DisplayOnly;
#15997D CHANGES STARTS HERE
#       Length = "71";
        Length = "60";
#15997D CHANGES ENDS HERE
        DBTableName = "TPOL";
        SType = "Text";
        Label = "Send To Address";
    }
    IN MIR-SEND-TO-ADDR-ADDL-TXT
    {
        MixedCase;
        DisplayOnly;
        Length = "72";
        DBTableName = "TPOL";
        SType = "Text";
        Label = "Send To Address(Samakata-bu)";
    }
    IN MIR-STRT-YR-MO
    {  
        Length = "7";
        DisplayOnly;
        DBTableName = "TPOL";
        SType = "Text";
        Label = "Start Year & Month";

    }
    IN MIR-END-YR-MO
    {   
        Length = "7";
        DisplayOnly;
        DBTableName = "TPOL";
        SType = "Text";
        Label = "End Year & Month";
    
    }
    IN MIR-SML-PROD-CD
    {
      Length = "3";
      DisplayOnly;
      DBTableName = "TPOL";
      SType = "Text";
      Label = "Small Product Type";
    }
    IN MIR-PLAN-ID
    {
        Length = "40";
        DisplayOnly;
        CodeSource = "EDIT";
        CodeType = "PLAN";
        DBTableName = "TCVG";
        SType = "Text";
        Label = "Plan ID";
    }
    IN MIR-POL-ISS-EFF-DT
    { 
      Length = "10";
      DisplayOnly;
      DBTableName = "TPOL";
      SType = "Date";
      Label = "Policy Issue Date";
    }
   IN MIR-DV-OWN-CLI-NM
   {
      Length = "75";
      DisplayOnly;
      SType = "Text";
      Label = "Policyholder Name";
   }  
    IN MIR-DV-INSRD-CLI-NM
    {
        Length = "75";
        DisplayOnly;
        SType = "Text";
        Label = "Insured Name";
    }
    IN MIR-INSRD-SEX-CD 
    {
      Length = "40";
      DisplayOnly;
      CodeSource = "DataModel";
      CodeType = "CVG-SEX-CD";
      DBTableName = "TCVG";
      SType = "Text";
      Label = "Insured Gender";
      Length = "1";
    }
     IN MIR-INSRD-BTH-DT
     {
      Length = "10";
      DisplayOnly;
      DBTableName = "TCLI";
      SType = "Date";
      Label = "Insured DOB";
     }
     IN MIR-INSRD-ISS-AGE
     {
      Length = "3";
      DisplayOnly;
      Decimals = "0";
      SType = "Number";
      Label = "Insured Issue Age";
     }
     IN MIR-POL-CRCY-CD
     {
         Length = "2";
         DisplayOnly;
         CodeSource = "XTAB";
         CodeType = "CRCYS";
         SType = "Text";
         Label = "Policy Currency";
     }
     IN MIR-CVG-STBL-3-CD
     {
         Length = "40";
         DisplayOnly;
         CodeSource = "EDIT";
         CodeType = "STB3";
         DBTableName = "TCVG";
         SType ="Text";
         Label = "Premium Payment Period";
     }
     IN MIR-PREM-YEN-PMT-AMT
     {
        Length = "14";
        DisplayOnly;
        SType = "Currency";
        Label = "Premium Yen Payment Amount";     
     }
     IN MIR-CVG-STBL-4-CD
     {
         Length = "40";
         DisplayOnly;
         CodeSource = "EDIT";
         CodeType = "STB4";
         DBTableName = "TCVG";
         SType = "Text";
         Label = "Annuity Type";
    }
     IN MIR-ANTY-STRT-AGE
       {
        Length = "3";
        DisplayOnly;
        Decimals = "0";
        SType = "Number";
        Label = "Annuity Commencement Age";
       }
      IN MIR-ANTY-STRT-DT
       {
      Length = "10";
      DisplayOnly;
      DBTableName = "TPOL";
      SType = "Date";
      Label = "Annuity Commencement Date";
       }
      IN MIR-TRAD-PD-TO-MO-NUM
      {
          Length = "7";
          DisplayOnly;
          DBTableName = "Derived";
          SType = "Text";
          Label = "Trad Paid to Month";
      }
      IN MIR-TRAD-ACTL-PD-TO-MO-NUM
      {
          Length = "7";
          DisplayOnly;
          DBTableName = "Derived";
          SType = "Text";
          Label = "Trad Actual Paid to Month";
      }
   
      IN MIR-TRAD-PD-TO-DT-NUM
      {
          Length = "10";
          DisplayOnly;
          DBTableName = "TPOL";
          SType = "Text";
          Label = "Trad Paid to Date";
      }
      IN MIR-PD-TO-DT-NUM
      {
          Length = "10";
          DisplayOnly;
          DBTableName = "TPOL";
          SType = "Text";
          Label = "Paid to Date";
      }
            
      IN MIR-TRAD-PD-DUR-NUM
      {
          Length = "7";
          DisplayOnly;
          DBTableName = "Derived";
          SType = "Text";
          Label = "Trad Paid Duration";
      }
      IN MIR-TRAD-ACTL-PD-DUR-NUM
      {
          Length = "7";
          DisplayOnly;
          DBTableName = "Derived";
          SType = "Text";
          Label = "Trad Actual Paid Duration";
      }
    IN MIR-ACCUM-YEN-PREM-AMT
    {
        Length = "14";
        DisplayOnly;
        SType = "Currency";
        Label = "Accum.P Yen Amount as of Current (Excl.Unearned P)";
    }    
    IN MIR-UNEARN-PREM-AMT
    {
        Length = "14";
        DisplayOnly;
        SType = "Currency";
        Label = "Unearned Premium as of Current";
    }   
    IN MIR-ACCUM-POL-VALU-AMT
    {
        Length = "16";
        DisplayOnly;
        DBTableName = "TPOL";
        CurrencyCode = "MIR-POL-CRCY-CD";
        SType = "Currency";
        Label = "Accum. PV as of Current";
    }    
    IN MIR-INT-RT
    {
        Length = "5";
        DisplayOnly;
        Decimals = "2";
        SType = "Percent";
        Label = "Interest Rate as of Current";
    }
#15997D CHANGES STARTS HERE
#   IN MIR-DB-AMT
#   {
#       Length = "16";
#       DisplayOnly;
#       DBTableName = "TPOL";
#       CurrencyCode = "MIR-POL-CRCY-CD";
#       SType = "Currency";
#       Label = "Death Benefit as of Current";
#   }
#15997D CHANGES ENDS HERE
    IN MIR-CSV-AMT
    {
        Length = "16";
        DisplayOnly;
#15997D CHANGES STARTS HERE
#       DBTableName = "TPOL";
#       CurrencyCode = "MIR-POL-CRCY-CD";
        SType = "Currency";
#        Label = "CSV as of Current";
        Label = "CSV(Pay-out Currency) as of Current";
#15997D CHANGES ENDS HERE
    }
     IN MIR-PAYIN-RT
     {
         Length = "6";
         DisplayOnly;
         Decimals = "2";
         SType = "Number";
         Label = "Pay-In-Yen Rate as of Current";
    }
     IN MIR-PAYIN-RT-INFO
     {
         Length = "20";
         DisplayOnly;
         SType = "Text";
         Label = "Pay-In-Yen Rate info";
    }    
     IN MIR-PAYOUT-RT
     {
         Length = "6";
         DisplayOnly;
         Decimals = "2";
         SType = "Number";
         Label = "PayOut-In-Yen Rate as of Current";
    }
     IN MIR-PAYOUT-RT-INFO
     {
         Length = "20";
         DisplayOnly;
         SType = "Text";
         Label = "PayOut-In-Yen Rate info";
    }     
    IN MIR-ELAPS-YR-FRM-ISS-DT-T[7]    
    {
        Length = "2";
        DisplayOnly;
         FieldGroup = "Table1";
         SType = "Text";
         Label = "# of Elapsed Years From Iss DT"; 
         Index = "1";  
    }
    IN MIR-ELPSD-MO-POL-ANNV-T[7]    
    {
        Length = "2";
        DisplayOnly;
        FieldGroup = "Table1";
         SType = "Text";
         Label = "# of Elapsed Months From Policy Anniversary";
         Index = "1";  
    }    
    IN MIR-ANTY-STRT-AFT-EXT-DT
     {
    Length = "10";
    DisplayOnly;
    DBTableName = "TPOL";
    SType = "Date";
    Label = "Annuity Commencement Date after Extension";
     }
    IN MIR-SC1-PREM-DUE-MO-T[45]
    {
        Length = "7";
        DisplayOnly;
        FieldGroup = "Table2";
        DBTableName = "Derived";
        SType = "Text";
        Label = "Premium Due Month";
        Action = "SelectItem1";
        Index = "1";
        KeyColumn;
    }
    IN MIR-SC1-ELAPS-YR-T[45]    
    {
         Length = "2";
         DisplayOnly;
          FieldGroup = "Table2";
          SType = "Text";
          Label = "# of Elapsed Years From Iss DT"; 
          Index = "1";  
    }
    IN MIR-SC1-INSRD-AGE-T[45]
    {
      Length = "3";
      DisplayOnly;
      Decimals = "0";
      SType = "Number";
      Label = "Age";
      FieldGroup = "Table2";
      Index = "1";       
    } 
    IN MIR-SC1-PREM-YEN-AMT-T[45]
    {
        Length = "14";
        DisplayOnly;
        SType = "Currency";
        Label = "P Yen Amount";
         FieldGroup = "Table2";
         Index = "1"; 
    }
    IN MIR-SC1-ACUM-JP-PREM-AMT-T[45]
    {
        Length = "14";
        DisplayOnly;
        SType = "Currency";
        Label = "Accum. P Yen Amount";
        Index = "1";
        FieldGroup = "Table2"; 
    }    
    IN MIR-SC1-ACUM-FC-PREM-AMT-T[45]
    {
        Length = "16";
        DisplayOnly;
        CurrencyCode = "MIR-POL-CRCY-CD";
        SType = "Currency";
        Label = "Accum. P Amount";
        Index = "1";
        FieldGroup = "Table2"; 
        
    }    
    IN MIR-SC1-UNEARN-PREM-AMT-T[45]
    {
        Length = "16";
        DisplayOnly;
        SType = "Currency";
        Label = "Unearned P";
        Index = "1";
        FieldGroup = "Table2"; 
    }        
    IN MIR-SC1-INT-RT-T[45]
    {
        Length = "5";
        DisplayOnly;
        Decimals = "2";
        SType = "Percent";
        Label = "Interest RT";
        Index = "1";
        FieldGroup = "Table2"; 
    }    
    IN MIR-SC1-ACUM-FC-PV-AMT-T[45]
    {
        Length = "16";
        DisplayOnly;
        CurrencyCode = "MIR-POL-CRCY-CD";
        SType = "Currency";
        Label = "Accum. PV (FC)";
        Index = "1";
        FieldGroup = "Table2"; 
    }     
    IN MIR-SC1-FC-DB-AMT-T[45]
    {
        Length = "16";
        DisplayOnly;
        CurrencyCode = "MIR-POL-CRCY-CD";
        SType = "Currency";
        Label = "Death Benefit (FC)";
        Index = "1";
        FieldGroup = "Table2"; 
    }    
    IN MIR-SC1-FC-CSV-AMT-T[45]
    {
        Length = "16";
        DisplayOnly;
        CurrencyCode = "MIR-POL-CRCY-CD";
        SType = "Currency";
        Label = "CSV (FC)";
        Index = "1";
        FieldGroup = "Table2"; 
    }     
    IN MIR-SC1-FC-CSV-INT-RT-T[45]
    {
        Length = "5";
        DisplayOnly;
        Decimals = "1";
        SType = "Percent";
        Label = "CSV Return RT (FC)";
        Index = "1";
        FieldGroup = "Table2"; 
    }    
    IN MIR-SC1-YEN-CSV-AMT-T[45]
    {
        Length = "14";
        DisplayOnly;
        SType = "Currency";
        Label = "CSV (Yen)";
        Index = "1";
        FieldGroup = "Table2"; 
    }     
    IN MIR-SC1-YEN-CSV-INT-RT-T[45]
    {
        Length = "5";
        DisplayOnly;
        Decimals = "1";
        SType = "Percent";
        Label = "CSV Return RT (Yen)";
        Index = "1";
        FieldGroup = "Table2"; 
    }    
    IN MIR-SC1-ACUM-PREM-JP-AMT
    {
        Length = "14";
        DisplayOnly;
        SType = "Currency";
        Label = "Accum. P Yen Amount as of 1-day before ACD";
    }   
    IN MIR-SC1-ACUM-PREM-FC-AMT
    {
        Length = "16";
        DisplayOnly;
        CurrencyCode = "MIR-POL-CRCY-CD";
        SType = "Currency";
        Label = "Accum. P Amount (Policy Curr.) as of 1-day before ACD";
    }    
    IN MIR-SC1-FC-ANTY-RESRC-AMT
    {
        Length = "16";
        DisplayOnly;
        CurrencyCode = "MIR-POL-CRCY-CD";
        SType = "Currency";
        Label = "Foreign Curr. Denomi. Annuity Resource";
    }    
    IN MIR-SC1-FC-ANTY-RESRC-RT
    {
        Length = "5";
        DisplayOnly;
        Decimals = "1";
        SType = "Percent";
        Label = "Foreign Curr. Denomi. Annuity Resource Return RT";
    }    
    IN MIR-SC1-FC-ANTY-AMT
    {
        Length = "16";
        DisplayOnly;
        CurrencyCode = "MIR-POL-CRCY-CD";
        SType = "Currency";
        Label = "Foreign Curr. Denomi. Annuity AMT";
    }    
    IN MIR-SC1-ACUM-FC-ANTY-AMT
    {
        Length = "16";
        DisplayOnly;
        CurrencyCode = "MIR-POL-CRCY-CD";
        SType = "Currency";
        Label = "Accum. Foreign Curr. Denomi. Annuity AMT";
    }    
    IN MIR-SC1-ACUM-FC-ANTY-RT
    {
        Length = "5";
        DisplayOnly;
        Decimals = "1";
        SType = "Percent";
        Label = "Accum. Foreign Curr. Denomi. Annuity AMT Return RT";
    }     
    IN MIR-SC1-ACUM-YEN-ANTY-AMT
    {
        Length = "14";
        DisplayOnly;
        SType = "Currency";
        Label = "Accum. Foreign Curr. Denomi. Annuity AMT (Yen Conv.)";
    }    
    IN MIR-SC1-ACUM-YEN-ANTY-RT
    {
        Length = "5";
        DisplayOnly;
        Decimals = "1";
        SType = "Percent";
        Label = "Accum. Foreign Curr. Denomi. Annuity AMT (Yen Conv.) Return RT";
    }    
    IN MIR-SC1-PAYOUT-YEN-ANTY-RT
    {
        Length = "6";
        DisplayOnly;
        Decimals = "2";
        SType = "Number";
        Label = "PayOut-In-Yen RT for Yen Denomi. Annuity Resource";
    }    
    IN MIR-SC1-YEN-ANTY-RESRC-AMT
    {
        Length = "14";
        DisplayOnly;
        SType = "Currency";
        Label = "Yen Denomi. Annuity Resource";
    }    
    IN MIR-SC1-YEN-ANTY-AMT
    {
        Length = "14";
        DisplayOnly;
        SType = "Currency";
        Label = "Yen Denomi. Annuity AMT";
    }    
    IN MIR-SC1-ELAPS-YR-AFT-ACD-T[10]
    {
        Length = "2";
        DisplayOnly;
        SType = "Text";
        Label = "# of Elapsed Years From ACD";
        Index = "1";
        FieldGroup = "Table3"; 
    }    
    IN MIR-SC1-ANTY-STRT-AGE-T[10]
     {
      Length = "3";
      DisplayOnly;
      Decimals = "0";
      SType = "Number";
      Label = "Age";
      Index = "1";
      FieldGroup = "Table3";
     }    
    IN MIR-SC1-FC-ANTY-AMT-T[10]
    {
        Length = "16";
        DisplayOnly;
        CurrencyCode = "MIR-POL-CRCY-CD";
        SType = "Currency";
        Label = "Foreign Curr. Denomi. Annuity AMT";
        Index = "1";
        FieldGroup = "Table3";
    }     
    IN MIR-SC1-PAYOUT-YEN-RT-T[10]
    {
        Length = "6";
        DisplayOnly;
        Decimals = "2";
        SType = "Number";
        Label = "PayOut-In-Yen RT";
        Index = "1";
        FieldGroup = "Table3";        
    }    
    IN MIR-SC1-YEN-ANTY-AMT-T[10]
    {
        Length = "14";
        DisplayOnly;
        SType = "Currency";
        FieldGroup = "Table3";
        Label = "Foreign Curr. Denomi. Annuity AMT (Yen Conv.)";
    }
    IN MIR-SC2-PREM-DUE-MO-T[45]
    {
        Length = "7";
        DisplayOnly;
        FieldGroup = "Table4";
        DBTableName = "Derived";
        SType = "Text";
        Label = "Premium Due Month";
        Action = "SelectItem2";
        Index = "1";
        KeyColumn;
    }
    IN MIR-SC2-ELAPS-YR-T[45]    
     {
         Length = "2";
         DisplayOnly;
          FieldGroup = "Table4";
          SType = "Text";
          Label = "# of Elapsed Years From Iss DT"; 
          Index = "1";  
    }
    IN MIR-SC2-INSRD-AGE-T[45]
     {
      Length = "3";
      DisplayOnly;
      Decimals = "0";
      SType = "Number";
      Label = "Age";
      FieldGroup = "Table4";
      Index = "1";       
    } 
    IN MIR-SC2-PREM-YEN-AMT-T[45]
    {
        Length = "14";
        DisplayOnly;
        SType = "Currency";
        Label = "P Yen Amount";
         FieldGroup = "Table4";
         Index = "1"; 
    }
    IN MIR-SC2-ACUM-JP-PREM-AMT-T[45]
    {
        Length = "14";
        DisplayOnly;
        SType = "Currency";
        Label = "Accum. P Yen Amount";
        Index = "1";
        FieldGroup = "Table4"; 
    }    
    IN MIR-SC2-ACUM-FC-PREM-AMT-T[45]
    {
        Length = "16";
        DisplayOnly;
        CurrencyCode = "MIR-POL-CRCY-CD";
        SType = "Currency";
        Label = "Accum. P Amount";
        Index = "1";
        FieldGroup = "Table4"; 
        
    }    
    IN MIR-SC2-UNEARN-PREM-AMT-T[45]
    {
        Length = "16";
        DisplayOnly;
        SType = "Currency";
        Label = "Unearned P";
        Index = "1";
        FieldGroup = "Table4"; 
    }        
    IN MIR-SC2-INT-RT-T[45]
    {
        Length = "5";
        DisplayOnly;
        Decimals = "2";
        SType = "Percent";
        Label = "Interest RT";
        Index = "1";
        FieldGroup = "Table4"; 
    }    
    IN MIR-SC2-ACUM-FC-PV-AMT-T[45]
    {
        Length = "16";
        DisplayOnly;
        CurrencyCode = "MIR-POL-CRCY-CD";
        SType = "Currency";
        Label = "Accum. PV (FC)";
        Index = "1";
        FieldGroup = "Table4"; 
    }     
    IN MIR-SC2-FC-DB-AMT-T[45]
    {
        Length = "16";
        DisplayOnly;
        CurrencyCode = "MIR-POL-CRCY-CD";
        SType = "Currency";
        Label = "Death Benefit (FC)";
        Index = "1";
        FieldGroup = "Table4"; 
    }    
    IN MIR-SC2-FC-CSV-AMT-T[45]
    {
        Length = "16";
        DisplayOnly;
        CurrencyCode = "MIR-POL-CRCY-CD";
        SType = "Currency";
        Label = "CSV (FC)";
        Index = "1";
        FieldGroup = "Table4"; 
    }     
    IN MIR-SC2-FC-CSV-INT-RT-T[45]
    {
        Length = "5";
        DisplayOnly;
        Decimals = "1";
        SType = "Percent";
        Label = "CSV Return RT (FC)";
        Index = "1";
        FieldGroup = "Table4"; 
    }    
    IN MIR-SC2-YEN-CSV-AMT-T[45]
    {
        Length = "14";
        DisplayOnly;
        SType = "Currency";
        Label = "CSV (Yen)";
        Index = "1";
        FieldGroup = "Table4"; 
    }     
    IN MIR-SC2-YEN-CSV-INT-RT-T[45]
    {
        Length = "5";
        DisplayOnly;
        Decimals = "1";
        SType = "Percent";
        Label = "CSV Return RT (Yen)";
        Index = "1";
        FieldGroup = "Table4"; 
    }    
    IN MIR-SC2-ACUM-PREM-JP-AMT
    {
        Length = "14";
        DisplayOnly;
        SType = "Currency";
        Label = "Accum. P Yen Amount as of 1-day before ACD";
    }   
    IN MIR-SC2-ACUM-PREM-FC-AMT
    {
        Length = "16";
        DisplayOnly;
        CurrencyCode = "MIR-POL-CRCY-CD";
        SType = "Currency";
        Label = "Accum. P Amount (Policy Curr.) as of 1-day before ACD";
    }    
    IN MIR-SC2-FC-ANTY-RESRC-AMT
    {
        Length = "16";
        DisplayOnly;
        CurrencyCode = "MIR-POL-CRCY-CD";
        SType = "Currency";
        Label = "Foreign Curr. Denomi. Annuity Resource";
    }    
    IN MIR-SC2-FC-ANTY-RESRC-RT
    {
        Length = "5";
        DisplayOnly;
        Decimals = "1";
        SType = "Percent";
        Label = "Foreign Curr. Denomi. Annuity Resource Return RT";
    }    
    IN MIR-SC2-FC-ANTY-AMT
    {
        Length = "16";
        DisplayOnly;
        CurrencyCode = "MIR-POL-CRCY-CD";
        SType = "Currency";
        Label = "Foreign Curr. Denomi. Annuity AMT";
    }    
    IN MIR-SC2-ACUM-FC-ANTY-AMT
    {
        Length = "16";
        DisplayOnly;
        CurrencyCode = "MIR-POL-CRCY-CD";
        SType = "Currency";
        Label = "Accum. Foreign Curr. Denomi. Annuity AMT";
    }    
    IN MIR-SC2-ACUM-FC-ANTY-RT
    {
        Length = "5";
        DisplayOnly;
        Decimals = "1";
        SType = "Percent";
        Label = "Accum. Foreign Curr. Denomi. Annuity AMT Return RT";
    }     
    IN MIR-SC2-ACUM-YEN-ANTY-AMT
    {
        Length = "14";
        DisplayOnly;
        SType = "Currency";
        Label = "Accum. Foreign Curr. Denomi. Annuity AMT (Yen Conv.)";
    }    
    IN MIR-SC2-ACUM-YEN-ANTY-RT
    {
        Length = "5";
        DisplayOnly;
        Decimals = "1";
        SType = "Percent";
        Label = "Accum. Foreign Curr. Denomi. Annuity AMT (Yen Conv.) Return RT";
    }    
    IN MIR-SC2-PAYOUT-YEN-ANTY-RT
    {
        Length = "6";
        DisplayOnly;
        Decimals = "2";
        SType = "Number";
        Label = "PayOut-In-Yen RT for Yen Denomi. Annuity Resource";
    }    
    IN MIR-SC2-YEN-ANTY-RESRC-AMT
    {
        Length = "14";
        DisplayOnly;
        SType = "Currency";
        Label = "Yen Denomi. Annuity Resource";
    }    
    IN MIR-SC2-YEN-ANTY-AMT
    {
        Length = "14";
        DisplayOnly;
        SType = "Currency";
        Label = "Yen Denomi. Annuity AMT";
    }    
    IN MIR-SC2-ELAPS-YR-AFT-ACD-T[10]
    {
        Length = "2";
        DisplayOnly;
        SType = "Text";
        Label = "# of Elapsed Years From ACD";
        Index = "1";
        FieldGroup = "Table5"; 
    }    
    IN MIR-SC2-ANTY-STRT-AGE-T[10]
    {
      Length = "3";
      DisplayOnly;
      Decimals = "0";
      SType = "Number";
      Label = "Age";
      Index = "1";
      FieldGroup = "Table5";
     }    
    IN MIR-SC2-FC-ANTY-AMT-T[10]
    {
        Length = "16";
        DisplayOnly;
        CurrencyCode = "MIR-POL-CRCY-CD";
        SType = "Currency";
        Label = "Foreign Curr. Denomi. Annuity AMT";
        Index = "1";
        FieldGroup = "Table5";
    }     
    IN MIR-SC2-PAYOUT-YEN-RT-T[10]
    {
        Length = "6";
        DisplayOnly;
        Decimals = "2";
        SType = "Number";
        Label = "PayOut-In-Yen RT";
        Index = "1";
        FieldGroup = "Table5";        
    }    
    IN MIR-SC2-YEN-ANTY-AMT-T[10]
    {
        Length = "14";
        DisplayOnly;
        SType = "Currency";
        FieldGroup = "Table5";                
        Label = "Foreign Curr. Denomi. Annuity AMT (Yen Conv.)";
    } 
    IN MIR-SC3-PREM-DUE-MO-T[45]
    {
        Length = "7";
        DisplayOnly;
        FieldGroup = "Table6";
        DBTableName = "Derived";
        SType = "Text";
        Label = "Premium Due Month";
        Action = "SelectItem3";        
        Index = "1";
        KeyColumn;
    }
    IN MIR-SC3-ELAPS-YR-T[45]    
    {
         Length = "2";
         DisplayOnly;
          FieldGroup = "Table6";
          SType = "Text";
          Label = "# of Elapsed Years From Iss DT"; 
          Index = "1";  
    }
    IN MIR-SC3-INSRD-AGE-T[45]
    {
      Length = "3";
      DisplayOnly;
      Decimals = "0";
      SType = "Number";
      Label = "Age";
      FieldGroup = "Table6";
      Index = "1";       
    } 
    IN MIR-SC3-PREM-YEN-AMT-T[45]
    {
        Length = "14";
        DisplayOnly;
        SType = "Currency";
        Label = "P Yen Amount";
         FieldGroup = "Table6";
         Index = "1"; 
    }
    IN MIR-SC3-ACUM-JP-PREM-AMT-T[45]
    {
        Length = "14";
        DisplayOnly;
        SType = "Currency";
        Label = "Accum. P Yen Amount";
        Index = "1";
        FieldGroup = "Table6"; 
    }    
    IN MIR-SC3-ACUM-FC-PREM-AMT-T[45]
    {
        Length = "16";
        DisplayOnly;
        CurrencyCode = "MIR-POL-CRCY-CD";       
        SType = "Currency";
        Label = "Accum. P Amount";
        Index = "1";
        FieldGroup = "Table6"; 
        
    }    
    IN MIR-SC3-UNEARN-PREM-AMT-T[45]
    {
        Length = "16";
        DisplayOnly;
        SType = "Currency";
        Label = "Unearned P";
        Index = "1";
        FieldGroup = "Table6"; 
    }        
    IN MIR-SC3-INT-RT-T[45]
    {
        Length = "5";
        DisplayOnly;
        Decimals = "2";
        SType = "Percent";
        Label = "Interest RT";
        Index = "1";
        FieldGroup = "Table6"; 
    }    
    IN MIR-SC3-ACUM-FC-PV-AMT-T[45]
    {
        Length = "16";
        DisplayOnly;
        CurrencyCode = "MIR-POL-CRCY-CD";
        SType = "Currency";
        Label = "Accum. PV (FC)";
        Index = "1";
        FieldGroup = "Table6"; 
    }     
    IN MIR-SC3-FC-DB-AMT-T[45]
    {
        Length = "16";
        DisplayOnly;
        CurrencyCode = "MIR-POL-CRCY-CD";
        SType = "Currency";
        Label = "Death Benefit (FC)";
        Index = "1";
        FieldGroup = "Table6"; 
    }    
    IN MIR-SC3-FC-CSV-AMT-T[45]
    {
        Length = "16";
        DisplayOnly;
        CurrencyCode = "MIR-POL-CRCY-CD";
        SType = "Currency";
        Label = "CSV (FC)";
        Index = "1";
        FieldGroup = "Table6"; 
    }     
    IN MIR-SC3-FC-CSV-INT-RT-T[45]
    {
        Length = "5";
        DisplayOnly;
        Decimals = "1";
        SType = "Percent";
        Label = "CSV Return RT (FC)";
        Index = "1";
        FieldGroup = "Table6"; 
    }    
    IN MIR-SC3-YEN-CSV-AMT-T[45]
    {
        Length = "14";
        DisplayOnly;
        SType = "Currency";
        Label = "CSV (Yen)";
        Index = "1";
        FieldGroup = "Table6"; 
    }     
    IN MIR-SC3-YEN-CSV-INT-RT-T[45]
    {
        Length = "5";
        DisplayOnly;
        Decimals = "1";
        SType = "Percent";
        Label = "CSV Return RT (Yen)";
        Index = "1";
        FieldGroup = "Table6"; 
    }    
    IN MIR-SC3-ACUM-PREM-JP-AMT
    {
        Length = "14";
        DisplayOnly;
        SType = "Currency";
        Label = "Accum. P Yen Amount as of 1-day before ACD";
    }   
    IN MIR-SC3-ACUM-PREM-FC-AMT
    {
        Length = "16";
        DisplayOnly;
        CurrencyCode = "MIR-POL-CRCY-CD";
        SType = "Currency";
        Label = "Accum. P Amount (Policy Curr.) as of 1-day before ACD";
    }    
    IN MIR-SC3-FC-ANTY-RESRC-AMT
    {
        Length = "16";
        DisplayOnly;
        CurrencyCode = "MIR-POL-CRCY-CD";
        SType = "Currency";
        Label = "Foreign Curr. Denomi. Annuity Resource";
    }    
    IN MIR-SC3-FC-ANTY-RESRC-RT
    {
        Length = "5";
        DisplayOnly;
        Decimals = "1";
        SType = "Percent";
        Label = "Foreign Curr. Denomi. Annuity Resource Return RT";
    }    
    IN MIR-SC3-FC-ANTY-AMT
    {
        Length = "16";
        DisplayOnly;
        CurrencyCode = "MIR-POL-CRCY-CD";
        SType = "Currency";
        Label = "Foreign Curr. Denomi. Annuity AMT";
    }    
    IN MIR-SC3-ACUM-FC-ANTY-AMT
    {
        Length = "16";
        DisplayOnly;
        CurrencyCode = "MIR-POL-CRCY-CD";
        SType = "Currency";
        Label = "Accum. Foreign Curr. Denomi. Annuity AMT";
    }    
    IN MIR-SC3-ACUM-FC-ANTY-RT
    {
        Length = "5";
        DisplayOnly;
        Decimals = "1";
        SType = "Percent";
        Label = "Accum. Foreign Curr. Denomi. Annuity AMT Return RT";
    }     
    IN MIR-SC3-ACUM-YEN-ANTY-AMT
    {
        Length = "14";
        DisplayOnly;
        SType = "Currency";
        Label = "Accum. Foreign Curr. Denomi. Annuity AMT (Yen Conv.)";
    }    
    IN MIR-SC3-ACUM-YEN-ANTY-RT
    {
        Length = "5";
        DisplayOnly;
        Decimals = "1";
        SType = "Percent";
        Label = "Accum. Foreign Curr. Denomi. Annuity AMT (Yen Conv.) Return RT";
    }    
    IN MIR-SC3-PAYOUT-YEN-ANTY-RT
    {
        Length = "6";
        DisplayOnly;
        Decimals = "2";
        SType = "Number";
        Label = "PayOut-In-Yen RT for Yen Denomi. Annuity Resource";
    }    
    IN MIR-SC3-YEN-ANTY-RESRC-AMT
    {
        Length = "14";
        DisplayOnly;
        SType = "Currency";
        Label = "Yen Denomi. Annuity Resource";
    }    
    IN MIR-SC3-YEN-ANTY-AMT
    {
        Length = "14";
        DisplayOnly;
        SType = "Currency";
        Label = "Yen Denomi. Annuity AMT";
    }    
    IN MIR-SC3-ELAPS-YR-AFT-ACD-T[10]
    {
        Length = "2";
        DisplayOnly;
        SType = "Text";
        Label = "# of Elapsed Years From ACD";
        Index = "1";
        FieldGroup = "Table7"; 
    }    
    IN MIR-SC3-ANTY-STRT-AGE-T[10]
    {
      Length = "3";
      DisplayOnly;
      Decimals = "0";
      SType = "Number";
      Label = "Age";
        Index = "1";
        FieldGroup = "Table7";
    }    
    IN MIR-SC3-FC-ANTY-AMT-T[10]
    {
        Length = "16";
        DisplayOnly;
        CurrencyCode = "MIR-POL-CRCY-CD";
        SType = "Currency";
        Label = "Foreign Curr. Denomi. Annuity AMT";
        Index = "1";
        FieldGroup = "Table7";
    }     
    IN MIR-SC3-PAYOUT-YEN-RT-T[10]
    {
        Length = "6";
        DisplayOnly;
        Decimals = "2";
        SType = "Number";
        Label = "PayOut-In-Yen RT";
        Index = "1";
        FieldGroup = "Table7";        
    }    
    IN MIR-SC3-YEN-ANTY-AMT-T[10]
    {
        Length = "14";
        DisplayOnly;
        SType = "Currency";
        FieldGroup = "Table7";
        Label = "Foreign Curr. Denomi. Annuity AMT (Yen Conv.)";
    }    
    IN MIR-SC4-PREM-DUE-MO-T[45]
    {
        Length = "7";
        DisplayOnly;
        FieldGroup = "Table8";
        DBTableName = "Derived";
        SType = "Text";
        Label = "Premium Due Month";
        Action = "SelectItem4";        
        Index = "1";
        KeyColumn;
    }
    IN MIR-SC4-ELAPS-YR-T[45]    
    {
         Length = "2";
         DisplayOnly;
          FieldGroup = "Table8";
          SType = "Text";
          Label = "# of Elapsed Years From Iss DT"; 
          Index = "1";  
    }
    IN MIR-SC4-INSRD-AGE-T[45]
    {
      Length = "3";
      DisplayOnly;
      Decimals = "0";
      SType = "Number";
      Label = "Age";
      FieldGroup = "Table8";
      Index = "1";       
    } 
    IN MIR-SC4-PREM-YEN-AMT-T[45]
    {
        Length = "14";
        DisplayOnly;
        SType = "Currency";
        Label = "P Yen Amount";
         FieldGroup = "Table8";
         Index = "1"; 
    }
    IN MIR-SC4-ACUM-JP-PREM-AMT-T[45]
    {
        Length = "14";
        DisplayOnly;
        SType = "Currency";
        Label = "Accum. P Yen Amount";
        Index = "1";
        FieldGroup = "Table8"; 
    }    
    IN MIR-SC4-ACUM-FC-PREM-AMT-T[45]
    {
        Length = "16";
        DisplayOnly;
        CurrencyCode = "MIR-POL-CRCY-CD";
        SType = "Currency";
        Label = "Accum. P Amount";
        Index = "1";
        FieldGroup = "Table8"; 
        
    }    
    IN MIR-SC4-UNEARN-PREM-AMT-T[45]
    {
        Length = "16";
        DisplayOnly;
        SType = "Currency";
        Label = "Unearned P";
        Index = "1";
        FieldGroup = "Table8"; 
    }        
    IN MIR-SC4-INT-RT-T[45]
    {
        Length = "5";
        DisplayOnly;
        Decimals = "2";
        SType = "Percent";
        Label = "Interest RT";
        Index = "1";
        FieldGroup = "Table8"; 
    }    
    IN MIR-SC4-ACUM-FC-PV-AMT-T[45]
    {
        Length = "16";
        DisplayOnly;
        CurrencyCode = "MIR-POL-CRCY-CD";
        SType = "Currency";
        Label = "Accum. PV (FC)";
        Index = "1";
        FieldGroup = "Table8"; 
    }     
    IN MIR-SC4-FC-DB-AMT-T[45]
    {
        Length = "16";
        DisplayOnly;
        CurrencyCode = "MIR-POL-CRCY-CD";
        SType = "Currency";
        Label = "Death Benefit (FC)";
        Index = "1";
        FieldGroup = "Table8"; 
    }    
    IN MIR-SC4-FC-CSV-AMT-T[45]
    {
        Length = "16";
        DisplayOnly;
        CurrencyCode = "MIR-POL-CRCY-CD";
        SType = "Currency";
        Label = "CSV (FC)";
        Index = "1";
        FieldGroup = "Table8"; 
    }     
    IN MIR-SC4-FC-CSV-INT-RT-T[45]
    {
        Length = "5";
        DisplayOnly;
        Decimals = "1";
        SType = "Percent";
        Label = "CSV Return RT (FC)";
        Index = "1";
        FieldGroup = "Table8"; 
    }    
    IN MIR-SC4-YEN-CSV-AMT-T[45]
    {
        Length = "14";
        DisplayOnly;
        SType = "Currency";
        Label = "CSV (Yen)";
        Index = "1";
        FieldGroup = "Table8"; 
    }     
    IN MIR-SC4-YEN-CSV-INT-RT-T[45]
    {
        Length = "5";
        DisplayOnly;
        Decimals = "1";
        SType = "Percent";
        Label = "CSV Return RT (Yen)";
        Index = "1";
        FieldGroup = "Table8"; 
    }    
    IN MIR-SC4-ACUM-PREM-JP-AMT
    {
        Length = "14";
        DisplayOnly;
        SType = "Currency";
        Label = "Accum. P Yen Amount as of 1-day before ACD";
    }   
    IN MIR-SC4-ACUM-PREM-FC-AMT
    {
        Length = "16";
        DisplayOnly;
        CurrencyCode = "MIR-POL-CRCY-CD";
        SType = "Currency";
        Label = "Accum. P Amount (Policy Curr.) as of 1-day before ACD";
    }    
    IN MIR-SC4-FC-ANTY-RESRC-AMT
    {
        Length = "16";
        DisplayOnly;
        CurrencyCode = "MIR-POL-CRCY-CD";
        SType = "Currency";
        Label = "Foreign Curr. Denomi. Annuity Resource";
    }    
    IN MIR-SC4-FC-ANTY-RESRC-RT
    {
        Length = "5";
        DisplayOnly;
        Decimals = "1";
        SType = "Percent";
        Label = "Foreign Curr. Denomi. Annuity Resource Return RT";
    }    
    IN MIR-SC4-FC-ANTY-AMT
    {
        Length = "16";
        DisplayOnly;
        CurrencyCode = "MIR-POL-CRCY-CD";
        SType = "Currency";
        Label = "Foreign Curr. Denomi. Annuity AMT";
    }    
    IN MIR-SC4-ACUM-FC-ANTY-AMT
    {
        Length = "16";
        DisplayOnly;
        CurrencyCode = "MIR-POL-CRCY-CD";
        SType = "Currency";
        Label = "Accum. Foreign Curr. Denomi. Annuity AMT";
    }    
    IN MIR-SC4-ACUM-FC-ANTY-RT
    {
        Length = "5";
        DisplayOnly;
        Decimals = "1";
        SType = "Percent";
        Label = "Accum. Foreign Curr. Denomi. Annuity AMT Return RT";
    }     
    IN MIR-SC4-ACUM-YEN-ANTY-AMT
    {
        Length = "14";
        DisplayOnly;
        SType = "Currency";
        Label = "Accum. Foreign Curr. Denomi. Annuity AMT (Yen Conv.)";
    }    
    IN MIR-SC4-ACUM-YEN-ANTY-RT
    {
        Length = "5";
        DisplayOnly;
        Decimals = "1";
        SType = "Percent";
        Label = "Accum. Foreign Curr. Denomi. Annuity AMT (Yen Conv.) Return RT";
    }    
    IN MIR-SC4-PAYOUT-YEN-ANTY-RT
    {
        Length = "6";
        DisplayOnly;
        Decimals = "2";
        SType = "Number";
        Label = "PayOut-In-Yen RT for Yen Denomi. Annuity Resource";
    }    
    IN MIR-SC4-YEN-ANTY-RESRC-AMT
    {
        Length = "14";
        DisplayOnly;
        SType = "Currency";
        Label = "Yen Denomi. Annuity Resource";
    }    
    IN MIR-SC4-YEN-ANTY-AMT
    {
        Length = "14";
        DisplayOnly;
        SType = "Currency";
        Label = "Yen Denomi. Annuity AMT";
    }    
    IN MIR-SC4-ELAPS-YR-AFT-ACD-T[10]
    {
        Length = "2";
        DisplayOnly;
        SType = "Text";
        Label = "# of Elapsed Years From ACD";
        Index = "1";
        FieldGroup = "Table9"; 
    }    
    IN MIR-SC4-ANTY-STRT-AGE-T[10]
    {
      Length = "3";
      DisplayOnly;
      Decimals = "0";
      SType = "Number";
      Label = "Age";
        Index = "1";
        FieldGroup = "Table9";
    }    
    IN MIR-SC4-FC-ANTY-AMT-T[10]
    {
        Length = "16";
        DisplayOnly;
        CurrencyCode = "MIR-POL-CRCY-CD";
        SType = "Currency";
        Label = "Foreign Curr. Denomi. Annuity AMT";
        Index = "1";
        FieldGroup = "Table9";
    }     
    IN MIR-SC4-PAYOUT-YEN-RT-T[10]
    {
        Length = "6";
        DisplayOnly;
        Decimals = "2";
        SType = "Number";
        Label = "PayOut-In-Yen RT";
        Index = "1";
        FieldGroup = "Table9";        
    }    
    IN MIR-SC4-YEN-ANTY-AMT-T[10]
    {
        Length = "14";
        DisplayOnly;
        SType = "Currency";
        FieldGroup = "Table9"; 
        Label = "Foreign Curr. Denomi. Annuity AMT (Yen Conv.)";
    }
# 15997D CHANGES STARTS HERE 
    INOUT MIR-XCHG-RT-DIFF-IND
    {
        Length = "1";
        DBTableName = "Derived";
        SType = "Hidden";
        Label = "MIR-XCHG-RT-DIFF-IND";
    } 
# 15997D CHANGES ENDS HERE       
#M2025A CHANGES STARTS HERE
    INOUT MIR-FRA-PREM-SUSP
    {
        Length = "26";
        DisplayOnly;
        SType = "Text";
        Label = "FRA Premium Suspension";
    }
#M2025A CHANGES ENDS HERE	    
}    
    
