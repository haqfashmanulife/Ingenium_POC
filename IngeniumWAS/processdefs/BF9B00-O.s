# Converted from PathFinder 2.2 to 3.0 Jun 18, 2004 3:13:59 PM EDT

#*******************************************************************************
#*  Component:   BF9B00-O.s                                                    *
#*  Description: Death Claim Summary Sheet(for UL)                             *
#*                                                                             *
#*******************************************************************************
#*  Chg#    Release  Description                                               *
#*                                                                             *
#*  IPCASS  CTS     INITIAL VERSION                                            *
#*  IPCA02  CTS     CHANGED DISPLAY TAX INFORMATION INDICATOR FROM CHECKBOX TO *
#*  IPCA02          DROPDOWN                                                   *
#*  ABU209  CTS     FIX TO DISPLAY RELATION TO INSURED                         *
#*  ABF423  CTS     CHANGES MADE TO DISPLAY THE SIGN FOR CLAIM                 *
#*                  PAYABLE AMOUNT                                             *
#*  ISLCLM  CTS     ADDED STEP-IN RIGHT INFORMATION FIELDS                     *
#*  143C38  CTS      ADDED A NEW FIELD TO DISPLAY THE TRAD PAID                *
#*                   TO DATE FOR NWL AND AMI DEATH CLAIMS                      *      
#*  M213M2  CTS      CHANGES DONE TO ADD A CANCER TYPE AND TRANSPLANT TYPE     * 
#*  M245B2  CTS      Foreign Currency Formatting 			       *
#*  M245Q2  CTS      SPWL CHANGES FOR DEATH CLAIMS                             *
#*  Q52688  CTS      FIX FOR ACCUMULATED PREMIUM AMOUNT                        *
#*  Q52997  CTS     FIX TO DISPLAY EXCHNG RATE AND NET AMOUNT                  *
#*  M271A3  CTS      FRA DEATH CLAIMS CHANGES                                  *
#*  M271C9  CTS      CHANGES AS PART OF CR4 SECOND PAYEE DETAILS              **
#*  M287C9  CTS      CHANGES AS PART OF CR9 PAYEE DETAILS                      *
#*  MP300C  CTS      CHANGES TO ADD NEW FIELD PRE-LCD CHECK INDICATOR FOR ETC  *
#*  MP302L  CTS     TD SURVIVAL BENEFIT DEATH CLAIM CHANGES                    *
#*  M319A7  CTS      CHANGES FOR FXWL DEATH CLAIM PROCESSING                   *
#*  CS0008  CTS      CSA IMPROVEMENTS-DEATH CLAIM CHANGES                     **
#*  TV2024  CTS    CHANGES AS PART OF SULv2 DEATH CLAIM                        *
#*  TLB041  CTS      CORPORATE POLICY HOLDER NAME & ADDRESS EXPANSION          *
#*  ULMG13  CTS      CHANGES DONE FOR LAPSE RIDER AS PART OF UL MEDICAL RIDER  *
#*  UY3077  CTS      LIVING NEEDS STREAM 3                                     *
#*******************************************************************************

S-STEP BF9B00-O
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

  OUT index
  {
    SType = "Hidden";
  }

    IN MIR-CLM-ID
    {
      DefaultSession = "MIR-CLM-ID";
      DisplayOnly;
      Key;
      Length = "8";
      SType = "Text";
      Label = "Claim ID";
    }

    IN MIR-POL-ID
    {
        Length = "10";
        DisplayOnly;
        SType = "Text";
        Label = "Policy ID";
    }

    IN MIR-CLM-STAT-CD
    {
      Length = "1";
      CodeSource = "DataModel";
      CodeType = "CLM-STAT-CD";
      SType = "Text";
      Label = "Death Master Claim Status";
    }

    IN MIR-INSRD-CLI-ID
    {
        Length = "10";
        DisplayOnly;
        SType = "Text";
        Label = "Client ID";
    }

    IN MIR-INSRD-CLI-NM
    {
        Length = "51";
        DisplayOnly;
        SType = "Text";
        Label = "Insured Name";
    }

    IN MIR-INSRD-KJ-NM
    {
        Length = "50";
        DisplayOnly;
        SType = "Text";
        Label = "Insured Kanji Name";
    }

    IN MIR-CLI-BTH-DT
    {
        Length = "10";
        DisplayOnly;
        SType = "Date";
        Label = "Date of Birth";
    }

    IN MIR-CLI-SEX-CD
    {
        Length = "1";
        CodeSource = "DataModel";
        CodeType = "CLI-SEX-CD";
        DisplayOnly;
        SType = "Text";
        Label = "Sex";
    }

    IN MIR-CLM-HO-ACPT-DT
    {
        Length = "10";
        DisplayOnly;
        SType = "Date";
        Label = "Head Office Claim Form Acceptance Date";
    }

    IN MIR-RO-ID
    {
        Length = "5";
        DisplayOnly;
        SType = "Text";
        Label = "RO";
    }

    IN MIR-SO-ID
    {
        Length = "5";
        DisplayOnly;
        SType = "Text";
        Label = "SO";
    }

    IN MIR-POL-CNVR-TYP-CD
    {
        Length = "2";
        CodeSource = "DataModel";
        CodeType = "CNVR-TYP-CD";
        DisplayOnly;
        SType = "Text";
        Label = "Policy Source";
    }

    IN MIR-POL-CSTAT-CD
    {
        Length = "2";
        CodeSource = "DataModel";
        CodeType = "POL-CSTAT-CD";
        DisplayOnly;
        SType = "Text";
        Label = "Current Policy status";
    }

    IN MIR-POL-SUB-STAT-CD
    {
        Length = "2";
        CodeSource = "DataModel";
        CodeType = "SUBSC";
        DisplayOnly;
        SType = "Text";
        Label = "Policy Sub Status";
    }

    IN MIR-NUM-OF-INSRD
    {
        Length = "2";
        DisplayOnly;
        SType = "Text";
        Label = "Number Of Insured";
    }

    IN MIR-DV-CLI-NM
    {
        Length = "51";
        DisplayOnly;
        SType = "Text";
        Label = "Owner Name";
    }

    IN MIR-DV-CLI-KJ-NM
    {
        Length = "50";
        DisplayOnly;
        SType = "Text";
        Label = "Owner Kanji Name";
    }

    IN MIR-OWN-BTH-DT
    {
        Length = "10";
        DisplayOnly;
        SType= "Date";
        Label = "Owner's Birth Date";
    }
    
