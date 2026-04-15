
#*******************************************************************************
#*  Component:   BF9G72-P.p                                                    *
#*  Description: Annuity Payout Quotation                                      *
#*                                                                             *
#*******************************************************************************
#*  Chg#    Release  Description                                               *
#*  UY3047  29JAN24  INITIAL VERSION                                           *
#*  UY3149           CHANGES MADE AS PART OF VIRTUAL QUOTE SCREEN              *
#*  UY3049           ANNUITY WEBSERVICES                                       *
#*******************************************************************************

P-STEP BF9G72-P
{
    ATTRIBUTES
    {
        BusinessFunctionId = "9G72";
        BusinessFunctionName = "Annuity Payout Transfer Quote Screen ";
        BusinessFunctionType = "Retrieve";
        MirName = "CCWM9G72";
    }

    OUT LSIR-RETURN-CD;

    OUT MIR-RETRN-CD;

    INOUT MIR-POL-ID-BASE
    {
        DisplayOnly;
        Length = "9";
        DBTableName = "TPOL";
        DefaultSession = "MIR-POL-ID-BASE";
        SType = "Text";
        Label = "Policy ID";
    }

    INOUT MIR-POL-ID-SFX
    {
        Length = "1";
        DisplayOnly;
        DBTableName = "TPOL";
        DefaultSession = "MIR-POL-ID-SFX";
        SType = "Text";
        Label = "Suffix";
    }    

    INOUT MIR-CALC-DT
    {
        DisplayOnly;
        Length = "10";
        DefaultSession = "LSIR-PRCES-DT";
        SType = "Date";
        Label = "Calculation Base Date";
    }
    
    INOUT MIR-JRNL-DT
    {
        DisplayOnly;
        Length = "10";
        DefaultSession = "LSIR-PRCES-DT";
        SType = "Date";
        Label = "Journal Date";
    }
    
    OUT MIR-PLAN-ID
    {
        DisplayOnly;
        Length = "6";
        CodeSource = "EDIT";
        CodeType = "PLAN";
        DBTableName = "TCVG";
        SType = "Selection";
        Label = "Plan Name";
    } 
    
    OUT MIR-POL-ISS-EFF-DT
    {
        DisplayOnly;
        Length = "10";
        DBTableName = "TPOL";
        SType = "Date";
        Label = "Policy Issue Date";
    }
    
    OUT MIR-POL-CSTAT-CD
    {
        DisplayOnly;
        Length = "4";
        CodeSource = "DataModel";
        CodeType = "POL-CSTAT-CD";
        DBTableName = "TPOL";
        SType = "Text";
        Label = "Policy Status";
    }
    
    OUT MIR-POL-ANTY-STAT-CD
    {
        DisplayOnly;
        Length = "1";
        CodeSource = "DataModel";
        CodeType = "POL-ANTY-STAT-CD";
        DBTableName = "TPOL";
        SType = "Text";
        Label = "Annuity Status";
    }   
    
    OUT MIR-OWN-CLI-NM 
    {
        DisplayOnly;
        Length = "51";
        DBTableName = "Derived"; 
        SType = "Text";
        Label = "Policyholder Name";
    }
    
    OUT MIR-OWN-SEX-CD
    {
        Length = "1";
        DisplayOnly;
        CodeSource = "DataModel";
        CodeType = "CVG-SEX-CD";
        DBTableName = "TCVG";
        SType = "Text";       
        Label = "Policyholder Gender";  
    }
    
    OUT MIR-OWN-REL-INSR-CD
    {
        DisplayOnly;
        Length = "1";
        CodeSource = "DataModel";
        CodeType = "OWNR-REL-INSR-CD";
        DBTableName = "TCLIU";
        SType = "Text";
        Label = "Relationship of Insured to Policy Owner";        
    }
    
    OUT MIR-INSRD-NM   
    {
        DisplayOnly;
        Length = "51";
        SType = "Text";
        Label = "Insured Name";
    }
    
    OUT MIR-INSRD-SEX-CD 
    {
        Length = "1";
        DisplayOnly;
        CodeSource = "DataModel";
        CodeType = "CVG-SEX-CD";
        DBTableName = "TCVG";
        SType = "Text";
        Label = "Insured Gender";
    }
    
    OUT MIR-INSRD-AGE
    {
        DisplayOnly;
        Length = "3";
        SType = "Number";
        Label = "Insured age";
    }
    
    INOUT MIR-ANTY-TYP-CD
    {
        DisplayOnly;
        Length = "2";
        CodeSource = "DataModel";
        CodeType = "CVG-ANTY-TYP-CD";
        SType = "Selection";
        Label = "Annuity Type";
    } 
    
    INOUT MIR-ANTY-STYLE-CD
    {
        DisplayOnly;
        Length = "2";
        CodeSource = "DataModel";
        CodeType = "CVG-ANTY-STL";
        SType = "Selection";
        Label = "Annuity Style";
    }     
    
    INOUT MIR-GUAR-PERI-CD
    {
        DisplayOnly;
        Length = "2";
        CodeSource = "EDIT";
        CodeType = "STB4";
        DBTableName = "TCVG";
        SType = "Selection";
        Label = "Guarantee Period";
    }
      
    INOUT MIR-ANTY-PMT-DUR
    {
        DisplayOnly;
        Length = "3";
        CodeSource = "DataModel";
        CodeType = "ANTY-PMT-TRM";
        SType = "Selection";
        Label = "Annuity Payment Term";
    }    
      
    INOUT MIR-ANTY-PAYO-FREQ
    {
        DisplayOnly;
        Length = "2";
        CodeSource = "DataModel";
        CodeType = "ANTY-FREQ-CRNT-YR";
        SType = "Selection";
        Label = "Payout Frequency";
    }
    
    OUT MIR-ANTY-STRT-DT
    {
        DisplayOnly;
        Length = "10";
        SType = "Date";
        Label = "Annuity Commencement Date";    
    }
    
    OUT MIR-CLI-ID
    {
        DisplayOnly;
        Length = "10";
        DBTableName = "TCLI";
        DefaultSession = "MIR-CLI-ID";
        SType = "Text";
        Label = "Client ID";
    }
    
    OUT MIR-CLI-SEX-CD
    {
        DisplayOnly;
        Length = "1";
        CodeSource = "DataModel";
        CodeType = "CLI-SEX-CD";
        SType = "Selection";
        Label = "Sex";
    }    
    
    OUT MIR-DV-CLI-BTH-DT
    {
        DisplayOnly;
        Length = "10";
        SType = "Date";
        Label = "Birth Date";
    }
    
    OUT MIR-ANTY-AGE
    {
        DisplayOnly;
        Length = "3";
        SType = "Number";
        Label = "Annuitant Age";
    }
    
    OUT MIR-ANUTNT-NAME
    {
        DisplayOnly;
        Length = "51";
        DBTableName = "Derived";
        SType = "Text";
        Label = "Annuitant Name";
    }
    
    OUT MIR-DV-TOT-ANTY-AMT
    {
        DisplayOnly;
        Signed;
        Length = "15";   
        Decimals = "2";       
        SType = "Currency";      
        Label = "Total Annuity Amount";
    }
    
    OUT MIR-DV-ANTY-CAP-AMT
    {
        DisplayOnly;
        Signed;
        Length = "15";   
        Decimals = "2";       
        SType = "Currency";      
        Label = "Annuity Capital";
    }
	
    OUT MIR-DV-ANTY-FND-AMT
    {
        DisplayOnly;
        Signed;
        Length = "15";   
        Decimals = "2";       
        SType = "Currency";      
        Label = "Annuity Fund";
    }
	
    OUT MIR-DV-CRNT-ANTY-AMT
    {
        DisplayOnly;
        Signed;
        Length = "15";   
        Decimals = "2";       
        SType = "Currency";      
        Label = "Current Annuity Amount";
    }
    
    OUT MIR-DV-APL-BAL-AMT
    {
        DisplayOnly;
        Signed;
        Length = "15";  
        Decimals = "2";
        DBTableName = "Derived";
        SType = "Currency";
        Label = "APL Balance";
    }
    
    OUT MIR-DV-APL-INT-AMT
    { 
        DisplayOnly;
        Signed;
        Length = "15";  
        Decimals = "2";
        DBTableName = "Derived";
        SType = "Currency";
        Label = "APL Interest";
    } 
    
    OUT MIR-DV-LOAN-BAL-AMT
    {
        DisplayOnly;
        Signed;
        Length = "15";  
        Decimals = "2";
        DBTableName = "Derived";
        SType = "Currency";    
        Label = "Balance of Policy Loans";        
    }
    
    OUT MIR-DV-LOAN-INT-AMT
    { 
        DisplayOnly;
        Signed;
        Length = "15";  
        Decimals = "2";
        DBTableName = "Derived";
        SType = "Currency";
        Label = "Interest of Policy Loans";
    }
    
    OUT MIR-DV-LOAN-SHRT-AMT
    {
        DisplayOnly;
        Signed;
        Length = "15";
        Decimals = "2";
        DBTableName = "Derived";
        SType = "Currency";         
        Label = "Shortage of Policy Loan Repayments";
    }    
    
    OUT MIR-DV-PREM-SHRT-AMT
    {
        DisplayOnly;
        Signed;
        Length = "15";
        Decimals = "2";
        DBTableName = "Derived";
        SType = "Currency";
        CurrencyCode = "MIR-DV-PREM-SHRT-AMT";         
        Label = "Shortage Premium";
    }
    
    OUT MIR-DV-UNEARN-PREM-AMT
    {
        DisplayOnly;
        Signed;
        Length = "15";  
        Decimals = "2";
        DBTableName = "Derived";
        SType = "Currency";  
        Label = "Unearned Premium";
    }
    
    OUT MIR-DV-OVR-PD-PREM-AMT
    {
        DisplayOnly;
        Signed;
        Length = "15";  
        Decimals = "2";
        DBTableName = "Derived";
        SType = "Currency";         
        Label = "OverPaid Premiums";        
    } 
        
    OUT MIR-DV-OVR-PD-LOAN-AMT    
    {
        DisplayOnly;
        Signed;
        Length = "15";  
        Decimals = "2";
        DBTableName = "Derived";
        SType = "Currency";       
        Label = "Overpaid Policy Loan Repayments";
    }  
    
    OUT MIR-DV-PD-PREM-AMT
    {
        DisplayOnly;
        Signed;
        Length = "15";  
        Decimals = "2";
        DBTableName = "Derived";
        SType = "Currency";  
        Label = "Paid Premium"; 
    }
    
    OUT MIR-DV-BASIC-ANTY-AMT
    {
        DisplayOnly;
        Signed;
        Length = "15";  
        Decimals = "2";
        DBTableName = "Derived";
        SType = "Currency";  
        Label = "Basic Annuity Amount";
    }
    
    OUT MIR-DV-ADDL-ANTY-AMT
    {
        DisplayOnly;
        Signed;
        Length = "15";  
        Decimals = "2";
        DBTableName = "Derived";
        SType = "Currency";  
        Label = "Additional Annuity Amount";
    }

    OUT MIR-DV-ACCUM-DIV-AMT
    {
        DisplayOnly;
        Signed;
        Length = "15";  
        Decimals = "2";
        DBTableName = "Derived";
        SType = "Currency";         
        Label = "Accumulated Dividend Amount";
    }
    
    
    OUT MIR-DV-TOT-RSRV-QUALF-CVG-AMT
    {
        DisplayOnly;
        Signed;
        Length = "15";  
        Decimals = "2";
        DBTableName = "Derived";
        SType = "Currency";         
        Label = "Total Reserve for Qualified Rider";
    }
    
    OUT MIR-DV-VEST-AMT
    {
        DisplayOnly;
        Signed;
        Length = "15";  
        Decimals = "2";
        DBTableName = "Derived";
        SType = "Currency";         
        Label = "Vesting Amount";
    }
    
    OUT MIR-DV-UNEARN-LOAN-INT-AMT
    {
        DisplayOnly;
        Signed;
        Length = "15";  
        Decimals = "2";
        DBTableName = "Derived";
        SType = "Currency";
        Label = "Unearned Policy Loan Interest";
    }
	
    OUT MIR-DV-OTHR-RFND-AMT
    {
        DisplayOnly;
        Signed;
        Length = "15";  
        Decimals = "2";
        DBTableName = "Derived";
        SType = "Currency";         
        Label = "Other Refund";
    } 
    
    OUT MIR-DV-SURVIVE-BNFT-AMT
    {
        DisplayOnly;
        Signed;
        Length = "15";  
        Decimals = "2";
        DBTableName = "Derived";
        SType = "Currency";         
        Label = "Survival Benefit";
    }  
    
    OUT MIR-DV-ADD-ANTY-CAP-AMT
    {
        DisplayOnly;
        Signed;
        Length = "15";  
        Decimals = "2";
        DBTableName = "Derived";
        SType = "Currency";         
        Label = "Additional Annuity Capital Amount";
    }
    
    OUT MIR-DV-TOT-EST-ANTY-PAYMT-AMT
    {
        DisplayOnly;
        Signed;
        Length = "15";  
        Decimals = "2";
        DBTableName = "Derived";
        SType = "Currency";         
        Label = "Total Estimated Annuity Payment Amount";
    }
    
    OUT MIR-DV-XPNS-RATIO-AMT
    {
        DisplayOnly;
        Signed;
        Length = "15";  
        Decimals = "2";
        DBTableName = "Derived";
        SType = "Currency";         
        Label = "Necessary Expense Ratio";
    }
    
    OUT MIR-DV-MISC-INC-AMT
    {
        DisplayOnly;
        Signed;
        Length = "15";  
        Decimals = "2";
        DBTableName = "Derived";
        SType = "Currency";         
        Label = "Miscellaneous (sundry) Income";
    }    
    
    OUT MIR-DV-WITHHOLD-TAX-AMT
    {
        DisplayOnly;
        Signed;
        Length = "15";  
        Decimals = "2";
        DBTableName = "Derived";
        SType = "Currency";         
        Label = "Withholding Tax";
    }
	
    OUT MIR-DV-PAYBL-ANTY-AMT
    {
        DisplayOnly;
        Signed;
        Length = "15";  
        Decimals = "2";
        DBTableName = "Derived";
        SType = "Currency";         
        Label = "Payable Annuity Amount";
    }
    
    OUT MIR-DV-INSTL-1-ANTY-AMT
    {
        DisplayOnly;
        Signed;
        Length = "15";  
        Decimals = "2";
        DBTableName = "Derived";
        SType = "Currency";         
        Label = "INSTLlment 1 Annuity Amount";
    }  
    
    OUT MIR-DV-INSTL-2-ANTY-AMT
    {
        DisplayOnly;
        Signed;
        Length = "15";  
        Decimals = "2";
        DBTableName = "Derived";
        SType = "Currency";         
        Label = "INSTLlment 2 Annuity Amount";
    }

    OUT MIR-DV-INSTL-3-ANTY-AMT
    {
        DisplayOnly;
        Signed;
        Length = "15";  
        Decimals = "2";
        DBTableName = "Derived";
        SType = "Currency";         
        Label = "INSTLlment 3 Annuity Amount";
    }
    
    OUT MIR-DV-INSTL-4-ANTY-AMT
    {
        DisplayOnly;
        Signed;
        Length = "15";  
        Decimals = "2";
        DBTableName = "Derived";
        SType = "Currency";         
        Label = "INSTLlment 4 Annuity Amount";
    }
    
    IN MIR-DV-PRCES-STATE-CD
    {
        Length = "1";
        DBTableName = "Derived";
        SType = "Hidden";
        Label = "process code";
    }
    
#UY3149 CHANGES START HERE
    INOUT MIR-VIR-SCREEN-IND
    {
        Length = "1";
        SType = "Indicator";
        Label = "Please check in case of virtual quote implementation";
    }    
	  
    OUT MIR-VIR-LOAN-CAP-AMT
    {
        DisplayOnly;
        Signed;
        Length = "15";  
        DBTableName = "Derived";
        SType = "Currency";         
        Label = "Loan Capital Amount";
    }  

    OUT MIR-VIR-APL-CAP-AMT
    {
        DisplayOnly;
        Signed;
        Length = "15";  
        DBTableName = "Derived";
        SType = "Currency";         
        Label = "APL Capital Amount";
     }  

    INOUT MIR-VIRT-LN-REPAY-AMT
     {
        Length = "15";
        SType = "Currency";         
        Label = "Loan Repayment Amount";
     }  

     INOUT MIR-VIRT-APL-REPAY-AMT
     {
        Length = "15";
        SType = "Currency";
        Label = "APL Repayment Amount";
     }   
#UY3149 CHANGES ENDS HERE
#UY3049 CHANGES START HERE
    INOUT MIR-PNSN-KND
    {
        Length ="3";
        SType = "Text";
        Label = "Pension Kind";
    }
    INOUT MIR-LRG-PROD-CD
    {
        Length ="3";
        SType = "Text";
        Label = "Large Product Code";
    }
    IN MIR-CHILD-NUM
    {
        Length ="1";
        SType = "Number";
        Label = "Child Number";
    }
    IN MIR-PNSN-PMT-FREQ
    {
        Length ="2";
        SType = "Number";
        Label = "Pension Payment Frequency";
    }
    IN MIR-DIVSN-PMT-FREQ
    {
        Length ="2";
        SType = "Number";
        Label = "Division Payment Frequency";
    }
    IN MIR-DT-OF-RECK
    {
        Length ="8";
        SType = "Date";
        Label = "Date of Reckoning";
    }
    IN MIR-BNK-CD
    {
        Length ="4";
        SType = "Text";
        Label = "Bank Code";
    }
    IN MIR-BR-CD
    {
        Length ="3";
        SType = "Text";
        Label = "Branch Code";
    }
    IN MIR-ACCT-TYP 
    {
        Length ="3";
        SType = "Text";
        Label = "Account Type";
    }
    IN MIR-BNK-ACCT-NUM
    {
        Length ="9";
        SType = "Text";
        Label = "Bank Account Number";
    }
    IN MIR-ACCT-HLDR-NM
    {
        Length ="32";
        SType = "Text";
        Label = "Account Holder Name";
    }
    IN MIR-DIF-HLDR-FLG
    {
        Length ="1";
        SType = "Text";
        Label = "Different Holder Flag";
    }
    IN MIR-AGNCY-CHEG-FLG
    {
        Length ="1";
        SType = "Text";
        Label = "Agency Charged Flag";
    }
    OUT MIR-USER-ID
    {
        Length = "8";
        SType = "Text";
        Label = "User ID";
    }
    OUT MIR-SEVRTY-CD
    {
        Length = "1";
        SType = "Text";
        Label = "Severity";
    }
    OUT MIR-ERROR-MSG
    {
        Length = "100";
        SType = "Text";
        Label = "Content";
    }
    INOUT MIR-WEB-SERV-CALL-IND
    {
        Length = "1";
        SType = "Indicator";
        Label = "Web Service Indicator";
    }
    INOUT MIR-WEB-POST-ACD-IND
    {
        Length = "1";
        SType = "Indicator";
        Label = "Post ACD Indicator";
    }
#UY3049 CHANGES START HERE
}   