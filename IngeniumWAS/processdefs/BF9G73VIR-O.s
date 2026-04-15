
#*******************************************************************************
#*  Component:   BF9G73VIR-O.s                                                 *
#*  Description: ANNUITY PAYOUT VIRTUAL QUOTATION - RESULT                     *
#*                                                                             *
#*******************************************************************************
#*  Chg#    Release  Description                                               *
#*  UY3149  20JUN24   INITIAL VERSION                                          *  
#*******************************************************************************

S-STEP BF9G73VIR-O
{
    ATTRIBUTES
    {
        BusinessFunctionType = "Retrieve";
        Type = "Output";
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
        DefaultSession = "MIR-POL-ID-BASE";
        SType = "Text";
        Label = "Policy ID";
    }

    IN MIR-POL-ID-SFX
    {
        Length = "1";
        DisplayOnly;
        DBTableName = "TPOL";
        DefaultSession = "MIR-POL-ID-SFX";
        SType = "Text";
        Label = "Suffix";
    }    

    IN MIR-CALC-DT
    {
        DisplayOnly;
        Length = "10";
        DefaultSession = "LSIR-PRCES-DT";
        SType = "Date";
        Label = "Calculation Base Date";
    }
    
    IN MIR-JRNL-DT
    {
        DisplayOnly;
        Length = "10";
        DefaultSession = "LSIR-PRCES-DT";
        SType = "Date";
        Label = "Journal Date";
    }
    
    IN MIR-PLAN-ID
    {
        Key;
        DisplayOnly;
        Length = "6";
        CodeSource = "EDIT";
        CodeType = "PLAN";
        SType = "Selection";
        Label = "Plan Name";
    } 
    
    IN MIR-POL-ISS-EFF-DT
    {
        DisplayOnly;
        Length = "10";
        DBTableName = "TPOL";
        SType = "Date";
        Label = "Policy Issue Date";
    }
    
    IN MIR-POL-CSTAT-CD
    {
        DisplayOnly;
        Length = "4";
        CodeSource = "DataModel";
        CodeType = "POL-CSTAT-CD";
        DBTableName = "TPOL";
        SType = "Text";
        Label = "Policy Status";
    }
    
    IN MIR-POL-ANTY-STAT-CD
    {
        DisplayOnly;
        Length = "51";
        DBTableName = "Derived";
        SType = "Text";
        Label = "Annuity Status";
    }   
    
    IN MIR-OWN-CLI-NM 
    {
        DisplayOnly;
        Length = "51";
        DBTableName = "Derived"; 
        SType = "Text";
        Label = "Policyholder Name";
    }
    
    IN MIR-OWN-SEX-CD
    {
        Length = "1";
        DisplayOnly;
        CodeSource = "DataModel";
        CodeType = "CVG-SEX-CD";
        DBTableName = "TCVG";
        SType = "Text";       
        Label = "Policyholder Gender";  
    }
    
    IN MIR-OWN-REL-INSR-CD
    {
        DisplayOnly;
        Length = "1";
        CodeSource = "DataModel";
        CodeType = "OWNR-REL-INSR-CD";
        DBTableName = "TCLIU";
        SType = "Text";
        Label = "Relationship of Insured to Policy Owner";        
    }
    
    IN MIR-INSRD-NM   
    {
        DisplayOnly;
        Length = "51";
        SType = "Text";
        Label = "Insured Name";
    }
    
    IN MIR-INSRD-SEX-CD 
    {
        Length = "1";
        DisplayOnly;
        CodeSource = "DataModel";
        CodeType = "CVG-SEX-CD";
        DBTableName = "TCVG";
        SType = "Text";
        Label = "Insured Gender";
    }
    
    IN MIR-INSRD-AGE
    {
        DisplayOnly;
        Length = "3";
        SType = "Number";
        Label = "Insured age";
    }
    
    IN MIR-ANTY-TYP-CD
    {
        DisplayOnly;
        Length = "2";
        CodeSource = "DataModel";
        CodeType = "CVG-ANTY-TYP-CD";
        SType = "Selection";
        Label = "Annuity Type";
    } 
    
    IN MIR-ANTY-STYLE-CD
    {
        DisplayOnly;
        Length = "2";
        CodeSource = "DataModel";
        CodeType = "CVG-ANTY-STL";
        SType = "Selection";
        Label = "Annuity Style";
    }     
    
    IN MIR-GUAR-PERI-CD
    {
        DisplayOnly;
        Length = "2";
        CodeSource = "EDIT";
        CodeType = "STB4";
        DBTableName = "TCVG";
        SType = "Selection";
        Label = "Guarantee Period";
    }
      
    IN MIR-ANTY-PMT-DUR
    {
        DisplayOnly;
        Length = "3";
        CodeSource = "DataModel";
        CodeType = "ANTY-PMT-TRM";
        SType = "Selection";
        Label = "Annuity Payment Term";
    }    
      
    IN MIR-ANTY-PAYO-FREQ
    {
        DisplayOnly;
        Length = "2";
        CodeSource = "DataModel";
        CodeType = "ANTY-FREQ-CRNT-YR";
        SType = "Selection";
        Label = "Payout Frequency";
    }
    
    IN MIR-ANTY-STRT-DT
    {
        DisplayOnly;
        Length = "10";
        SType = "Date";
        Label = "Annuity Commencement Date";    
    }
    
    IN MIR-CLI-ID
    {
        DisplayOnly;
        Length = "10";
        DBTableName = "TCLI";
        DefaultSession = "MIR-CLI-ID";
        SType = "Text";
        Label = "Client ID";
    }
    
    IN MIR-CLI-SEX-CD
    {
        DisplayOnly;
        Length = "1";
        CodeSource = "DataModel";
        CodeType = "CLI-SEX-CD";
        SType = "Selection";
        Label = "Sex";
    }    
    
    IN MIR-DV-CLI-BTH-DT
    {
        DisplayOnly;
        Length = "10";
        SType = "Date";
        Label = "Birth Date";
    }
    
    IN MIR-ANTY-AGE
    {
        DisplayOnly;
        Length = "3";
        SType = "Number";
        Label = "Annuitant Age";
    }
    
    IN MIR-ANUTNT-NAME
    {
        DisplayOnly;
        Length = "51";
        DBTableName = "Derived";
        SType = "Text";
        Label = "Annuitant Name";
    }
    
    IN MIR-DV-TOT-ANTY-AMT
    {
        DisplayOnly;
        Signed;
        Length = "15";       
        SType = "Currency";      
        Label = "Total Annuity Amount";
    }
    
    IN MIR-DV-ANTY-CAP-AMT
    {
        DisplayOnly;
        Signed;
        Length = "15";         
        SType = "Currency";      
        Label = "Annuity Capital";
    }
	
    IN MIR-DV-ANTY-FND-AMT
    {
        DisplayOnly;
        Signed;
        Length = "15";          
        SType = "Currency";      
        Label = "Annuity Fund";
    }
	
    IN MIR-DV-CRNT-ANTY-AMT
    {
        DisplayOnly;
        Signed;
        Length = "15";          
        SType = "Currency";      
        Label = "Current Annuity Amount";
    }
	
    
    IN MIR-DV-APL-BAL-AMT
    {
        DisplayOnly;
        Signed;
        Length = "15";  
        DBTableName = "Derived";
        SType = "Currency";
        Label = "APL Balance";
    }
    
    IN MIR-DV-APL-INT-AMT
    { 
        DisplayOnly;
        Signed;
        Length = "15";  
        DBTableName = "Derived";
        SType = "Currency";
        Label = "APL Interest";
    } 
    
    IN MIR-DV-LOAN-BAL-AMT
    {
        DisplayOnly;
        Signed;
        Length = "15";  
        DBTableName = "Derived";
        SType = "Currency";    
        Label = "Balance of Policy Loans";        
    }
    
    IN MIR-DV-LOAN-INT-AMT
    { 
        DisplayOnly;
        Signed;
        Length = "15";  
        DBTableName = "Derived";
        SType = "Currency";
        Label = "Interest of Policy Loans";
    }
    
    IN  MIR-DV-LOAN-SHRT-AMT
    {
        DisplayOnly;
        Signed;
        Length = "15";
        DBTableName = "Derived";
        SType = "Currency";         
        Label = "Shortage of Policy Loan Repayments";
    }    
    
    IN MIR-DV-PREM-SHRT-AMT
    {
        DisplayOnly;
        Signed;
        Length = "15";
        DBTableName = "Derived";
        SType = "Currency";         
        Label = "Shortage Premium";
    } 
    
    IN MIR-DV-UNEARN-PREM-AMT
    {
        DisplayOnly;
        Signed;
        Length = "15";  
        DBTableName = "Derived";
        SType = "Currency";  
        Label = "Unearned Premium";
    }
    
    IN MIR-DV-OVR-PD-PREM-AMT
    {
        DisplayOnly;
        Signed;
        Length = "15";  
        DBTableName = "Derived";
        SType = "Currency";         
        Label = "OverPaid Premiums";        
    } 
        
    IN MIR-DV-OVR-PD-LOAN-AMT    
    {
        DisplayOnly;
        Signed;
        Length = "15";  
        DBTableName = "Derived";
        SType = "Currency";       
        Label = "Overpaid Policy Loan Repayments";
    }  
    
    IN MIR-DV-PD-PREM-AMT
    {
        DisplayOnly;
        Signed;
        Length = "15";  
        DBTableName = "Derived";
        SType = "Currency";  
        Label = "Paid Premium"; 
    }
    
    IN MIR-DV-BASIC-ANTY-AMT
    {
        DisplayOnly;
        Signed;
        Length = "15";  
        DBTableName = "Derived";
        SType = "Currency";  
        Label = "Basic Annuity Amount";
    }
    
    IN MIR-DV-ADDL-ANTY-AMT
    {
        DisplayOnly;
        Signed;
        Length = "15";  
        DBTableName = "Derived";
        SType = "Currency";  
        Label = "Additional Annuity Amount";
    }
    
    IN MIR-DV-ACCUM-DIV-AMT
    {
        DisplayOnly;
        Signed;
        Length = "15";  
        DBTableName = "Derived";
        SType = "Currency";         
        Label = "Accumulated Dividend Amount";
    }
    
    IN MIR-DV-TOT-RSRV-QUALF-CVG-AMT
    {
        DisplayOnly;
        Signed;
        Length = "15";  
        DBTableName = "Derived";
        SType = "Currency";         
        Label = "Total Reserve for Qualified Rider";
    }
    
    IN MIR-DV-VEST-AMT
    {
        DisplayOnly;
        Signed;
        Length = "15";  
        DBTableName = "Derived";
        SType = "Currency";         
        Label = "Vesting Amount";
    }
    
    IN MIR-DV-UNEARN-LOAN-INT-AMT
    {
        DisplayOnly;
        Signed;
        Length = "15";  
        DBTableName = "Derived";
        SType = "Currency";
        Label = "Unearned Policy Loan Interest";
    }
    
    IN MIR-DV-OTHR-RFND-AMT
    {
        DisplayOnly;
        Signed;
        Length = "15";  
        DBTableName = "Derived";
        SType = "Currency";         
        Label = "Other Refund";
    } 
    
    IN MIR-DV-SURVIVE-BNFT-AMT
    {
        DisplayOnly;
        Signed;
        Length = "15";  
        DBTableName = "Derived";
        SType = "Currency";         
        Label = "Survival Benefit";
    }  
    
    IN MIR-DV-ADD-ANTY-CAP-AMT
    {
        DisplayOnly;
        Signed;
        Length = "15";  
        DBTableName = "Derived";
        SType = "Currency";         
        Label = "Additional Annuity Capital Amount";
    }
    
    IN MIR-DV-TOT-EST-ANTY-PAYMT-AMT
    {
        DisplayOnly;
        Signed;
        Length = "15";  
        DBTableName = "Derived";
        SType = "Currency";         
        Label = "Total Estimated Annuity Payment Amount";
    }
    
    IN MIR-DV-XPNS-RATIO-AMT
    {
        DisplayOnly;
        Signed;
        Length = "15";  
        DBTableName = "Derived";
        SType = "Currency";         
        Label = "Necessary Expense Ratio";
    }
    
    IN MIR-DV-MISC-INC-AMT
    {
        DisplayOnly;
        Signed;
        Length = "15";  
        DBTableName = "Derived";
        SType = "Currency";         
        Label = "Miscellaneous (sundry) Income";
    }    
    
    IN MIR-DV-WITHHOLD-TAX-AMT
    {
        DisplayOnly;
        Signed;
        Length = "15";  
        DBTableName = "Derived";
        SType = "Currency";         
        Label = "Withholding Tax";
    }
	
    IN MIR-DV-PAYBL-ANTY-AMT
    {
        DisplayOnly;
        Signed;
        Length = "15";  
        DBTableName = "Derived";
        SType = "Currency";         
        Label = "Payable Annuity Amount";
    }
    
    
    IN MIR-DV-INSTL-1-ANTY-AMT
    {
        DisplayOnly;
        Signed;
        Length = "15";  
        DBTableName = "Derived";
        SType = "Currency";         
        Label = "INSTLlment 1 Annuity Amount";
    }  
    
    IN MIR-DV-INSTL-2-ANTY-AMT
    {
        DisplayOnly;
        Signed;
        Length = "15";  
        DBTableName = "Derived";
        SType = "Currency";         
        Label = "INSTLlment 2 Annuity Amount";
    }

    IN MIR-DV-INSTL-3-ANTY-AMT
    {
        DisplayOnly;
        Signed;
        Length = "15";  
        DBTableName = "Derived";
        SType = "Currency";         
        Label = "INSTLlment 3 Annuity Amount";
    }
    
    IN MIR-DV-INSTL-4-ANTY-AMT
    {
        DisplayOnly;
        Signed;
        Length = "15";  
        DBTableName = "Derived";
        SType = "Currency";         
        Label = "INSTLlment 4 Annuity Amount";
    }
    	   
    IN MIR-VIR-LOAN-CAP-AMT
    {
        DisplayOnly;
        Signed;
        Length = "15";     
        SType = "Currency";      
        Label = "Loan Capital Amount";
    }
			
    IN MIR-VIR-APL-CAP-AMT
    {
        DisplayOnly;
        Signed;
        Length = "15";          
        SType = "Currency";      
        Label = "APL Capital Amount";
    }
				
    IN MIR-VIRT-LN-REPAY-AMT
    {
        DisplayOnly;
        Signed;
        Length = "15";      
        SType = "Currency";      
        Label = "Loan Repayment Amount";
    }
					
    IN MIR-VIRT-APL-REPAY-AMT
    {
        DisplayOnly;
        Signed;
        Length = "15";   
        SType = "Currency";      
        Label = "APL Repayment Amount";
    }
}    