#143C38 CHANGES START
    
    IN MIR-TRAD-PD-TO-DT-NUM
    {
        Length = "10";
        DisplayOnly;
        SType= "Date";
        Label = "Trad Paid to Date";
    }
    
#143C38 CHANGES END

    IN MIR-UL-LAPS-STRT-DT
    {
        Length = "10";
        DisplayOnly;
        SType = "Date";
        Label = "Lapse Start Date";
    }

    IN MIR-XHBT-REINST-DT
    {
        Length = "10";
        DisplayOnly;
        SType = "Date";
        Label = "Reinstatement Date";
    }
    
#*ISLCLM CHANGE START
    IN MIR-CO-RECV-DT
    {
        Length = "10";
        DBTableName = "TDCBD";
        SType = "Date";
        Label = "Company Received Date";

    }
  
    IN MIR-CLMA-HO-ACPT-DT
    {
        Length = "10";
        DBTableName = "TDCLM";
        SType = "Date";
        Label = "HO Acceptance Date";

    } 
    
#*ISLCLM CHANGE END          

    IN MIR-CWA-RECPT-DT
    {
        Length = "10";
        DisplayOnly;
        SType = "Date";
        Label = "CWA Receipt Date";
    }

    IN MIR-DV-ASIGN-CLI-NM
    {
        Length = "30";
        DisplayOnly;
        SType = "Text";
        Label = "Asignee";
    }
    
#ISLCLM - Changes start here     
    IN MIR-SURR-FORM-ACPT-DT
    { 
        DisplayOnly;
        Length = "10";
        DBTableName = "TPOL";        
        SType = "Date";
        Label = "Surrender Request Form Acceptance Date";
    }
            
    IN MIR-ASIGN-SURR-EFF-DT
    { 
        DisplayOnly;
        Length = "10";
        DBTableName = "TPOL";                
        SType = "Date";
        Label = "Assigned Surrender Effective Date for Policy with Assignee";
    }
            
    IN MIR-POL-STEP-IN-RIGHT-IND
    { 
        DisplayOnly;
        Length = "1";
        DBTableName = "TPOL";                
        SType = "Text";
        Label = "Policy with Step-In Right";
    }     
#ISLCLM - Changes end here    

    IN MIR-CLM-TYP-CD
    {
        Length = "2";
        CodeSource = "DataModel";
        CodeType = "CLM-TYP-CD";
        DisplayOnly;
        SType = "Text";
        Label = "Claim Type";
    }

    IN MIR-CLM-EFF-DT
    {
        Length = "10";
        DisplayOnly;
        SType = "Date";
        Label = "Effective Date";
    }

    IN MIR-CAUSE-TYP-CD
    {
        DisplayOnly;
        Length = "3";
        SType = "Text";
        Label = "Cause Code";
    }

    IN MIR-CAUSE-DESC-TXT
    {
        DisplayOnly;
        Length= "40";
        SType = "Text";
        Label = "Cause Description";
    }

    IN MIR-LNB-CLM-TYP-CD
    {
        Length= "2";
        CodeSource = "Edit";
        CodeType = "LTAMT";
        DisplayOnly;
        SType = "Text";
        Label = "Living Needs Claim Type";
    }

    IN MIR-LNB-CLM-AMT
    {
#M245B2 CHANGES START HERE    
        CurrencyCode = "MIR-POL-CRCY-CD";
#M245B2 CHANGES END HERE 
        DisplayOnly;
        Length = "15";
        SType = "Currency";
        Label = "Living Needs Claim Amount";
    }

    IN MIR-TCB-CLM-TYP-CD
    {
        Length = "2";
        CodeSource = "Edit";
        CodeType = "LTAMT";
        DisplayOnly;
        SType = "Text";
        Label = "Terminal Care Claim Type";
    }

    IN MIR-TCB-CLM-AMT
    {
#M245B2 CHANGES START HERE    
        CurrencyCode = "MIR-POL-CRCY-CD";
#M245B2 CHANGES END HERE 
        DisplayOnly;
        Length = "15";
        SType = "Currency";
        Label = "Terminal Care Claim Amount";
    }

    IN MIR-BNFY-SEQ-NUM-T[05]
    {
        Length = "3";
        FieldGroup = "Table1";
        DisplayOnly;
        SType = "Text";
        Label = "Sequence Number";
        Index = "1";
    }

    IN MIR-BENE-INSRD-CLI-ID-T[05]
    {
        Length = "10";
        FieldGroup = "Table1";
        DisplayOnly;
        SType = "Text";
        Label = "Client Number";
        Index = "1";
    }

    IN MIR-BENE-BNFY-NM-T[05]
    {
        #TLB041 CHANGES START HERE
        #Length = "54";
        Length = "100";	
	#TLB041 CHANGES END HERE
        FieldGroup = "Table1";
        DisplayOnly;
        SType = "Text";
        Label = "Beneficiary's Name";
        Index = "1";
    }

    IN MIR-BNFY-TYP-CD-T[05]
    {
        Length = "1";
        FieldGroup = "Table1";
        DisplayOnly;
        CodeSource = "DataModel";
        CodeType   = "BNFY-TYP-CD";
        SType = "Text";
        Label = "Beneficiary Type";
        Index = "1";
    }

    IN MIR-BNFY-DESGNT-CD-T[05]
    {

        Length = "1";
        FieldGroup = "Table1";
        DisplayOnly;
        CodeSource = "DataModel";
        CodeType   = "BNFY-DESGNT-CD";
        SType = "Text";
        Label = "Designation";
        Index = "1";
    }

    IN MIR-BNFY-PRCDS-PCT-T[05]
    {
        Length = "3";
        FieldGroup = "Table1";
        DisplayOnly;
        SType = "Number";
        Label = "Percentage";
        Index = "1";
    }

    IN MIR-BNFY-REL-INSRD-CD-T[05]
    {
        Length = "5";
        FieldGroup = "Table1";
        DisplayOnly;
#ABU209 CHANGES START HERE       
        CodeSource = "EDIT";
        CodeType   = "BTOI";  
#ABU209 CHANGES END HERE        
        SType = "Text";
        Label = "Relation to the Insured";
        Index = "1";
    }

    IN MIR-BNFY-MINR-IND-T[05]
    {
        Length = "1";
        FieldGroup = "Table1";
        DisplayOnly;
        CodeSource = "DataModel";
        CodeType   = "BNFY-MINR-IND";
        SType = "Indicator";
        Label = "Beneficiary is a Minor";
        Index = "1";
    }
