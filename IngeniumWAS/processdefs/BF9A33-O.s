# Converted from PathFinder 2.2 to 3.0 Jun 18, 2004 3:13:59 PM EDT

#*******************************************************************************
#*  Component:   BF9A33-O.s                                                    *
#*  Description: Death Claim Final Approval Reversal                           *
#*                                                                             *
#*******************************************************************************
#*  Chg#    Release  Description                                               *
#*  IPCAFA  CTS      Intial Version                                            *
#*  ABF405  CTS      FIX TO DISPLAY DECLINE REASON FIELD                       *
#*  ABF419  CTS      CHANGED 'SUM OF PREMIUM SUSPENSE ' TO 'SUM OF SUSPENSE'   *
#*  ABF423  CTS     CHANGES MADE TO DISPLAY THE SIGN FOR CLAIM                 *
#*                  PAYABLE AMOUNT                                             *
#*  ISLCLM  CTS      ADDED A NEW FIELD FOR 'NUMBER OF DAYS TO                  *   
#*                   CLAIM PAYMENT DUE'                                        *
#*  M245Q2  CTS      SPWL CHANGES FOR DEATH CLAIMS                             **
#*  117569  CTS      CHANGES FOR NET PAYABLE AMOUNT FIELD CURRENCY CODE        *
#*******************************************************************************
S-STEP BF9A33-O
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

	
	 IN MIR-CLM-ID
	 {
	   
	     Length = "8";
	     DBTableName = "TDCLM";
	     SType = "Text";
	     Label = "Death Master Claim ID";
	   
	 }
	 IN MIR-POL-ID
	 {
	     
	     Length = "10";
	     DBTableName = "TDCLM";
	     SType = "Text";
	     Label = "Policy ID";
	     
	 }
	    
	 IN MIR-INSRD-CLI-ID
	 {
	     
	     Length = "10";
	     DBTableName = "TDCLM";
	     SType = "Text";
	     Label = "Insured Client ID";
	  }
	
	 IN MIR-DV-INS-CLI-NM
	
	 {
	     
	     Length = "75";
	     DBTableName = "Derived";
	     SType = "Text";
	     Label = "Insured Name";
	    
	 }
	 IN MIR-DV-INS-CLI-NM-1
	
	 {
	    
	     Length = "75";
	     DBTableName = "Derived";
	     SType = "Text";
	     Label = "Insured Kanji Name";
	    
	 }    
	 IN MIR-CLI-BTH-DT
	 {
	     Length = "10";
	     DBTableName = "TCLI";
	     SType = "Date";
	     Label = "Insured Date Of Birth";
	    
	 }
	
	  IN MIR-CLI-SEX-CD
	  {
	      Length = "40";
	      CodeSource = "DataModel";
	      CodeType = "CLI-SEX-CD";
	      DBTableName = "TCLI";
	      SType = "Text";
	      Label = "Sex";
	      
	  }  
	  IN MIR-CLM-HO-ACPT-DT
	  {
	      
	      Length = "10";
	      DBTableName = "TDCLM";
	      SType = "Date";
	      Label = "Head Office Acceptance Date";
          }	      
	IN MIR-RO-ID
	{
	        Label = "RO:";
		Length = "5";
		SType = "Text";
	}

	IN MIR-SO-ID
	{
	        Label = "SO:";
		Length = "5";
		SType = "Text";
	}
        IN MIR-DCLM-CLM-STAT-CD 
	{
		DisplayOnly;
		Length = "1";
		CodeSource = "DataModel";
		CodeType = "CLM-STAT-CD";		
		SType = "Text";		
		Label = "Death Master Claim Status";
	}
	
        IN MIR-CHK-ADJU-AMT
         {
             Length = "1";
	     DBTableName = "Derived";
	     SType = "Hidden";
             Label = "Decision Check";
        }  
        IN MIR-CHK-OTHR-AMT
         {
             Length = "1";
	     DBTableName = "Derived";
	     SType = "Hidden";
             Label = "Decision Check2";
         }                     	
