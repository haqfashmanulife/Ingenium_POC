#*******************************************************************************
#*  Component:   BF9B10-O.s                                                    *
#*  Description: Created for Tax Payment Record Information Screen             *
#*                                                                             *
#*******************************************************************************
#*  Chg#    Release  Description                                               *
#*                                                                             *
#*  M142S2   CTS     INITIAL VERSION                                           *
#*                                                                             *
#*  M245B2  CTS      Foreign Currency Formatting 			       *
#*  M271O1  CTS      CHANGES DONE AS PART OF FRA                               * 
#*  TDMG24  CTS      INQUIRY SCREEN CHANGES                                    * 
#*******************************************************************************
S-STEP BF9B10-O
{
        ATTRIBUTES
        {
        	BusinessFunctionType = "Retrieve";
        	DelEmptyRows;
        	FocusField = "OKButton";
        	FocusFrame = "ButtonFrame";
        	Type = "Output";
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
                SType="Hidden";
        }
        
        IN MIR-POL-ID-BASE 
        {
                DefaultSession = "MIR-POL-ID-BASE";
                DisplayOnly;
                Key;
                Label = "Policy ID";
                Length = "9";
                SType = "Text";
        }
        
        IN MIR-POL-ID-SFX 
        {
                DefaultSession = "MIR-POL-ID-SFX";
                DisplayOnly;
                Key;
                Label = "Suffix";
                Length = "1";
                SType = "Text";
        }
        
        INOUT MIR-CVG-NUM
        {
                Length = "2";
                DBTableName = "TCVG";
                SType = "Text";
                Label = "Coverage Number";
        }
         
        IN MIR-DV-OWN-CLI-NM 
        {
                DisplayOnly;
                Label = "Owner Name";
                Length = "75";
                SType = "Text";
        }
        
        IN MIR-POL-CSTAT-CD 
        {
                CodeSource = "DataModel";
                CodeType = "POL-CSTAT-CD";
                DisplayOnly;
                Label = "Current Policy Status";
                Length = "40";
                SType = "Text";
        }
        #TDMG24 CHANGES START HERE
	    IN MIR-PREM-PMT-CMPLT-IND
	    {
	        DisplayOnly;
	        Length = "1";
	        SType = "Indicator";
	        Label = "Base Policy Premium Payment Completion";
	
	    }    
	#TDMG24 CHANGES END HERE    

        
        IN MIR-POL-CVG-REC-CTR 
        {
        	DisplayOnly;
        	Label = "Number of Coverages on This Policy";
        	Length = "40";
        	SType = "Text";
        }
        
        IN MIR-POL-MPREM-AMT 
        {
#M245B2 CHANGES START HERE   
#M271O1 CHANGES START HERE CHANGING CURRENCY CODE  
      # CurrencyCode = "MIR-POL-CRCY-CD";
        CurrencyCode = "MIR-PREM-CRCY-CD";
#M271O1 CHANGES END HERE 
#M245B2 CHANGES END HERE 
        DisplayOnly;
        Label = "Modal Premium";
        Length = "15";
        SType = "Currency";
        Signed;
        }
        
        IN MIR-POL-GRS-APREM-AMT 
        {
#M245B2 CHANGES START HERE 
#M271O1 CHANGES START HERE CHANGING CURRENCY CODE  
      # CurrencyCode = "MIR-POL-CRCY-CD";
        CurrencyCode = "MIR-PREM-CRCY-CD";
#M271O1 CHANGES END HERE 
#M245B2 CHANGES END HERE 
        DisplayOnly;
        Label = "Gross Annual Premium:";
        Length = "15";
        SType = "Currency";
        Signed;
        }
        
    IN MIR-POL-PD-TO-DT-NUM 
    {
        DisplayOnly;
        Label = "Policy Paid to Date";
        Length = "10";
        SType = "Text";
    }
        
        IN MIR-MPREM-DSCNT-AMT 
     {
#M245B2 CHANGES START HERE    
#M271O1 CHANGES START HERE CHANGING CURRENCY CODE  
      # CurrencyCode = "MIR-POL-CRCY-CD";
        CurrencyCode = "MIR-PREM-CRCY-CD";
#M271O1 CHANGES END HERE 
#M245B2 CHANGES END HERE  
        DisplayOnly;
        Label = "Mode Premium Discount Amount";
        Length = "13";
        SType = "Currency";
        Signed;
     }
        
        IN MIR-POL-CNVR-TYP-CD 
        {
                CodeSource = "DataModel";
                CodeType = "CNVR-TYP-CD";
                DisplayOnly;
                Label = "Conversion Policy Type Code";
                Length = "2";
                SType = "Text";
        }
        
        IN MIR-SBSDRY-CO-ID 
        {
                CodeSource = "EDIT";
                CodeType = "SUBCO";
                DisplayOnly;
                Label = "Sub Company:";
                Length = "40";
                SType = "Text";
        }
        
        IN MIR-ORIG-LTD-PREM-PD 
        {
#M245B2 CHANGES START HERE  
#M271O1 CHANGES START HERE CHANGING CURRENCY CODE  
      # CurrencyCode = "MIR-POL-CRCY-CD";
        CurrencyCode = "MIR-PREM-CRCY-CD";
#M271O1 CHANGES END HERE 
#M245B2 CHANGES END HERE 
        DisplayOnly;
        Label = "Premium Paid on Pre-Conversion policy:";
        Length = "16";
        SType = "Currency";
        }
        
        IN MIR-DV-CSV-PAYO-AMT 
        {
#M245B2 CHANGES START HERE    
        CurrencyCode = "MIR-POL-CRCY-CD";
#M245B2 CHANGES END HERE   
                DisplayOnly;
                Label = "Payout Amount for Rider FA Reduction/Surrender :";
                Length = "16";
                SType = "Currency";
        }
        
        IN MIR-DV-PAYO-PSUR-AMT 
        {
         #M245B2 CHANGES START HERE    
	         CurrencyCode = "MIR-POL-CRCY-CD";
#M245B2 CHANGES END HERE 
                DisplayOnly;
                Label = "Payout Amount for Partial Surrender of Base Fund:";
                Length = "16";
                SType = "Currency";
        }
        
        IN MIR-DV-ELIG-SRVBEN-LTD-AMT 
        {
         #M245B2 CHANGES START HERE    
	         CurrencyCode = "MIR-POL-CRCY-CD";
#M245B2 CHANGES END HERE 
                DisplayOnly;
                Label = "Payout Amount for Survivorship Benefit :";
                Length = "18";
                SType = "Currency";
        }
        
        IN MIR-DV-PAYO-DTH-CLM-AMT 
        {
         #M245B2 CHANGES START HERE    
	         CurrencyCode = "MIR-POL-CRCY-CD";
#M245B2 CHANGES END HERE 
                DisplayOnly;
                Label = "Payout Amount of Death Claim :";
                Length = "16";
                SType = "Currency";
        }
        
        IN MIR-POL-CONN-COI-AMT 
        {
#M245B2 CHANGES START HERE   
#M271O1 CHANGES START HERE CHANGING CURRENCY CODE  
      # CurrencyCode = "MIR-POL-CRCY-CD";
        CurrencyCode = "MIR-PREM-CRCY-CD";
#M271O1 CHANGES END HERE 
#M245B2 CHANGES END HERE 
                DisplayOnly;
                Label = "Accumulated COI of Pre-Split/Joint Coverages:";
                Length = "19";
                SType = "Currency";
        }
        
        IN MIR-DV-CONN-CLI-NM 
        {
                DisplayOnly;
                Label = "Policyholder name of Pre-Split/Joint Policy:";
                Length = "50";
                SType = "Text";
        }
        
        IN MIR-POL-CONN-REL-CD 
        {
        #       DisplayOnly;
                CodeSource = "DataModel";
                CodeType = "OWNR-REL-INSR-CD";
                Label = "Relation of Policyholder of Pre-Split/Joint Policy:";
                Length = "16";
                SType = "Text";
        }
        
        IN MIR-CVG-NUM-T[20] 
        {
                DisplayOnly;
                FieldGroup = "Table20";
                Index = "1";
                KeyColumn;
                Label = "Coverage Number";
                Length = "2";
                SType = "Text";
        }
        
        IN MIR-PLAN-ID-T[20] 
        {
                CodeSource = "EDIT";
                CodeType = "PLAN";
                DisplayOnly;
                FieldGroup = "Table20";
                Index = "1";
                Label = "Plan Name";
                Length = "40";
                SType = "Text";
        }
        
        IN MIR-INSRD-CLI-ID-T[20] 
        {
                DisplayOnly;
                FieldGroup = "Table20";
                Index = "1";
                Label = "Insured";
                Length = "10";
                SType = "Text";
        }
        
        IN MIR-DV-CVG-TOT-DED-AMT-T[20] 
        {
#M245B2 CHANGES START HERE   
#M271O1 CHANGES START HERE CHANGING CURRENCY CODE  
      # CurrencyCode = "MIR-POL-CRCY-CD";
        CurrencyCode = "MIR-PREM-CRCY-CD";
#M271O1 CHANGES END HERE 
#M245B2 CHANGES END HERE 
                DisplayOnly;
                FieldGroup = "Table20";
                Index = "1";
                Label = "Accumulated COI";
                Length = "18";
                SType = "Currency";
        }
#M245B2 CHANGES START HERE          
        INOUT MIR-POL-CRCY-CD
              {
                 Length = "2";           
                 SType = "Hidden";
                 Label = "Currency";
           }
#M245B2 CHANGES END HERE   
#M271O1 CHANGES START HERE   
    INOUT MIR-PREM-CRCY-CD
    {
                      
        Length = "2";
        SType = "Hidden";
        Label = "Currency";
    }
#M271O1 CHANGES END HERE 

}
