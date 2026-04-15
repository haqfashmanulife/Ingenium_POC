# Converted from PathFinder 2.2 to 3.0 Jun 18, 2004 3:13:01 PM EDT

#*******************************************************************************
#*  Component:   BF6982-O.s                                                    *
#*  Description:                                                               *
#*                                                                             *
#*******************************************************************************
#*  Chg#    Release  Description                                               *
#*                                                                             *
#*  014590  6.0      New for release 6.0                                       *
#*  017150  612J     Remove Currency Decimals = "2"                            *
#*  NWLLTC  CTS      CHANGES FOR POLICY LOAN QUOTE SCREEN                      *
#*  MP1542  CTS      CHANGES FOR AUTOMATIC PREMIUM LOAN PROCESSING             *
#*  TVI031  CTS      CHANGES FOR AUTOMATIC PREMIUM SUSPENSION PROCESSING       *
#*  M319A2  CTS      Changes done for FXWL Policy Loan Processing              *
#*  Q94501  CTS      CHANGES TO NEW LOAN INPUT SCREEN FOR FXWL                **
#*  M319B5  CTS      CHANGES FOR AUTOMATIC PREMIUM LOAN FOR FXWL PRODUCT       *
#*  UYS057  CTS      CHANGES RELATED POLICY LOAN CHANGES                       *
#*  UYS32E  CTS      ADDITIONAL ITEMS FOR UNEARNED INTEREST                    *
#*  NVCB03  CTS      CHANGES DONE AS PART OF ONTARIO APS/LAPSE                 *
#*  ON2682  CTS      FIX DONE AS THE PART OF ONATRIO-2682                      *
#*******************************************************************************

