# Converted from PathFinder 2.2 to 3.0 Jun 18, 2004 3:13:59 PM EDT

#*******************************************************************************
#*  Component:   BF9320-P.p                                                    *
#*  Description: Firm Banking Table (FBNK) Retrieve step                       *
#*                                                                             *
#*******************************************************************************
#*  Chg#    Release  Description                                               *
#*                                                                             *
#* HAC002  HIN/CL   FIRM BANKING - ONLINE            (HAC002A)                 *
#* ISLADM  CTS      CHANGES FOR INSURANCE LAW PROJECT                          *    
#* M245K2  CTS      PROCESSING NEW VARIABLES TO FIRM BANKING UPDATE SCREEN     *
#*  Q50690  CTS      ADDING PAYOUT TYPE METHOD FIELD                           *
#* MP302M  CTS      SURVIVAL BENEFIT - MEDICAL CLAIM CHANGES                   *
#*  UYS70A  CTS      CHANGES AS PART OF UNISYS FOR DISB INFO                   *
#*  UY3049  CTS      STREAM 3 ANNUITY PAYOUT                                   *
#*******************************************************************************

P-STEP BF9320-P
{
    ATTRIBUTES
    {
        BusinessFunctionId = "9320";
        BusinessFunctionName = "Firm Banking Retrieve";
        BusinessFunctionType = "Retrieve";
        MirName = "CCWM9320";
    }

    OUT LSIR-RETURN-CD;

    OUT MIR-RETRN-CD;

    INOUT MIR-FBNK-REMIT-DT
    {
        Key;
        DisplayOnly;
        Length = "10";
        SType = "Date";
        Label = "Remittance Date";
    }
    
    INOUT MIR-FBNK-CAT-CD
    {
        Key;
        DisplayOnly;
        Length = "5";
        CodeSource = "DataModel";
        CodeType = "FBNK-CAT-CD";
        SType = "Text";
        Label = "Operation Category";
    }
    
    INOUT MIR-FBNK-REF-ID
    {
        Key;
        DisplayOnly;
        Length = "10";
        SType = "Text";
        Label = "Master Claim ID";
    }
    
    INOUT MIR-POL-ID
    {
        Key;
        DisplayOnly;
        Length = "9";
        SType = "Text";
        Label = "Policy ID";
    }
    
    INOUT MIR-FB-CLI-ID
    {
        Key;
        DisplayOnly;
        Length = "10";
        SType = "Text";
        Label = "Insured Client ID";
    }    
    
    INOUT MIR-FBNK-SEQ-NUM
    {
        Key;
        DisplayOnly;
        Length = "3";
        SType = "Text";
        Label = "Reference Number";
    }   
    
    OUT MIR-DV-INS-CLI-NM
    {
        Key;
        DisplayOnly;
        Length = "75";
        SType = "Text";
        Label = "Insured Name";
    }  
    
    OUT MIR-KANJI-PAYE-NM
    {
        DisplayOnly;
        Length = "50";
        SType = "Text";
        Label = "Kanji Payee Name";
    }

    OUT MIR-SEND-PMT-NOTI-IND
    {
        DisplayOnly;
        Length = "1";
        SType = "Indicator";
        Label = "Send Payment Notice";
    }

    OUT MIR-INSRD-REL-CD
    {
        DisplayOnly;
        Length = "1";
        CodeSource = "EDIT";
        CodeType = "CLMREL";	        
        SType = "Text";
        Label = "Relationship to Insured";
    }

    OUT MIR-FBNK-KJ-PREFCT-TXT
    {
        DisplayOnly;
        Length = "11";
        SType = "Text";
        Label = "Kanji Address Line 1";
    }

    OUT MIR-FBNK-KJ-CITY-TXT
    {
        DisplayOnly;
        Length = "30";
        SType = "Text";
        Label = "Kanji Address Line 2";
    }

    OUT MIR-FBNK-KJ-NGHBRHD-TXT
    {
        DisplayOnly;
        Length = "30";
        SType = "Text";
        Label = "Kanji Address Line 3";
    }

    OUT MIR-FBNK-PSTL-CD
    {
        DisplayOnly;
        Length = "9";
        SType = "Text";
        Label = "Postal Code";
    }

    OUT MIR-FBNK-SAMAKATA-BU-TXT
    {
        DisplayOnly;
        Length = "72";
        SType = "Text";
        Label = "Samakata-bu";
    }

    OUT MIR-BNK-ID
    {
        DisplayOnly;
        Length = "4";
        SType = "Text";
        Label = "Bank Number";
    }

    OUT MIR-BNK-NM
    {
        DisplayOnly;
        Length = "36";
        SType = "Text";
        Label = "Bank Name";
    }

    OUT MIR-BNK-BR-ID
    {
        DisplayOnly;
        Length = "5";
        SType = "Text";
        Label = "Branch Number";
    }

    OUT MIR-BNK-BR-NM
    {
        DisplayOnly;
        Length = "36";
        SType = "Text";
        Label = "Branch Name";
    }

    OUT MIR-ACCT-TYP-CD
    {
        DisplayOnly;
        Length = "3";
        SType = "Text";
        CodeSource = "EDIT";
        CodeType = "FBACC";
        Label = "Account Type";
    }

    OUT MIR-BNK-ACCT-ID
    {
        DisplayOnly;
        Length = "17";
        SType = "Text";
        Label = "Account Number";
    }

    OUT MIR-ACCT-HLDR-NM
    {
        DisplayOnly;
        Length = "50";
        SType = "Text";
        Label = "Account Holder Name";
    }    

    OUT MIR-DV-ADJ-PMT-AMT
    {
        DisplayOnly;
        Length = "15";
        SType = "Currency";
        Label = "Adjusted Payment Amount";
    } 
# M245K2 Changes Start here
    OUT MIR-REMIT-AMT
    {
        DisplayOnly;
        Length = "15";
        SType = "Currency";
        Label = "Adjusted Payment Amount";
    } 
# M245K2 Changes End here
    OUT MIR-FINAL-APROV-DT
    {
        DisplayOnly;
        Length = "10";
        SType = "Text";
        Label = "Final Approval Date";
    }    

#  ISLADM Changes Start here        
    OUT MIR-CO-RECV-DT
    {
        DisplayOnly;
        Length = "10";
        SType = "Date";
        Label = "Company Received Date";
    }
#  ISLADM Changes End here
    
    OUT MIR-FBNK-STAT-CD
    {
        DisplayOnly;
        Length = "1";
        CodeSource = "DataModel";
        CodeType = "FBNK-STAT-CD";        
        SType = "Text";
        Label = "Firm Banking Status";
    }
    
    OUT MIR-FBNK-FAIL-RSN-TXT
    {
        DisplayOnly;
        Length = "40";
        SType = "Text";
        Label = "Fail Reason";
    }   
# Q50690 CHANGES START HERE 	    
    OUT MIR-FBNK-CREAT-TYP-CD
    {
        FieldGroup = "Table1";
        Length = "1";
        SType = "Text";
        CodeSource = "DataModel";
        CodeType = "FBNK-PAYO-MTHD-CD"; 
        Label = "Payout Method Type";
        Index = "1";
    } 
# Q50690 CHANGES END HERE     
    OUT MIR-FBNK-RE-REMIT-DT
    {
        DisplayOnly;
        Length = "10";
        SType = "Text";
        Label = "Re-Remittance Date";
    }        
        
    OUT MIR-PREM-DED-AMT
    {
        DisplayOnly;
        Length = "15";
        SType = "Currency";
        Label = "Premium Deducted";
    }  
    
    OUT MIR-BNFT-PMT-AMT
    {
        DisplayOnly;
        Length = "15";
        SType = "Currency";
        Label = "Payment Amount";
    }      
    
    OUT MIR-DLAY-INT-AMT
    {
        DisplayOnly;
        Length = "15";
        SType = "Currency";
        Label = "Interest Paid";
    }

#MP302M CHANGES STARTS HERE
    OUT MIR-SRVBEN-CHRGBCK-AMT
    {
        DisplayOnly;
        Length = "15";
        SType = "Currency";
        Label = "Survival Benefit Chargeback Deducted";
    }
#MP302M CHANGES ENDS HERE
    
    IN MIR-ACTION-TO-TAKE-CD
    {
        SType = "Hidden";
    }    

    IN MIR-SELECTED-FBNK-STAT-CD
    {
        SType = "Hidden";
    }    
# M245K2 Changes Start here
    OUT MIR-ORIG-PMT-CRCY-CD
    {

        Length = "5";
        CodeSource = "EDIT";
        CodeType = "CRCY";
        SType = "Text";
        Label = "Currency";
    }
    
    OUT MIR-REMIT-CRCY-CD
    {

        Length = "5";
        CodeSource = "EDIT";
        CodeType = "CRCY";
        SType = "Text";
        Label = "Currency";
    }
    
    OUT MIR-XCHG-EFF-DT
    {
        DisplayOnly;
        Length = "10";
        SType = "Date";
        Label = "Exchange Effective Date";
    }
# M245K2 Changes Start here
# UYS70A changes start here
    OUT MIR-POL-DED-TYP-CD-T[20]
    {
      DisplayOnly;
      Length = "5";
      FieldGroup = "Table20";
      CodeSource = "DataModel";
      CodeType = "POL-DED-TYP-CD";
      SType = "Text";
      Label = "Deduction"; 
      Index = "1";
    }      
  
    OUT MIR-POL-DED-AMT-T[20]
    {
      DisplayOnly;
      Length = "15";
      FieldGroup = "Table20";
      SType = "Currency";
      CurrencyCode = "MIR-DV-DED-CRCY-CD-T[]";
      Label = "Deduction";
      Index = "1";        
    }
    
    OUT MIR-POL-PMT-TYP-CD-T[20]
    {
      DisplayOnly;
      Length = "5";
      FieldGroup = "Table20";
      CodeSource = "DataModel";
      CodeType = "POL-PMT-TYP-CD";
      SType = "Text";
      Label = "Payment"; 
      Index = "1";
    }
    
    OUT MIR-POL-PMT-AMT-T[20]
    {
      DisplayOnly;
      Length = "15";
      FieldGroup = "Table20";
      SType = "Currency";
      CurrencyCode = "MIR-DV-PMT-CRCY-CD-T[]";
      Label = "Payment";
      Index = "1";        
    }
    
    OUT MIR-DV-JP-XCHNG-RT
    { 
      DisplayOnly;
      Length = "7";
      Decimals = "2";
      DBTableName = "TCXRT";
      SType = "Text";
      Label = "Exchange rate";     
    } 
    
    OUT MIR-DV-PMT-CRCY-CD-T[20]
    {
      Length = "5";
      SType = "Hidden";
      Label = "Currency";
      Index = "1";  
   }
    OUT MIR-DV-DED-CRCY-CD-T[20]
    {
      Length = "5";
      SType = "Hidden";
      Label = "Currency";
      Index = "1";  
   }
   OUT MIR-ACTL-XCHG-EFF-DT
   {
        DisplayOnly;
        Length = "10";
        SType = "Date";
        Label = "Actual Exchange Effective Date";
    }
#UY3049 CHANGES STARTS
    IN MIR-10-POL-ID
    {
        Length = "10";
        SType = "Hidden";
        Label = "Policy Id";
    }     
    IN MIR-STR3-PAYO-IND
    {
        Length = "1";
        SType = "Hidden";
    }
#UY3049 CHANGES ENDS      
#UYS70A changes ends here
}