#M245Q2 CHANGES START HERE

        IN MIR-PAYO-MTHD-CD 
        {
  	     Length = "18";
	     DisplayOnly;  	     
    	     CodeSource = "DataModel";
    	     CodeType = "PAYO-MTHD-CD";
    	     SType = "Text";
    	     Label = "Payout Method";   	
        }  
    
        IN MIR-PAYO-JPY-BNFT-CD 
        {
             Length = "12";
	     DisplayOnly;             
             CodeSource = "DataModel";
    	     CodeType = "PAYO-JPY-BNFT-CD";
    	     SType = "Text";
    	     Label = "JPY Benefit Rider";   	
        }  
#M245Q2 CHANGES END HERE          
	IN MIR-PAYEE-NM-TXT-T[30] 
	{
		DisplayOnly;
		FieldGroup = "table1";
		Index = "1";
		KeyColumn;
		Label = "Payee Name:";
		Length = "50";
		SType = "Text";
	}

	IN MIR-BNK-NM-T[30] 
	{
		DisplayOnly;
		Index = "1";
		FieldGroup = "table1";
		Label = "Bank Name:";
		Length = "36";
		SType = "Text";
	}

	IN MIR-BNK-BR-NM-T[30] 
	{
		DisplayOnly;
		Index = "1";
		FieldGroup = "table1";
		Label = "Branch Name:";
		Length = "36";
		SType = "Text";
	}

	IN MIR-ACCT-TYP-CD-T[30] 
	{
		CodeSource = "EDIT";
		CodeType = "FBACC";
		DisplayOnly;
		FieldGroup = "table1";
		Label = "Account Type:";
		Length = "3";
		SType = "Text";
		Index = "1";
	}

	IN MIR-DCRL-BNK-ACCT-ID-T[30] 
	{
		DisplayOnly;
		FieldGroup = "table1";
		Label = "Account Number:";
		Length = "7";
		SType = "Text";
		Index = "1";
	}

	IN MIR-DCRL-ACCT-HLDR-NM-T[30] 
	{
		DisplayOnly;
		FieldGroup = "table1";
		Label = "Account Holder's Name:";
		Length = "50";
		SType = "Text";
		Index = "1";
	}

	IN MIR-DCRL-KJ-ADDR-TXT-T[30] 
	{
		DisplayOnly;
		FieldGroup = "table1";
		Label = "Address:";
		Length = "50";
		SType = "Text";
		Index = "1";
	}

	IN MIR-DCRL-SAMAKATA-BU-TXT-T[30] 
	{
		DisplayOnly;
		FieldGroup = "Table1";
		Label = "Address Samakata-bu:";
		Length = "72";
		SType = "Text";
		Index = "1";
	}

	IN MIR-DCRL-SEND-PMT-NOTI-IND-T[30] 
	{
		DisplayOnly;
		FieldGroup ="Table1";
		Index = "1";
		Label = "Send Notice:";
		Length = "1";
		SType = "Indicator";
	}

	IN MIR-DCRL-INSRD-REL-CD-T[30] 
	{
		CodeSource = "EDIT";
		CodeType = "CLMRL";
		DisplayOnly;
		FieldGroup = "Table1";
		Index = "1";
		Label = "Relation to Beneficiary:";
		Length = "40";
		SType = "Text";
	}

	IN MIR-DCRL-PAYE-STAT-CD-T[30] 
	{
		CodeSource = "DataModel";
		CodeType = "DCRL-PAYE-STAT-CD";
		DisplayOnly;
		FieldGroup = "table1";
		Index = "1";
		Label = "Payee Status:";
		Length = "1";
		SType = "Text";
	}

	IN MIR-CVG-NUM-T[30] 
	{
		DisplayOnly;
		FieldGroup = "Table2";
		Index = "1";
		Label = "Coverage Id:";
		Length = "2";
		SType = "Text";
	}

	IN MIR-PLAN-ID-T[30] 
	{
		CodeSource = "EDIT";
		CodeType = "PLAN";
		DisplayOnly;
		FieldGroup = "Table2";
		Index = "1";
		Label = "Rider Name:";
		Length = "6";
		SType = "Text";
	}

	IN MIR-CVG-ISS-EFF-DT-T[30] 
	{
		DisplayOnly;
		FieldGroup = "Table2";
		Index = "1";
		Label = "Issue Effective Date:";
		Length = "10";
		SType = "Date";
	}

	IN MIR-CVG-MAT-XPRY-DT-T[30] 
	{
		DisplayOnly;
		FieldGroup = "Table2";
		Index = "1";
		Label = "Termination Date:";
		Length = "10";
		SType = "Date";
	}

	IN MIR-CVG-CSTAT-CD-T[30] 
	{
		CodeSource = "DataModel";
		CodeType = "CVG-CSTAT-CD";
		DisplayOnly;
		FieldGroup = "Table2";
		Index = "1";
		Label = "Coverage Status:";
		Length = "3";
		SType = "Text";
	}

	IN MIR-CVG-SUB-STAT-CD-T[30] 
	{
		CodeSource = "EDIT";
		CodeType = "SUBSC";
		DisplayOnly;
		FieldGroup = "Table2";
		Index = "1";
		Label = "Coverage Sub Status:";
		Length = "2";
		SType = "Text";
	}

	IN MIR-CVG-FACE-AMT-T[30] 
	{
#M245B2 CHANGES START HERE    
	        CurrencyCode = "MIR-POL-CRCY-CD";
#M245B2 CHANGES END HERE	
		DisplayOnly;
		FieldGroup = "Table2";
		Index = "1";
		Label = "Face Amount:";
		Length = "15";
		SType = "Currency";
	}

	IN MIR-BNFT-NM-ID-T[30] 
	{
		CodeSource = "EDIT";
		CodeType = "BNNM";
		DisplayOnly;
		FieldGroup = "Table2";
		Index = "1";
		Label = "Benefit Name:";
		Length = "5";
		SType = "Text";
	}
