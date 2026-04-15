# Converted from PathFinder 2.2 to 3.0 Jun 18, 2004 3:13:59 PM EDT

#*******************************************************************************
#*  Component:   BF9B00-P.p                                                    *
#*  Description: Death Claim Summary Sheet(for UL)                             *
#*                                                                             *
#*******************************************************************************
#*  Chg#    Release  Description                                               *
#*  IPCASS  CTS      Intial Version                                            *
#*  IPCA02  CTS      CHANGED DISPLAY TAX INFORMATION FIELD FROM CHECKBOX TO    *
#*  IPCA02           DROPDROWN                                                 *
#*  ABU209  CTS      FIX TO DISPLAY RELATION TO INSURED                        *
#*  ABF423  CTS     CHANGES MADE TO DISPLAY THE SIGN FOR CLAIM                 *
#*                  PAYABLE AMOUNT                                             *
#*  ISLCLM  CTS      ADDED STEP-IN RIGHT INFORMATION FIELDS                    *
#*  143C38  CTS      ADDED A NEW FIELD TO DISPLAY THE TRAD PAID                *
#*                   TO DATE FOR NWL AND AMI DEATH CLAIMS                      *      
#*  M213M2 CTS       CHANGES DONE TO ADD A CANCER TYPE AND TRANSPLANT TYPE     * 
#*  M245B2  CTS      Foreign Currency Formatting 			       *
#*  M245Q2  CTS      SPWL CHANGES FOR DEATH CLAIMS                             *
#*  M271A3  CTS      FRA DEATH CLAIMS CHANGES                                  *
#*  M271C9  CTS      CHANGES AS PART OF CR4 SECOND PAYEE DETAILS              **
#*  M287C9  CTS      CHANGES AS PART OF CR9 PAYEE DETAILS                      *
#*  MP300C  CTS      CHANGES TO ADD NEW FIELD PRE-LCD CHECK INDICATOR FOR ETC  *
#*  MP302L  CTS     TD SURVIVAL BENEFIT DEATH CLAIM CHANGES                    *
#*  M319A7  CTS      CHANGES FOR FXWL DEATH CLAIM PROCESSING                   *
#*  CS0008  CTS      CSA IMPROVEMENTS-DEATH CLAIM CHANGES                     **
#*  TV2024  CTS      CHANGES AS PERT OF SULv2 DEATH CLAIM                      *
#*  TLB041  CTS      CORPORATE POLICY HOLDER NAME & ADDRESS EXPANSION          *
#*  ULMG13  CTS      CHANGES DONE FOR LAPSE RIDER AS PART OF UL MEDICAL RIDER  *
#*  UY3077  CTS      LIVING NEEDS STREAM 3                                     *
#*******************************************************************************