#M245Q2 CHANGES START HERE

    IN MIR-PAYO-MTHD-CD
    {
  	Length = "18";
        DisplayOnly;
    	CodeSource = "DataModel";
    	CodeType = "PAYO-MTHD-CD";
    	DBTableName = "TDCBD";
    	SType = "Text";
    	Label = "Payout Method";  	
    }  
    
    IN MIR-PAYO-JPY-BNFT-CD
    {
    	Length = "12";
        DisplayOnly;
    	CodeSource = "DataModel";
    	CodeType = "PAYO-JPY-BNFT-CD";
    	DBTableName = "TDCBD";
    	SType = "Text";
    	Label = "JPY Benefit Rider";
      
  }  
#M245Q2 CHANGES END HERE

#M319A7 CHANGES START HERE
        
    IN MIR-XCHNG-BASE-DT 
    {
        Length = "10";
        DisplayOnly;  	    
        SType = "Date";
        Label = "Exchange Base Date";   	
    }  
        
#M319A7 CHANGES END HERE
    IN MIR-PAYEE-NM-TXT-T[05]
    {
        Length = "30";
        FieldGroup = "Table2";
        KeyColumn;
        DisplayOnly;
        SType = "Text";
        Label = "Kanji Payee Name";
        Index = "1";
    }

    IN MIR-BNK-NM-T[05]
    {
        Length = "36";
        FieldGroup = "Table2";
        DisplayOnly;
        SType = "Text";
        Label = "Bank Name";
    }

    IN MIR-BNK-BR-NM-T[05]
    {
        Length = "36";
        FieldGroup = "Table2";
        DisplayOnly;
        SType = "Text";
        Label = "Branch Name";
    }

    IN MIR-ACCT-TYP-CD-T[05]
    {
        Length = "3";
        FieldGroup = "Table2";
        DisplayOnly;
        CodeSource = "EDIT";
        CodeType = "FBACC";
        SType = "Text";
        Label = "Account Type";
    }

    IN MIR-DCRL-BNK-ACCT-ID-T[05]
    {
        Length = "7";
        FieldGroup = "Table2";
        DisplayOnly;
        Mandatory;
        SType = "Text";
        Label = "Bank Account Number";
    }

    IN MIR-DCRL-ACCT-HLDR-NM-T[05]
    {
        Length = "50";
        FieldGroup = "Table2";
        DisplayOnly;
        Mandatory;
        SType = "Text";
        Label = "Account Holder Name";
    }

    IN MIR-DCRL-KJ-ADDR-TXT-T[05]
    {
        Length = "50";
        FieldGroup = "Table2";
        DisplayOnly;
        SType = "Text";
        Label = "Kanji Address";
    }

    IN MIR-DCRL-SAMAKATA-BU-TXT-T[05]
    {
        DisplayOnly;
        MixedCase;
        Length = "72";
        FieldGroup = "Table2";
        SType = "Text";
        Label = "Samakata-bu";
        Index = "1";
    }

    IN MIR-DCRL-SEND-PMT-NOTI-IND-T[05]
    {
        Length = "1";
        FieldGroup = "Table2";
        DisplayOnly;
        SType = "Indicator";
        Label = "Send Payment Notice";
        Index = "1";
    }

    IN MIR-DCRL-INSRD-REL-CD-T[05]
    {
        Length = "1";
        FieldGroup = "Table2";
        CodeSource = "EDIT";
        CodeType = "CLMRL";
        DisplayOnly;
        SType = "Selection";
        Label = "Relation to Beneficiary";
        Index = "1";
    }

    IN MIR-DCRL-PAYE-STAT-CD-T[05]
    {
        Length = "1";
        FieldGroup = "Table2";
        CodeSource = "DataModel";
        CodeType = "DCRL-PAYE-STAT-CD";
        DisplayOnly;
        SType = "Text";
        Label = "Payee Status";
        Index = "1";
    }

    IN MIR-KJ-PAYEE-NM-TXT-T[05]
    {
        Length = "50";
        FieldGroup = "Table3";
        DisplayOnly;
        SType = "Text";
        Label = "Payee";
        Index = "1";
    }

