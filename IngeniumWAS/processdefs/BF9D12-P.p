# Converted from PathFinder 2.2 to 3.0 Jun 18, 2004 3:13:52 PM EDT

#*******************************************************************************
#*  Component:   BF9D12-P.p                                                    *
#*  Description: Survival Benefit Payout Process-Confirm Transaction           *
#*                                                                             *
#*******************************************************************************
#*                                                                             *
#*  MP302A  CTS      INITIAL VERSION                                           *
#*  Q76550  CTS      ADDED HIDDEN VARIABLE MIR-DV-CALL-TYP-CD                  *
#*  R12887  CTS      ADDED OVERRIDE INTEREST CALCULATION DATE                  *
#*  UY3037  CTS      INGENIUM SURVIVAL BENEFIT                                 *
#*  27549A  CTS      CHANGES DONE AS PART OF CDAP PROJECT                      *
#*  CD3001  CTS      CHANGES DONE AS PART OF CERBERUS DAY 3.0                  *
#*******************************************************************************

P-STEP BF9D12-P
{
    ATTRIBUTES
    {
        BusinessFunctionId = "9D12";
        BusinessFunctionName = "Survival Benefit Payout Process";
        BusinessFunctionType = "TDSrvb";
        MirName = "CCWM9D12";
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
        Label = "Policy Id";
    }
    
    INOUT MIR-POL-ID-SFX
    {
        Key;
        Length = "1";
        SType = "Text";
        Label = "Suffix";
    }    

    INOUT MIR-DV-OWN-CLI-NM
    {
        Length = "75";
        DBTableName = "Derived";
        SType = "Text";
        Label = "Owner name"; 

    }
    INOUT MIR-APPL-CTL-PRCES-DT    
    {    
        Length = "10";    
        DBTableName = "TMAST";      
        SType = "Date";    
        Label = "Process Date";    
    }    

    INOUT MIR-CO-RECV-DT
    {
        Length = "10";
        SType = "Date";
        Label = "Company Received Date";
    }

    INOUT MIR-DV-TRNXT-PAYO-MTHD-CD
    {
        Length = "1";
        CodeSource = "DataModel";
        CodeType = "DV-TRNXT-PAYO-MTHD-CD";
        SType = "Selection";
        DBTableName = "Derived";
        Label = "Pay Out Method";
    }

    INOUT MIR-JRNL-DT
    {
        Length = "10";
        SType = "Date";
        Label = "Journal Date";
    }

#CD3001 CHANGES STARTS HERE
     INOUT MIR-HO-RECV-DT
    {
        DisplayOnly;
        DefaultSession = "LSIR-PRCES-DT";
        Length = "10";
        SType = "Date";
        Label = "Head Office Received Date";
    }
    
     INOUT MIR-VWD-SPEC-AMT
    {
        Length = "15";
        CurrencyCode="MIR-POL-CRCY-SP";
        SType = "Currency";
        Label = "Specified Amount";

    }
     
     INOUT MIR-PAYO-JPY-BNFT-CD
    {
        Length = "1";
        CodeSource = "DataModel";
        CodeType = "PAYO-JPY-BNFT-CD";
        SType = "Selection";
        Label = "JPY Benefit Rider";
    }
#CD3001 CHANGES ENDS HERE

    INOUT MIR-DV-PRCES-STATE-CD
    {
        Length = "1";
        DBTableName = "Derived";
        SType = "Hidden";
        Label = "Process State";
    }
    
    OUT MIR-SRVBEN-EFF-DT
    {
        Length = "10";
        SType = "Date";
        DBTableName = "TPOL";
        Label = "Survival Benefit Payout Effective Date";
    }
    
   OUT MIR-SRVBEN-PAYO-AMT
   {
        Length = "20";
        SType = "Currency";
        Label = "Survival Benefit Payout Amount";
   }
   
   OUT MIR-CLM-DED-AMT
   {
        Length = "20";
        SType = "Currency";
        Label = "Deduction amount";
   }
    
   OUT MIR-DEFR-SRVBEN-PAYO-AMT
   {
        Length = "20";
        SType = "Currency";
        Label = "Deferral Survival Benefit Payout Amount";
    }
    
    OUT MIR-DEFR-INT-AMT
    {
        Length = "20";
        SType = "Currency";
        Label = "Deferral Interest Amount";
    }
    
    OUT MIR-NET-PAYO-AMT
    {
        Length = "20";            
        SType = "Currency";
        Label = "Net Payout Amount";
    }

    OUT MIR-CLM-POL-ID-T[99]
    {
        Length = "10";
        FieldGroup = "Table99";
        SType = "Text";
        Label = "Policy No";
        Index = "1";
    }
    
    OUT MIR-CLM-ID-T[99]
    {
        Length = "8";
        FieldGroup = "Table99";
        SType = "Text";
        Label = "Claim Id";
        Index = "1";
    }

    OUT MIR-CLM-CVG-NUM-T[99]
    {
        Length = "2";
        FieldGroup = "Table99";
        DBTableName = "TCVG";
        SType = "Text";
        Label = "Coverage No";
        Index = "1";
    }

    OUT MIR-BNFT-NM-T[99]
    {
        Length = "5";
        FieldGroup = "Table99";
        SType = "Text";
        Label = "Benefit Name";
        Index = "1";
        CodeSource = "EDIT";
	CodeType = "BENNM";
    }

    OUT MIR-STRT-DT-T[99]
    {
        Length = "10";
        FieldGroup = "Table99";
        SType = "Date";
        Label = "Start date";
        Index = "1";
    }

    OUT MIR-END-DT-T[99]
    {
        Length = "10";
        FieldGroup = "Table99";
        SType = "Date";
        Label = "End date";
        Index = "1";
    }
    
    OUT MIR-EVNT-UNIT-QTY-T[99]
    {
        Length = "6";
        FieldGroup = "Table99";      
        SType = "Text";
        Label = "Units";
        Index = "1";
    }
    
     OUT MIR-MULT-AMT-T[99]
    {
        Length = "7";
        FieldGroup = "Table99";      
        SType = "Text";
        Label = "Multiplier";
        Index = "1";
    }

    OUT MIR-ELIG-DAYS-T[99]
    {
        Length = "2";
        FieldGroup = "Table99";
        SType = "Text";
        Label = "Elligible days";
        Index = "1";
    }

    OUT MIR-CVG-FACE-AMT-T[99]
    {
        Length = "16";
        FieldGroup = "Table99";
        SType = "Currency";
        Label = "Face Amount at the end of 5 years";
        Index = "1";
    }

    OUT MIR-BNFT-MED-AMT-T[99]
    {
        Length = "16";
        FieldGroup = "Table99";
        SType = "Currency";
        Label = "Medical Benefit Amount";
        Index = "1";
    }
   INOUT MIR-PAYE-CLI-LAST-NM
   { 
        Label = "Payee's Last Name";
        Length = "25";
        SType = "Text";
   }
       
   INOUT MIR-PAYE-CLI-FRST-NM
   {
        Label = "Payee's First Name";
        Length = "25";
        SType = "Text";
   }
       
   INOUT MIR-PAYE-CO-NM
   {
        Label = "Company Name";
        Length = "50";
        SType = "Text";
   }
       
   INOUT MIR-CLI-ADDR-LOC-CD
   {
        Label = "Address Code";
        Length = "8";
        SType = "Text";
   }
       
   INOUT MIR-CLI-PSTL-CD
   {
        Label = "Postal Code";
        Length = "8";
        SType = "Text";
   }
       
   INOUT MIR-DV-CLI-ADDR
   { 
        Label = "Kanji Address";
        Length = "75";
        SType = "Text";
        DisplayOnly;
   }
       
   INOUT MIR-CLI-ADDR-ADDL-TXT
   {
        Label = "Samakata-bu";
        Length = "60";
        SType = "Text";
   }        
   
   INOUT MIR-BNK-ID
   {       
       Label = "Bank Number";
       Length = "4";
       SType = "Text";
   }
       
   OUT MIR-BNK-NM
   {        
       Label = "Bank Name";
       Length = "75";
       SType = "Text";
   } 
       
   INOUT MIR-BNK-BR-ID
   {       
        Label = "Branch Number";
        Length = "3";
        SType = "Text";
   }
       
   INOUT MIR-BNK-BR-NM
   {
        Label = "Branch Name";
        Length = "50";
        SType = "Text";
   }
       
   INOUT MIR-BNK-ACCT-TYP-CD
   {
       Length = "3";
       CodeSource = "EDIT";
       CodeType = "FBACC";
       SType = "Selection";
       Label = "Account Type";
   }
   
   INOUT MIR-BNK-ACCT-ID
   {
       Label = "Bank Account Number";
       Length = "17";
       SType = "Text";
   }
          
   INOUT MIR-BNK-ACCT-HLDR-NM
   {
       Label = "Account Holder Name";
       Length = "50";
       SType = "Text";
   }
#Q76550 CHANGES STARTS
    INOUT MIR-DV-INT-CALC-DT-TYP-CD
    {
        Length = "1";
        DBTableName = "Derived";
        SType = "Hidden";
        Label = "Interest Calculation Type";
    }
#Q76550 CHANGES ENDS
#R12887 CHANGES STARTS
    INOUT MIR-OVRID-INT-CALC-DT
    {
        Length = "10";
        DBTableName = "Derived";
        SType = "Hidden";
        Label = "Override Interest Calculation Date";
    }
#R12887 CHANGES ENDS
#UY3037 CHANGES STARTS HERE
    
    OUT MIR-LOAN-RPAY-EFF-DT
    {
        Length = "10";
        SType = "Date";
        Label = "Loan Repayment effective date";
    }
    
    OUT MIR-LOAN-INT-STRT-DT
    {
        Length = "10";
        SType = "Date";
        Label = "Loan interest start date";
    }
    
    OUT MIR-LOAN-POL-CHNG-CAT
    {
        Length = "25";
        SType = "Text";
        Label = "Loan Transaction category";
    }
    
    OUT MIR-LOAN-RPAY-PRCES-DT
    {
        Length = "10";
        SType = "Date";
        Label = "Process Date";
    }
      
    OUT MIR-CSH-LOAN-BAL-AMT
    {
        Length = "16";
        SType = "Currency";
        Label = "Policy Loan Balance";
    }
    
    OUT MIR-XCES-SHRT-INT-AMT
    {
        Length = "40";
        SType = "Text";
        Label = "Excess or Shortage of Interest";
    }
    
    OUT MIR-UNEARNED-INT-AMT
    {
        Length = "16";
        SType = "Currency";
        Label = "Unearned Interest";
    }
    
    OUT MIR-OUTSTAND-INT-AMT
    {
        Length = "16";
        SType = "Currency";
        Label = "outstanding Interest";
    }
    
    OUT MIR-TOT-LOAN-RPAY-AMT
    {
        Length = "16";
        SType = "Currency";
        Label = "Repayment of Loan amount";
    }
    OUT MIR-APL-TRNSF-EFF-DT
    {
        Length = "10";
        SType = "Date";
        Label = "APL effective date";
    }
    
    OUT MIR-APL-SELF-SWNG-CAP-DT
    {
        Length = "10";
        SType = "Date";
        Label = "APL next interest capitalization date";
    }
    
    OUT MIR-APL-SELF-POL-CHNG-CAT
    {
        Length = "25";
        SType = "Text";
        Label = "APL Transaction category";
    }
    
    OUT MIR-APL-PRCES-DT
    {
        Length = "10";
        SType = "Date";
        Label = "Process Date";
    } 
  
    OUT MIR-APL-PRNCPL-INT-AMT
    {
        Length = "16";
        SType = "Currency";
        Label = "APL balance";
    }
    
    OUT MIR-APL-INT-AMT
    {
        Length = "16";
        SType = "Currency";
        Label = "APL Interest";
    }
    
    OUT MIR-APL-PAY-AMT
    {
        Length = "16";
        SType = "Currency";
        Label = "APL payment amount";
    } 
    
    OUT MIR-TOT-APL-CSH-LOAN-AMT
    {
        Length = "16";
        SType = "Currency";
        Label = "Total amount APL/Loan Repayment";
    }
#UY3037 CHANGES ENDS HERE

#27549A CHANGES STARTS HERE      
      
    INOUT MIR-ATO-NOT-APPL-IND
    {
         Length = "1";
         SType = "Indicator";
         Label = "ATO not applicable";
     } 
      OUT MIR-WARN-MSG-CD
      {
        Length = "01";
        SType = "Text";
        Label = "Warning Message Indicator";
      }
      
#27549A CHANGES END HERE 

#CD3001 - CHANGES START HERE

     OUT MIR-RID-AV-BAL-AMT
    {
        Length = "15";
        CurrencyCode="MIR-POL-CRCY-CD";
        SType = "Currency";
        Label = "Rider A/V Balance";
    }

     OUT MIR-WTHDR-AMT-AFTR-DED
    {
        Length = "15";
        CurrencyCode="MIR-POL-CRCY-CD";
        Signed;
        SType = "Currency";
        Label = "Withdrawal Amount(After Interest Deduction)";
    }

     OUT MIR-DLY-INT-AMT
    {
        Length = "15";
        CurrencyCode="MIR-POL-CRCY-CD";
        SType = "Currency";
        Label = "Daily Interest";
    }

     OUT MIR-WTHDR-AMT
    {
        Length = "15";
        CurrencyCode="MIR-POL-CRCY-CD";
        Signed;
        SType = "Currency";
        Label = "Withdrawal Amount";
    }

     OUT MIR-AV-BAL-AMT-AFTR-WTHDR
    {
        Length = "15";
        CurrencyCode="MIR-POL-CRCY-CD";
        SType = "Currency";
        Label = "Rider A/V Balance After Withdrawal";
    }

     OUT MIR-RDR-AV-WTHDR-YEN-AMT
    {
        Length = "15";
        SType = "Currency";
        Label = "Rider A/V Withdrawal Amount(Yen)";
    }

     INOUT MIR-POL-CRCY-CD
    {   
        Length = "2";
        SType = "Hidden";             
    } 

     INOUT MIR-POL-CRCY-SP
    {   
        Length = "2";
        SType = "Hidden";             
    } 

     INOUT MIR-SPWL-PLAN-IND
    {
        Length = "1"; 
        SType = "Hidden";
    }
#CD3001 - CHANGES ENDS HERE

}
