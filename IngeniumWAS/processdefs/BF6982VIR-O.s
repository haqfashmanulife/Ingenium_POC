#*******************************************************************************
#*  Component:   BF6982VIR-O.s                                                 *
#*  Description:                                                               *
#*                                                                             *
#*******************************************************************************
#*  Chg#    Release  Description                                               *
#*                                                                             *
#*  UYS043  CTS      NEW VIRTUAL QUOTE SCREEN                                  *
#*******************************************************************************

S-STEP BF6982VIR-O
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

    IN MIR-APPL-CTL-PRCES-DT
    {
        Key;
        DisplayOnly;
        Length = "10";
        SType = "Date";

        Label = "Effective Date";
    }

    IN MIR-POL-ID-BASE
    {
        Key;
        DisplayOnly;
        Length = "9";
        SType = "Text";
        Label = "Policy Id";
    }

    IN MIR-POL-ID-SFX
    {
        Key;
        DisplayOnly;
        Length = "1";
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
	CurrencyCode = "MIR-POL-CRCY-CD";       
        Label = "Loan Repayment Amount";
    }

    IN MIR-DV-MAX-LOAN-AMT
    {
        DisplayOnly;
        Signed;
        Length = "17";
        SType = "Currency";
	CurrencyCode = "MIR-POL-CRCY-CD";
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
	CurrencyCode = "MIR-POL-CRCY-CD";
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
    
    IN MIR-LOAN-TYP-CD
    {
        DisplayOnly;
        Length = "40";
        CodeSource = "DataModel";
        CodeType = "LOAN-TYP-CD";
        SType = "Text";
        Label = "Type of Loan:";
    }    

    IN MIR-SBSDRY-CO-ID
    {
        DisplayOnly;
        Length = "40";
        CodeSource = "EDIT";
        CodeType = "SUBCO";
        SType = "Text";
        Label = "Sub Company";
    }
    IN MIR-LOAN-AMT
    {
        DisplayOnly;
        Signed;
        Length = "15";
        SType = "Currency";
        CurrencyCode="MIR-POL-CRCY-CD";
        Label = "Loan Amount Requested";
    }
    IN MIR-APL-LOAN-AMT
    {
        DisplayOnly;
        Signed;
        Length = "15";
        SType = "Currency";
	CurrencyCode = "MIR-POL-CRCY-CD";

        Label = "Automatic Premium Loan";
    }
    IN MIR-DV-APL-LOAN-INT-AMT
    {
        DisplayOnly;
        Signed;
        Length = "15";
        SType = "Currency";
	CurrencyCode = "MIR-POL-CRCY-CD";

        Label = "Interest for Automatic Premium Loan";
    }
    IN MIR-DV-LOAN-INT-AMT
    {
        DisplayOnly;
        Signed;
        Length = "15";
        SType = "Currency";
	CurrencyCode = "MIR-POL-CRCY-CD";
        Label = "Loan Interest";
    }
    
    IN MIR-XCES-INT-AMT
    {
        DisplayOnly;
        Length = "13";
        SType = "Currency";

	CurrencyCode = "MIR-POL-CRCY-CD";

        Label = "Excess Interest";
    }
    
    IN MIR-SHRT-INT-AMT
    {
        DisplayOnly;
        Length = "13";
        SType = "Currency";
	CurrencyCode = "MIR-POL-CRCY-CD";

        Label = "Short Interest";
    }
    IN MIR-DV-REMIT-AMT
    {
        DisplayOnly;
        Signed;
        Length = "15";
        SType = "Currency";
	CurrencyCode = "MIR-POL-CRCY-CD";

        Label = "Remmitance Amount Available";
    }

    IN MIR-DV-POL-APL-CV-AMT
    {
        DisplayOnly;
        Signed;
        Length = "15";
        SType = "Currency";

	CurrencyCode = "MIR-POL-CRCY-CD";
      
        Label = "Assumed APL Cash Value";
     }
    IN MIR-APL-LOAN-BAL-AMT
    {
        DisplayOnly;
        Signed;
        Length = "15";
        SType = "Currency";
	CurrencyCode = "MIR-POL-CRCY-CD";
        Label = "Balance of APL";
     }
    IN MIR-APL-LOAN-INT-AMT
    {
        DisplayOnly;
        Signed;
        Length = "15";
        SType = "Currency";
	CurrencyCode = "MIR-POL-CRCY-CD";
        Label = "Loan amount of this time and interest for APL Balance";
     }
    IN MIR-LOAN-BAL-AMT
    {
        DisplayOnly;
        Signed;
        Length = "15";
        SType = "Currency";
	CurrencyCode = "MIR-POL-CRCY-CD";
        Label = "Balance of Policy Loan";
     }
    IN MIR-UNEARN-LOAN-INT-AMT	
    {
         DisplayOnly;
         Signed;
         Length = "15";
         SType = "Currency";
         CurrencyCode = "MIR-POL-CRCY-CD";
         Label = "Unearned Interest";
     }
    IN MIR-LOAN-INT-AMT
    {
        DisplayOnly;
        Signed;
        Length = "15";
        SType = "Currency";
	CurrencyCode = "MIR-POL-CRCY-CD";

        Label = "Interest for Policy Loan Balance";
     }
    IN MIR-PREM-SHRT-AMT
    {
        DisplayOnly;
        Signed;
        Length = "15";
        SType = "Currency";

	CurrencyCode = "MIR-POL-CRCY-CD";

        Label = "Premium Shortage Amount";
     }
    IN MIR-APL-APPLY-AMT
    {
        DisplayOnly;
        Signed;
        Length = "15";
        SType = "Currency";

	CurrencyCode = "MIR-POL-CRCY-CD";

        Label = "APL Amount to be applied this time";
     }

    IN MIR-DV-POL-ACUM-CV-AMT
    {
        DisplayOnly;
        Signed;
        Length = "15";
        SType = "Currency";

	CurrencyCode = "MIR-POL-CRCY-CD";

        Label = "Market Value";
     }
    IN MIR-DV-APS-DTRMN-AMT
    {
        DisplayOnly;
        Signed;
        Length = "15";
        SType = "Currency";

	CurrencyCode = "MIR-POL-CRCY-CD";

        Label = "TRAD Modal Premium * 6";
     }

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
    IN MIR-DV-LOAN-INT-UNEARN-AMT
    {
        DisplayOnly;
        Signed;        
        Length = "15";
        SType  = "Currency";
        CurrencyCode = "MIR-POL-CRCY-CD";
        Label = "Loan interest unearned";
    } 

    IN MIR-VIR-TRAD-PD-TO-MO-NUM
    {
    
        Label = "Next Payment Date:";
        DisplayOnly;
        Length = "07";
        SType = "text";
    }  
    
    IN MIR-VIR-CI-FRST-ELAPS-YRS-DUR
    {
 
        Label = "Elapsed years:";
        DisplayOnly;
        Length = "07";
        SType = "text";
    } 
    
    IN MIR-VIR-ACTV-IND
    {
        DisplayOnly;
        Length = "1";
        SType = "Indicator";
        Label = "Active";
    }
    
    
    IN MIR-VIR-LOAN-AMT
    {   
        DisplayOnly;    
        Signed;
        CurrencyCode = "MIR-POL-CRCY-CD";
        Length = "13";
        SType = "Currency";
        Label = "Policy loan balance:";
    }  
    
    IN MIR-VIR-INT-STR-DT
    {
        DisplayOnly;
        Length = "10";
        SType = "Date";
        Label = "Interest start date";
    }  
    
    IN MIR-VIR-APL-LOAN-AMT
    {   
        DisplayOnly;
        Signed;
        CurrencyCode = "MIR-POL-CRCY-CD";
        Length = "13";
        SType = "Currency";
        Label = "APL balance:";
    }     
    
    IN MIR-VIR-POL-LOAN-EFF-DT
    {
        DisplayOnly;
        Length = "10";
        SType = "Date";
        Label = "APL date";
    }    
    
    IN MIR-VIR-PREPAY-MNG-IND
    {
        DisplayOnly;    
        Length = "1";
        SType = "Indicator";
        Label = "Prepayment management";
    }
    
    IN MIR-VIR-SEI-ASS-IND
    {
        Length = "1";
        SType = "Indicator";
        Label = "Seizure assignment";
    } 
}