# ABF423 The attribute Signed is added

	IN MIR-CLM-ADJC-AMT-T[30] 
	{
#M245B2 CHANGES START HERE    
	        CurrencyCode = "MIR-POL-CRCY-CD";
#M245B2 CHANGES END HERE	
	        Signed;
		DisplayOnly;
		FieldGroup = "Table2";
		Index = "1";
		Label = "Amount for Adjudication:";
		Length = "15";
		SType = "Currency";
	}
# ABF423 The attribute Signed is added

	IN MIR-CLM-PAYBL-AMT-T[30] 
	{
#M245B2 CHANGES START HERE    
	        CurrencyCode = "MIR-POL-CRCY-CD";
#M245B2 CHANGES END HERE	
	        Signed;
		DisplayOnly;
		FieldGroup = "Table2";
		Index = "1";
		Label = "Payable Amount:";
		Length = "15";
		SType = "Currency";
	}
#M245Q2 CHANGES START HERE
         IN  MIR-DV-CLM-PAYBL-JPY-AMT-T[30]
         {
             Signed;
             DisplayOnly;             
             Length = "15";
             FieldGroup = "Table2";
             SType = "Currency";
             Label = "Payable Amount(Converted to JPY)";
             Index = "1";
         }
#M245Q2 CHANGES END HERE
	IN MIR-CLM-OTHR-RFND-AMT-T[30] 
	{
#M245B2 CHANGES START HERE    
	        CurrencyCode = "MIR-POL-CRCY-CD";
#M245B2 CHANGES END HERE	
		DisplayOnly;
		FieldGroup = "Table2";
		Index = "1";
		Label = "Other Refund Amount:";
		Length = "15";
		SType = "Currency";
	}
	
	IN MIR-CLM-STAT-CD-T[30]         
	{
	        Length = "40";
	    	FieldGroup = "Table2";
	    	CodeSource = "DataModel";
	    	CodeType = "CLM-STAT-CD";
	    	DBTableName = "TDCLM";
	    	SType = "Text";
	    	Label = "Death Claim Status:";
	    	Index = "1";
	    	DisplayOnly;
	}
	
        IN MIR-PAYEE-NM-TXT-1-T[30] 
	{
		DisplayOnly;
		FieldGroup = "Table2";
		Index = "1";
		KeyColumn;
		Label = "Payee Name:";
		Length = "50";
		SType = "Text";
	}

	IN MIR-BNFT-DECID-CD-T[30] 
	{
		CodeSource = "DataModel";
		CodeType = "BNFT-DECID-CD";
		DisplayOnly;
		FieldGroup = "Table2";
		Index = "1";
		Label = "Decision:";
		Length = "2";
		SType = "Text";
	}