# M287C9 CHANGES STARTS HERE
    
    IN MIR-INDV-KA-SUR-NM-T[05] 
    {
        DisplayOnly;
        FieldGroup = "table3";
        Index = "1";
        Length = "25";
        SType = "Text";
        Label = "Last Name";
    }

    IN MIR-INDV-KA-GIV-NM-T[05] 
    {
        DisplayOnly;
        FieldGroup = "table3";
        Index = "1";
        Length = "25";
        SType = "Text";
        Label = "First Name";
    }

    IN MIR-CO-KA-NM-T[05] 
    
    {
        DisplayOnly;
        FieldGroup = "table3";
        Index = "1";
        Length = "50";
        SType = "Text";
        Label = "Company Name";
    }
    IN MIR-PAYEE-CLI-SEX-CD-T[05]
    {
        DisplayOnly;
        FieldGroup = "table3";
        Index = "1";
        Length = "40";
        CodeSource = "DataModel";
        CodeType = "CLI-SEX-CD";
        SType = "Text";
        Label = "Sex";
    }
    IN MIR-PAYEE-CLI-BTH-DT-T[05]
    {
        DisplayOnly;
        FieldGroup = "table3";
        Index = "1";
        Length = "10";
        SType = "Date";
        Label = "Birth Date";
    } 
# M287C9 CHANGES ENDS HERE
    

# M271C9 CHANGES START HERE
    IN MIR-BNK-NM-1-T[05]
    {
        Length = "36";
        FieldGroup = "Table2";
        DisplayOnly;
        SType = "Text";
        Label = "Bank Name";
    }

    IN MIR-BNK-BR-NM-1-T[05]
    {
        Length = "36";
        FieldGroup = "Table2";
        DisplayOnly;
        SType = "Text";
        Label = "Branch Name";
    }

    IN MIR-ACCT-TYP-CD-1-T[05]
    {
        Length = "3";
        FieldGroup = "Table2";
        DisplayOnly;
        CodeSource = "EDIT";
        CodeType = "FBACC";
        SType = "Text";
        Label = "Account Type";
    }

    IN MIR-DCRL-BNK-ACCT-ID-1-T[05]
    {
        Length = "7";
        FieldGroup = "Table2";
        DisplayOnly;
        Mandatory;
        SType = "Text";
        Label = "Bank Account Number";
    }

    IN MIR-DCRL-ACCT-HLDR-NM-1-T[05]
    {
        Length = "50";
        FieldGroup = "Table2";
        DisplayOnly;
        Mandatory;
        SType = "Text";
        Label = "Account Holder Name";
    }

# M271C9 CHANGES ENDS HERE
# IPCA02 CHANGES START HERE

    IN MIR-TAX-TYP-CD-T[05]
    {
        Length = "02";
        FieldGroup = "Table3";
	CodeSource = "DataModel";
	CodeType = "PAYE-TAX-TYP-CD";
	SType = "Text";
	DBTableName = "TDCRL";
	Label = "Display Tax Information";
        Index = "1";
    }

# IPCA02 CHANGES ENDS HERE

    IN MIR-PREM-ACUM-AMT-T[05]
    {
#Q52688 CHANGES START HERE    	
#M245B2 CHANGES START HERE    
#	        CurrencyCode = "MIR-POL-CRCY-CD";
#M245B2 CHANGES END HERE 
#Q52688 CHANGES END HERE 
        Length = "1";
        FieldGroup = "Table3";
        DisplayOnly;
        SType = "Currency";
        Label = "Total premium Collected Amount - Accumulation";
        Index = "1";
    }

    IN MIR-EXPL-RMRK-TXT-T[05]
    {
        Length = "120";
        FieldGroup = "Table3";
        DisplayOnly;
        SType = "Text";
        Label = "Explanatory Remarks";
        Index = "1";
    }

    IN MIR-CVG-NUM-T[25]
    {
        Length = "2";
        FieldGroup = "Table4";
        DisplayOnly;
        SType = "Text";
        Label = "Coverage Number";
        Index = "1";
    }

    IN MIR-PLAN-ID-T[25]
    {
        FieldGroup = "Table4";
        Length = "6";
        CodeSource = "EDIT";
        CodeType = "PLAN";
        DisplayOnly;
        SType = "Text";
        Label = "Plan";
        Index = "1";
    }

    IN MIR-CVG-ISS-EFF-DT-T[25]
    {
        Length = "10";
        FieldGroup = "Table4";
        DisplayOnly;
        SType = "Date";
        Label = "Issue Effective Date";
        Index = "1";
    }

    IN MIR-CVG-MAT-XPRY-DT-T[25]
    {
        Length = "10";
        FieldGroup = "Table4";
        DisplayOnly;
        SType = "Date";
        Label = "Coverage Maturity/Expiry Date";
        Index = "1";
    }

    IN MIR-CVG-CSTAT-CD-T[25]
    {
        Length = "3";
        FieldGroup = "Table4";
        CodeSource = "DataModel";
        CodeType = "CVG-CSTAT-CD";
        DisplayOnly;
        SType = "Text";
        Label = "Coverage Status";
        Index = "1";
    }

    IN MIR-CVG-SUB-STAT-CD-T[25]
    {
        Length = "2";
        FieldGroup = "Table4";
        CodeSource = "EDIT";
        CodeType = "SUBSC";
        DisplayOnly;
        SType = "Text";
        Label = "Coverage Sub Status";
        Index = "1";
    }

    IN MIR-CVG-FACE-AMT-T[25]
    {
#M245B2 CHANGES START HERE    
        CurrencyCode = "MIR-POL-CRCY-CD";
#M245B2 CHANGES END HERE 
        Length = "15";
        FieldGroup = "Table4";
        DisplayOnly;
        SType = "Currency";
        Label = "Face Amount";
        Index = "1";
    }

    IN MIR-BNFT-NM-ID-T[25]
    {
        Length = "5";
        FieldGroup = "Table4";
        CodeSource = "EDIT";
        CodeType = "BNNM";
        DisplayOnly;
        SType = "Text";
        Label = "Benefit Name";
        Index = "1";
    }
