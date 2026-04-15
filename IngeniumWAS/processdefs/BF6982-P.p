# Converted from PathFinder 2.2 to 3.0 Jun 18, 2004 3:13:53 PM EDT

#*******************************************************************************
#*  Component:   BF6982-P.p                                                    *
#*  Description:                                                               *
#*                                                                             *
#*******************************************************************************
#*  Chg#    Release  Description                                               *
#*                                                                             *
#*  014590  6.0      New for release 6.0                                       *
#*  017150  612J     Remove Currency Decimals = "2"                            *
#*  NWLLTC  CTS      CHANGES FOR LOAN QUOTE SCREEN                             *
#*  MP1542  CTS      CHANGES FOR AUTOMATIC PREMIUM LOAN PROCESSING             *
#*  MP162A  CTS      OWL SERVER ENHANCEMENTS                                   *
#*  TVI031  CTS      CHANGES FOR AUTOMATIC PREMIUM SUSPENSION PROCESSING       *
#*  M319A2  CTS      Changes done for FXWL Policy Loan Processing              *
#*  Q91578  CTS      REQUESTED LOAN AMOUNT NOT ACCEPTED IN JPY FOR FXWL        *
#*  Q94501  CTS      CHANGES TO NEW LOAN INPUT SCREEN FOR FXWL                 *
#*  UYS057  CTS      CHANGES RELATED POLICY LOAN CHANGES                       *
#*  UYS32E  CTS      ADDITIONAL ITEMS FOR UNEARNED INTEREST                    *
#*  UYS043  CTS      CHANGES MADE AS PART OF VIRTUAL QUOTE SCREEN              *
#*  UYS024  CTS      CHANGES FOR TRAIL CALC WEBSERVICE                         *
#*  S25278  CTS      CHANGES DONE FOR APL WARNING MSG                          *
#*  S25524  CTS       FIX FOR UDSD-5524                                       **
#*  NVCB03  CTS      CHANGES DONE AS PART OF ONTARIO APS/LAPSE                 *
#*  ON2682  CTS      FIX DONE AS THE PART OF ONTARIO-2682                      *
#*******************************************************************************