# ABF405 CHANGES DTART HERE
        IN MIR-BNFT-DCLN-REASN-CD-T[30]
        {
               Length = "2";
               FieldGroup = "Table2";
               CodeSource = "DataModel";
               CodeType = "BNFT-DCLN-REASN-CD";
               DBTableName = "TDCBD";
               SType = "Text";
               Label = "Decline Reason";
               Index = "1";
         }
# ABF405 CHANGES END HERE
	

	IN MIR-PREM-DED-AMT-T[30] 
	{
#M245B2 CHANGES START HERE    
	        CurrencyCode = "MIR-POL-CRCY-CD";
#M245B2 CHANGES END HERE	
		DisplayOnly;
		FieldGroup = "Table3";
		Index = "1";
		Label = "Amount to Deduct:";
		Length = "11";
		SType = "Currency";
        }		
	
	IN MIR-DTH-MTHLY-BNFT-AMT-T[30] 
	{
#M245B2 CHANGES START HERE    
	        CurrencyCode = "MIR-POL-CRCY-CD";
#M245B2 CHANGES END HERE	
		DisplayOnly;
		FieldGroup = "Table4";
		Index = "1";
		Label = "Amount to Pay Monthly:";
		Length = "15";
		SType = "Currency";
	}

	

	IN MIR-BNFT-ADDL-AMT-T[30] 
	{
#M245B2 CHANGES START HERE    
	        CurrencyCode = "MIR-POL-CRCY-CD";
#M245B2 CHANGES END HERE	
		DisplayOnly;
		FieldGroup = "Table5";
		Index = "1";
		Label = "Amount to be Added:";
		Length = "15";
		SType = "Currency";
	}
	IN MIR-BNFT-DED-AMT-T[30] 
	{
#M245B2 CHANGES START HERE    
	        CurrencyCode = "MIR-POL-CRCY-CD";
#M245B2 CHANGES END HERE	
		DisplayOnly;
		FieldGroup = "Table5";
		Index = "1";
		Label = "Amount to be Deducted:";
		Length = "15";
		SType = "Currency";
	}
	IN MIR-LN-TC-PREM-AMT-T[30] 
	{
#M245B2 CHANGES START HERE    
	        CurrencyCode = "MIR-POL-CRCY-CD";
#M245B2 CHANGES END HERE	
		DisplayOnly;
		FieldGroup = "Table6";
		Index = "1";
		Label = "Living Needs/Terminal Care Amount:";
		Length = "15";
		SType = "Currency";
	}

	
# ABF419 CHANGES START HERE
	IN MIR-PREM-SUSP-AMT-T[30] 
	{
#M245B2 CHANGES START HERE    
	        CurrencyCode = "MIR-POL-CRCY-CD";
#M245B2 CHANGES END HERE	
		DisplayOnly;
		FieldGroup = "Table7";
		Index = "1";
		Label = "Sum of Suspense:";
		Length = "15";
		SType = "Currency";
	}
# ABF419 CHANGES ENDS HERE
	
 
	IN MIR-OTHR-RFND-AMT-T[30] 
	{
#M245B2 CHANGES START HERE    
	        CurrencyCode = "MIR-POL-CRCY-CD";
#M245B2 CHANGES END HERE	
		DisplayOnly;
		FieldGroup = "Table8";
		Index = "1";
		Label = "Other Refund Amount:";
		Length = "15";
		SType = "Currency";
	}