# ABF423 The attribute Signed is added    

    IN MIR-CLM-ADJC-AMT-T[25]
    {
#M245B2 CHANGES START HERE    
        CurrencyCode = "MIR-POL-CRCY-CD";
#M245B2 CHANGES END HERE 
        Signed;
        Length = "15";
        FieldGroup = "Table4";
        DisplayOnly;
        SType = "Currency";
        Label = "Amount for Adjudication";
        Index = "1";
     }

# ABF423 The attribute Signed is added
     IN MIR-CLM-PAYBL-AMT-T[25]
     {
 #M245B2 CHANGES START HERE    
         CurrencyCode = "MIR-POL-CRCY-CD";
#M245B2 CHANGES END HERE 
         Signed;
         Length = "15";
         FieldGroup = "Table4";
         DisplayOnly;
         SType = "Currency";
         Label = "Payable Amount";
         Index = "1";
     }
#M245Q2 CHANGE START HERE     
     IN MIR-DV-CLM-PAYBL-JPY-AMT-T[25]
     {
         Signed;       
         DisplayOnly;
         Length = "15";
	 FieldGroup = "Table4";
         DBTableName = "Derived";	 
         SType = "Currency";
         Label = "Payable Amount(Converted to JPY)";
         Index = "1";
     }
#M245Q2 CHANGE END HERE 
 
     IN MIR-CLM-OTHR-RFND-AMT-T[25]
     {
 #M245B2 CHANGES START HERE    
         CurrencyCode = "MIR-POL-CRCY-CD";
#M245B2 CHANGES END HERE 
         Length = "15";
         FieldGroup = "Table4";
         DisplayOnly;
         SType = "Currency";
         Label = "Other Refund Amount";
         Index = "1";
     }

     IN MIR-PAYE-T[25]
     {
         DisplayOnly;
         Length = "51";
         FieldGroup = "Table4";
         SType = "Text";
         Label = "Payee";
         Index ="1";
     }

     IN MIR-BNFT-DECID-CD-T[25]
     {
         Length = "2";
         FieldGroup = "Table4";
         CodeSource = "DataModel";
         CodeType = "BNFT-DECID-CD";
         DisplayOnly;
         SType = "Text";
         Label = "Decision";
         Index = "1";
     }

     IN MIR-BNFT-DCLN-REASN-CD-T[25]
     {
         Length = "2";
         FieldGroup = "Table4";
         CodeSource = "DataModel";
         CodeType = "BNFT-DCLN-REASN-CD";
         DisplayOnly;
         SType = "Text";
         Label = "Decline Reason";
         Index = "1";
     }
     