P-STEP BF9B00-P
{
    ATTRIBUTES
    {
        BusinessFunctionId = "9B00";
        BusinessFunctionName = "Death Claim Summary Sheet(for UL)";
        BusinessFunctionType = "Retreive";
        MirName = "CCWM9B00";
    }

    OUT LSIR-RETURN-CD;

    OUT MIR-RETRN-CD;

    IN MIR-CLM-ID
    {
        Key;
        Mandatory;
        Length = "8";
        DBTableName = "TDCLM";
        DefaultSession = "MIR-CLM-ID";
        SType = "Text";
        Label = "Death Master Claim ID";
    }

    OUT MIR-POL-ID
    {
        Length = "10";
        DBTableName = "TDCLM";
        SType = "Text";
        Label = "Policy ID";
    }

    OUT MIR-CLM-STAT-CD
    {
        Length = "1";
        CodeSource = "DataModel";
        CodeType = "CLM-STAT-CD";
        SType = "Text";
        Label = "Death Master Claim Status";
    }

    OUT MIR-INSRD-CLI-ID
    {
        Length = "10";
        DBTableName = "TDCLM";
        SType = "Text";
        Label = "Client ID";
    }

    OUT MIR-INSRD-CLI-NM
    {
        Length = "51";
        DBTableName = "TCLI";
        SType = "Text";
        Label = "Insured Name";
    }

    OUT MIR-INSRD-KJ-NM
    {
        Length = "50";
        DBTableName = "TCLI";
        SType = "Text";
        Label = "Insured Kanji Name";
    }

    OUT MIR-CLI-BTH-DT
    {
        Length = "10";
        DBTableName = "TCLI";
        SType = "Date";
        Label = "Date of Birth";
    }

    OUT MIR-CLI-SEX-CD
    {
        Length = "1";
        CodeSource = "DataModel";
        CodeType = "CLI-SEX-CD";
        DBTableName = "TCLI";
        SType = "Text";
        Label = "Sex";
    }

    OUT MIR-CLM-HO-ACPT-DT
    {
        Length = "10";
        DBTableName = "TDCLM";
        SType = "Date";
        Label = "Head Office Claim Form Acceptance Date";
    }

    OUT MIR-RO-ID
    {
        Length = "5";
        DBTableName = "TDCLM";
        SType = "Text";
        Label = "RO";
    }

    OUT MIR-SO-ID
    {
        Length = "5";
        DBTableName = "TDCLM";
        SType = "Text";
        Label = "SO";
    }

    OUT MIR-POL-CNVR-TYP-CD
    {
        Length = "2";
        CodeSource = "DataModel";
        CodeType = "CNVR-TYP-CD";
        DBTableName = "TPOL";
        SType = "Text";
        Label = "Policy Source";
    }

    OUT MIR-POL-CSTAT-CD
    {
        Length = "4";
        CodeSource = "DataModel";
        CodeType = "POL-CSTAT-CD";
        DBTableName = "TPOL";
        SType = "Text";
        Label = "Current Policy status";
    }

    OUT MIR-POL-SUB-STAT-CD
    {
        Length = "2";
        CodeSource = "Edit";
        CodeType = "SUBSC";
        DBTableName = "TPOL";
        SType = "Text";
        Label = "Policy Sub Status";
    }

    OUT MIR-NUM-OF-INSRD
    {
        Length = "2";
        DBTableName = "TCVG";
        SType = "Text";
        Label = "Number Of Insured";
    }

    OUT MIR-DV-CLI-NM
    {
        Length = "51";
        DBTableName = "TCLNM";
        SType = "Text";
        Label = "Owner Name";
    }

    OUT MIR-DV-CLI-KJ-NM
    {
        Length = "50";
        DBTableName = "TCLNM";
        SType = "Text";
        Label = "Owner Kanji Name";
    }

    OUT MIR-OWN-BTH-DT
    {
        Length = "10";
        DBTableName = "TCLI";
        SType= "Date";
        Label = "Owner's Birth Date";
    }
#143C38 CHANGES START
    
    OUT MIR-TRAD-PD-TO-DT-NUM
    {
            Length = "10";
            DBTableName = "TCLI";
            SType= "Date";
            Label = "Trad Paid to Date";
    }
  
#143C38 CHANGES END

    OUT MIR-UL-LAPS-STRT-DT
    {
        Length = "10";
        DBTableName = "TPOL";
        SType = "Date";
        Label = "Lapse Start Date";
    }

    OUT MIR-XHBT-REINST-DT
    {
        Length = "10";
        DBTableName = "TCVG";
        SType = "Date";
        Label = "Reinstatement Date";
    }
    
#*ISLCLM CHANGE START
    OUT MIR-CO-RECV-DT
    {
        Length = "10";
        DBTableName = "TDCBD";
        SType = "Date";
        Label = "Company Received Date";

    }
  
    OUT MIR-CLMA-HO-ACPT-DT
    {
        Length = "10";
        DBTableName = "TDCLM";
        SType = "Date";
        Label = "HO Acceptance Date";

    } 
    
#*ISLCLM CHANGE END      

    OUT MIR-CWA-RECPT-DT
    {
        Length = "10";
        DBTableName = "TCWAR";
        SType = "Date";
        Label = "CWA Receipt Date";
    }

    OUT MIR-DV-ASIGN-CLI-NM
    {
        Length = "30";
        SType = "Text";
        Label = "Asignee";

    }
    
# ISLCLM - Changes start here     
    OUT MIR-SURR-FORM-ACPT-DT
    { 
        DisplayOnly;
        Length = "10";
        DBTableName = "TPOL";        
        SType = "Date";
        Label = "Surrender Request Form Acceptance Date";
    }
          
    OUT MIR-ASIGN-SURR-EFF-DT
    { 
        DisplayOnly;
        Length = "10";
        DBTableName = "TPOL";                
        SType = "Date";
        Label = "Assigned Surrender Effective Date for Policy with Assignee";
    }
          
    OUT MIR-POL-STEP-IN-RIGHT-IND
    { 
        DisplayOnly;
        Length = "1";
        DBTableName = "TPOL";                
        SType = "Text";
        Label = "Policy with Step-In Right";
    }    
# ISLCLM - Changes end here
    

    OUT MIR-CLM-TYP-CD
    {
        Length = "2";
        CodeSource = "DataModel";
        CodeType = "CLM-TYP-CD";
        DBTableName = "TDCLM";
        SType = "Text";
        Label = "Claim Type";
    }

    OUT MIR-CLM-EFF-DT
    {
        Length = "10";
        DBTableName = "TDCLM";
        SType = "Date";
        Label = "Effective Date";
    }

    OUT MIR-CAUSE-TYP-CD
    {
        Length = "3";
        SType = "Text";
        DBTableName = "TDCLM";
        Label = "Cause Code";
    }

    OUT MIR-CAUSE-DESC-TXT
    {
        Length= "40";
        SType = "Text";
        Label = "Cause Description";
    }

    OUT MIR-LNB-CLM-TYP-CD
    {
        Length= "2";
        CodeSource = "Edit";
        CodeType = "LTAMT";
        DBTableName = "TDCLM";
        SType = "Text";
        Label = "Living Needs Claim Type";
    }

    OUT MIR-LNB-CLM-AMT
    {
        Length = "15";
        SType = "Currency";
        DBTableName = "TDCLM";
        Label = "Living Needs Claim Amount";
    }

    OUT MIR-TCB-CLM-TYP-CD
    {
        Length = "2";
        CodeSource = "Edit";
        CodeType = "LTAMT";
        DBTableName = "TDCLM";
        SType = "Text";
        Label = "Terminal Care Claim Type";
    }

    OUT MIR-TCB-CLM-AMT
    {
        Length = "15";
        SType = "Currency";
        DBTableName = "TDCLM";
        Label = "Terminal Care Claim Amount";
    }

    OUT MIR-BNFY-SEQ-NUM-T[05]
    {
        Length = "3";
        FieldGroup = "Table1";
        DBTableName = "TBENE";
        SType = "Text";
        Label = "Sequence Number";
        Index = "1";
    }

    OUT MIR-BENE-INSRD-CLI-ID-T[05]
    {
        Length = "10";
        FieldGroup = "Table1";
        DBTableName = "TBENE";
        SType = "Text";
        Label = "Client Number";
        Index = "1";
    }

    OUT MIR-BENE-BNFY-NM-T[05]
    {
        #TLB041 CHANGES START HERE
        #Length = "54";
        Length = "100";	
	#TLB041 CHANGES END HERE
        FieldGroup = "Table1";
        DBTableName = "TBENE";
        SType = "Text";
        Label = "Beneficiary's Name";
        Index = "1";
    }

    OUT MIR-BNFY-TYP-CD-T[05]
    {
        Length = "1";
        FieldGroup = "Table1";
        DBTableName = "TBENE";
        CodeSource = "DataModel";
        CodeType   = "BNFY-TYP-CD";
        SType = "Text";
        Label = "Beneficiary Type";
        Index = "1";
    }

    OUT MIR-BNFY-DESGNT-CD-T[05]
    {
        Length = "1";
        FieldGroup = "Table1";
        DBTableName = "TBENE";
        CodeSource = "DataModel";
        CodeType   = "BNFY-DESGNT-CD";
        SType = "Text";
        Label = "Designation";
        Index = "1";
    }

    OUT MIR-BNFY-PRCDS-PCT-T[05]
    {
        Length = "3";
        FieldGroup = "Table1";
        DBTableName = "TBENE";
        SType = "Number";
        Label = "Percentage";
        Index = "1";
    }

    OUT MIR-BNFY-REL-INSRD-CD-T[05]
    {
        Length = "5";
        FieldGroup = "Table1";
        DBTableName = "TBENE";
#ABU209 CHANGES START HERE       
        CodeSource = "EDIT";
        CodeType   = "BTOI";  
#ABU209 CHANGES END HERE                
        SType = "Text";
        Label = "Relation to the Insured";
        Index = "1";
    }

    OUT MIR-BNFY-MINR-IND-T[05]
    {
        Length = "1";
        FieldGroup = "Table1";
        DBTableName = "TBENE";
        CodeSource = "DataModel";
        CodeType   = "BNFY-MINR-IND";
        SType = "Indicator";
        Label = "Beneficiary is a Minor";
        Index = "1";
    }
#M245Q2 CHANGES START HERE
    OUT MIR-PAYO-MTHD-CD 
    {
  	Length = "18";
    	CodeSource = "DataModel";
    	CodeType = "PAYO-MTHD-CD";
    	DBTableName = "TDCBD";
    	SType = "Text";
    	Label = "Payout Method";  	
    }  

    OUT MIR-PAYO-JPY-BNFT-CD 
    {
    	Length = "12";
    	CodeSource = "DataModel";
    	CodeType = "PAYO-JPY-BNFT-CD";
    	DBTableName = "TDCBD";
    	SType = "Text";
    	Label = "JPY Benefit Rider";    	
  }  
#M245Q2 CHANGES END HERE
#M319A7 CHANGES START HERE
        
    OUT MIR-XCHNG-BASE-DT 
    {
        Length = "10";
	DisplayOnly;  	    
	SType = "Date";
	Label = "Exchange Base Date";   	
    }  
        
#M319A7 CHANGES END HERE
    OUT MIR-PAYEE-NM-TXT-T[05]
    {
        Length = "30";
        FieldGroup = "Table2";
        KeyColumn;
        DBTableName = "Derived";
        SType = "Text";
        Label = "Kanji Payee Name";
        Index = "1";
    }

    OUT MIR-BNK-NM-T[05]
    {
        Length = "36";
        FieldGroup = "Table2";
        DBTableName = "TBNKB";
        SType = "Text";
        Label = "Bank Name";
    }

    OUT MIR-BNK-BR-NM-T[05]
    {
        Length = "36";
        FieldGroup = "Table2";
        DBTableName = "TBNKB";
        SType = "Text";
        Label = "Branch Name";
    }

    OUT MIR-ACCT-TYP-CD-T[05]
    {
        Length = "3";
        FieldGroup = "Table2";
        DBTableName = "TDCRL";
        CodeSource = "EDIT";
        CodeType = "FBACC";
        SType = "Text";
        Label = "Account Type";
    }

    OUT MIR-DCRL-BNK-ACCT-ID-T[05]
    {
        Length = "7";
        FieldGroup = "Table2";
        DBTableName = "TDCRL";
        Mandatory;
        SType = "Text";
        Label = "Bank Account Number";
    }

    OUT MIR-DCRL-ACCT-HLDR-NM-T[05]
    {
        Length = "50";
        FieldGroup = "Table2";
        DBTableName = "TDCRL";
        Mandatory;
        SType = "Text";
        Label = "Account Holder Name";
    }

    OUT MIR-DCRL-KJ-ADDR-TXT-T[05]
    {
        Length = "50";
        FieldGroup = "Table2";
        DBTableName = "TDCRL";
        SType = "Text";
        Label = "Kanji Address";
        Index = "1";
    }

    OUT MIR-DCRL-SAMAKATA-BU-TXT-T[05]
    {
        MixedCase;
        Length = "72";
        FieldGroup = "Table2";
        SType = "Text";
        Label = "Samakata-bu";
        Index = "1";
    }

    OUT MIR-DCRL-SEND-PMT-NOTI-IND-T[05]
    {
        Length = "1";
        FieldGroup = "Table2";
        DBTableName = "TDCRL";
        SType = "Indicator";
        Label = "Send Payment Notice";
        Index = "1";
    }

    OUT MIR-DCRL-INSRD-REL-CD-T[05]
    {
        Length = "01";
        FieldGroup = "Table2";
        CodeSource = "EDIT";
        CodeType = "CLMRL";
        DBTableName = "TDCRL";
        SType = "Selection";
        Label = "Relation to Beneficiary";
        Index = "1";
    }

    OUT MIR-DCRL-PAYE-STAT-CD-T[05]
    {
        Length = "1";
        FieldGroup = "Table2";
        CodeSource = "DataModel";
        CodeType = "DCRL-PAYE-STAT-CD";
        DBTableName = "TDCRL";
        SType = "Text";
        Label = "Payee Status";
        Index = "1";
    }

    OUT MIR-KJ-PAYEE-NM-TXT-T[05]
    {
        Length = "50";
        FieldGroup = "Table3";
        DBTableName = "Derived";
        SType = "Text";
        Label = "Payee";
        Index = "1";
    }
# M287C9 CHANGES STARTS HERE
    OUT MIR-INDV-KA-SUR-NM-T[05]
    {
        MixedCase;
        FieldGroup = "table3";
        Index = "1";
        Length = "25";
        SType = "Text";
        Label = "Kana Last Name";
        DBTableName = "TDCRL";
    }

    OUT MIR-INDV-KA-GIV-NM-T[05]
    {
        MixedCase;
        FieldGroup = "table3";
        Index = "1";
        Length = "25";
        SType = "Text";
        Label = "Kana First Name";
        DBTableName = "TDCRL";
    } 
    OUT MIR-CO-KA-NM-T[05]
    {
        MixedCase;
        FieldGroup = "table3";
        Index = "1";
        Length = "50";
        SType = "Text";
        Label = "Company Kana Name";
        DBTableName = "TDCRL";
    }
    OUT MIR-PAYEE-CLI-SEX-CD-T[05]
    {
        FieldGroup = "table3";
        Index = "1";
        Length = "40";
        CodeSource = "DataModel";
        CodeType = "CLI-SEX-CD";
        SType = "Text";
        Label = "Sex";
        DBTableName = "TDCRL";
    }
    OUT MIR-PAYEE-CLI-BTH-DT-T[05]
    {
        FieldGroup = "table3";
        Index = "1";
        Length = "10";
        SType = "Date";
        Label = "Birth Date";
        DBTableName = "TDCRL";
    } 
    
# M287C9 CHANGES ENDS HERE    
# M271C9 CHANGES START HERE
    OUT MIR-BNK-NM-1-T[05]
    {
        Length = "36";
        FieldGroup = "Table2";
        DBTableName = "TBNKB";
        SType = "Text";
        Label = "Bank Name";
    }

    OUT MIR-BNK-BR-NM-1-T[05]
    {
        Length = "36";
        FieldGroup = "Table2";
        DBTableName = "TBNKB";
        SType = "Text";
        Label = "Branch Name";
    }

    OUT MIR-ACCT-TYP-CD-1-T[05]
    {
        Length = "3";
        FieldGroup = "Table2";
        DBTableName = "TDCRL";
        CodeSource = "EDIT";
        CodeType = "FBACC";
        SType = "Text";
        Label = "Account Type";
    }

    OUT MIR-DCRL-BNK-ACCT-ID-1-T[05]
    {
        Length = "7";
        FieldGroup = "Table2";
        DBTableName = "TDCRL";
        Mandatory;
        SType = "Text";
        Label = "Bank Account Number";
    }

    OUT MIR-DCRL-ACCT-HLDR-NM-1-T[05]
    {
        Length = "50";
        FieldGroup = "Table2";
        DBTableName = "TDCRL";
        Mandatory;
        SType = "Text";
        Label = "Account Holder Name";
    }
# M271C9 CHANGES ENDS HERE

# IPCA02 CHANGES STARTS HERE.

    OUT MIR-TAX-TYP-CD-T[05]
    {
        Length = "02";
        FieldGroup = "Table3";
        CodeSource = "DataModel";
        CodeType = "PAYE-TAX-TYP-CD";
        SType = "Text";
        Label = "Display Tax Information";
        Index = "1";
    }

#IPCA02 CHANGES ENDS HERE.

    OUT MIR-PREM-ACUM-AMT-T[05]
    {
        Length = "1";
        FieldGroup = "Table3";
        DBTableName = "TDCRL";
        SType = "Currency";
        Label = "Total premium Collected Amount - Accumulation";
        Index = "1";
    }

    OUT MIR-EXPL-RMRK-TXT-T[05]
    {
        Length = "120";
        FieldGroup = "Table3";
        DBTableName = "TDCRL";
        SType = "Text";
        Label = "Explanatory Remarks";
        Index = "1";
    }

    OUT MIR-CVG-NUM-T[25]
    {
        Length = "2";
        FieldGroup = "Table4";
        DBTableName = "TDCBD";
        SType = "Text";
        Label = "Coverage Number";
        Index = "1";
    }

    OUT MIR-PLAN-ID-T[25]
    {
        FieldGroup = "Table4";
        Length = "6";
        CodeSource = "EDIT";
        CodeType = "PLAN";
        DBTableName = "TCVG";
        SType = "Text";
        Label = "Plan";
        Index = "1";
    }

    OUT MIR-CVG-ISS-EFF-DT-T[25]
    {
        Length = "10";
        FieldGroup = "Table4";
        DBTableName = "TCVG";
        SType = "Date";
        Label = "Issue Effective Date";
        Index = "1";
    }

    OUT MIR-CVG-MAT-XPRY-DT-T[25]
    {
        Length = "10";
        FieldGroup = "Table4";
        DBTableName = "TCVG";
        SType = "Date";
        Label = "Coverage Maturity/Expiry Date";
        Index = "1";
    }

    OUT MIR-CVG-CSTAT-CD-T[25]
    {
        Length = "3";
        FieldGroup = "Table4";
        CodeSource = "DataModel";
        CodeType = "CVG-CSTAT-CD";
        DBTableName = "TCVG";
        SType = "Text";
        Label = "Coverage Status";
        Index = "1";
    }

    OUT MIR-CVG-SUB-STAT-CD-T[25]
    {
        Length = "2";
        FieldGroup = "Table4";
        CodeSource = "EDIT";
        CodeType = "SUBSC";
        DBTableName = "TCVG";
        SType = "Text";
        Label = "Coverage Sub Status";
        Index = "1";
    }

    OUT MIR-CVG-FACE-AMT-T[25]
    {
        Length = "15";
        FieldGroup = "Table4";
        DBTableName = "TCVG";
        SType = "Currency";
        Label = "Face Amount";
        Index = "1";
    }

    OUT MIR-BNFT-NM-ID-T[25]
    {
        Length = "5";
        FieldGroup = "Table4";
        CodeSource = "EDIT";
        CodeType = "BNNM";
        DBTableName = "TDCBD";
        SType = "Text";
        Label = "Benefit Name";
        Index = "1";
    }
# ABF423 The attribute Signed is added

    OUT MIR-CLM-ADJC-AMT-T[25]
    {
        Signed;
        Length = "15";
        FieldGroup = "Table4";
        DBTableName = "TDCBD";
        SType = "Currency";
        Label = "Amount for Adjudication";
        Index = "1";
     }
# ABF423 The attribute Signed is added

     OUT MIR-CLM-PAYBL-AMT-T[25]
     {
         Signed;
         Length = "15";
         FieldGroup = "Table4";
         DBTableName = "TCBD";
         SType = "Currency";
         Label = "Payable Amount";
         Index = "1";
     }
#M245Q2 CHANGE START HERE     
     OUT MIR-DV-CLM-PAYBL-JPY-AMT-T[25]
     {
         Signed;
         Length = "15";
         SType = "Currency";
         Label = "Payable Amount(Converted to JPY)";
         Index = "1";
     }
#M245Q2 CHANGE END HERE     
     OUT MIR-CLM-OTHR-RFND-AMT-T[25]
     {
         Length = "15";
         FieldGroup = "Table4";
         DBTableName = "TCBD";
         SType = "Currency";
         Label = "Other Refund Amount";
         Index = "1";
     }

     OUT MIR-PAYE-T[25]
     {
         Length = "51";
         FieldGroup = "Table4";
         SType = "Text";
         Label = "Payee";
         Index ="1";
     }

     OUT MIR-BNFT-DECID-CD-T[25]
     {
         Length = "2";
         FieldGroup = "Table4";
         CodeSource = "DataModel";
         CodeType = "BNFT-DECID-CD";
         DBTableName = "TDCBD";
         SType = "Text";
         Label = "Decision";
         Index = "1";
     }

     OUT MIR-BNFT-DCLN-REASN-CD-T[25]
     {
         Length = "2";
         FieldGroup = "Table4";
         CodeSource = "DataModel";
         CodeType = "BNFT-DCLN-REASN-CD";
         DBTableName = "TDCBD";
         SType = "Text";
         Label = "Decline Reason";
         Index = "1";
     }
# ABF423 The attribute Signed is added

     OUT MIR-TOT-ADJC-AMT
     {
         Signed;
         Length = "15";
         SType = "Currency";

     }
# ABF423 The attribute Signed is added

     OUT MIR-TOT-PAYBL-AMT
     {
        Signed;
        Length = "15";
        SType = "Currency";

     }

     OUT MIR-BNFT-TOT-REFND-AMT
     {
        Length = "15";
        SType = "Currency";
     }

     OUT MIR-OTHR-CVG-NUM-T[25]
     {
        Length = "2";
        FieldGroup = "Table5";
        DBTableName = "TDCBD";
        SType = "Text";
        Label = "Coverage Number";
        Index = "1";
     }

    OUT MIR-OTHR-PLAN-ID-T[25]
    {
        FieldGroup = "Table5";
        Length = "6";
        CodeSource = "EDIT";
        CodeType = "PLAN";
        DBTableName = "TCVG";
        SType = "Text";
        Label = "Plan";
        Index = "1";
    }

    OUT MIR-OTHR-MAT-XPRY-DT-T[25]
    {
        Length = "10";
        FieldGroup = "Table5";
        DBTableName = "TCVG";
        SType = "Date";
        Label = "Coverage Maturity/Expiry Date";
        Index = "1";
    }

    OUT MIR-OTHR-CSTAT-CD-T[25]
    {
        Length = "3";
        FieldGroup = "Table5";
        CodeSource = "DataModel";
        CodeType = "CVG-CSTAT-CD";
        DBTableName = "TCVG";
        SType = "Text";
        Label = "Coverage Status";
        Index = "1";
    }

    OUT MIR-OTHR-SUB-STAT-CD-T[25]
    {
        Length = "2";
        FieldGroup = "Table5";
        CodeSource = "EDIT";
        CodeType = "SUBSC";
        DBTableName = "TCVG";
        SType = "Text";
        Label = "Coverage Sub Status";
        Index = "1";
    }

    OUT MIR-OTHR-FACE-AMT-T[25]
    {
        Length = "15";
        FieldGroup = "Table5";
        DBTableName = "TCVG";
        SType = "Currency";
        Label = "Face Amount";
        Index = "1";
    }

    OUT MIR-OTHR-ISS-EFF-DT-T[25]
    {
         Length = "10";
         FieldGroup = "Table4";
         DBTableName = "TCVG";
         SType = "Date";
         Label = "Issue Effective Date";
         Index = "1";
     }


    OUT MIR-OTHR-INSRD-CLI-NM-T[25]
    {
        Length = "51";
        DisplayOnly;
        FieldGroup = "Table4";
        SType = "Text";
        Label = "Insured Name";
        Index = "1";
    }

    OUT MIR-OTHR-INSRD-AGE-T[25]
    {
        Length = "03";
        FieldGroup = "Table4";
        SType = "Text";
        Label = "Issue Age";
        Index = "1";
     }

    OUT MIR-OTHR-SEX-CD-T[25]
    {
        Length = "1";
        FieldGroup = "Table4";
        CodeSource = "DataModel";
        CodeType = "CLI-SEX-CD";
        DBTableName = "TCLI";
        SType = "Text";
        Label = "Sex";
        Index = "1";
    }

    OUT MIR-OTHR-RFND-AMT-T[25]
    {
        Length = "15";
        FieldGroup = "Table5";
        DBTableName = "TDCBD";
        SType = "Currency";
        Label = "Other Refund Amount";
        Index = "1";
    }

    OUT MIR-OTHR-PAYE-T[25]
    {
        Length = "51";
        FieldGroup = "Table5";
        SType = "Text";
        Label = "Payee";
        Index ="1";
    }

    OUT MIR-OTHR-DECID-CD-T[25]
    {
        Length = "2";
        FieldGroup = "Table5";
        CodeSource = "DataModel";
        CodeType = "BNFT-DECID-CD";
        DBTableName = "TDCBD";
        SType = "Text";
        Label = "Decision";
        Index = "1";
    }

    OUT MIR-OTHR-DCLN-REASN-CD-T[25]
    {
        Length = "2";
        FieldGroup = "Table5";
        CodeSource = "DataModel";
        CodeType = "BNFT-DCLN-REASN-CD";
        DBTableName = "TDCBD";
        SType = "Text";
        Label = "Decline Reason";
        Index = "1";
    }

    OUT MIR-CVG-TOT-RFND-AMT
    {
        Length = "15";
        SType = "Currency";

    }

# ABF423 The attribute Signed is added
    OUT MIR-PMT-PAYBL-AMT
     {
         Signed;
         Length = "15";
         SType = "Currency";
         Label = "Payable Amount";

    }

    OUT MIR-PMT-REFND-AMT
     {
         Length = "15";
         SType = "Currency";
         Label = "Others Refund Amount";

    }

#M319A7 CHANGES START HERE
    OUT MIR-UNEARN-PREM-AMT
     {
         Signed;
         Length = "15";
         SType = "Currency";
         Label = "Unearned Premium";
     }
#M319A7 CHANGES END HERE 
#TV2024 CHANGES START HERE
    OUT MIR-PREM-DED-AMT
     {     
         Length = "15";
         SType = "Currency";
         Label = "Premium Amount to Deduct";
     }
#TV2024 CHANGES END HERE
#UY3054A CHANGES START HERE
    OUT MIR-OTHR-PAY-TOT-AMT
     {     
         Length = "15";
         SType = "Currency";
         Label = "Other payment amount total";
     }
#UY3054A CHANGES END HERE  
#M245Q2 CHANGES START HERE

    OUT MIR-DV-CLM-NET-PAYBL-AMT-T[30]
    {
         Signed;
         Length = "15";
         FieldGroup = "Table9";
         DBTableName = "Derived";
         SType = "Currency";
         Label = "Net Payable Amount";
         Index = "1";
    }
    OUT MIR-CLM-JPY-XCHNG-RT-T[30]
    {
         Signed;
         Length = "18";       
         FieldGroup = "Table9";
         DBTableName = "TCXRT";
         SType = "Text";
         Label = "Exchange Rate to JPY";
         Index = "1";
    }
    OUT MIR-DV-CLM-NET-PAYBL-JPY-AMT-T[30]
    {
         Signed;
         Length = "15";
         FieldGroup = "Table9";
         DBTableName = "TDCBD";
         SType = "Currency";
         Label = "Net Payable Amount(In Pay Out Curency)";
         Index = "1";
    }    
    OUT MIR-DLAY-INT-STRT-DT-T[30]
    {
         Length = "10";
         FieldGroup = "Table9";
         DBTableName = "TDCBD";
         SType = "Date";
         Label = "Delay Interest Start Date";
         Index = "1";
    }    
    OUT MIR-DYS-BFR-PMT-DUE-T[30]
    {
         Length = "03";
         FieldGroup = "Table9";
         CodeSource = "DataModel";
         CodeType = "DYS-BFR-PMT-DUE";
         DBTableName = "TDCBD";
         SType = "Selection";
         Label = "Days Before Claim Payment Due";
         Index = "1";
     }
             	              
     OUT MIR-DLAY-INT-ARR-DUR-T[30]
     {
         Length = "4";
         FieldGroup = "Table9";
         DBTableName = "TDCBD";
         SType = "Date";
         Label = "Number of Days of delay Interest";
         Index = "1";
     }
     OUT MIR-DLAY-INT-AMT-T[30]
     {
         Length = "15";
         FieldGroup = "Table9";
         DBTableName = "TDCBD";
         SType = "Currency";
         Label = "Delay Interest Amount";
         Index = "1";
     }
     
     OUT MIR-DV-REMIT-AMT-T[30]
     {
         Signed;
         Length = "15";
         FieldGroup = "Table9";
         DBTableName = "Derived";
         SType = "Currency";
         Label = "Remittance Amount";
         Index = "1";
      }
#M245Q2 CHANGES END HERE

#M271A3 CHANGES STARTS HERE
      OUT MIR-PREM-RFND-AMT-T[30] 
      {
      	DisplayOnly;
      	FieldGroup = "Table13";
      	Index = "1";
      	Label = "Premium Refund Amount:";
      	Length = "15";
      	SType = "Currency";
      }		
      
      OUT MIR-PREM-RFND-DLAY-INT-DUR-T[30] 
      {
      	DisplayOnly;
      	FieldGroup = "Table13";
      	Index = "1";
      	Label = "Number of Days of Delay Interest:";
      	Length = "4";
      	SType = "Date";
      }
      
      OUT MIR-PREM-RFND-DLAY-INT-AMT-T[30] 
      {
      	DisplayOnly;
      	FieldGroup = "Table13";
      	Index = "1";
      	Label = "Delay Interest Amount:";
      	Length = "15";
      	SType = "Currency";
      }
      OUT MIR-DV-PREM-RFND-REMIT-AMT-T[30] 
      {
      	DisplayOnly;
      	FieldGroup = "Table13";
      	Index = "1";
      	Label = "Remittance Amount:";
      	Length = "15";
      	SType = "Currency";
      }
      
      OUT MIR-PMT-CRCY-CD
      {
        Length = "2";           
        SType = "Hidden";
        Label = "Currency";
      }	
    
#M271A3 CHANGES END HERE

# ABF423 The attribute Signed is added

    OUT MIR-PMT-TOT-AMT
    {
         Signed;
         Length = "15";
         SType = "Currency";
         Label = "Total";

    }

    OUT MIR-MSG-TXT-T[18]
      {
          Length = "120";
          FieldGroup = "Table6";
          SType = "Text";
          Label = "Adjudication Message";
          Index = "1";
     }


     OUT MIR-PREV-UPDT-DT-T[15]
     {
         Length = "10";
         FieldGroup = "Table6";
         DBTableName = "TFTXT";
         SType = "Date";
         Label = "Previous Update Date";
         Index = "1";
     }

     OUT MIR-PREV-UPDT-USER-ID-T[15]
     {
         Length = "8";
         FieldGroup = "Table6";
         DBTableName = "TFTXT";
         SType = "Text";
         Label = "Previous Update User ID";
         Index = "1";
     }

     OUT MIR-CLM-NOTE-TXT-T[15]
     {
         Length = "500";
         FieldGroup = "Table6";
         DBTableName = "TFTXT";
         SType = "Text";
         Label = "Claim Note";
         Index = "1";
    }						  
#* M213M2 CHANGES BEGIN

     OUT MIR-CANCER-TYP-CD 
       {
           Length = "1";
           CodeSource = "Edit";
           CodeType = "CANCD";
           DBTableName = "TDCLM";
           SType = "Text";
           Label = "Cancer Type";
       }

     OUT MIR-TRANSPLT-TYP-CD
       {
       
            Length = "2";
            CodeSource = "Edit";
            CodeType = "TRSTY";
            DBTableName = "TDCLM";
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
#MP300C CHANGES STARTS HERE    
     OUT MIR-PRE-LCD-CHK-IND
    {
        Length = "01";
        CodeSource = "DataModel";
        CodeType = "PRE-LCD-CHK-IND";
        DBTableName = "TDCBD";
        SType = "Text";
        Label = "Pre-LCD Check";
    }
#MP300C CHANGES ENDS HERE
#CS0008 CHANGES START
        OUT MIR-TRMN-NOTI-CD
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

# UY3077 CHANGES START

     OUT MIR-LNB-PREM-AMT-T[25]
     {
        Length = "15";
        SType = "Currency";
        Label = "Premium (for 6 months)";
        Index = "1";
     }    
     
     OUT MIR-LNB-INT-AMT-T[25]
     {
        Length = "15";
        SType = "Currency";
        Label = "Interest";
        Index = "1";
     } 

     OUT MIR-TOT-LNB-PREM-AMT
     {
        Length = "15";
        SType = "Currency";
        Label = "Premium (for 6 months)";

     }    
     
     OUT MIR-TOT-LNB-INT-AMT
     {
        Length = "15";
        SType = "Currency";
        Label = "Interest";
     }  

     OUT MIR-PREM-CHNG-REASN-CD-T[25]
     { 
        Length = "02";
        CodeSource = "DataModel";
        CodeType = "MODIF-REASN-CD";
        SType = "Text";
        Label = "Modification Reason";
        Index = "1";    
     }      

# UY3077 CHANGES ENDS

#MP302L CHANGES START HERE
    OUT MIR-SRVBEN-DEFR-AMT
         {
             Length = "15";
             SType = "Currency";
             Label = "Survival Benefit Deferral Amount";
         }
    
    OUT MIR-SRVBEN-DEFR-INT-AMT
         {
             Length = "15";
             SType = "Currency";
             Label = "Deferral Interest";
         }
         
    OUT MIR-SRVBEN-TOT-AMT
        {
             Length = "15";
             SType = "Currency";
             Label = "Total";
         }
    
    OUT MIR-SRVBEN-CHRGBCK-AMT
             {
                 Length = "15";
                 SType = "Currency";
                 Label = "Chargeback Amount";
             }
#MP302L CHANGES END HERE    
#ULMG13 CHANGES START HERE
    OUT MIR-POST-LAPS-SUR-AMT
         {
             Length = "15";
             SType = "Currency";
             Label = "Cash Surrender Value";
         }
#ULMG13 CHANGES END HERE   
  }
  
