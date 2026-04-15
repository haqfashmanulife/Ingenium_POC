#<HEADER>
#<DESCRIPTION>
#Policy Retrieve
#</DESCRIPTION>
#</HEADER>
# *******************************************************************************
# *  Component:   BF9B10-P.p                                                    *
# *  Description:                                                               *
# *                                                                             *
# *******************************************************************************
# *  Chg#    Release  Description                                               *
# *                                                                             *
# *  M142S2   CTS     INITIAL VERSION                                           *
# *                                                                             *
#*  M245B2  CTS      Foreign Currency Formatting 			       *
#*  M271O1  CTS    CHANGES DONE AS PART OF FRA                                 *
#*  TDMG24  CTS      INQUIRY SCREEN CHANGES                                    * 
# *******************************************************************************
P-STEP BF9B10-P
{
        ATTRIBUTES
        {
                BusinessFunctionId = "9B10";
                BusinessFunctionType = "Retrieve";
                BusinessFunctionName = "Inquiry-Tax Payment Information";
                MirName = "CCWM9B10";
        }
        OUT LSIR-RETURN-CD;
        
        OUT MIR-RETRN-CD;
        
        IN MIR-DV-PRCES-STATE-CD
        {
                Length = "1";
                DBTableName = "Derived";
                SType = "Hidden";
                Label = "process code";
        }
        IN MIR-POL-ID-BASE
        {
                DBTableName = "TPOL";
                DefaultSession = "MIR-POL-ID-BASE";
                Key;
                Label = "Policy ID";
                Length = "9";
                Mandatory;
                SType = "Text";
        }
        
        IN MIR-POL-ID-SFX
        {
                DBTableName = "TPOL";
                DefaultSession = "MIR-POL-ID-SFX";
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
        
        OUT MIR-DV-OWN-CLI-NM
        {
                DBTableName = "Derived";
                Label = "Owner Name";
                Length = "75";
                SType = "Text";
        }
        
        OUT MIR-POL-CSTAT-CD
        {
                CodeSource = "DataModel";
                CodeType = "POL-CSTAT-CD";
                DBTableName = "TPOL";
                Label = "Current Policy Status";
                Length = "40";
                SType = "Text";
        }
        #TDMG24 CHANGES START HERE
        OUT MIR-PREM-PMT-CMPLT-IND
	 {
	 
	        Length = "1";
	        DBTableName = "TPOL";
	        SType = "Indicator";
	        Label = "Base Policy Premium Payment Completion";
	 
	 }    
#TDMG24 CHANGES END HERE    
        
        OUT MIR-POL-CVG-REC-CTR
        {
                DBTableName = "TPOL";
                Label = "Number of Coverages on This Policy";
                Length = "40";
                SType = "Text";
        }
        
        OUT MIR-POL-MPREM-AMT
        {
                DBTableName = "TPOL";
                DisplayOnly;
                Label = "Modal Premium";
                Length = "15";
                Signed;
                SType = "Currency";
        }
        
        OUT MIR-POL-GRS-APREM-AMT
        {
                DBTableName = "TPOL";
                Label = " Gross Annual Premium";
                Length = "15";
                Signed;
                SType = "Currency";
        }
        
        OUT MIR-POL-PD-TO-DT-NUM
        {
                DBTableName = "TPOL";
                DisplayOnly;
                Label = "Policy Paid to Date";
                Length = "10";
                SType = "Text";
        }
        
        OUT MIR-MPREM-DSCNT-AMT
        {
                DBTableName = "TPOL";
                Label = "Mode Premium Discount Amount";
                Length = "13";
                Signed;
                SType = "Currency";
        }
        
        OUT MIR-POL-CNVR-TYP-CD
        {
                CodeSource = "DataModel";
                CodeType = "CNVR-TYP-CD";
                DBTableName = "TPOL";
                Label = "Conversion Policy Type Code";
                Length = "2";
                SType = "Text";
        }
        
        OUT MIR-SBSDRY-CO-ID
        {
                CodeSource = "EDIT";
                CodeType = "SUBCO";
                DBTableName = "TPOL";
                Label = "Sub Company ";
                Length = "40";
                SType = "Text";
        }
        
        # Policy Level
        OUT MIR-ORIG-LTD-PREM-PD
        {
                DBTableName = "TPOLX";
                Label = "Premium Paid on Pre-Conversion policy:";
                Length = "16";
                SType = "Currency";
        }
        
        OUT MIR-DV-CSV-PAYO-AMT
        {
                DBTableName = "TCVG";
                Label = "Payout Amount for Rider FA Reduction/Surrender :";
                Length = "16";
                SType = "Currency";
        }
        
        OUT MIR-DV-PAYO-PSUR-AMT
        {
                DBTableName = "Derived";
                Label = "Payout Amount for Partial Surrender of Base Fund:";
                Length = "16";
                SType = "Currency";
        }
        
        OUT MIR-DV-ELIG-SRVBEN-LTD-AMT
        {
                DBTableName = "TPOL";
                Label = "Payout Amount for Survivorship Benefit :";
                Length = "18";
                SType = "Currency";
        }
        
        OUT MIR-DV-PAYO-DTH-CLM-AMT
        {
                DBTableName = "TDBCD";
                Label = "Payout Amount of Death Claim :";
                Length = "16";
                SType = "Currency";
        }
        
        OUT MIR-POL-CONN-COI-AMT
        {
                Signed;
                DBTableName = "TPOL";
                Label = "Accumulated COI of Pre-Split/Joint Coverages:";
                Length = "19";
                SType = "Currency";
        }
        
        OUT MIR-DV-CONN-CLI-NM
        {
                DBTableName = "Derived";
                DisplayOnly;
                Label = "Policyholder name of Pre-Split/Joint Policy:";
                Length = "50";
                SType = "Text";
        }
        
        OUT MIR-POL-CONN-REL-CD
        {
                DBTableName = "TPOL";
                CodeType = "OWNR-REL-INSR-CD";
                DisplayOnly;
                Label = "Relation of Policyholder of Pre-Split/Joint Policy:";
                Length = "16";
                SType = "Text";
        }
        
        # Coverage Level
        OUT MIR-CVG-NUM-T[20]
        {
                DBTableName = "TCVG";
                FieldGroup = "Table20";
                Index = "1";
                KeyColumn;
                Label = "Coverage Number";
                Length = "2";
                SType = "Text";
        }
        
        OUT MIR-PLAN-ID-T[20]
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
        
        OUT MIR-INSRD-CLI-ID-T[20]
        {
                DBTableName = "TCVGC";
                FieldGroup = "Table20";
                Index = "1";
                Label = "Insured";
                Length = "10";
                SType = "Text";
        }
        
        OUT MIR-DV-CVG-TOT-DED-AMT-T[20]
        {
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
#M271O1 CHANGES START HERE  
         
    INOUT MIR-PREM-CRCY-CD
    {
        Length = "2";
        SType = "Hidden";
        Label = "Currency";
    }  
#M271O1 CHANGES END HERE 
}