# ABF423 The attribute Signed is added

     IN MIR-TOT-ADJC-AMT
     {
 #M245B2 CHANGES START HERE    
        CurrencyCode = "MIR-POL-CRCY-CD";
#M245B2 CHANGES END HERE  
         Signed;
         DisplayOnly;
         Length = "15";
         SType = "Currency";
     }

     IN MIR-TOT-PAYBL-AMT
     {
 #M245B2 CHANGES START HERE    
         CurrencyCode = "MIR-POL-CRCY-CD";
#M245B2 CHANGES END HERE 
         Signed;
         DisplayOnly;
         Length = "15";
         SType = "Currency";

     }
  

     IN MIR-BNFT-TOT-REFND-AMT
     {
 #M245B2 CHANGES START HERE    
         CurrencyCode = "MIR-POL-CRCY-CD";
#M245B2 CHANGES END HERE 
         Length = "15";
         SType = "Currency";
         Index = "1";
     }


     IN MIR-OTHR-CVG-NUM-T[25]
     {
        Length = "2";
        FieldGroup = "Table5";
        DisplayOnly;
        SType = "Text";
        Label = "Coverage Number";
        Index = "1";
     }

    IN MIR-OTHR-PLAN-ID-T[25]
    {
        FieldGroup = "Table5";
        Length = "6";
        CodeSource = "EDIT";
        CodeType = "PLAN";
        DisplayOnly;
        SType = "Text";
        Label = "Plan";
        Index = "1";
    }

    IN MIR-OTHR-MAT-XPRY-DT-T[25]
    {
        Length = "10";
        FieldGroup = "Table5";
        DisplayOnly;
        SType = "Date";
        Label = "Coverage Maturity/Expiry Date";
        Index = "1";
    }

    IN MIR-OTHR-CSTAT-CD-T[25]
    {
        Length = "3";
        FieldGroup = "Table5";
        CodeSource = "DataModel";
        CodeType = "CVG-CSTAT-CD";
        DisplayOnly;
        SType = "Text";
        Label = "Coverage Status";
        Index = "1";
    }

    IN MIR-OTHR-SUB-STAT-CD-T[25]
    {
        Length = "2";
        FieldGroup = "Table5";
        CodeSource = "EDIT";
        CodeType = "SUBSC";
        DisplayOnly;
        SType = "Text";
        Label = "Coverage Sub Status";
        Index = "1";
    }

    IN MIR-OTHR-FACE-AMT-T[25]
    {
#M245B2 CHANGES START HERE    
        CurrencyCode = "MIR-POL-CRCY-CD";
#M245B2 CHANGES END HERE  
        Length = "15";
        FieldGroup = "Table5";
        DisplayOnly;
        SType = "Currency";
        Label = "Face Amount";
        Index = "1";
    }

    IN MIR-OTHR-ISS-EFF-DT-T[25]
    {
         Length = "10";
         FieldGroup = "Table4";
         DBTableName = "TCVG";
         SType = "Date";
         Label = "Issue Effective Date";
         Index = "1";
    }


    IN MIR-OTHR-INSRD-AGE-T[25]
    {
        DisplayOnly;
        Length = "03";
        FieldGroup = "Table4";
        SType = "Text";
        Label = "Issue Age";
        Index = "1";
    }

    IN MIR-OTHR-INSRD-CLI-NM-T[25]
    {
        Length = "51";
        FieldGroup = "Table4";
        DisplayOnly;
        SType = "Text";
        Label = "Insured Name";
    }

    IN MIR-OTHR-SEX-CD-T[25]
    {
        Length = "1";
        CodeSource = "DataModel";
        CodeType = "CLI-SEX-CD";
        FieldGroup = "Table4";
        DisplayOnly;
        Index = "1";
        SType = "Text";
        Label = "Sex";
    }

    IN MIR-OTHR-RFND-AMT-T[25]
    {
#M245B2 CHANGES START HERE    
        CurrencyCode = "MIR-POL-CRCY-CD";
#M245B2 CHANGES END HERE 
        Length = "15";
        FieldGroup = "Table5";
        DisplayOnly;
        SType = "Currency";
        Label = "Other Refund Amount";
        Index = "1";
    }

    IN MIR-OTHR-PAYE-T[25]
    {
        DisplayOnly;
        Length = "51";
        FieldGroup = "Table5";
        SType = "Text";
        Label = "Payee";
        Index ="1";
    }

    IN MIR-OTHR-DECID-CD-T[25]
    {
        Length = "2";
        FieldGroup = "Table5";
        CodeSource = "DataModel";
        CodeType = "BNFT-DECID-CD";
        DisplayOnly;
        SType = "Text";
        Label = "Decision";
        Index = "1";
    }

    IN MIR-OTHR-DCLN-REASN-CD-T[25]
    {
        Length = "2";
        FieldGroup = "Table5";
        CodeSource = "DataModel";
        CodeType = "BNFT-DCLN-REASN-CD";
        DisplayOnly;
        SType = "Text";
        Label = "Decline Reason";
        Index = "1";
    }

    IN MIR-CVG-TOT-RFND-AMT
    {
#M245B2 CHANGES START HERE    
        CurrencyCode = "MIR-POL-CRCY-CD";
#M245B2 CHANGES END HERE 
        Length = "15";
        SType = "Currency";
        FieldGroup = "Table5";
        Index = "1";
        DisplayOnly;
    }
    
# ABF423 The attribute Signed is added
    IN MIR-PMT-PAYBL-AMT
     {
#M245B2 CHANGES START HERE    
        CurrencyCode = "MIR-POL-CRCY-CD";
#M245B2 CHANGES END HERE 
        Signed;
        DisplayOnly;
        Length = "15"; 
        FieldGroup = "Table6"; 
        SType = "Currency"; 
        Label = "Payable Amount"; 

    }

    IN MIR-PMT-REFND-AMT
     {
#M245B2 CHANGES START HERE    
        CurrencyCode = "MIR-POL-CRCY-CD";
#M245B2 CHANGES END HERE 
        DisplayOnly;
        Length = "15"; 
        SType = "Currency"; 
        Label = "Others Refund Amount"; 

    }

#M319A7 CHANGES START HERE
    IN MIR-UNEARN-PREM-AMT
     {   
        CurrencyCode = "MIR-POL-CRCY-CD";
        DisplayOnly;
        Length = "15"; 
        SType = "Currency"; 
        Label = "Unearned Premium"; 
     }
#M319A7 CHANGES END HERE
#TV2024 CHANGES START HERE
    IN MIR-PREM-DED-AMT
     {
         CurrencyCode = "MIR-POL-CRCY-CD";
         DisplayOnly;
         Length = "15";
         SType = "Currency";
         Label = "Premium Amount to Deduct";
     }