S-STEP BF6982-O
{
    ATTRIBUTES
    {
        BusinessFunctionType = "Valueln";
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

# NWLLTC CHANGES STARTS HERE
    IN MIR-APPL-CTL-PRCES-DT
    {
        Key;
        DisplayOnly;
        Length = "10";
        DefaultSession = "LSIR-PRCES-DT";
        SType = "Date";
#        Label = "Process Date";
        Label = "Effective Date";
    }
# NWLLTC CHANGES ENDS HERE

    IN MIR-POL-ID-BASE
    {
        Key;
        DisplayOnly;
        Length = "9";
        DefaultSession = "MIR-POL-ID-BASE";
        SType = "Text";
        Label = "Policy Id";
    }

    IN MIR-POL-ID-SFX
    {
        Key;
        DisplayOnly;
        Length = "1";
        DefaultSession = "MIR-POL-ID-SFX";
        SType = "Text";
        Label = "Suffix";
    }

    IN MIR-DV-LOAN-DSCNT-AMT
    {
        DisplayOnly;
        Signed;
        Length = "17";
        SType = "Currency";
        Label = "Loan Amount after Interest Deduction";
    }

    IN MIR-DV-LOAN-DSCNT-FCT
    {
        DisplayOnly;
        Signed;
        Length = "8";
        Decimals = "5";
        SType = "Number";
        Label = "Discount Factor";
    }

    IN MIR-DV-LOAN-REPAY-AMT
    {
        DisplayOnly;
        Signed;
        Length = "17";
        SType = "Currency";
#M319A2 CHANGES STARTS HERE
	CurrencyCode = "MIR-POL-CRCY-CD";
#M319A2 CHANGES ENDS HERE       
        Label = "Loan Repayment Amount";
    }

    IN MIR-DV-MAX-LOAN-AMT
    {
        DisplayOnly;
        Signed;
        Length = "17";
        SType = "Currency";
#M319A2 CHANGES STARTS HERE
	CurrencyCode = "MIR-POL-CRCY-CD";
#M319A2 CHANGES ENDS HERE
        Label = "Maximum Loan Amount Available";
    }

    IN MIR-DV-OS-MPREM-AMT
    {
        DisplayOnly;
        Signed;
        Length = "17";
        SType = "Currency";
        Label = "Outstanding Full Modal Premium";
    }

    IN MIR-DV-OWN-CLI-NM
    {
        DisplayOnly;
        Length = "75";
        SType = "Text";
        Label = "Owner Name";
    }

    IN MIR-DV-POL-LOAN-CV-AMT
    {
        DisplayOnly;
        Signed;
        Length = "17";
        SType = "Currency";
#M319A2 CHANGES STARTS HERE
	CurrencyCode = "MIR-POL-CRCY-CD";
#M319A2 CHANGES ENDS HERE
        Label = "Loanable Cash Value";
    }

    IN MIR-DV-SURR-LOAN-AMT
    {
        DisplayOnly;
        Signed;
        Length = "17";
        SType = "Currency";
        Label = "Surrendered Loan";
    }

    IN MIR-LOAN-AMT-T[3]
    {
        Key;
        DisplayOnly;
        Signed;
        Length = "17";
        FieldGroup = "Table3";
        SType = "Currency";
        Label = "Policy Loan";
        Index = "1";
    }

    IN MIR-LOAN-ANNV-AMT-T[3]
    {
        DisplayOnly;
        Signed;
        Length = "17";
        FieldGroup = "Table3";
        SType = "Currency";
        Label = "Anniversary Loan Balance";
        Index = "1";
    }

    IN MIR-LOAN-AVB-AMT-T[3]
    {
        DisplayOnly;
        Signed;
        Length = "17";
        FieldGroup = "Table3";
        SType = "Currency";
        Label = "Average Loan Balance";
        Index = "1";
    }

    IN MIR-LOAN-DT-T[3]
    {
        DisplayOnly;
        Length = "10";
        FieldGroup = "Table3";
        SType = "Date";
        Label = "Effective Date";
        Index = "1";
    }

    IN MIR-LOAN-INT-BILL-AMT-T[3]
    {
        DisplayOnly;
        Signed;
        Length = "15";
        FieldGroup = "Table3";
        SType = "Currency";
        Label = "Loan Interest Billed";
        Index = "1";
    }

    IN MIR-LOAN-INT-MAX-RT-T[3]
    {
        DisplayOnly;
        Length = "7";
        Decimals = "5";
        FieldGroup = "Table3";
        SType = "Percent";
        Label = "Maximum Loan Interest Rate";
        Index = "1";
    }

    IN MIR-LOAN-INT-RT-T[3]
    {
        DisplayOnly;
        Length = "7";
        Decimals = "5";
        FieldGroup = "Table3";
        SType = "Percent";
        Label = "Loan Interest Rate";
        Index = "1";
    }

    IN MIR-LOAN-INT-YTD-AMT-T[3]
    {
        DisplayOnly;
        Signed;
        Length = "15";
        FieldGroup = "Table3";
        SType = "Currency";
        Label = "Loan Interest Paid / Capitalized Year to Date";
        Index = "1";
    }

    IN MIR-LOAN-PREV-ANNV-AMT-T[3]
    {
        DisplayOnly;
        Signed;
        Length = "17";
        FieldGroup = "Table3";
        SType = "Currency";
        Label = "Previous Anniversary Loan Balance";
        Index = "1";
    }

    IN MIR-POL-CSTAT-CD
    {
        DisplayOnly;
        Length = "40";
        CodeSource = "DataModel";
        CodeType = "POL-CSTAT-CD";
        SType = "Text";
        Label = "Policy Status";
    }
#TVI031 CHANGES STARTS HERE MODIFIED THE DMAD VARIABLE FOR THE MIR    
# MP1542 CHANGES STARTS HERE
#    IN MIR-LOAN-TYP-CD
#    {
#        DisplayOnly;
#        Length = "40";
#        CodeSource = "DataModel";
#        CodeType = "POL-LOAN-ID";
#        SType = "Text";
#        Label = "Type of Loan:";
#    }
# MP1542 CHANGES ENDS HERE    
    IN MIR-LOAN-TYP-CD
    {
        DisplayOnly;
        Length = "40";
        CodeSource = "DataModel";
        CodeType = "LOAN-TYP-CD";
        SType = "Text";
        Label = "Type of Loan:";
    }    
# TVI031 CHANGES ENDS HERE

    IN MIR-SBSDRY-CO-ID
    {
        DisplayOnly;
        Length = "40";
        CodeSource = "EDIT";
        CodeType = "SUBCO";
        SType = "Text";
        Label = "Sub Company";
    }
# NWLLTC CHANGES STARTS HERE
    IN MIR-LOAN-AMT
    {
        DisplayOnly;
        Signed;
        Length = "15";
        SType = "Currency";
#M319A2 CHANGES STARTS HERE
        CurrencyCode="MIR-POL-CRCY-CD";
#M319A2 CHANGES ENDS HERE
        Label = "Loan Amount Requested";
    }
    IN MIR-APL-LOAN-AMT
    {
        DisplayOnly;
        Signed;
        Length = "15";
        SType = "Currency";
#M319A2 CHANGES STARTS HERE
	CurrencyCode = "MIR-POL-CRCY-CD";
#M319A2 CHANGES ENDS HERE
        Label = "Automatic Premium Loan";
    }
    IN MIR-DV-APL-LOAN-INT-AMT
    {
        DisplayOnly;
        Signed;
        Length = "15";
        SType = "Currency";
#M319A2 CHANGES STARTS HERE
	CurrencyCode = "MIR-POL-CRCY-CD";
#M319A2 CHANGES ENDS HERE
        Label = "Interest for Automatic Premium Loan";
    }
    IN MIR-DV-LOAN-INT-AMT
    {
        DisplayOnly;
        Signed;
        Length = "15";
        SType = "Currency";
#M319A2 CHANGES STARTS HERE
	CurrencyCode = "MIR-POL-CRCY-CD";
#M319A2 CHANGES ENDS HERE
        Label = "Loan Interest";
    }
    
    IN MIR-XCES-INT-AMT
    {
        DisplayOnly;
        Length = "13";
        SType = "Currency";
#M319A2 CHANGES STARTS HERE
	CurrencyCode = "MIR-POL-CRCY-CD";
#M319A2 CHANGES ENDS HERE
        Label = "Excess Interest";
    }
    
    IN MIR-SHRT-INT-AMT
    {
        DisplayOnly;
        Length = "13";
        SType = "Currency";
#M319A2 CHANGES STARTS HERE
	CurrencyCode = "MIR-POL-CRCY-CD";
#M319A2 CHANGES ENDS HERE
        Label = "Short Interest";
    }
    IN MIR-DV-REMIT-AMT
    {
        DisplayOnly;
        Signed;
        Length = "15";
        SType = "Currency";
#M319A2 CHANGES STARTS HERE
	CurrencyCode = "MIR-POL-CRCY-CD";
#M319A2 CHANGES ENDS HERE
        Label = "Remmitance Amount Available";
    }
# NWLLTC CHANGES ENDS HERE
# MP1542 CHANGES STARTS HERE
    IN MIR-DV-POL-APL-CV-AMT
    {
        DisplayOnly;
        Signed;
        Length = "15";
        SType = "Currency";
#M319B5 CHANGES STARTS HERE
	CurrencyCode = "MIR-POL-CRCY-CD";
#M319B5 CHANGES ENDS HERE        
        Label = "Assumed APL Cash Value";
     }
    IN MIR-APL-LOAN-BAL-AMT
    {
        DisplayOnly;
        Signed;
        Length = "15";
        SType = "Currency";
#M319A2 CHANGES STARTS HERE
	CurrencyCode = "MIR-POL-CRCY-CD";
#M319A2 CHANGES ENDS HERE
        Label = "Balance of APL";
     }
    IN MIR-APL-LOAN-INT-AMT
    {
        DisplayOnly;
        Signed;
        Length = "15";
        SType = "Currency";
#M319A2 CHANGES STARTS HERE
	CurrencyCode = "MIR-POL-CRCY-CD";
#M319A2 CHANGES ENDS HERE
        Label = "Loan amount of this time and interest for APL Balance";
     }
    IN MIR-LOAN-BAL-AMT
    {
        DisplayOnly;
        Signed;
        Length = "15";
        SType = "Currency";
#M319A2 CHANGES STARTS HERE
	CurrencyCode = "MIR-POL-CRCY-CD";
#M319A2 CHANGES ENDS HERE
        Label = "Balance of Policy Loan";
     }
     
# UYS32E ADDITIONAL ITEMS FOR UNEARNED INTEREST START HERE 
    IN MIR-UNEARN-LOAN-INT-AMT	
    {
         DisplayOnly;
         Signed;
         Length = "15";
         SType = "Currency";
         CurrencyCode = "MIR-POL-CRCY-CD";
         Label = "Unearned Interest";
     }
# UYS32E ADDITIONAL ITEMS FOR UNEARNED INTEREST END HERE 
     
    IN MIR-LOAN-INT-AMT
    {
        DisplayOnly;
        Signed;
        Length = "15";
        SType = "Currency";
#M319A2 CHANGES STARTS HERE
	CurrencyCode = "MIR-POL-CRCY-CD";
#M319A2 CHANGES ENDS HERE
        Label = "Interest for Policy Loan Balance";
     }
    IN MIR-PREM-SHRT-AMT
    {
        DisplayOnly;
        Signed;
        Length = "15";
        SType = "Currency";
#M319A2 CHANGES STARTS HERE
	CurrencyCode = "MIR-POL-CRCY-CD";
#M319A2 CHANGES ENDS HERE
        Label = "Premium Shortage Amount";
     }
    IN MIR-APL-APPLY-AMT
    {
        DisplayOnly;
        Signed;
        Length = "15";
        SType = "Currency";
#M319A2 CHANGES STARTS HERE
	CurrencyCode = "MIR-POL-CRCY-CD";
#M319A2 CHANGES ENDS HERE
        Label = "APL Amount to be applied this time";
     }
# MP1542 CHANGES ENDS HERE
# TVI031 CHANGES STARTS HERE
    IN MIR-DV-POL-ACUM-CV-AMT
    {
        DisplayOnly;
        Signed;
        Length = "15";
        SType = "Currency";
#M319A2 CHANGES STARTS HERE
	CurrencyCode = "MIR-POL-CRCY-CD";
#M319A2 CHANGES ENDS HERE
        Label = "Market Value";
     }
    IN MIR-DV-APS-DTRMN-AMT
    {
        DisplayOnly;
        Signed;
        Length = "15";
        SType = "Currency";
#M319A2 CHANGES STARTS HERE
	CurrencyCode = "MIR-POL-CRCY-CD";
#M319A2 CHANGES ENDS HERE
# ON2682 CHANGES STARTS HERE 
#       Label = "TRAD Modal Premium * 6";
        Label = "TRAD Monthly Premium*6";
# ON2682 CHANGES ENDS HERE 	  
     }
# TVI031 CHANGES ENDS HERE
# NVCB03 CHANGES STARTS HERE
    IN MIR-DV-APS-DTRMN-AMT1
    {
        DisplayOnly;
        Signed;
        Length = "15";
        SType = "Currency";
        CurrencyCode = "MIR-POL-CRCY-CD";
# ON2682 CHANGES STARTS HERE
#       Label = "TRAD Modal Premium * 8";
        Label = "TRAD Monthly Premium*8";
# ON2682 CHANGES ENDS HERE 
     }
    IN MIR-DV-APS-DTRMN-AMT2
    {
        DisplayOnly;
        Signed;
        Length = "15";
        SType = "Currency";
        CurrencyCode = "MIR-POL-CRCY-CD";
        Label = "TRAD Modal Premium * 2";
     }
    IN MIR-MTHLY-STD-PREM-AMT
    {
        DisplayOnly;
        Signed;
        Length = "15";
        SType = "Currency";
        CurrencyCode = "MIR-POL-CRCY-CD";
# ON2682 CHANGES STARTS HERE	
#       Label = "Monthly Premium";
        Label = "Modal Premium";
     }
    IN MIR-POL-BILL-MODE-CD
    {
        DisplayOnly;
        Length = "02";
        CodeSource = "DataModel";
        CodeType = "POL-BILL-MODE-CD";
        SType = "Text";
        Label = "Policy Billing Frequency";
    }
# NVCB03 CHANGES ENDS HERE
# M319A2 CHANGES STARTS HERE
    IN MIR-DV-JPY-REMIT-AMT
    {
        DisplayOnly;
        Signed;
        Length = "15";
        SType = "Currency";
        Label = "Remmitance Amount Available";
    }
    
    IN MIR-DV-PAYO-JPY-BNFT-CD
      {
        DisplayOnly;
        Length = "1";        
        CodeSource = "DataModel";
        CodeType = "PAYO-JPY-BNFT-CD";
        SType = "Text";
        Label = "JPY Benefit Rider";
      } 
    IN MIR-JPY-XCHNG-EFF-DT
    { 
        DisplayOnly;
        Length = "10";
        SType = "Date";
        Label = "Exchange Effective date to JPY";
    }
    IN MIR-JPY-XCHNG-RT
    { 
        DisplayOnly;
        Length = "7";
        Decimals = "2";
        DBTableName = "TCXRT";
        SType = "Text";
        Label = "Exchange rate to JPY";     
    } 
    
     IN MIR-POL-CRCY-CD
     {     
         Length = "2";
         SType = "Hidden";
         Label = "Currency";
     }     
# Q94501 - Changes begins
   #  IN MIR-LOAN-CRCY-CD
   #  {
   #      Length = "5";
   #      Label = "Currency";
   #  }
   # IN MIR-PREM-CRCY-CD
   # {
   #     Length = "2";
   #     SType = "Hidden";
   #     Label = "Currency";
   # }
   # IN MIR-PMT-CRCY-CD
   # {
   #     Length = "2";
   #     SType = "Hidden";
   #     Label = "Currency";
   # }     
# Q94501 - Changes Ends
# M319A2 CHANGES ENDS HERE
#UYS057 CHANGES STARTS HERE
    IN MIR-DV-LOAN-INT-UNEARN-AMT
    {
        DisplayOnly;
        Signed;        
        Length = "15";
        SType  = "Currency";
        CurrencyCode = "MIR-POL-CRCY-CD";
        Label = "Loan interest unearned";
    } 
#UYS057 CHANGES ENDS HERE    
}

