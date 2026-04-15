
# *******************************************************************************
# *  Component:   BF9B12-I.S                                                    *
# *  Description:                                                               *
# *                                                                             *
# *******************************************************************************
# *  Chg#    Release  Description                                               *
# *                                                                             *
# *  M142S2   CTS     INITIAL VERSION                                           *
# *                                                                             *
#*  M245B2  CTS      Foreign Currency Formatting 			       *
# *******************************************************************************
S-STEP BF9B12-I
{
        ATTRIBUTES
        {
                BusinessFunctionType = "Update";
                Type = "Input";
                FocusFrame = "ContentFrame";
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

        IN index
        {
                SType = "Hidden";
        }
        
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
        
        INOUT MIR-CVG-NUM
        {
              Length = "2";
              DBTableName = "TCVG";
              SType = "Text";
              Label = "Coverage Number";
        }
        
        IN MIR-DV-OWN-CLI-NM
        {
                DBTableName = "Derived";
                Label = "Owner Name";
                Length = "75";
                SType = "Text";
        }
        
        IN MIR-POL-CSTAT-CD
        {
                CodeSource = "DataModel";
                CodeType = "POL-CSTAT-CD";
                DBTableName = "TPOL";
                Label = "Current Policy Status";
                Length = "40";
                SType = "Text";
        }
        
        IN MIR-POL-CVG-REC-CTR
        {
                DBTableName = "TPOL";
                Label = "Number of Coverages on This Policy";
                Length = "40";
                SType = "Text";
        }
        
        IN MIR-POL-MPREM-AMT
        {
        #M245B2 CHANGES START HERE    
        CurrencyCode = "MIR-POL-CRCY-CD";
#M245B2 CHANGES END HERE      
                DBTableName = "TPOL";
                DisplayOnly;
                Label = "Modal Premium";
                Length = "15";
                Signed;
                SType = "Currency";
        }
        
        IN MIR-POL-GRS-APREM-AMT
        {
        #M245B2 CHANGES START HERE    
	        CurrencyCode = "MIR-POL-CRCY-CD";
#M245B2 CHANGES END HERE 
                DBTableName = "TPOL";
                Label = " Gross Annual Premium";
                Length = "15";
                Signed;
                SType = "Currency";
        }
        
        IN MIR-POL-PD-TO-DT-NUM
        {
                DBTableName = "TPOL";
                DisplayOnly;
                Label = "Policy Paid to Date";
                Length = "10";
                SType = "Text";
        }
        
        IN MIR-MPREM-DSCNT-AMT
        {
        #M245B2 CHANGES START HERE    
	        CurrencyCode = "MIR-POL-CRCY-CD";
#M245B2 CHANGES END HERE 
                DBTableName = "TPOL";
                Label = "Mode Premium Discount Amount";
                Length = "13";
                Signed;
                SType = "Currency";
        }
        
        IN MIR-POL-CNVR-TYP-CD
        {
                CodeSource = "DataModel";
                CodeType = "CNVR-TYP-CD";
                DBTableName = "TPOL";
                Label = "Conversion Policy Type Code";
                Length = "2";
                SType = "Text";
        }
        
        IN MIR-SBSDRY-CO-ID
        {
                CodeSource = "EDIT";
                CodeType = "SUBCO";
                DBTableName = "TPOL";
                Label = "Sub Company ";
                Length = "40";
                SType = "Text";
        }
        
        # Policy Level
        IN MIR-ORIG-LTD-PREM-PD
        {
        #M245B2 CHANGES START HERE    
        CurrencyCode = "MIR-POL-CRCY-CD";
#M245B2 CHANGES END HERE   
                DBTableName = "TPOLX";
                Label = "Premium Paid on Pre-Conversion policy:";
                Length = "16";
                SType = "Currency";
        }
        
        IN MIR-DV-CSV-PAYO-AMT
        {
        #M245B2 CHANGES START HERE    
        CurrencyCode = "MIR-POL-CRCY-CD";
#M245B2 CHANGES END HERE   
                DBTableName = "TCVG";
                Label = "Payout Amount for Rider FA Reduction/Surrender :";
                Length = "16";
                SType = "Currency";
        }
        
        IN MIR-DV-PAYO-PSUR-AMT
        {
        #M245B2 CHANGES START HERE    
	        CurrencyCode = "MIR-POL-CRCY-CD";
#M245B2 CHANGES END HERE 
                DBTableName = "Derived";
                Label = "Payout Amount for Partial Surrender of Base Fund:";
                Length = "16";
                SType = "Currency";
        }
        
        IN MIR-DV-ELIG-SRVBEN-LTD-AMT
        {
        #M245B2 CHANGES START HERE    
        CurrencyCode = "MIR-POL-CRCY-CD";
#M245B2 CHANGES END HERE     
                DBTableName = "TPOL";
                Label = "Payout Amount for Survivorship Benefit :";
                Length = "18";
                SType = "Currency";
        }
        
        IN MIR-DV-PAYO-DTH-CLM-AMT
        {
        #M245B2 CHANGES START HERE    
	        CurrencyCode = "MIR-POL-CRCY-CD";
#M245B2 CHANGES END HERE 
                DBTableName = "TDBCD";
                Label = "Payout Amount of Death Claim :";
                Length = "16";
                SType = "Currency";
        }
        
        INOUT MIR-POL-CONN-COI-AMT
        {
        #M245B2 CHANGES START HERE    
        CurrencyCode = "MIR-POL-CRCY-CD";
#M245B2 CHANGES END HERE  
                Signed;
                DBTableName = "TPOL";
                Label = "Accumulated COI of Pre-Split/Joint Coverages:";
                Length = "19";
                SType = "Currency";
        }
        
        IN MIR-DV-CONN-CLI-NM
        {
                DBTableName = "Derived";
                DisplayOnly;
                Label = "Policyholder name of Pre-Split/Joint Policy:";
                Length = "50";
                SType = "Text";
        }
        
       INOUT MIR-POL-CONN-REL-CD
        {
                Length = "40";
                CodeSource = "DataModel";
                CodeType = "OWNR-REL-INSR-CD";
                SType = "Selection";
                Label = "Relation of Policyholder of Pre-Split/Joint Policy:";
        }
        # Coverage Level
        IN MIR-CVG-NUM-T[20]
        {
                DBTableName = "TCVG";
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
                DBTableName = "TCVG";
                FieldGroup = "Table20";
                Index = "1";
                Label = "Plan Name";
                Length = "40";
                SType = "Text";
        }
        
        IN MIR-INSRD-CLI-ID-T[20]
        {
                DBTableName = "TCVGC";
                FieldGroup = "Table20";
                Index = "1";
                Label = "Insured";
                Length = "10";
                SType = "Text";
        }
        
        IN MIR-DV-CVG-TOT-DED-AMT-T[20]
        {
        #M245B2 CHANGES START HERE    
	        CurrencyCode = "MIR-POL-CRCY-CD";
#M245B2 CHANGES END HERE 
                DBTableName = "TUHCO";
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
}