#TV2024 CHANGES END HERE
#UY3054A CHANGES START HERE
    IN MIR-OTHR-PAY-TOT-AMT
     {
         CurrencyCode = "MIR-POL-CRCY-CD";
         DisplayOnly;
         Length = "15";
         SType = "Currency";
         Label = "Other payment amount total";
     }
#UY3054A CHANGES END HERE  
# ABF423 The attribute Signed is added

    IN MIR-PMT-TOT-AMT
    {
 #M245B2 CHANGES START HERE    
         CurrencyCode = "MIR-POL-CRCY-CD";
#M245B2 CHANGES END HERE 
         Signed;
         DisplayOnly;
         Length = "15";
         SType = "Currency";
         Label = "Total";

    }
#M245Q2 CHANGES START HERE
    IN MIR-DV-CLM-NET-PAYBL-AMT-T[25]
    {
         Signed;
         CurrencyCode = "MIR-POL-CRCY-CD";
         Length = "15";
     	 DisplayOnly;  
         FieldGroup = "Table7";
         DBTableName = "Derived";
         SType = "Currency";
         Label = "Net Payable Amount:";
         Index = "1";
    }
    IN MIR-CLM-JPY-XCHNG-RT-T[25]
    {
         Signed;
         Length = "18";
  	 DisplayOnly;  
         FieldGroup = "Table7";  	 
         DBTableName = "TCXRT";
         SType = "Text";
         Label = "Exchange Rate to JPY:";
         Index = "1";
    } 
    IN MIR-DV-CLM-NET-PAYBL-JPY-AMT-T[25]
    {
         Signed;  
#Q52997 CHANGES START HERE 
         CurrencyCode = "MIR-DISB-CRCY-CD";
#Q52997 CHANGES START HERE          
         Length = "15";
     	 DisplayOnly;  
         FieldGroup = "Table7";
         DBTableName = "Derived";
         SType = "Currency";
         Label = "Net Payable Amount (In Pay Out Currency):";
         Index = "1";
    }    
    IN MIR-DLAY-INT-STRT-DT-T[25]
    {
         Length = "10";
     	 DisplayOnly;
         FieldGroup = "Table7";  
         DBTableName = "TDCBD";
         SType = "Date";
         Label = "Delay Interest Start Date:";
         Index = "1";
    }    
    IN MIR-DYS-BFR-PMT-DUE-T[25]
    {
         Length = "03";
   	 DisplayOnly;  
         FieldGroup = "Table7";
         CodeSource = "DataModel";
         CodeType = "DYS-BFR-PMT-DUE";
         DBTableName = "TDCBD";
         SType = "Text";
         Label = "Days Before Claim Payment Due:";
         Index = "1";
     }
             	              
     IN MIR-DLAY-INT-ARR-DUR-T[25]
     {
         Length = "4";
	 DisplayOnly;  
         FieldGroup = "Table7";
         DBTableName = "TDCBD";
         SType = "Text";
         Label = "Number of Days of delay Interest:";
         Index = "1";
     }
     IN MIR-DLAY-INT-AMT-T[25]
     {
         Length = "15";
         CurrencyCode = "MIR-DISB-CRCY-CD";         
	 DisplayOnly;  
         FieldGroup = "Table7";
         DBTableName = "TDCBD";
         SType = "Currency";
         Label = "Delay Interest Amount:";
         Index = "1";
     }
     
     IN MIR-DV-REMIT-AMT-T[25]
     {
         Signed;
         CurrencyCode = "MIR-DISB-CRCY-CD";         
         Length = "15";
         DisplayOnly;  
         FieldGroup = "Table7";
         DBTableName = "Derived";
         SType = "Currency";
         Label = "Remittance Amount:";
         Index = "1";
      }
#M245Q2 CHANGES END HERE

#M271A3 CHANGES STARTS HERE
	IN MIR-PREM-RFND-AMT-T[30] 
	  {
	   CurrencyCode = "MIR-PMT-CRCY-CD";
	   DisplayOnly;
	   FieldGroup = "Table13";
	   Index = "1";
	   Label = "Premium Refund Amount:";
	   Length = "15";
	   SType = "Currency";
	  }		

	IN MIR-PREM-RFND-DLAY-INT-DUR-T[30] 
	  {
	   DisplayOnly;
	   FieldGroup = "Table13";
	   Index = "1";
	   Label = "Number of Days of Delay Interest:";
	   Length = "4";
	   SType = "Date";
	  }

	IN MIR-PREM-RFND-DLAY-INT-AMT-T[30] 
	  {
	   CurrencyCode = "MIR-PMT-CRCY-CD";
	   DisplayOnly;
	   FieldGroup = "Table13";
	   Index = "1";
	   Label = "Delay Interest Amount:";
	   Length = "15";
	   SType = "Currency";
	  }
	IN MIR-DV-PREM-RFND-REMIT-AMT-T[30] 
	  {
	   CurrencyCode = "MIR-PMT-CRCY-CD";
	   DisplayOnly;
	   FieldGroup = "Table13";
	   Index = "1";
	   Label = "Remittance Amount:";
	   Length = "15";
	   SType = "Currency";
	  }

	IN MIR-PMT-CRCY-CD
	  {
	   Length = "2";           
	   SType = "Hidden";
	   Label = "Currency";
	  }	
