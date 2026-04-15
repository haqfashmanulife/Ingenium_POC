#*******************************************************************************
#*  Component:   BF9362-P.p                                                    *
#*  Description: CSV CERTIFICATE/QUOTE SCREEN                                  *
#*                                                                             *
#*******************************************************************************
#*  Chg#    Release  Description                                               *
#*                                                                             *
#*  23802D  13APR22  Intial Version                                            *
#*******************************************************************************

P-STEP BF9362-P
{
    ATTRIBUTES
    {
        BusinessFunctionId = "9362";
        BusinessFunctionName = "Creation of CSV certificate/Quote";
        BusinessFunctionType = "Quotecsv";
        MirName = "CCWM9362";
    }

    OUT LSIR-RETURN-CD;

    OUT MIR-RETRN-CD;

    IN MIR-DV-PRCES-STATE-CD
    {
       Length = "2";
       SType = "Hidden";
       DBTableName = "Derived";
       Label = "Process State";
    }

    INOUT MIR-POL-ID-BASE
    {
       Key;
       Mandatory;
       Length = "9";
       DBTableName = "TPOL";
       SType = "Text";
       Label = "Policy Id";
    }
    
    INOUT MIR-POL-ID-SFX
    {
       Key;
       Length = "1";
       SType = "Text";
       Label = "Suffix";
    }

    INOUT MIR-APPL-CTL-PRCES-DT
    {
       Key;
       Length = "10";
       DBTableName = "TMAST";
       DefaultSession = "LSIR-PRCES-DT";
       SType = "Date";
       Label = "Process Date";
    }    
    
    INOUT MIR-DV-OWN-CLI-NM
    {
       Mandatory;
       Length = "100";
       SType = "Text";
       Label = "Owner Name (Kanji)";
    }

    INOUT MIR-CLI-ADDR-TITL
    {
       Length = "10";
       SType = "Text";
       Label = "Address Title";
    }

    INOUT MIR-CLI-PSTL-CD
    {
       Mandatory;
       Length = "9";
       DBTableName = "TCLIA";
       SType = "Text";
       Label = "Postal Code";
    }
    
    INOUT MIR-CLI-PREFCT-TXT
    {
       Mandatory;
       Length = "11";
       SType = "Text";
       Label = "Prefecture";
    }
         
    INOUT MIR-CLI-CITY-NM-TXT
    {
       Mandatory;
       Length = "30";
       SType = "Text";
       Label = "City";
    }
         
    INOUT MIR-CLI-ADDR-LN-1-TXT
    {
       Mandatory;
       Label = "Address";
       Length = "30";
       SType = "Text";
    }
        
    INOUT MIR-CLI-ADDR-ADDL-TXT
    {
       Mandatory;
       Length = "90";
       SType = "Text";
       Label = "Samakata-bu";
    }
    
    INOUT MIR-CLI-ID
    {
       DisplayOnly;
       Length = "10";
       SType = "Text";
       Label = "Client ID";
    }  
        
    INOUT MIR-CREAT-DT
    {
       Length = "10";
       SType = "Date";
       Label = "Creation Date";
    }

    INOUT MIR-CSV-TYP-CD
    {
       Length = "1";
       CodeSource = "DataModel";
       CodeType = "CERT-QUOT-TYP-CD";
       SType = "Selection";
       Label = "Certificate/Quote Type";
#MOR345 CHANGES START HERE
       Label = "Certificate/Quote Select";
#MOR345 CHANGES START HERE
    } 

    INOUT MIR-PRCES-DT
    {
       Mandatory;
       Length = "10";
       SType = "Date";
       Label = "Process Date";
    } 

    INOUT MIR-RECORD-CTR
    {
       Length = "2";
       SType = "Text";
       Label = "Record counter";
    }

    INOUT MIR-BULK-IND
    {
       Length = "1";
       SType = "Indicator";
       Label = "Bulk";
    }    

    INOUT MIR-NXT-POL-ID
    {
       Length = "10";
       SType = "Text";
       Label = "Next Policy ID";
    }

    INOUT MIR-DV-PAYO-JPY-BNFT-CD
    {
       Length = "1";
       CodeSource = "DataModel";
       CodeType = "PAYO-JPY-BNFT-CD";
       SType = "Selection";
       Label = "JPY Benefit Rider Indicator";
    }

    OUT MIR-DV-JP-XCHNG-RT
    { 
       DisplayOnly;
       Length = "7";
       Decimals = "2";
       DBTableName = "TCXRT";
       SType = "Text";
       Label = "Exchange rate from FC to JPY";     
    }

    OUT MIR-DV-JP-XCHNG-EFF-DT
     { 
       Length = "10";
       SType = "Date";
       Label = "Conversion Exchange Effective date";
     }

    INOUT MIR-RPU-TRNST-CNCL-IND
    {
       Length = "1";
       SType = "Indicator";
       Label = "During RPU Transition Period Cancel:";
    }

    INOUT MIR-VIR-TRAD-PD-TO-MO-NUM
    {
     
       Label = "Next Payment Date:";
       DBTableName = "TPOL";
       Length = "07";
       SType = "text";
    }

    INOUT MIR-VIR-CI-FRST-ELAPS-YRS-DUR
    {
  
       Label = "Elapsed years:";
       Length = "07";
       SType = "text";
    }

    INOUT MIR-VIR-SCREEN-IND
    {
       Length = "1";
       SType = "Indicator";
       Label = "Please check in case of virtual quote implementation";
    }    
 
    INOUT MIR-VIR-ACTV-IND
    {
       Length = "1";
       SType = "Indicator";
       Label = "Active";
    }
     
    INOUT MIR-VIR-BILL-MODE-CD
    {
       Length = "40";
       CodeSource = "DataModel";
       CodeType = "PLAN-BILL-MODE-CD";
       SType = "Selection";
       Label = "Payment frequency";
    }

    OUT MIR-VIR-RPU-FACE-AMT
    {   
       Signed;
       DBTableName = "Derived";
       Length = "13";
       SType = "Currency";
       Label = "Regular death face amount after RPU:";
    }   
     
    INOUT MIR-VIR-LOAN-AMT
    {   
       Mandatory;
       Signed;
       DBTableName = "Derived";
       Length = "13";
       SType = "Currency";
       Label = "Policy loan balance:";
    }

    INOUT MIR-VIR-INT-STR-DT
    { 
       Length = "10";
       SType = "Date";
       Label = "Interest start date";
    }  
     
    INOUT MIR-VIR-APL-LOAN-AMT
    {   
       Signed;
       DBTableName = "Derived";
       Length = "13";
       SType = "Currency";
       Label = "APL balance:";
    }     
     
    INOUT MIR-VIR-POL-LOAN-EFF-DT
    {
 
       Length = "10";
       SType = "Date";
       Label = "APL date";
    }    
     
    INOUT MIR-VIR-PREPAY-MNG-IND
    {
       Length = "1";
       SType = "Indicator";
       Label = "Prepayment management";
    }

    INOUT MIR-SELECT-T1[25]
    {       
       FieldGroup = "Table25";
       DBTableName = "Derived";
       Index = "1";
       Label = "Creation Target checkbox indicator";
       Length = "1";
       SType = "checkbox";
    }

    INOUT MIR-SEQ-NUM-T[25]
    {
       DisplayOnly;
       Length = "03";
       FieldGroup = "Table25";
       SType = "Text";
       Label = "No";
       Index = "1";
    }
               
    INOUT MIR-POL-ISS-EFF-DT-T[25]
    {
       DisplayOnly;
       Length = "10";
       FieldGroup = "Table25";
       SType = "Date";
       Label = "Policy Issue Date";
       Index = "1";
    }
        
    INOUT MIR-PROD-APP-TYP-CD-T[25]
    {
       DisplayOnly;
       Length = "2";
       FieldGroup = "Table25";
       DBTableName = "TPOL";
       SType = "Text";
       Label = "Prod Typ";
       Index = "1";
    }
        
    INOUT MIR-LRG-PROD-CD-T[25]
    {
       DisplayOnly;
       Length = "3";
       FieldGroup = "Table25";
       SType = "Text";
#MOR343 STARTS HERE
#       Label = "Type";
       Label = "Plan Code";
#MOR343 ENSS HERE
       Index = "1";
    }

    INOUT MIR-POL-ID-T[25]
    {
       DisplayOnly;
       Length = "10";
       FieldGroup = "Table25";
       DBTableName = "TPOL";
       SType = "Text";
       Label = "Policy ID";
       Index = "1";
    }
        
    INOUT MIR-DV-INSRD-CLI-NM-T[25]
    {
       DisplayOnly;
       Length = "50";
       FieldGroup = "Table25";
       DBTableName = "Derived";
       SType = "Text";
       Label = "Insured Name";
       Index = "1";
    }
        
    INOUT MIR-POL-CSTAT-CD-T[25]
    {
       DisplayOnly;
       Length = "40";
       FieldGroup = "Table25";
       CodeSource = "DataModel";
       CodeType = "POL-CSTAT-CD";
       DBTableName = "TPOL";
       SType = "Text";
       Label = "Policy Status";
       Index = "1";
    }

    INOUT MIR-QUOT-TS-T[25]
    {
       DisplayOnly;
       Length = "17";
       FieldGroup = "Table25";
       DBTableName = "Derived";
       SType = "Text";
       Label = "Quote Date Time";
       Index = "1";
    }
          
    INOUT MIR-CREAT-TS-T[25]
    {
       DisplayOnly;
       Length = "17";
       FieldGroup = "Table25";
       DBTableName = "Derived";
       SType = "Text";
       Label = "Create Date Time";
       Index = "1";
    }
    INOUT MIR-PRCES-DT-T[25]
    {
       DisplayOnly;
       Length = "10";
       FieldGroup = "Table25";
       SType = "Date";
       Label = "Process Date";
       Index = "1";
    }
    OUT MIR-SBSDRY-CO-ID
    {
       Length = "2";
       CodeSource = "EDIT";
       CodeType = "SUBCO";
       DBTableName = "TPOL";
       SType = "Text";
       Label = "Sub Company";
    }

    OUT MIR-DV-OWN-CLI-NM-SUR
    {
       Length = "75";
       DBTableName = "Derived";
       SType = "Text";
       Label = "Owner Name";
    }

    OUT MIR-POL-CVG-REC-CTR
    {
       Length = "2";
       DBTableName = "TPOL";
       SType = "Text";
       Label = "Number of Coverages";
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

    OUT MIR-DV-POL-CSV-AMT
    {
       Signed;
       Length = "19";
       DBTableName = "Derived";
       SType = "Currency";
       Label = "Cash Surrender Value";
    }
 
    OUT MIR-WS-POL-CSV-AMT
    {
       Signed;
       Length = "19";
       DBTableName = "Derived";
       SType = "Currency";
       Label = "WS Cash Surrender Value";
    }
 
    OUT MIR-POST-LAPS-SUR-AMT
    {
       Signed;
       Length = "17";
       DBTableName = "Derived";
       SType = "Currency";
       Label = "Post-Lapse Surrender Value";
    }

    OUT MIR-POL-OS-DISB-AMT
    {
       Signed;
       Length = "17";
       DBTableName = "TPOL";
       SType = "Currency";
       Label = "Outstanding Disbursement";
    }

    OUT MIR-OS-DISB-SURR-AMT
    {
       Signed;
       Length = "17";
       DBTableName = "TPOL";
       SType = "Currency";
       Label = "Outstanding Disbursements - Surrender";
    }

    OUT MIR-OS-DISB-MAT-AMT
    {
       Signed;
       Length = "17";
       DBTableName = "TPOL";
       SType = "Currency";
       Label = "Outstanding Disbursements - Maturity";
    }

    OUT MIR-OS-DISB-DTH-AMT
    {
       Signed;
       Length = "17";
       DBTableName = "TPOL";
       SType = "Currency";
       Label = "Outstanding Disbursements - Death";
    }

    OUT MIR-OS-DISB-CLM-AMT
    {
       Signed;
       Length = "17";
       DBTableName = "TPOL";
       SType = "Currency";
       Label = "Outstanding Disbursements - Claims";
    }
    
    OUT MIR-OS-DISB-AD-AMT
    {
       Signed;
       Length = "17";
       DBTableName = "TPOL";
       SType = "Currency";
       Label = "Outstanding Disbursements - Accidental Death";
    }
 
    OUT MIR-POL-UL-SHRT-AMT
    {
       Signed;
       Length = "17";
       DBTableName = "TPOL";
       SType = "Currency";
       Label = "Shortage Amount";
    }

    OUT MIR-POL-PREM-SUSP-AMT
    {
       Signed;
       Length = "17";
       DBTableName = "TPOL";
       SType = "Currency";
       Label = "Premium Suspense";
    }
    
    OUT MIR-POL-BT-SUSP-AMT
    {
       Signed;
       Length = "13";
       DBTableName = "TPOL";
       SType = "Currency";
       Label = "Bank Transfer Suspense";
    }
    
    OUT MIR-POL-PD-SUSP-AMT
    {
       Signed;
       Length = "13";
       DBTableName = "TPOL";
       SType = "Currency";
       Label = "Payroll Deduction Suspense";
    }
    
    OUT MIR-POL-CC-SUSP-AMT
    {
       Signed;
       Length = "13";
       DBTableName = "TPOL";
       SType = "Currency";
       Label = "Cash Collection Suspense";
    }
    
    OUT MIR-POL-PD-TO-DT-NUM
    {
       Length = "10";
       DBTableName = "TPOL";
       SType = "Date";
       Label = "Paid to Date";
    }
    
    OUT MIR-UL-LAPS-STRT-DT
    {
       Length = "10";
       DBTableName = "TPOL";
       SType = "Date";
       Label = "Lapse Start Date";
    }
    
    OUT MIR-DV-FUND-QUOTE-DT
    {
       Length = "10";
       DBTableName = "TMAST";
       SType = "Date";
       Label = "Fund Quote Date";
    }
    
    OUT MIR-DV-GCSV-QUOTE-DT
    {
       Length = "10";
       DBTableName = "TMAST";
       SType = "Date";
       Label = "Guaranteed Cash Value Quote Date";
    }
    
    OUT MIR-SA-TYP-IND
    {
       SType="Hidden";
    }

    INOUT MIR-SURR-CHRG-TYP-CD 
    {
       Length = "1";
       CodeSource = "EDIT";
       CodeType = "MVAL";
       DBTableName = "TPOL";
       SType = "Text";
       Label = "FlexFund Surrender Charge Type";
    }

    OUT MIR-SURR-FORM-ACPT-DT
    { 
       Length = "10";
       DBTableName = "TPOL";        
       SType = "Date";
       Label = "Surrender Request Form Acceptance Date";
    }
  
    OUT MIR-ASIGN-SURR-EFF-DT
    { 
       Length = "10";
       DBTableName = "TPOL";                
       SType = "Date";
       Label = "Assigned Surrender Effective Date for Policy with Assignee";
    }
  
    OUT MIR-POL-STEP-IN-RIGHT-IND
    { 
       Length = "1";
       DBTableName = "TPOL";                
       SType = "Indicator";
       Label = "Policy with Step-In Right";
    }
    
    OUT MIR-CVG-NUM-T[99]
    {
       Length = "2";
       FieldGroup = "Table50";
       Index = "1";
       DBTableName = "TCVG";
       SType = "Text";
       Label = "Coverage Number";
    }
    
    OUT MIR-PLAN-ID-T[99]
    {
       Length = "6";
       FieldGroup = "Table50";
       Index = "1";
       CodeSource = "EDIT";
       CodeType = "PLAN";
       DBTableName = "TCVG";
       SType = "Text";
       Label = "Type of Plan";
    }
    
    OUT MIR-DV-ACUM-FND-VAL-T[99]
    {
       Signed;
       Length = "17";
       FieldGroup = "Table50";
       Index = "1";
       DBTableName = "TCFLW";
       SType = "Currency";
       Label = "Accumulated Fund Value Amount";
    }
    
    OUT MIR-DV-MKTVAL-T[99]
    {
       Signed;
       Length = "17";
       FieldGroup = "Table50";
       Index = "1";
       DBTableName = "TCFLW";
       SType = "Currency";
       Label = "MVA";
    }
    
    OUT MIR-DV-SURRCHRG-T[99]
    {
       Signed;
       Length = "17";
       FieldGroup = "Table50";
       Index = "1";
       DBTableName = "TCFLW";
       SType = "Currency";
       Label = "Surrender Charge";
    }
    
    OUT MIR-DV-NET-FUND-VAL-T[99]
    {
       Signed;
       Length = "17";
       FieldGroup = "Table50";
       Index = "1";
       DBTableName = "TCFLW";
       SType = "Currency";
       Label = "Net Fund Value";
    }
    
    OUT MIR-DV-GCSV-AMT-T[99]
    {
       Signed;
       Length = "17";
       FieldGroup = "Table50";
       Index = "1";
       DBTableName = "TCFLW";
       SType = "Currency";
       Label = "Guaranteed Cash Value";
    }
    
    OUT MIR-DV-NET-GCSV-AMT-T[99]
    {
       Signed;
       Length = "17";
       FieldGroup = "Table50";
       Index = "1";
       DBTableName = "TCFLW";
       SType = "Currency";
       Label = "Coverage Net Surrender Value";
    }
    
    OUT MIR-CVG-INS-TYP-CD-T[99]
    {
       FieldGroup = "Table50";
       Index = "1";
       SType = "Hidden";
    }

    OUT MIR-CVG-PRIM-GR-ID-T[99]
    {
        Length = "2";
         FieldGroup = "Table50";
         Index = "1";
         DBTableName = "TCVG";
         SType = "Text";
         Label = "Group ID";
     }

    OUT MIR-SURR-INCM-ACCT-NM-T[8]
    {
        Length ="30";
        FieldGroup = "Table1";
        DBTableName = "Derived";
        SType = "Text";
        Label = "Account Name";
        Index = "1";
    }

    OUT MIR-SURR-INCM-ACCT-CD-T[8]
    {
        Length ="10";
        FieldGroup = "Table1";
        SType = "Text";
        Label = "Type";
        Index = "1";
    }     
 
    OUT MIR-SURR-INCM-AMT-T[8]
    {
        Length ="15";
        FieldGroup = "Table1";
        DBTableName = "Derived";
        SType = "Currency";
        Label = "Income amount";
        Index = "1";
    } 
 
    OUT MIR-SURR-XPNS-ACCT-NM-T[8]
    {
        Length ="30";
        FieldGroup = "Table1";
        DBTableName = "Derived";
        SType = "Text";
        Label = "Account Name";
        Index = "1";
    }

    OUT MIR-SURR-XPNS-ACCT-CD-T[8]
    {
        Length ="10";
        FieldGroup = "Table1";
        SType = "Text";
        Label = "Type";
        Index = "1";
    }     
 
    OUT MIR-SURR-XPNS-AMT-T[8]
    {
        Length ="15";
        FieldGroup = "Table1";
        DBTableName = "Derived";
        SType = "Currency";
        Label = "Income amount";
        Index = "1";
    } 

    IN MIR-TRAD-PD-TO-MO-NUM
    {
        Length = "7";
        SType = "Text";
        Label = "Paid To Month";
    }

    OUT MIR-DV-UNEARN-PREM
    {
        Signed;
        Length = "17";
        DBTableName = "Derived";
        SType = "Currency";
        Label = "Unearned Premium";
    }

    OUT MIR-PREM-XCES-SHRT-AMT
    {
       Signed;
       Length = "17";
       DBTableName = "TPOL";
       SType = "Currency";
       Label = "Excess / Shortage in Premium";
    }

    OUT MIR-APL-LOAN-AMT
    {
       Signed;
       Length = "17";
       DBTableName = "TLHST";
       SType = "Currency";
       Label = "APL Balance";
    }

    OUT MIR-DV-APL-LOAN-INT-AMT
    {
        Signed;
        Length = "17";
        DBTableName = "TLHST";
        SType = "Currency";
        Label = "APL Interest";
    }

    OUT MIR-LOAN-AMT
    {
        Signed;
        Length = "17";
        DBTableName = "TLHST";
        SType = "Currency";
        Label = "Policy Loan Balance ";
    }

    OUT MIR-DV-LOAN-INT-AMT
    {
        Signed;
        Length = "17";
        DBTableName = "TLHST";
        SType = "Currency";
        Label = "Policy Loan Interest";
    }

    OUT MIR-LOAN-XCES-SHRT-AMT
    {
        Signed;
        Length = "17";
        DBTableName = "TPOL";
        SType = "Currency";
        Label = "Excess / Shortage of Policy Loan Interest";
    }

    OUT MIR-DV-UNDO-VALID-CD
    {
        Length = "1";
        DBTableName = "Derived";
        SType = "Hidden";
        Label = "Undo Indicator";
    }

    OUT  MIR-POL-TRAD-NON-SEG-FND-IND
    {
        Length = "1";
        DBTableName = "Derived";
        SType = "Hidden";
        Label = "Trad Non Seg Fund Indicator";
    }

    INOUT MIR-POL-CRCY-CD
    {
      Length = "2";
      SType = "Hidden";
      Label = "Currency";
    } 
 
    INOUT MIR-OS-DISB-CRCY-CD
    {
       
       Length = "2";
       SType = "Hidden";
       Label = "Currency";
    } 

    INOUT MIR-PAYO-CRCY-CD
    {
        Length = "2";
        SType = "Hidden";
        Label = "Currency";
    } 

    OUT MIR-DV-PAYO-CSV-AMT
    {
        Signed;
        Length = "19";
        DBTableName = "Derived";
        SType = "Currency";
        Label = "Cash Surrender Value";
    }

    INOUT MIR-PREM-CRCY-CD
    {
        Length = "2";
        SType = "Hidden";
        Label = "Currency";
    }  

    INOUT MIR-PMT-CRCY-CD
    {
       Length = "2";
       SType = "Hidden";
       Label = "Currency";
    }   

    OUT MIR-DV-PREM-RFND-AMT          
    { 
        Signed; 
        Length = "19"; 
        DBTableName = "Derived"; 
        SType = "Currency"; 
        Label = "Refund Premium(JPY)";
    }

    OUT MIR-DV-NATNL-TAXWH-AMT
    {
        Signed;
        Length = "19";
        DBTableName = "Derived";
        SType = "Currency";
        Label = "Separate Withholding Tax (Income Tax)";
    }
    
    OUT MIR-DV-LOC-TAXWH-AMT
    {
        Signed;
        Length = "19";
        DBTableName = "Derived";
        SType = "Currency";
        Label = "Separate Withholding Tax (Local Tax)";
    }
      
    OUT MIR-SRVBEN-DEFR-AMT
    {
        Signed;
        Length = "15";
        SType = "Currency";
        Label = "Survival Benefit Deferral Amount";
    }

    OUT MIR-SRVBEN-DEFR-INT-AMT 
    {
         Signed;
         Length = "15";
         SType = "Currency";
         Label = "Survival Benefit Deferral Interest";
    }

    OUT MIR-TOT-PD-PREM-AMT
    {
        Signed;
        Length = "16";
        SType = "Currency";
        Label = "Total Premium Paid for the Policy";
    }

    INOUT MIR-CC-SUSP-CRCY-CD
    {
        Length = "2";       
        SType = "Hidden";
        Label = "Currency";
    }

    INOUT MIR-OVR-SHRT-PREM-CRCY-CD    
    {
             
        Length = "2";
        SType = "Hidden";
        Label = "Currency";
    }

    OUT MIR-VIR-INS-TYP-CD
    {
        Length = "5";
        CodeSource = "DataModel";
        CodeType = "INS-TYP-CD";
        SType = "Selection";
        Label = "Type:";	
    }     
 
    OUT MIR-VIR-RPU-POL-CD
    {
        Length = "5";
        CodeSource = "DataModel";
        CodeType = "MIR-VIR-RPU-POL-CD";
        SType = "Selection";
        Label = "RPU Policy:";	
    }     

    OUT MIR-VIR-RPU-NEW-OLD-RT
    {
        Length = "13";
        CodeSource = "DataModel";
        CodeType = "RPU-NEW-OLD-RT";
        SType = "Selection";
        Label = "RPU new/old rate:";
    }

    OUT MIR-VIR-SEI-ASS-IND
    {
        Length = "1";
        SType = "Indicator";
        Label = "Seizure assignment";
    }    
     
    OUT MIR-VIR-CVG-NUM-T[99] 
    {
       
        FieldGroup = "Table99";
        DBTableName = "TCVG";
        Index = "1";
        KeyColumn;
        Label = "Coverage No";
        Length = "2";
        SType = "Text";
    }
 
    OUT MIR-VIR-PLAN-ID-T[99] 
    {
        CodeSource = "EDIT";
        CodeType = "PLAN";
        DBTableName = "TCVG";
        FieldGroup = "Table99";
        Index = "1";
        Label = "Plan";
        Length = "40";
        SType = "Text";
    }
 
    OUT MIR-VIR-CVG-FACE-AMT-T[99] 
    {   
        FieldGroup = "Table99";
        DBTableName = "TCVG";
        Index = "1";
        Label = "Face Amount";
        Length = "16";
        SType = "Currency";
        Signed;
    }

    OUT MIR-UNEARN-LOAN-INT-AMT 
    {
        Signed;
        Length = "15";
        SType = "Currency";
        Label = "Unearned Interest";
    }

    OUT MIR-TOT-SURR-INCM-AMT
    {
        CurrencyCode = "MIR-PMT-CRCY-CD";    
        Length = "15";
        SType = "Currency";
        Label = "Total Paid-up Income amount";
    }  
    
    OUT MIR-TOT-SURR-XPNS-AMT
    {
        CurrencyCode = "MIR-PMT-CRCY-CD";    
        Length = "15";
        SType = "Currency";
        Label = "Total Paid-up Expense";
    }  
     
    OUT MIR-NET-SURR-INCM-AMT
    {
        CurrencyCode = "MIR-PMT-CRCY-CD";    
        Length = "15";
        SType = "Currency";
        Label = "Net Paid-up Income amount";
    }  
    
    OUT MIR-NET-SURR-XPNS-AMT
    {
        CurrencyCode = "MIR-PMT-CRCY-CD";    
        Length = "15";
        SType = "Currency";
        Label = "Net Paid-up Expense amount";
    }

    OUT MIR-WARN-MSG-CD
    {
      Length = "01";
      SType = "Text";
      Label = "Warning Message Indicator";
    }

    OUT MIR-INS-TYP-CD
    {
       Length = "3";
       CodeSource = "EDIT";
       CodeType = "PRSML";
       DBTableName = "TETAB";
       SType = "Text";
       Label = "InsuranceType";
    }  
    OUT MIR-TCALC-PD-PREM-AMT
    {
        CurrencyCode = "MIR-PMT-CRCY-CD";    
        Length = "15";
        SType = "Currency";
        Label = "Paid Premium Amount";
    } 
    OUT MIR-VIR-QUOTE-CON[3]
    {       
        FieldGroup = "Table3";
        DBTableName = "Derived";
        Index = "1";
        KeyColumn;
        Label = "Remarks";
        Length = "154";
        SType = "Text";
    }
    INOUT MIR-SELECT-T[10]
    {       
        FieldGroup = "Table10";
        DBTableName = "Derived";
        Index = "1";
        KeyColumn;
        Label = "Condition phrase print checkbox indicator";
        Length = "1";
        SType = "checkbox";
    }
    INOUT MIR-CON-PRT-ORD-T[10]
    {       
        FieldGroup = "Table10";
        DBTableName = "Derived";
        Index = "1";
        Label = "Condition phrase print order control";
        Length = "2";
        SType = "Text";
    }
    INOUT MIR-PRT-CON-PHR-T[10]
    {       
        FieldGroup = "Table10";
        DBTableName = "Derived";
        Index = "1";
        Label = "Print condition phrase";
        Length = "140";
        SType = "Text";
    }
}