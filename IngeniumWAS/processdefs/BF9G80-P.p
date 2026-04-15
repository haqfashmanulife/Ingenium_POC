
#*******************************************************************************
#*  Component:   BF9G80-P.p                                                    *
#*  Description: CREATED FOR Annuity Payout Transfer Quote Screen              *
#*                                                                             *
#*******************************************************************************
#*  Chg#    Release  Description                                               *
#*                                                                             *
#*  TDM22A  02MAR20  INITIAL VERSION                                           *
#*                                                                             *
#*******************************************************************************

P-STEP BF9G80-P
{
    ATTRIBUTES
    {
        BusinessFunctionId = "9G80";
        BusinessFunctionName = "Annuity Payout Transfer Quote Screen ";
        BusinessFunctionType = "Retrieve";
        MirName = "CCWM9G80";
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
        Label = "Policy ID";
    }

    INOUT MIR-ANTY-STRT-DT
    {
        Mandatory;        
        Length = "10";
        SType = "Date";
        Label = "Annuity Commencement Date";    
    }
    
    INOUT MIR-PRCES-DT
    {
        Length = "10";
        SType = "Date";
        Label = "Process Date";
    }

    INOUT MIR-ANTY-PAYO-PERI-CD
    {
        Mandatory;     
        Length = "2";
        CodeSource = "DataModel";
        CodeType = "ANTY-PAYO-PERI-CD";
        SType = "Selection";
        Label = "Annuity Payout Period";
    }
    
    
    INOUT MIR-ANUTNT-TYP-CD
    {
        Mandatory;     
        SType = "Selection";
	Length = "2";
        CodeSource = "DataModel";
        CodeType = "ANUTNT-TYP-CD";
        Label = "Annuitant Type";
    }    
    
    INOUT MIR-FINAL-DPOS-DED-CD
    {
        Mandatory;     
        Length = "2";
        CodeSource = "DataModel";
        CodeType = "FINAL-DPOS-DED-CD";
        SType = "Selection";
        Label = "Final deposit deduction Ind";
    }    
    
    OUT MIR-PLAN-ID
    {
        Length = "6";
        CodeSource = "EDIT";
        CodeType = "PLAN";
        DBTableName = "TCVG";
        SType = "Selection";
        Label = "Plan Name";
    }    
    
    OUT MIR-POL-ISS-EFF-DT
    {
        Length = "10";
        DBTableName = "TPOL";
        SType = "Date";
        Label = "Policy Issue Date";
    }

    OUT MIR-PREM-PMT-PERI-CD
    {
        Length = "5";
        CodeSource = "CSOM9789";        
	FilterFields = "2";
        FilterField1 = "MIR-PLAN-ID";       
        DBTableName = "TCVG";
        SType = "Selection";
        Label = "Premium Payment Period";
    }
    
    OUT MIR-POL-CSTAT-CD
    {
        Length = "4";
        CodeSource = "DataModel";
        CodeType = "POL-CSTAT-CD";
        DBTableName = "TPOL";
        SType = "Text";
        Label = "Policy Status";
    }     
        
    OUT MIR-PREM-XPRY-DT
    {
        DisplayOnly;
        SType = "Date";
   	Length = "10";                   
   	Label = "Premium Expiry Date";        
    }  
   
    OUT MIR-FACE-AMT
    {
        DisplayOnly;
   	Signed;
   	Length = "15";
   	Decimals = "2";
        SType = "Currency";
        Label = "Face Amount";
    }  
    
    OUT MIR-SSTD-PREM-PERI-CD 
    {
        DisplayOnly;
        Length = "1";
        DBTableName = "Derived";
        CodeSource = "DataModel";
        CodeType = "SSTD-PREM-PERI-CD";
        SType = "Text";    
   	Label = "Substandard premium period";         
    } 
    
    OUT MIR-OWN-CLI-NM 
    {
        DisplayOnly;
        Length = "51";
        DBTableName = "Derived"; 
        SType = "Text";
        Label = "Policyholder Name";
    }
    
    OUT MIR-POL-HLDR-SEX-CD
    {
        Length = "1";
        DisplayOnly;
        CodeSource = "DataModel";
        CodeType = "CVG-SEX-CD";
        DBTableName = "TCVG";
        SType = "Text";       
   	Label = "Policyholder Gender";  
   } 
    OUT MIR-OWNR-REL-INSR-CD
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
        Length = "3";
        SType = "Number";
        Label = "Insured age";
    }
   
    OUT MIR-ANUTNT-NAME
    {
        Length = "51";
        DBTableName = "Derived";
        SType = "Text";
        Label = "Annuitant Name";
    }      
   
    OUT MIR-ANTY-TERM-TXT
    {
        DisplayOnly;
   	Length = "2";  
        CodeSource = "DataModel";
        CodeType = "ANTY-TERM-TXT";   	
        SType = "Text";
   	Label = "Term of annuity";        
    }  
   
    OUT MIR-ANTY-PAYO-TYP-TXT
    {
        DisplayOnly;        
   	Length = "2";  
        CodeSource = "DataModel";
        CodeType = "ANTY-PAYO-TYP-TXT";         
        SType = "Text";   
   	Label = "Annuity type";        
    }  
    
    OUT MIR-ANTY-PAYO-TIME-TXT
    {
        DisplayOnly;
   	Length = "2";
        CodeSource = "DataModel";
        CodeType = "ANTY-PAYO-TIME-TXT";              
        SType = "Text";
   	Label = "Payout times";        
    }  
    
    OUT MIR-ANTY-AMT
    {
        DisplayOnly;
   	Signed;
   	Length = "15";   
   	Decimals = "2";       
   	SType = "Currency";      
   	Label = "Annuity Amount";        
    }  
    
    OUT MIR-ANTY-RESRC-AMT
    {
        DisplayOnly;
   	Signed;
   	Length = "15";   
   	Decimals = "2";       
   	SType = "Currency";     
   	Label = "Annuity Resource";        
    }  
    
    OUT MIR-ANTY-LIAB-RSRV-AMT
    {
        DisplayOnly;
   	Signed;
   	Length = "15";   
   	Decimals = "2";       
   	SType = "Currency";       
   	Label = "Liability reserve";        
    }  
    
    OUT MIR-APL-BAL-AMT
    {
        DisplayOnly;
   	Signed;
   	Length = "15";  
   	Decimals = "2";
        DBTableName = "Derived";
        SType = "Currency";
        Label = "APL Balance";
    }  
    
    OUT MIR-APL-INT-AMT
    { 
        DisplayOnly;
   	Signed;
   	Length = "15";  
   	Decimals = "2";
        DBTableName = "Derived";
        SType = "Currency";
        Label = "APL Interest";
    }    
    
    OUT MIR-LOAN-BAL-AMT
    {
        DisplayOnly;
   	Signed;
   	Length = "15";  
   	Decimals = "2";
        DBTableName = "Derived";
        SType = "Currency";    
   	Label = "Balance of policy loans";        
    }  
    
    OUT MIR-LOAN-INT-AMT
    { 
        DisplayOnly;
   	Signed;
   	Length = "15";  
   	Decimals = "2";
        DBTableName = "Derived";
        SType = "Currency";
        Label = "Interest of policy loans";
    }    

    OUT MIR-SHRT-LOAN-AMT
    {
        DisplayOnly;
   	Signed;
   	Length = "15";  
   	Decimals = "2";
        DBTableName = "Derived";
        SType = "Currency";                  
   	Label = "Shortage of Policy Loan Repayments";        
    }   
    
    OUT MIR-SHRT-PREM-AMT
    {
        DisplayOnly;
   	Signed;
   	Length = "15";
   	Decimals = "2";
        DBTableName = "Derived";
        SType = "Currency";
        CurrencyCode = "MIR-SHRT-PREM-AMT";         
        Label = "Shortage Premium";
    }
         
      
    OUT MIR-OS-PREM-AMT
    {
        DisplayOnly;
   	Signed;
   	Length = "15";  
   	Decimals = "2";
        DBTableName = "Derived";
        SType = "Currency";  
        Label = "Outstanding Premium";
    } 
    
    OUT MIR-UNEARN-PREM-AMT
    {
        DisplayOnly;
   	Signed;
   	Length = "15";  
   	Decimals = "2";
        DBTableName = "Derived";
        SType = "Currency";  
        Label = "Unearned Premium";
    }   
    
    OUT MIR-OVR-PD-PREM-AMT
    {
        DisplayOnly;
   	Signed;
   	Length = "15";  
   	Decimals = "2";
        DBTableName = "Derived";
        SType = "Currency";         
   	Label = "Overpaid premiums";        
    } 
        
    OUT MIR-OVR-PD-LOAN-AMT    
    {
        DisplayOnly;
   	Signed;
   	Length = "15";  
   	Decimals = "2";
        DBTableName = "Derived";
        SType = "Currency";       
   	Label = "Overpaid policy loan repayments";        
    }  
    
    OUT MIR-PD-PREM-AMT
    {
        DisplayOnly;
   	Signed;
   	Length = "15";  
   	Decimals = "2";
        DBTableName = "Derived";
        SType = "Currency";  
        Label = "Paid premium"; 
    }              	   

    OUT MIR-SUBMSN-LAST-DT               
    {
        DisplayOnly;
        Length = "10";               
        SType = "Date";        	   
   	Label = "Submission Deadline";  	
   
    }  
        
    IN MIR-DV-PRCES-STATE-CD
    {
        Length = "1";
        DBTableName = "Derived";
        SType = "Hidden";
        Label = "process code";
    }
}