#M271A3 CHANGES END HERE

    IN MIR-MSG-TXT-T[18]
    {
        Length = "120";
        FieldGroup = "Table6";  
        DisplayOnly;  
        SType = "Text";  
        Label = "Adjudication Message";  
        Index = "1";  
     }


     IN MIR-PREV-UPDT-DT-T[15]
     {
         FieldGroup = "Table6";
         Length = "10";
         DisplayOnly;
         SType = "Date";
         Index = "1";
         Label = "Previous Update Date";
     }

     IN MIR-PREV-UPDT-USER-ID-T[15]
     {
         FieldGroup = "Table6";
         Index = "1";
         Length = "8";
         DisplayOnly;
         SType = "Text";
         Label = "Previous Update User ID";
     }

     IN MIR-CLM-NOTE-TXT-T[15]
     {
         FieldGroup = "Table6";
         Index = "1";
         Length = "500";
         DisplayOnly;
         SType = "Text";
         Label = "Claim Note";
      }

#* M213M2 CHANGES BEGIN

      IN MIR-CANCER-TYP-CD 
      {
          Length = "1";
          CodeSource = "Edit";
          CodeType = "CANCD";
          DisplayOnly;
          SType = "Text";
          Label = "Cancer Type";
      }

      IN MIR-TRANSPLT-TYP-CD
      {
      
           Length = "2";
           CodeSource = "Edit";
           CodeType = "TRSTY";
           DisplayOnly;
           SType = "Text";
           Label = "Transplant Type";
      }

 #* M213M2 CHANGES END
 
 #M245B2 CHANGES START HERE      
         INOUT MIR-POL-CRCY-CD
          {
             Length = "2";           
             SType = "Hidden";
             Label = "Currency";
    }
#M245B2 CHANGES END HERE    
#M245Q2 CHANGES START HERE      
         INOUT MIR-DISB-CRCY-CD
          {
             Length = "2";           
             SType = "Hidden";
             Label = "Currency";
    }
#M245Q2 CHANGES END HERE 
#*MP300C CHANGES START
        IN MIR-PRE-LCD-CHK-IND
        {
                Length = "01";
                CodeSource = "DataModel";
                CodeType = "PRE-LCD-CHK-IND";
                SType = "Text";
                Label = "Pre-LCD Check";
        }
#*MP300C CHANGES END
#CS0008 CHANGES START
        IN MIR-TRMN-NOTI-CD
        {
         Length = "01";
         CodeSource = "DataModel";
         CodeType = "TRMN-NOTI-CD";
         FieldGroup = "Table7";
         DBTableName = "TDCBD";
         SType = "Text";
         Label = "Policy Continuation/Termination";
        }
#CS0008 CHANGES END

#UY3077 CHANGES START HERE

     IN MIR-LNB-PREM-AMT-T[25]
     { 
         CurrencyCode = "MIR-POL-CRCY-CD";
         DisplayOnly;
         Length = "15";
         SType = "Currency";
         Label = "Premium (for 6 months)";
         Index = "1";
     }
     
     IN MIR-LNB-INT-AMT-T[25]
     { 
         CurrencyCode = "MIR-POL-CRCY-CD";
         DisplayOnly;
         Length = "15";
         SType = "Currency";
         Label = "Interest";
         Index = "1";    
     } 

     IN MIR-TOT-LNB-PREM-AMT
     { 
         CurrencyCode = "MIR-POL-CRCY-CD";
         DisplayOnly;
         Length = "15";
         SType = "Currency";
         Label = "Premium (for 6 months)";
     }
     
     IN MIR-TOT-LNB-INT-AMT
     { 
         CurrencyCode = "MIR-POL-CRCY-CD";
         DisplayOnly;
         Length = "15";
         SType = "Currency";
         Label = "Interest";
     } 

     IN MIR-PREM-CHNG-REASN-CD-T[25]
     { 
         DisplayOnly;
         CodeSource = "DataModel";
         CodeType = "MODIF-REASN-CD";
         Length = "02";
         SType = "Text";
         Label = "Modification Reason";
         Index = "1";    
     }      
    
#UY3077 CHANGES ENDS HERE

#MP302L CHANGES START HERE
    IN MIR-SRVBEN-DEFR-AMT
        {
             CurrencyCode = "MIR-POL-CRCY-CD";
             DisplayOnly;
             Length = "15";
             SType = "Currency";
             Label = "Survival Benefit Deferral Amount";
        }
    
    IN MIR-SRVBEN-DEFR-INT-AMT
        { 
             CurrencyCode = "MIR-POL-CRCY-CD";
             DisplayOnly;
             Length = "15";
             SType = "Currency";
             Label = "Deferral Interest";
        }
         
    IN MIR-SRVBEN-TOT-AMT
        {
             CurrencyCode = "MIR-POL-CRCY-CD";
             DisplayOnly;
             Length = "15";
             SType = "Currency";
             Label = "Total";
        }
        
    IN MIR-SRVBEN-CHRGBCK-AMT
            {
             CurrencyCode = "MIR-POL-CRCY-CD";
             DisplayOnly;
             Length = "15";
             SType = "Currency";
             Label = "Chargeback Amount";
            }
#MP302L CHANGES END HERE 
#ULMG13 CHANGES START HERE
    IN MIR-POST-LAPS-SUR-AMT
         {
             CurrencyCode = "MIR-POL-CRCY-CD";
             DisplayOnly;
             Length = "15";
             SType = "Currency";
             Label = "Cash Surrender Value";
         }
#ULMG13 CHANGES END HERE
  }