# ABF423 The attribute Signed is added
	
	IN MIR-CLM-PAYBL-AMT-1-T[30]
	 {
#M245B2 CHANGES START HERE    
	    CurrencyCode = "MIR-POL-CRCY-CD";
#M245B2 CHANGES END HERE	 
	    Signed;
	    Length = "15";
	    FieldGroup = "Table9";
	    DBTableName = "TCBD";
	    SType = "Currency";
	    Label = "Net Payable Amount";
	    Index = "1";
	    
	 }
#M245Q2  CHANGES START HERE       
        IN MIR-CLM-JPY-XCHNG-RT-T[30]
        {
            Signed;
	    DisplayOnly;            
            Length = "18";
            Decimals ="9";            
            SType = "Number";
            Label = "Exchange Rate to JPY";
            Index = "1";
        }
        IN MIR-DV-CLM-NET-PAYBL-JPY-AMT-T[30]
        {
#117569  CHANGES START HERE
 	    CurrencyCode = "MIR-DISB-CRCY-CD";
#117569  CHANGES ENDS HERE
            Signed;
	    DisplayOnly;                        
            Length = "15";
       	    SType = "Currency";
       	    Label = "Net Payable Amount (In payout currency)";
       	    Index = "1";
        }  
#M245Q2  CHANGES END HERE       	
	IN MIR-DLAY-INT-STRT-DT-T[30] 
	{
		DisplayOnly;
		FieldGroup = "Table9";
		Index = "1";
		Label = "Delay Interest Start Date:";
		Length = "10";
		SType = "Date";
	}
	
#ISLCLM CHANGES START    
        IN MIR-DCLM-DYS-BFR-PMT-DUE-T[30]
        {
                Length = "03";
                FieldGroup = "Table9";
                CodeSource = "DataModel";
                CodeType = "DYS-BFR-PMT-DUE";
                DBTableName = "TDCBD";
                SType = "Text";
                Label = "Days Before Claim Payment Due";
                Index = "1";
        }
           
#ISLCLM CHANGES END    		

	IN MIR-DLAY-INT-ARR-DUR-T[30] 
	{
		DisplayOnly;
		FieldGroup = "Table9";
		Index = "1";
		Label = "Number of Days of delay Interest";
		Length = "4";
		SType = "Date";
	}

	IN MIR-DLAY-INT-AMT-T[30] 
	{
#M245Q2 CHANGES START HERE  
#M245B2 CHANGES START HERE 
#	        CurrencyCode = "MIR-POL-CRCY-CD";
	        CurrencyCode = "MIR-DISB-CRCY-CD";
#M245B2 CHANGES END HERE	
#M245Q2 CHANGES END HERE	
		DisplayOnly;
		FieldGroup = "Table9";
		Index = "1";
		Label = "Delay Interest Amount:";
		Length = "15";
		SType = "Currency";
	}
# ABF423 The attribute Signed is added

	IN MIR-REMIT-AMT-T[30] 
	{
#M245Q2 CHANGES START HERE  
#M245B2 CHANGES START HERE 
#	        CurrencyCode = "MIR-POL-CRCY-CD";
	        CurrencyCode = "MIR-DISB-CRCY-CD";
#M245B2 CHANGES END HERE	
#M245Q2 CHANGES END HERE	
	        Signed;
		DisplayOnly;
		FieldGroup = "Table9";
		Index = "1";
		Label = "Remittance Amount:";
		Length = "15";
		SType = "Currency";
	}
#M245B2 CHANGES START HERE          
          IN MIR-POL-CRCY-CD
            {
               Length = "2";           
               SType = "Hidden";
               Label = "Currency";
            }
#M245B2 CHANGES END HERE 
#M245Q2 CHANGES START HERE          
          IN MIR-DISB-CRCY-CD
           {
              Length = "2";           
              SType = "Hidden";
              Label = "Currency";
    }
#M245Q2 CHANGES END HERE  
}
