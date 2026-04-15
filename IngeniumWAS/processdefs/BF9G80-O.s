
#*******************************************************************************
#*  Component:   BF9G80-O.s                                                    *
#*  Description: ANNUITY PAYOUT TRANSFER QUOTE SCREEN                          *
#*                                                                             *
#*******************************************************************************
#*  Chg#    Release  Description                                               *
#*  TDM22A  02MAR20  INITIAL VERSION                                           *   
#*******************************************************************************

S-STEP BF9G80-O
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
        Key;
        DisplayOnly;
        Length = "9";
        SType = "Text";
        Label = "Policy ID";
    }

    IN MIR-ANTY-STRT-DT
    {
        Length = "10";
        DisplayOnly;
        SType = "Date";
        Label = "Annuity Commencement Date";    
    }
    
    IN MIR-PRCES-DT
    {
	DisplayOnly;
        Label = "Process Date";
	Length = "10";
	SType = "Date";
    }

    IN MIR-ANTY-PAYO-PERI-CD
    {
        Key;
        DisplayOnly;
        Length = "2";
        CodeSource = "DataModel";
        CodeType = "ANTY-PAYO-PERI-CD";
        SType = "Selection";
        Label = "Annuity Payout Period";
    }
    
    
    IN MIR-ANUTNT-TYP-CD
    {
        DisplayOnly;
        SType = "Selection";
	Length = "2";
        CodeSource = "DataModel";
        CodeType = "ANUTNT-TYP-CD";
        Label = "Annuitant Type";
    }    
    
    IN MIR-FINAL-DPOS-DED-CD
    {
        DisplayOnly;
        Length = "2";
        CodeSource = "DataModel";
        CodeType = "FINAL-DPOS-DED-CD";
        SType = "Selection";
        Label = "Final deposit deduction Ind";
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
        SType = "Date";
        Label = "Policy Issue Date";
    }   
    
    IN MIR-PREM-PMT-PERI-CD
     {
        DisplayOnly; 
        Length = "5";
        CodeSource = "CSOM9789";        
	FilterFields = "1";
        FilterField1 = "MIR-PLAN-ID";      
        DBTableName = "TCVG";
        SType = "Selection";
        Label = "Premium Payment Period";
     }   
    IN MIR-POL-CSTAT-CD
    {
        DisplayOnly;
        Length = "4";
        CodeSource = "DataModel";
        CodeType = "POL-CSTAT-CD";
        SType = "Text";
        Label = "Policy Status";
    }
        
    IN MIR-PREM-XPRY-DT           
    {
        DisplayOnly;
   	Length = "10";                
   	SType = "Date";        
   	Label = "Premium Expiry Date";        
    }  
   
    IN MIR-FACE-AMT
    {
        DisplayOnly;
        Signed;
        Length = "15";
        Decimals = "2";
        SType = "Currency";
        Label = "Face Amount";
    }

    IN MIR-SSTD-PREM-PERI-CD
    {
        DisplayOnly;
        Length = "1";
        DBTableName = "Derived";
        CodeSource = "DataModel";
        CodeType = "SSTD-PREM-PERI-CD";
        SType = "Text";    
   	Label = "Substandard premium period";        
    }
    
    IN MIR-OWN-CLI-NM 
    {
        DisplayOnly;
        Length = "51";
        DBTableName = "Derived"; 
        SType = "Text";
        Label = "Policyholder Name";
    }
    
    IN MIR-POL-HLDR-SEX-CD
    {
        DisplayOnly; 
        Length = "1";
        CodeSource = "DataModel";
        CodeType = "CVG-SEX-CD";
        DBTableName = "TCVG";
        SType = "Text";      
   	Label = "Policyholder Gender";        
    }  
    
    IN MIR-OWNR-REL-INSR-CD
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

    IN  MIR-INSRD-AGE
    {
          DisplayOnly;            
          Length = "3";
          SType = "Number";
          Label = "Insured age";
    }
    
    IN MIR-ANUTNT-NAME
    {
        DisplayOnly; 
        Length = "51";
        DBTableName = "Derived";
        SType = "Text";
        Label = "Annuitant Name";
    }  
   
    IN MIR-ANTY-TERM-TXT
    {
        DisplayOnly;
   	Length = "2";  
        CodeSource = "DataModel";
        CodeType = "ANTY-TERM-TXT";   	
        SType = "Text";
   	Label = "Term of annuity";        
    }  
   
    IN MIR-ANTY-PAYO-TYP-TXT
    {
        DisplayOnly;        
   	Length = "2";  
        CodeSource = "DataModel";
        CodeType = "ANTY-PAYO-TYP-TXT";         
        SType = "Text";   
   	Label = "Annuity type";        
    }  
    
    IN MIR-ANTY-PAYO-TIME-TXT
    {
        DisplayOnly;
   	Length = "2";
        CodeSource = "DataModel";
        CodeType = "ANTY-PAYO-TIME-TXT";              
        SType = "Text";
   	Label = "Payout times";        
    }  
    
    IN MIR-ANTY-AMT
    {
        DisplayOnly;
   	Signed;
   	Length = "15";   
   	Decimals = "2";       
   	SType = "Currency";        
   	Label = "Annuity Amount";        
    }  
    
    IN MIR-ANTY-RESRC-AMT
    {
        DisplayOnly;
   	Signed;
   	Length = "15";   
   	Decimals = "2";       
   	SType = "Currency";       
   	Label = "Annuity Resource";        
    }  
    
    IN MIR-ANTY-LIAB-RSRV-AMT
    {
        DisplayOnly;
   	Signed;
   	Length = "15";   
   	Decimals = "2";       
   	SType = "Currency";          
   	Label = "Liability reserve";        
    }  
    
    IN MIR-APL-BAL-AMT
    {
        DisplayOnly;
   	Signed;
   	Length = "15";  
   	Decimals = "2";
        DBTableName = "Derived";
        SType = "Currency";
        Label = "APL Balance";
    }  
    
    IN MIR-APL-INT-AMT
    { 
        DisplayOnly;
   	Signed;
   	Length = "15";  
   	Decimals = "2";
        DBTableName = "Derived";
        SType = "Currency";
        Label = "APL Interest";
    }    
    
    IN MIR-LOAN-BAL-AMT
    {
        DisplayOnly;
   	Signed;
   	Length = "15";  
   	Decimals = "2";
        DBTableName = "Derived";
        SType = "Currency";       
   	Label = "Balance of policy loans";        
    }  
    
    IN MIR-LOAN-INT-AMT
    { 
        DisplayOnly;
   	Signed;
   	Length = "15";  
   	Decimals = "2";
        DBTableName = "Derived";
        SType = "Currency";
        Label = "Interest of policy loans";
    }    

    IN MIR-SHRT-LOAN-AMT
    {
        DisplayOnly;
   	Signed;
   	Length = "15";  
   	Decimals = "2";
        DBTableName = "Derived";
        SType = "Currency";                 
   	Label = "Shortage of Policy Loan Repayments";        
    }   
    
    IN MIR-SHRT-PREM-AMT 
    {
        DisplayOnly;
        Signed;
        Length = "15";
        Decimals = "2";
        DBTableName = "Derived";
        SType = "Currency";    
        Label = "Shortage Premium";
    }
    
    IN MIR-OS-PREM-AMT
    {
        DisplayOnly;
   	Signed;
   	Length = "15";  
   	Decimals = "2";
        DBTableName = "Derived";
        SType = "Currency";  
        Label = "Outstanding Premium";
    } 
    
    IN MIR-UNEARN-PREM-AMT
    {
        DisplayOnly;
   	Signed;
   	Length = "15";  
   	Decimals = "2";
        DBTableName = "Derived";
        SType = "Currency";  
        Label = "Unearned Premium";
    }   
    
    IN MIR-OVR-PD-PREM-AMT
    {
        DisplayOnly;
   	Signed;
   	Length = "15";  
   	Decimals = "2";
        DBTableName = "Derived";
        SType = "Currency";          
   	Label = "Overpaid premiums";        
    } 
          
    IN MIR-OVR-PD-LOAN-AMT   
    {
        DisplayOnly;
   	Signed;
   	Length = "15";  
   	Decimals = "2";
        DBTableName = "Derived";
        SType = "Currency";        
   	Label = "Overpaid policy loan repayments";        
    }  
 
    IN MIR-PD-PREM-AMT
    {
        DisplayOnly;
   	Signed;
   	Length = "15";  
   	Decimals = "2";
        DBTableName = "Derived";
        SType = "Currency";  
        Label = "Paid premium"; 
    }              	   


    IN MIR-SUBMSN-LAST-DT              
    {
        DisplayOnly;
        Length = "10";              
        SType = "Date";        	   
   	Label = "Submission Deadline";  	    
    }       
}    	    
	    
	    