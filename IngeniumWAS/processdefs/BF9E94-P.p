# Converted from PathFinder 2.2 to 3.0 Jun 18, 2004 3:13:38 PM EDT

#*******************************************************************************
#*  Component:   BF9E94P.p                                                     *
#*  Description: Termtype Processing Screen                                    *
#*                                                                             *
#*******************************************************************************
#*  Chg#    Release  Description                                               *
#*                                                                             *
#*  UY3094  CTS      INITIAL VERSION                                           *
#*******************************************************************************

P-STEP BF9E94-P
{
    ATTRIBUTES
    {
        BusinessFunctionId = "9E94";
        BusinessFunctionName = "Term type Processing ";
        BusinessFunctionType = "Prcesterm";
        MirName = "CCWM9E93";
    }

    OUT LSIR-RETURN-CD;

    OUT MIR-RETRN-CD;

    IN MIR-DV-PRCES-STATE-CD
    {
        Length = "1";
        SType = "Hidden";
        DBTableName = "Derived";
        Label = "Process State";
    }
    
    OUT MIR-DV-OWN-CLI-NM
    {
        DisplayOnly;
        Length = "75";
        SType = "Text";
        Label = "Policyholder Name";
    }

    INOUT MIR-POL-ID-BASE
    {
        Key;
        Mandatory;
        Length = "10";
        DBTableName = "TPOL";
        DefaultSession = "MIR-POL-ID-BASE";
        SType = "Text";
        Label = "Policy Number";
    }
 
    INOUT MIR-POL-ID-SFX
    {
        Key;
        Length = "1";
        SType = "Text";
        Label = "Suffix";
    }

    INOUT MIR-PRCES-DT
    {
        Length = "10";
        SType = "Date";
        Label = "Process Date";
    
    }
   INOUT MIR-DV-TRNXT-PAYO-MTHD-CD
    {
        Length = "1";
        CodeSource = "DataModel";
        CodeType = "DV-TRNXT-PAYO-MTHD-CD";
        SType = "Selection";
        DBTableName = "Derived";
        Label = "Payout Method";
     }

   INOUT MIR-JRNL-DT
    {
        Mandatory;
        Length = "10";
        DefaultSession = "LSIR-PRCES-DT";
        SType = "Date";
        Label = "Journal Date";
        
     }
     
  INOUT MIR-APPL-CTL-PRCES-DT
    {
        Length = "10";
        DBTableName = "TMAST";
        DefaultSession = "LSIR-PRCES-DT";
        SType = "Date";
        Label = "Company Received Date";
     }
     
   INOUT MIR-DV-HO-RECV-DT
       {
           Length = "10";
           SType = "Date";
           Label = "Head Office Received Date";
       }     

   OUT MIR-POL-BILL-MODE-CD
    {       
        DisplayOnly;
        Length = "2";
        CodeSource = "DataModel";
        CodeType = "PLAN-BILL-MODE-CD";
        SType = "Text";
        Label = "Billing Mode";
    } 

   OUT MIR-TOT-PD-PREM-AMT
       {
          Length = "17";
          Signed;
          SType = "Currency";
          Label = "Total Premium Paid for the Policy";
       }     

   OUT MIR-SHRT-PREM-AMT
    { 
        Length = "17";
        SType = "Currency";
        Label = "Shortage Premium";
    }

    OUT MIR-PRE-PAY-INT-AMT
    { 
        Length = "15";
        SType = "Currency";
        Label = "Prepayment Earned interest";
    }

    OUT MIR-OVR-PAID-PREM-AMT
    {
        Length = "17";
        SType = "Currency";
        Label = "Overpaid Premium";
    }
    INOUT MIR-REMIT-AMT
    {
        Length = "15";
        SType = "Currency";
        Label = "Total Remittance Amount";
    }

    
    OUT MIR-LOAN-REPAY-AMT
    {
        Length = "15";
        SType = "Currency";
        Label = "Policy Loan Balance";
    }

    OUT MIR-LOAN-XCES-SHRT-AMT
    {   
        Length = "15"; 
        SType = "Currency"; 
        Label = "Excess Interest of Policy Loan Repayments"; 
    }

    OUT MIR-LOAN-INT-AMT
    {   
        Length = "15"; 
        SType = "Currency"; 
        Label = "Policy Loan interest"; 
    }

    OUT MIR-UNEARN-LOAN-INT-AMT
    {   
        Length = "15"; 
        SType = "Currency"; 
        Label = "Loan Interest (Unearned)"; 
    }
    
    
    OUT MIR-HLT-BNFT-AMT
    {   
        Length = "15"; 
        SType = "Currency"; 
        Label = "Health Congratulatory Benefit"; 
    }

    OUT MIR-SRV-BNFT-AMT
    {   
        Length = "15"; 
        SType = "Currency"; 
        Label = "Survival Benefit"; 
    }

    OUT MIR-INC-SRV-BNFT-AMT
    {   
        Length = "15";
        SType = "Currency"; 
        Label = "Increased Survival Benefit"; 
    }

     OUT MIR-DIV-AMT
     {
        Length = "15";
        SType = "Currency";
        Label = "Dividend Amount";
     }    
    OUT MIR-DEFR-AMT
    {
        Length = "15"; 
        SType = "Currency";
        Label = "Deferred Amount";
    }

    OUT MIR-SHRT-INT-AMT
    {
        Length = "15";
        SType = "Currency";
        Label = "Short INterest";
    }   
   

    OUT MIR-NO-ACC-BNFT-AMT
    {
        Length = "15";
        SType = "Currency";
        Label = "Non Accidental Benefit";
    }  

  INOUT MIR-PAYE-CLI-FRST-NM 
    {
        Length = "25";
        DBTableName = "CLNM";
        SType = "Text";
        Label = "Payee's First Name";
    }

  INOUT MIR-PAYE-CLI-LAST-NM 
    {
       Length = "25";
       DBTableName = "CLNM";
       SType = "Text";
       Label = "Payee's Last Name";
    }

  INOUT MIR-PAYE-CO-NM 
    {
       Length = "50";
       DBTableName = "CLNC";
       SType = "Text";
       Label = "Company Name";
    }
    
  INOUT MIR-CLI-ADDR-LOC-CD 
    {
       Length = "8";
       DBTableName = "CLIA";
       SType = "Text";
       Label = "Address Code";
    }
     
  INOUT MIR-CLI-PSTL-CD 
    {
       DisplayOnly;
       Length = "9";
       SType = "Text";
       Label = "Postal Code";
    }

  INOUT MIR-DV-CLI-ADDR 
    {
       DisplayOnly;
       Length = "50";
       SType = "Text";
       Label = "Kanji Address";
    }

  INOUT MIR-CLI-ADDR-ADDL-TXT
    {
       Length = "60";
       SType = "Text";
       Label = "Samakata-bu";
    }


  INOUT MIR-MRF-IND
    {
        Length = "1";
        SType = "Indicator";
        Label = "MRF Indicator";
    }
    
  OUT MIR-BNK-NM 
    {
      DisplayOnly;
      Length = "36";
      SType = "Text";
      Label = "Bank Name";
    }

  OUT MIR-BNK-BR-NM
    {
      DisplayOnly;
      Length = "36";
      SType = "Text";
      Label = "Branch Name";
    }    
     
  INOUT MIR-BNK-ID
    {
        Length = "4";
        SType = "Text";
        Label = "Bank Number";
    }

  INOUT MIR-BNK-BR-ID
    {
        Length = "5";
        SType = "Text";
        Label = "Branch Number";
    }

  INOUT MIR-BNK-ACCT-ID
    {
        Length = "17";
        SType = "Text";
        Label = "Bank Account Number";
    }

  INOUT MIR-BNK-ACCT-HLDR-NM
    {
        Length = "50";
        SType = "Text";
        Label = "Account Holder Name";
    }

  INOUT MIR-BNK-ACCT-TYP-CD
    {
        Length = "3";
        CodeSource = "EDIT";
        CodeType = "FBACC";
        SType = "Selection";
        Label = "Account Type";
    }
  }           