P-STEP BF6982-P
{
    ATTRIBUTES
    {
        BusinessFunctionId = "6982";
#NWLLTC CHANGE START
#        BusinessFunctionName = "Policy Inquiry - Loan Values";
        BusinessFunctionName = "Policy Inquiry - Policy Loan Quote";
#NWLLTC CHANGE END
        BusinessFunctionType = "Valueln";
        MirName = "CCWM6982";
    }

    OUT LSIR-RETURN-CD;

    OUT MIR-RETRN-CD;
#NWLLTC CHANGE START
    INOUT MIR-APPL-CTL-PRCES-DT
    {
        Key;
        Length = "10";
        DBTableName = "TMAST";
        DefaultSession = "LSIR-PRCES-DT";
        SType = "Date";
#        Label = "Process Date";
#       MP162A Changes Starts Here
#         label = "Effective Date";
         Label = "Effective Date";
#       MP162A Changes Ends Here
    }
#NWLLTC CHANGE END

    IN MIR-POL-ID-BASE
    {
        Key;
        Mandatory;
        Length = "9";
        DBTableName = "TPOL";
        DefaultSession = "MIR-POL-ID-BASE";
        SType = "Text";
        Label = "Policy Id";
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

    OUT MIR-DV-LOAN-DSCNT-AMT
    {
        Signed;
        Length = "17";
        DBTableName = "Derived";
        SType = "Currency";
        Label = "Loan Amount after Interest Deduction";
    }

    OUT MIR-DV-LOAN-DSCNT-FCT
    {
        Signed;
        Length = "8";
        Decimals = "5";
        DBTableName = "Derived";
        SType = "Number";
        Label = "Discount Factor";
    }

    OUT MIR-DV-LOAN-REPAY-AMT
    {
        Signed;
        Length = "17";
        DBTableName = "Derived";
        SType = "Currency";
        Label = "Loan Repayment Amount";
    }

    OUT MIR-DV-MAX-LOAN-AMT
    {
        Signed;
        Length = "17";
        DBTableName = "Derived";
        SType = "Currency";
        Label = "Maximum Loan Amount Available";
    }

    OUT MIR-DV-OS-MPREM-AMT
    {
        Signed;
        Length = "17";
        DBTableName = "Derived";
        SType = "Currency";
        Label = "Outstanding Full Modal Premium";
    }

    OUT MIR-DV-OWN-CLI-NM
    {
        Length = "75";
        DBTableName = "Derived";
        SType = "Text";
        Label = "Owner Name";
    }

    OUT MIR-DV-POL-LOAN-CV-AMT
    {
        Signed;
        Length = "17";
        DBTableName = "Derived";
        SType = "Currency";
        Label = "Loanable Cash Value";
    }

    OUT MIR-DV-SURR-LOAN-AMT
    {
        Signed;
        Length = "17";
        DBTableName = "Derived";
        SType = "Currency";
        Label = "Surrendered Loan";
    }

    OUT MIR-LOAN-AMT-T[3]
    {
        Key;
        Signed;
        Length = "17";
        FieldGroup = "Table3";
        DBTableName = "TPOLL";
        SType = "Currency";
        Label = "Policy Loan";
        Index = "1";
    }

    OUT MIR-LOAN-ANNV-AMT-T[3]
    {
        Signed;
        Length = "17";
        FieldGroup = "Table3";
        DBTableName = "TPOLL";
        SType = "Currency";
        Label = "Anniversary Loan Balance";
        Index = "1";
    }

    OUT MIR-LOAN-AVB-AMT-T[3]
    {
        Signed;
        Length = "17";
        FieldGroup = "Table3";
        DBTableName = "TPOLL";
        SType = "Currency";
        Label = "Average Loan Balance";
        Index = "1";
    }

    OUT MIR-LOAN-DT-T[3]
    {
        Length = "10";
        FieldGroup = "Table3";
        DBTableName = "TPOLL";
        SType = "Date";
        Label = "Effective Date";
        Index = "1";
    }

    OUT MIR-LOAN-INT-BILL-AMT-T[3]
    {
        Signed;
        Length = "15";
        FieldGroup = "Table3";
        DBTableName = "TPOLL";
        SType = "Currency";
        Label = "Loan Interest Billed";
        Index = "1";
    }

    OUT MIR-LOAN-INT-MAX-RT-T[3]
    {
        Length = "7";
        Decimals = "5";
        FieldGroup = "Table3";
        DBTableName = "TPOLL";
        SType = "Percent";
        Label = "Maximum Loan Interest Rate";
        Index = "1";
    }

    OUT MIR-LOAN-INT-RT-T[3]
    {
        Length = "7";
        Decimals = "5";
        FieldGroup = "Table3";
        DBTableName = "TPOLL";
        SType = "Percent";
        Label = "Loan Interest Rate";
        Index = "1";
    }

    OUT MIR-LOAN-INT-YTD-AMT-T[3]
    {
        Signed;
        Length = "15";
        FieldGroup = "Table3";
        DBTableName = "TPOLL";
        SType = "Currency";
        Label = "Loan Interest Paid / Capitalized Year to Date";
        Index = "1";
    }

    OUT MIR-LOAN-PREV-ANNV-AMT-T[3]
    {
        Signed;
        Length = "17";
        FieldGroup = "Table3";
        DBTableName = "TPOLL";
        SType = "Currency";
        Label = "Previous Anniversary Loan Balance";
        Index = "1";
    }
#UYS024 CHANGES STARTS HERE 
#Table fields  (income)
 
     OUT MIR-LOAN-INCM-ACCT-NM-T[8]
    {
        Length ="30";
        FieldGroup = "Table1";
        DBTableName = "Derived";
        SType = "Text";
        Label = "Account Name";
        Index = "1";
    }
    OUT MIR-LOAN-INCM-ACCT-CD-T[8]
    {
        Length ="10";
        FieldGroup = "Table1";
        SType = "Text";
        Label = "Type";
        Index = "1";
    }     
 
    OUT MIR-LOAN-INCM-AMT-T[8]
    {
        Length ="15";
        FieldGroup = "Table1";
        DBTableName = "Derived";
        SType = "Currency";
        Label = "Income amount";
        Index = "1";
    } 
#Table fields  (Expense)  
     OUT MIR-LOAN-EXPNS-ACCT-NM-T[8]
    {
        Length ="30";
        FieldGroup = "Table1";
        DBTableName = "Derived";
        SType = "Text";
        Label = "Account Name";
        Index = "1";
    }
    OUT MIR-LOAN-EXPNS-ACCT-CD-T[8]
    {
        Length ="10";
        FieldGroup = "Table1";
        SType = "Text";
        Label = "Type";
        Index = "1";
    }     
 
    OUT MIR-LOAN-EXPNS-AMT-T[8]
    {
        Length ="15";
        FieldGroup = "Table1";
        DBTableName = "Derived";
        SType = "Currency";
        Label = "Income amount";
        Index = "1";
    }  
#UYS024 CHANGES ENDS HERE

    OUT MIR-POL-CSTAT-CD
    {
        Length = "40";
        CodeSource = "DataModel";
        CodeType = "POL-CSTAT-CD";
        DBTableName = "TPOL";
        SType = "Text";
        Label = "Policy Status";
    }
# MP1542 CHANGES STARTS HERE
    IN MIR-LOAN-TYP-CD
    {
        DisplayOnly;
        Length = "40";
        CodeSource = "DataModel";
        CodeType = "POL-LOAN-ID";
        SType = "Text";
        Label = "Type of Loan:";
    }
# MP1542 CHANGES ENDS HERE

    OUT MIR-SBSDRY-CO-ID
    {
        Length = "40";
        CodeSource = "EDIT";
        CodeType = "SUBCO";
        DBTableName = "TPOL";
        SType = "Text";
        Label = "Sub Company";
    }
# NWLLTC CHANGES STARTS HERE
    INOUT MIR-LOAN-AMT
    {
        Signed;
        Length = "15";
        SType = "Currency";
        Label = "Loan Amount Requested";
    }
    OUT MIR-APL-LOAN-AMT
    {
        Signed;
        Length = "15";
        DBTableName = "TLHST";
        SType = "Currency";
        Label = "Automatic Premium Loan";
    }
    OUT MIR-DV-APL-LOAN-INT-AMT
    {
        Signed;
        Length = "15";
        DBTableName = "TLHST";
        SType = "Currency";
        Label = "Interest for Automatic Premium Loan";
    }
    OUT MIR-DV-LOAN-INT-AMT
    {
        Signed;
        Length = "15";
        SType = "Currency";
        Label = "Loan Interest";
    }
    
    OUT MIR-XCES-INT-AMT
    {
        Length = "13";
        DBTableName = "TPOL";
        SType = "Currency";
        Label = "Excess Interest";
    }
    
    OUT MIR-SHRT-INT-AMT
    {
        Length = "13";
        DBTableName = "TPOL";
        SType = "Currency";
        Label = "Short Interest";
    }
    OUT MIR-DV-REMIT-AMT
    {
        Signed;
        Length = "15";
        SType = "Currency";
        Label = "Remmitance Amount Available";
    }
# NWLLTC CHANGES ENDS HERE
# MP1542 CHANGES STARTS HERE
    OUT MIR-DV-POL-APL-CV-AMT
    {
        DisplayOnly;
        Signed;
        Length = "15";
        SType = "Currency";
        Label = "Assumed APL Cash Value";
     }
    OUT MIR-APL-LOAN-BAL-AMT
    {
        DisplayOnly;
        Signed;
        Length = "15";
        SType = "Currency";
        Label = "Balance of APL";
     }
    OUT MIR-APL-LOAN-INT-AMT
    {
        DisplayOnly;
        Signed;
        Length = "15";
        SType = "Currency";
        Label = "Loan amount of this time and interest for APL Balance";
     }
    OUT MIR-LOAN-BAL-AMT
    {
        DisplayOnly;
        Signed;
        Length = "15";
        SType = "Currency";
        Label = "Balance of Policy Loan";
     }
     
# UYS32E ADDITIONAL ITEMS FOR UNEARNED INTEREST START HERE 
     OUT MIR-UNEARN-LOAN-INT-AMT
     {
         DisplayOnly;
         Signed;
         Length = "15";
         SType = "Currency";
         Label = "Unearned Interest";
     }
# UYS32E ADDITIONAL ITEMS FOR UNEARNED INTEREST END HERE     
     
    OUT MIR-LOAN-INT-AMT
    {
        DisplayOnly;
        Signed;
        Length = "15";
        SType = "Currency";
        Label = "Interest for Policy Loan Balance";
     }
    OUT MIR-PREM-SHRT-AMT
    {
        DisplayOnly;
        Signed;
        Length = "15";
        SType = "Currency";
        Label = "Premium Shortage Amount";
     }
    OUT MIR-APL-APPLY-AMT
    {
        DisplayOnly;
        Signed;
        Length = "15";
        SType = "Currency";
        Label = "APL Amount to be applied this time";
     }
# MP1542 CHANGES ENDS HERE
# TVI031 CHANGES STARTS HERE

    OUT MIR-DV-POL-ACUM-CV-AMT
    {
        DisplayOnly;
        Signed;
        Length = "15";
        SType = "Currency";
        Label = "Market Value";
     }
# ON2682 CHANGES STARTS HERE    
    OUT MIR-DV-APS-DTRMN-AMT
    {
        DisplayOnly;
        Signed;
        Length = "15";
        SType = "Currency";
#       Label = "TRAD Modal Premium * 6";
        Label = "TRAD Monthly Premium*6";    
     }
# ON2682 CHNAGES  ENDS HERE     
# TVI031 CHANGES ENDS HERE     
# NVCB03 CHANGES STARTS HERE
# ON2682 CHANGES STARTS HERE
    OUT MIR-DV-APS-DTRMN-AMT1
    {
        DisplayOnly;
        Signed;
        Length = "15";
        DBTableName = "Derived";
        SType = "Currency";
#       Label = "TRAD Modal Premium * 8";
        Label = "TRAD Monthly Premium*8";
     }
# ON2682 CHNAGES  ENDS HERE     
    OUT MIR-DV-APS-DTRMN-AMT2
    {
        DisplayOnly;
        Signed;
        Length = "15";
        DBTableName = "Derived";
        SType = "Currency";
        Label = "TRAD Modal Premium * 2";
     }
# ON2682 CHANGES STARTS HERE
    OUT MIR-MTHLY-STD-PREM-AMT
    {
        DisplayOnly;
        Signed;
        Length = "15";
        DBTableName = "TPOL";
        SType = "Currency";
#       Label = "Monthly Premium";
        Label = "Modal Premium";
     }
# ON2682 CHNAGES  ENDS HERE
    OUT MIR-POL-BILL-MODE-CD
    {
        Length = "02";
        CodeSource = "DataModel";
        CodeType = "POL-BILL-MODE-CD";
        DBTableName = "TPOL";
        SType = "Text";
        Label = "Policy Billing Frequency";
    }
# NVCB03 CHANGES ENDS HERE     
# M319A2 CHANGES STARTS HERE
    OUT MIR-DV-JPY-REMIT-AMT
    {
        Signed;
        Length = "15";
        SType = "Currency";
        Label = "Remittance Amount Available";
    }
    
    OUT MIR-DV-PAYO-JPY-BNFT-CD
      {
        Length = "1";
        CodeSource = "DataModel";
        CodeType = "PAYO-JPY-BNFT-CD";
        SType = "Text";
        Label = "JPY Benefit Rider";
      } 
    OUT MIR-JPY-XCHNG-EFF-DT
    { 
        Length = "10";
        SType = "Date";
        Label = "Exchange Effective date to JPY";
    }
    OUT MIR-JPY-XCHNG-RT
    { 
        Length = "7";
        Decimals = "2";
        DBTableName = "TCXRT";
        SType = "Text";
        Label = "Exchange rate to JPY";     
    } 
#Q91578 - CHANGES START    
#Q91578  OUT MIR-JPY-TRXN-AMT
    INOUT MIR-JPY-TRXN-AMT
#Q91578 - CHANGES START     
    {
        Signed;
        Length = "15";
        SType = "Currency";
        Label = "Loan Amount Requested (Converted value in Yen)";
    }    
    
     INOUT MIR-POL-CRCY-CD
     {     
         Length = "2";
         SType = "Hidden";
         Label = "Currency";
     }    
# Q94501 - Changes begins
    # INOUT MIR-PMT-CRCY-CD
    # {     
    #     Length = "2";
    #     SType = "Hidden";
    #     Label = "Currency";
    # }        
     
     #INOUT MIR-LOAN-CRCY-CD
    # {
     #      Key;
    #       Mandatory;
     #      Length = "5";
      #     SType = "Text";
     #      Label = "Currency";
     # }
     # 
    #INOUT MIR-PREM-CRCY-CD
    #{
   #     Length = "2";
    #    SType = "Hidden";
    #    Label = "Currency";
    #}  
# Q94501 - Changes Ends
# M319A2 CHANGES ENDS HERE
#UYS057 CHANGES STARTS HERE
    OUT MIR-DV-LOAN-INT-UNEARN-AMT
    {
        Signed;        
        Length = "15";
        SType  = "Currency";
        Label = "Loan interest unearned";
    }
#UYS057 CHANGES ENDS HERE
#UYS043 CHANGES START HERE
    INOUT MIR-VIR-SCREEN-IND
    {
        Length = "1";
        SType = "Indicator";
        Label = "Please check in case of virtual quote implementation";
    }
    INOUT MIR-VIR-TRAD-PD-TO-MO-NUM
    {
    
        Label = "Next Payment Date:";
        Length = "07";
        SType = "text";
    }  
    
    INOUT MIR-VIR-CI-FRST-ELAPS-YRS-DUR
    {
 
        Label = "Elapsed years:";
        Length = "07";
        SType = "text";
    } 
    
     INOUT MIR-VIR-ACTV-IND
     {
         Length = "1";
         SType = "Indicator";
         Label = "Active";
     }

     INOUT MIR-VIR-LOAN-AMT
     {   
         
         Signed;
         Length = "13";
         DBTableName = "Derived";
         SType = "Currency";
         Label = "Policy loan balance:";
     }  
     
     INOUT MIR-VIR-INT-STR-DT
     {
 
         Length = "10";
         SType = "Date";
         Label = "Interest start date";
     }  
     
     INOUT MIR-VIR-APL-LOAN-AMT
     {   
         Signed;
         Length = "13";
         SType = "Currency";
         Label = "APL balance:";
     }     
     
     INOUT MIR-VIR-POL-LOAN-EFF-DT
     {
 
         Length = "10";
         SType = "Date";
         Label = "APL date";
     }    
     
     INOUT MIR-VIR-PREPAY-MNG-IND
     {
         Length = "1";
         SType = "Indicator";
         Label = "Prepayment management";
     }
     
     INOUT MIR-VIR-SEI-ASS-IND
     {
         Length = "1";
         SType = "Indicator";
         Label = "Seizure assignment";
     }    
    
    INOUT MIR-DV-PRCES-STATE-CD
    {
        Length = "1";
        SType = "Hidden";
        Label = "MIR-DV-PRCES-STATE-CD";
    }
     
#UYS043 CHANGES END HERE
#UYS024 CHANGES STARTS HERE
     OUT MIR-TOT-LOAN-INCM-AMT
     {
	     CurrencyCode = "MIR-PMT-CRCY-CD";    
         Length = "15";
         SType = "Currency";
         Label = "Total Paid-up Income amount";
     }  
     
     OUT MIR-TOT-LOAN-EXPNS-AMT
     {
	     CurrencyCode = "MIR-PMT-CRCY-CD";    
         Length = "15";
         SType = "Currency";
         Label = "Total Paid-up Expense";
     }  
     
     OUT MIR-NET-LOAN-INCM-AMT
     {
	     CurrencyCode = "MIR-PMT-CRCY-CD";    
         Length = "15";
         SType = "Currency";
         Label = "Net Paid-up Income amount";
     }  
     
     OUT MIR-NET-LOAN-EXPNS-AMT
     {
	     CurrencyCode = "MIR-PMT-CRCY-CD";    
         Length = "15";
         SType = "Currency";
         Label = "Net Paid-up Expense amount";
     } 
    OUT MIR-NXT-APL-DT
    {
        Length = "10";
        SType = "Date";
        Label = "Next APL Date";
    }

    OUT MIR-APL-AVAIL-FROM-DT
    {
        Length = "10";
        SType = "Date";
        Label = "Next APL Date";
    }
    
    OUT MIR-APL-AVAIL-TO-DT
    {
        Length = "10";
        SType = "Date";
        Label = "Next APL Date";
    }
    
#UYS024 CHANGES ENDS HERE
#S25278 CHANGES STARTS HERE            
      OUT MIR-WARN-MSG-CD
      {
        Length = "01";
        SType = "Indicator";
	Label = "Warning Message Indicator";        
      }   
      
#S25278 CHANGES ENDS HERE 
#S25524- Changes Starts here
  INOUT  MIR-DV-UNDO-VALID-CD
    {
        Length = "1";
        DBTableName = "Derived";
        SType = "Hidden";
        Label = "Undo Indicator";
    }
  INOUT MIR-DV-COMMIT-CD
    {
        Length = "1";
        DBTableName = "Derived";
        SType = "Hidden";
    }
#S25524- Changes ends here

}

