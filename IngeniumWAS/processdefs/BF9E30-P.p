# Converted from PathFinder 2.2 to 3.0 Jun 18, 2004 3:13:52 PM EDT

#*******************************************************************************
#*  Component:   BF9E30-P.p                                                    *
#*  Description: Policy Inquiry Webservice                                     *
#*                                                                             *
#*******************************************************************************
#*                                                                             *
#*  UYS024  CTS      INITIAL VERSION                                           *
#*  S22948  CTS   INCREASING LENGTH OF ADRESS LOACTION CODE                    *
#*  S23197  CTS   LOGIC FOR POLCHGCODE AND POLCHGDT                            *
#*  S22955  CTS   FIX FOR POL DRW DY                                           *
#*  S24186  CTS  CHANGES DONE FOR  REMARK FIELD                                *
#*  S24485  CTS   FIX TO POPULATE LAPSE DATE                                   *
#*  S24496  CTS  CHANGES DONE FOR  MATURITY EXP FIELD                          *
#*  S25313  CTS   FIX FOR POLICY INQUIRY FIELD                                 *
#*  S25404  CTS   BUG FIX FOR LATEST BILLED FIELDS                             *
#*  S25283  CTS   CHANGES DONE FOR ADVNC PMT FILEDS                            *
#*  S25641  CTS   FIX FOR WSPOLINQ FIELDS                                      *
#*  S25847  CTS   FIX FOR MULTIPLIER                                           *
#*  S25836  CTS    FIX FOR FULL ADV PMT FLAG                                   *
#*******************************************************************************

P-STEP BF9E30-P
{
    ATTRIBUTES
    {
        BusinessFunctionId = "9E30";
        BusinessFunctionName = "Policy Inquiry (Main)";
        BusinessFunctionType = "WSPolInq";
        MirName = "CCWM9E30";
    }

    OUT LSIR-RETURN-CD;

    OUT MIR-RETRN-CD;

    INOUT MIR-POL-ID-BASE
    {
        Key;
        Mandatory;
        Length = "9";
        DBTableName = "TPOL";
        DefaultSession = "MIR-POL-ID-BASE";
        SType = "Text";
        Label = "Policy Id";
    }
    
    INOUT MIR-POL-ID-SFX
    {
        Key;
        Length = "1";
        DBTableName = "TPOL";
        DefaultSession = "MIR-POL-ID-SFX";
        SType = "Text";
        Label = "Suffix";
    }    

    IN MIR-POL-INS-TYP-CD
    {
        Length ="3";
        SType = "Text";
        DBTableName = "TPOL";
        Label = "Insurance Type";
    }
  
    OUT MIR-POL-ISS-EFF-DT
    {
        Length = "10";
        DBTableName = "TPOL";
        SType = "Date";
        Label = "Issue Date of the Policy";
    }
    
#S25641 CHANGES START    
    OUT MIR-SMALL-TYP-CD
    {
        Length = "3";
        CodeSource = "EDIT";
        CodeType = "PRSML";
        DBTableName = "TETAB";
        SType = "Text";
        Label = "Small Type Code";
    }  
#S25641 CHANGES END     

    OUT MIR-OWN-NM-KJ
    {
        Length = "100";
        DBTableName = "Derived";
        SType = "Text";
        Label = "Policyholder Name (Kanji)";
    }
    OUT MIR-OWN-NM-KA
    {
        Length = "100";
        DBTableName = "Derived";
        SType = "Text";
        Label = "Policyholder Name (Kana)";
    }
    OUT MIR-OWN-SEX-CD
    {
        Length = "1";
        CodeSource = "DataModel";
        CodeType = "OWN-SEX-CD";
        DBTableName = "TCLI";
        SType = "Text";
        Label = "Policyholder Sex";
    }
    OUT MIR-OWN-BTH-DT
    {
        Length = "10";
        DBTableName = "TCLI";
        SType = "Date";
        Label = "Policyholder Date of Birth";
    }
    OUT MIR-OWN-PHON-NUM
    {
        Length ="15";
        DBTableName = "TCLIA";
        SType = "Text";
        Label = "Policyholder Telephone Number";
    }
    OUT MIR-CRNT-ADDR-TXT
    {
        Length = "100";
        DBTableName = "TCLIA";
        SType = "Text";
        Label = "Current Address ";
    }
    OUT MIR-CRNT-ADDR-TXT-KJ
    {
        Length ="100";
        DBTableName = "TCLIA";
        SType = "Text";
        Label = "Current Address (Kanji)";
    }
    OUT MIR-ADDR-LOC-CD
    {
#*S22948 CHANGES STARTS HERE *   
#        Length = "2";
        Length = "8";
#*S22948 CHANGES STARTS HERE *     
        DBTableName = "TCLIA";
        SType = "Text";
        Label = "Address Code";
    }
    OUT MIR-PSTL-CD
    {
        Length = "9";
        DBTableName = "TCLIA";
        SType = "Text";
        Label = "Postal Code";
    }
    OUT MIR-INSRD-NM-KJ
    {
        Length = "51";
        DBTableName = "Derived";
        SType = "Text";
        Label = "Insured Name (Kanji)";
    }
    OUT MIR-INSRD-NM-KA
    {
        Length = "51";
        DBTableName = "Derived";
        SType = "Text";
        Label = "Insured Name (Kana)";
    }
    OUT MIR-INSRD-SEX-CD
    {
        Length = "1";
        CodeSource = "DataModel";
        CodeType = "CLI-SEX-CD";
        DBTableName = "TCLI";
        SType = "Text";
        Label = "Insured Sex";
    }
    OUT MIR-INSRD-BTH-DT
    {
        Length = "10";
        DBTableName = "TCLI";
        SType = "Date";
        Label = "Insured Date of Birth";
    }
#S23197 STARTS
    OUT MIR-POL-CHNG-CD
    {
#S24186 STARTS    
#        Length ="2";
#S24186 ENDS
        Length ="3";
        DBTableName = "Derived";
        SType = "Text";
        Label = "Policy Change Code";
    }

    OUT MIR-POL-CHNG-DT
    {
        Length ="10";
        DBTableName = "Derived";
        SType = "Date";
        Label = "Policy Change Date";
    }
#S23197 ENDS

    OUT MIR-ON-SALE-CTL-IND
    {
        Length ="1";
        SType = "Indicator";
        Label = "On-sales Control";
    }

    OUT MIR-UNEARN-PREM-RFND-AMT-IND
    {
        Label = "Refund of Unearned Premium";
        Length ="1";
        SType = "Indicator";
    }

    OUT MIR-TOT-PREM-ACCUM-TPID-AMT
    {
        Length = "15";
        DBTableName = "Derived";
        SType = "Currency";
        Label = "Premium Collected - Accumulation";
    }
    OUT MIR-TRAD-PD-DURATION-NUM
    {
        Length = "7";
        DBTableName = "Derived";
        SType = "Text";
        Label = "Paid Duration";
    }
    OUT MIR-TRAD-PD-TO-DT-YR-MO
    {
        Length ="7";
        DBTableName = "Derived";
        SType = "Text";
        Label = "Number of Paid Months";
    }
    OUT MIR-TRAD-PD-TO-DT-MO-NUM
    {
        Length = "7";
        DBTableName = "Derived";
        SType = "Text";
        Label = "Paid to Month";
    }
    OUT MIR-POL-LAPS-DT
    {
        Length ="10";
        DBTableName = "TDH";
        SType = "Date";
        Label = "Lapse Year & Month";
    }
    OUT MIR-REINST-DT
    {
        Length = "10";
        DBTableName = "TREIN";
        SType = "Date";
        Label = "Reinstatement Date";
    }
#S24496 CHANGES STARTS HERE
    OUT MIR-POL-MAT-EXP-DT
    {
        Length = "4";
        DBTableName = "Derived";
        SType = "Text";
        Label = "Paid to Month";
    }
#S24496 CHANGES ENDS HERE

    OUT MIR-UW-TYP-CD
    {
        Length = "1";
        CodeSource = "DataModel";
        CodeType = "UW-TYP-CD";
        DBTableName = "TCLIU";
        SType = "Text";
        Label = "Medical Selection Code";
    }
    OUT MIR-TYP-CD
    {
        Length ="10";
        DBTableName = "Derived";
        SType = "Text";
        Label = "Type";
    }
    OUT MIR-MULTR-NUM
    {
#S25847 CHANGES START    
#        Length ="1";
        Length ="2";
#S25847 CHANGES END
        SType = "Text";
        DBTableName = "Derived";
        Label = "Multiplier";
    }
    OUT MIR-PERI1-NUM
    {
        Length ="3";
        SType = "Text";
        DBTableName = "Derived";
        Label = "Period 1";
    }
    OUT MIR-PERI2-NUM
    {
        Length ="3";
        SType = "Text";
        DBTableName = "Derived";
        Label = "Period 2";
    }
    OUT MIR-POL-BILL-MODE-CD
    {
        Length ="2";
        CodeSource = "DataModel";
        CodeType = "POL-BILL-MODE-CD";
        DBTableName = "TPOL";
        SType = "Text";
        Label = "Premium Payment Mode";
    }
    OUT MIR-INSRD-AGE-NUM
    {
        Length = "3";
        Decimals = "0";
        DBTableName = "TCLI";
        SType = "Number";
        Label = "Age 1";
    }

    OUT MIR-ANTY-DTH-BNFT-AMT
    {
        Length = "15";
        DBTableName = "Derived";
        SType = "Currency";
        Label = "Death Benefit Annuity Capital Base LTC Benefit";
    }
    OUT MIR-ADB-AMT
    {
        Length = "15";
        DBTableName = "Derived";
        SType = "Currency";
        Label = "Accidental Death Benefit";
    }

    OUT MIR-INC-RETRN-BNFT-AMT
    {
        Length = "15";
        DBTableName = "Derived";
        SType = "Currency";
        Label = "Increasing returns benefit Old expired benefit";
    }
    OUT MIR-CANCER-DTH-BNFT-AMT
    {
        Length = "15";
        DBTableName = "Derived";
        SType = "Currency";
        Label = "Cancer death benefit";
    }
    OUT MIR-CANCER-DIAG-BNFT-AMT
    {
        Length = "15";
        DBTableName = "Derived";
        SType = "Currency";
        Label = "Cancer diagnosis benefit";
    }
    OUT MIR-CANCER-HSPTL-BNFT-AMT
    {
        Length = "15";
        DBTableName = "Derived";
        SType = "Currency";
        Label = "Cancer hospitalization benefit";
    }
    OUT MIR-POL-MPREM-AMT
    {
        Length = "15";
        DBTableName = "TPOL";
        SType = "Currency";
        Label = "Premium Amount";
    }
    OUT MIR-POL-PU-IND
    {
        Label = "Paid-up Policy";
        Length ="1";
        SType = "Indicator";
    }

    OUT MIR-POL-WAV-IND
    {
        Label = "Waiver of Premium Policy";
        Length ="1";
        SType = "Indicator";
    }
    OUT MIR-POL-STRT-EFF-DT
    {
        Length ="10";
        DBTableName = "Derived";
        SType = "Date";
        Label = "Start Date";
    }
    OUT MIR-PU-SRVL-CLM-AMT
    {
        Length = "15";
        DBTableName = "Derived";
        SType = "Currency";
        Label = "Survival Claim of Paid-up Policy";
    }

    OUT MIR-POL-XCES-SHRT-PREM-AMT
    {
        Signed;
        Length = "15";
        DBTableName = "TPOL";
        SType = "Currency";
        Label = "Excess / Shortage in Premium";
    }
    OUT MIR-DIV-PMT-MTHD-CD
    {
        Length ="2";
        SType = "Text";
        DBTableName = "Derived";
        Label = "Dividend Payment Method";
    }
    
#S25313 CHANGES START
    OUT MIR-SUB-CLMNT-FLG
    {
        Length ="1";
        SType = "Text";
        DBTableName = "Derived";
        Label = "Substitute Claimant Flag";
    }    
#S25313 CHANGES END        
        
    OUT MIR-PMT-WIRE-XFER-IND
    {
        Label = "Payment Slip Used";
        DBTableName = "TPOL";
        Length ="1";
        SType = "Indicator";
    }
    OUT MIR-PMT-MTHD-CD
    {
        Length ="1";
        DBTableName = "Derived";
        SType = "Text";
        Label = "Payment Route ";
    }
    OUT MIR-SERVC-AGT-REG-OFC-CD
    {
        Length = "5";
        CodeSource = "XTAB";
        CodeType = "SALE";
        DBTableName = "TAG";
        SType = "Text";
        Label = "Servicing Agent's Regional Office";
    }
    OUT MIR-POL-SERV-AGT-NM
    {
        Length = "51";
        DBTableName = "Derived";
        SType = "Text";
        Label = "Servicing Agent Name";
    }
    OUT MIR-SERV-AGT-MANG-REG-OFC-ID
    {
        Length = "3";
        CodeSource = "XTAB";
        CodeType = "SALE";
        DBTableName = "TAG";
        SType = "Text";
        Label = "Managing Regional Office ";
    }
    OUT MIR-SERV-AGT-AGNCY-CD
    {
        Length = "10";
        DBTableName = "TPOL";
        SType = "Text";
        Label = "Agency Code / Sales Office";
    }
    OUT MIR-PD-CLI-ID
    {
        Length ="10";
        DBTableName = "TCLI";
        SType = "Text";
        Label = "Organization Code";
    }
    OUT MIR-WRIT-AGT-ID
    {
        Length = "10";
        DBTableName = "TPOL";
        SType = "Text";
        Label = "Writing Agent";
    }
    OUT MIR-APL-BAL-AMT
    {
        Length = "15";
        DBTableName = "Derived";
        SType = "Currency";
        Label = "APL Balance";
    }
    OUT MIR-APL-DT
    {
        Length ="10";
        SType = "Date";
        DBTableName = "Derived";
        Label = "APL Date ";
    }
    OUT MIR-APL-AMT
    {
        Length = "15";
        DBTableName = "Derived";
        SType = "Currency";
        Label = "Amount of This APL";
    }
    OUT MIR-APL-NUM-OF-MO
    {
        Length ="3";
        SType = "Text";
        DBTableName = "Derived";
        Label = "Number of APL months";
    }

    OUT MIR-LAPS-DUE-OVR-LOAN-IND
    {
        Label = "Lapse due to Over-loan";
        Length ="1";
        SType = "Indicator";
    }

    OUT MIR-MTHLY-PREM-AMT
    {
        Length = "15";
        DBTableName = "Derived";
        SType = "Currency";
        Label = "Bank Transfer Rider Monthly Premium";
    }

    OUT MIR-VAR-FACE-AMT-INIT-PREM-AMT
    {
        Length = "15";
        DBTableName = "Derived";
        SType = "Currency";
        Label = "Initial Premium / Variable Face Amount";
    }

    OUT MIR-PREM-NOTI-REQIR-IND
    {
        Label = "Premium Notice Required";
        Length ="1";
        SType = "Indicator";
    }
    OUT MIR-PREM-NOTI-NOT-REQIR-IND
    {
        Label = "Premium Notice Not Required";
        Length ="1";
        SType = "Indicator";
    }
    OUT MIR-POL-TRMN-IND
    {
        Label = "Terminated Policy";
        Length ="1";
        SType = "Indicator";
    }

    OUT MIR-PREM-PMT-CMPLT-IND
    {
        Label = "Premium Payment Completion Policy";
        Length ="1";
        SType = "Indicator";
    }

#S25836 CHANGES ENDS HERE
    OUT MIR-FULL-ADV-PREM-IND
    {
        Label = "Fully Advanced Premium Policy";
        Length ="1";
        SType = "Indicator";
    }
#S25836 CHANGES ENDS HERE
	
    OUT MIR-POL-LAPS-IND
    {
        Label = "Lapsed Policy";
        Length ="1";
        SType = "Indicator";
    }
    OUT MIR-POL-REINST-IND
    {
        Label = "Reinstated Policy";
        Length ="1";
        SType = "Indicator";
    }
    OUT MIR-POL-PRESCRIPTN-IND
    {
        Length ="1";
        SType = "Text";
        Label = "Prescription Policy";
    }

    OUT MIR-POL-APL-DEND-IND
    {
        Length ="1";
        SType = "Indicator";
        Label = "APL Denied Policy ";
    }

    OUT MIR-ASIGN-POL-IND
    {
        Label = "Assignment Policy";
        Length ="1";
        SType = "Indicator";
    }
    OUT MIR-THFT-VCTM-POL-IND
    {
        Label = "Theft Victim Policy";
        Length ="1";
        SType = "Indicator";
    }
    OUT MIR-SEIZR-POL-IND
    {
        Label = "Seizure Policy";
        Length ="1";
        SType = "Indicator";
    }
    OUT MIR-LVNG-REQIR-RDR-IND
    {
        Label = "Living Needs Rider";
        Length ="1";
        SType = "Indicator";
    }
    OUT MIR-LOW-CSV-PRVD-IND
    {
        Label = "Low-CSV Provisions";
        Length ="1";
        SType = "Indicator";
    }
    OUT MIR-CORP-POL-IND
    {
        Label = "Corporate Policy - Payroll Deduction (Large Group/Small Group)";
        Length ="1";
        SType = "Indicator";
    }
    OUT MIR-ANNL-STMT-NT-REQ-IND
    {
        Label = "Policy Not Requiring Annual Statement";
        DBTableName = "TPOL";
        Length ="1";
        SType = "Indicator";
    }
    OUT MIR-DSASTR-BT-CD
    {
        Length ="1";
        DBTableName = "TPOL";
        CodeSource = "EDIT";
        CodeType = "DSAST";
        SType = "Indicator";
        Label = "Disaster Bit";
    }
    
#S25313 CHANGES START    
    OUT MIR-PCERT-REDEL-NBR
    {
        Length ="2";
        DBTableName = "TPOL";
        SType = "Text";
        Label = "Certificate Redelivery Number";    
    }
#S25313 CHANGES END

    OUT MIR-REPOL-CERT-DT
    {
        Length ="10";
        DBTableName = "TPOL";
        SType = "Date";
        Label = "Policy Certificate Re-delivery Date";
    }
    OUT MIR-VISL-DISAB-IND
    {
        Length ="1";
        SType = "Indicator";
        Label = "Visual Disability";
    }
    OUT MIR-HEAR-DISAB-IND
    {
        Length ="1";
        SType = "Indicator";
        Label = "Hearing Disability";
    }
    OUT MIR-LIEN1-DUR-NUM
    {
        Length = "1";
        DBTableName = "TCVG";
        SType = "Text";
        Label = "Lien 1";
    }
    OUT MIR-POL-BASE-XTRA-PREM-RT
    {
        Signed;
        Length = "3";
        Decimals = "2";
        DBTableName = "TCVG";
        SType = "Number";
        Label = "Base Policy Extra Premium (To 10,000 yen, %)";
    }

    OUT MIR-DTH-BNFY-CD
    {
        Length = "20";
        CodeSource = "DataModel";
        CodeType = "BNFY-DESGNT-CD";
        DBTableName = "TBENE";
        SType = "Text";
        Label = "Death Beneficiary";
    }
    OUT MIR-DTH-BNFY-NUM
    {
        Length ="3";
        DBTableName = "TBENE";
        SType = "Text";
        Label = "Number of Death Beneficiaries";
    }
    OUT MIR-SUBST-CLMT-NM
    {
        Length = "100";
        DBTableName = "TBENE";
        SType = "Text";
        Label = "Substitute Claimant Name";
    }
    OUT MIR-CANCER-BNFY-NM
    {
        Length = "100";
        DBTableName = "TBENE";
        SType = "Text";
        Label = "Cancer Benefit Beneficiary Name";
    }
    OUT MIR-STEP-IN-RIGHT-IND
    {
        Length ="1";
        SType = "Indicator";
        Label = "Step-in Right Indicator";
    }
    OUT MIR-NB-BULK-APP-ID-IND
    {
        Length ="1";
        SType = "Indicator";
        Label = "New Business Bulk Application ID";
    }
    OUT MIR-AUTO-SURR-IND
    {
        Length ="1";
        SType = "Indicator";
        Label = "Automatic Surrender";
    }
 
    OUT MIR-BNK-ID
    {
        Length ="4";
        DBTableName = "TBNKB";
        SType = "Text";
        Label = "Bank Code";
    }
    OUT MIR-BNK-BR-ID
    {
        Length = "5";
        DBTableName = "TCLIB";
        SType = "Text";
        Label = "Branch Code";
    }
    OUT MIR-BNK-ACCT-TYP-CD
    {
        Length = "40";
        CodeSource = "EDIT";
        CodeType = "ACTYP";
        DBTableName = "TBNKA";
        SType = "Text";
        Label = "Account Type";
    }
    OUT MIR-BNK-ACCT-ID
    {
        Length = "7";
        DBTableName = "TCLIB";
        SType = "Text";
        Label = "Account Number";
    }
    OUT MIR-BT-SUSP-BIT-IND
    {
        Label = "BT Suspension Bit ";
        Length ="1";
        SType = "Indicator";
    }
    OUT MIR-BT-PRCES-DT
    {
        Length ="10";
        DBTableName = "Derived";
        SType = "Date";
        Label = "BT Process Date";
    }
# S22955 CHANGES START
    OUT MIR-BT-DRW-DT
    {
        Length = "10";
#        DBTableName = "TBAC";
        DBTableName = "TPOL";	
#        SType = "Date";
        SType = "Day";
# S22955 CHANGES END	
        Label = "Draw Date";
    }
    OUT MIR-POL-BT-STRT-MO
    {
        Length ="2";
        DBTableName = "TPOL";
        SType = "Text";
        Label = "Withdrawal Resumption Month";
    }
    OUT MIR-BNK-ACCT-HLDR-NM
    {
        Length = "100";
        DBTableName = "TBNKA";
        SType = "Text";
        Label = "Account Holder Name";
    }

# S25404 CHANGES STARTS
    OUT MIR-BILL-YR-MO
    {
        Length ="7";
        DBTableName = "TBAC";
        SType = "Text";
        Label = "Billing Year and Month";
    }
    OUT MIR-NUM-OF-BILL
    {
        Length ="3";
        DBTableName = "TBAC";
        SType = "Text";
        Label = "Number of Bills";
    }
    OUT MIR-BILLED-PREM-AMT
    {
        Length = "15";
        DBTableName = "TBAC";
        SType = "Currency";
        Label = "Billed Premium";
    }
    OUT MIR-BILLED-YR
    {
        Length = "4";
        DBTableName = "Derived";
        SType = "Text";
        Label = "Billed Year";
    }
    OUT MIR-NET-BILL-AMT
    {
        Length = "15";
        DBTableName = "TBAC";
        SType = "Currency";
        Label = "Net Billing Amount";
    }
#    OUT MIR-PREV-DPOS-RECV-DT
    OUT MIR-LAST-DPOS-RECV-DT
# S25404 CHANGES ENDS
    {
        Length = "10";
        DBTableName = "TDH";
        SType = "Date";
        Label = "Last Deposit Date";
    }
    OUT MIR-PREV-DPOS-MO
    {
        Length ="2";
        DBTableName = "Derived";
        SType = "Text";
        Label = "Last Deposit Month ";
    }
    OUT MIR-NM-CNSLDT-DNL-BIT-IND
    {
        Label = "Name Consolidation Denial Bit";
        Length ="1";
        SType = "Indicator";
    }
# S25404 CHANGES STARTS
    OUT MIR-WITHDRAW-DT
    {
        Length = "10";
        DBTableName = "TBAC";
        SType = "Date";
        Label = "Latest Billed Draw Date";
    }
# S25404 CHANGES ENDS
    OUT MIR-DPOS-CAT-CD-T[06]
    {
#S25313 CHANGES START    
#        Length = "20";
        Length = "6";
#S25313 CHANGES END
        FieldGroup = "Table1";
        DBTableName = "Derived";
        SType = "Text";
        Label = "Deposit Category ";
        Index = "1";
    }
    OUT MIR-RFND-DPOS-NUM-T[06]
    {
        Length = "3";
        FieldGroup = "Table1";
        DBTableName = "TDH";
        SType = "Text";
        Label = "Number of Refund Deposits";
        Index = "1";
    }
    OUT MIR-SERV-AGT-ID-T[06]
    {
        Length = "6";
        FieldGroup = "Table1";
        DBTableName = "TPOL";
        SType = "Text";
        Label = "Servicing Agent ";
        Index = "1";
    }
    OUT MIR-DPOS-JRNL-DT-T[06]
    {
        Length = "10";
        FieldGroup = "Table1";
        DBTableName = "TDH";
        SType = "Date";
        Label = "Journal Date";
        Index = "1";
    }
    OUT MIR-LMPSM-PMT-BOX-AMT
    {
        Length = "15";
        DBTableName = "TPOL";
        SType = "Currency";
        Label = "Lump-sum Payment Box";
    }
# S25283 CHANGES STARTS
    OUT MIR-NXT-INT-CAP-DT
    {
        Length = "07";
        DBTableName = "DERIVED";
        SType = "DATE";
        Label = "NEXT INT CAPT DATE ";
    }
    OUT MIR-ADV-PMT-DUR-YYMM
    {
        Length = "03";
        DBTableName = "DERIVED";
        SType = "DATE";
        Label = "ADV PMT DUR YYMM ";
    }
    OUT MIR-APPR-AMT 
    {
        Length = "15";
        DBTableName = "DERIVED";
        SType = "CURRENCY";
        Label = "ADV PMT APPR AMT ";
    }
    
    
#S25283 CHANGES END    

    OUT MIR-PREPAY-DSCNT-RT
    {
        Length ="3";
        SType = "Text";
        Label = "Prepayment Discount Rate";
    }
    OUT MIR-ADV-PMT-CAT-CD-T[5]
    {
        Length ="03";
        FieldGroup = "Table2";
        DBTableName = "TPOL";
        CodeSource = "DataModel";
        CodeType = "PMT-CAT-CD";
        SType = "Text";
        Label = "Advance Payment Category";
        Index = "1";
    }
    OUT MIR-PRCES-DT-T[5]
    {
        Length = "10";
        DBTableName = "Derived";
        FieldGroup = "Table2";
        SType = "Date";
        Label = "Process Date";
        Index = "1";
    }
    OUT MIR-APROP-YR-MO-T[5]
    {
        Length = "7";
        FieldGroup = "Table2";
        DBTableName = "TDH";
        SType = "Text";
        Label = "Appropriation Year & Month";
        Index = "1";
    }
    OUT MIR-COLCT-AMT-T[5]
    {
        Signed;
        Length = "15";
        FieldGroup = "Table2";
        DBTableName = "TDH";
        SType = "Currency";
        Label = "Deposited / Disbursed Amount";
        Index = "1";
    }
    OUT MIR-RSDUE-AMT-T[5]
    {
        Signed;
        Length = "15";
        FieldGroup = "Table2";
        DBTableName = "TDH";
        SType = "Currency";
        Label = "Residuals of Advance Premium";
        Index = "1";
    }
    OUT MIR-NUM-MO-INT-CAP-T[5]
    {
        Length ="2";
        DBTableName = "Derived";
        FieldGroup = "Table2";
        SType = "Text";
        Label = "Number of Months of Interest Capitalization";
        Index = "1";
    }
    OUT MIR-UNRN-ELPS-MNTH-T[5]
    {
        Length ="2";
        DBTableName = "Derived";
        FieldGroup = "Table2";
        SType = "Text";
        Label = "Number of Unearned Months Elapsed ";
        Index = "1";
    }
    OUT MIR-ADV-PMT-DUR-T[5]
    {
        Length ="5";
        FieldGroup = "Table2";
        DBTableName = "TDH";
        SType = "Text";
        Label = "Years and Months of Advance Payment";
        Index = "1";
    }
    OUT MIR-NXT-APROP-YR-MO-T[5]
    {
        Length = "6";
        FieldGroup = "Table2";
        DBTableName = "TDH";
        SType = "Text";
        Label = "Next Appropriation Year & Month";
        Index = "1";
    }

    OUT MIR-INT-EFF-PERI-END-DT
    {
        Length ="10";
        DBTableName = "Derived";
        SType = "Date";
        Label = "Interest Effective Period End Date";
    }
    OUT MIR-LOAN-DT
    {
        Length = "10";
        SType = "Date";
        DBTableName = "TLHST";
        Label = "Loan Date";
    }
    OUT MIR-CRNT-LOAN-BAL-AMT
    {
        Length = "15";
        DBTableName = "TLHST";
        SType = "Currency";
        Label = "Current Loan Balance";
    }
    OUT MIR-LOAN-INT-RT
    {
        Length ="3";
        DBTableName = "TIR";
        SType = "Text";
        Label = "Interest Rate";
    }
    OUT MIR-LOAN-OVR-SHRT-INT-AMT
    {
        Signed;
        Length = "15";
        DBTableName = "TPOL";
        SType = "Currency";
        Label = "Over / Short Interest";
    }
    OUT MIR-REPAY-DUE-DT
    {
        Length ="10";
        SType = "Date";
        Label = "Repayment Due Date";
    }
    OUT MIR-PREV-INT-EFF-PERI-END-DT
    {
        Length ="10";
        SType = "Date";
        Label = "Previous Interest Effective Period End Date";
    }
    OUT MIR-LOAN-PRIN-AMT
    {
        Signed;
        Length = "15";
        DBTableName = "TLHST";
        SType = "Currency";
        Label = "Loan Principle";
    }
    OUT MIR-LOAN-APP-RECV-DT
    {
        Length ="10";
        SType = "Date";
        Label = "Policy Loan Application Received Date";
    }
    OUT MIR-SERV-AGT-REG-OFC-CD-T[5]
    {
        Length ="2";
        FieldGroup = "Table3";
        CodeSource = "DataModel";
        CodeType = "SERV-AGT-REG-OFC-CD";
        SType = "Text";
        Label = "Servicing Agent's Regional Office";
        Index = "1";
    }
    OUT MIR-JRNL-DT-T[5]
    {
        Length = "10";
        FieldGroup = "Table3";
        DBTableName = "TLHST";
        SType = "Date";
        Label = "Journal Date ";
        Index = "1";
    }
    OUT MIR-CALC-BASE-DT-T[5]
    {
        Length = "10";
        FieldGroup = "Table3";
        DBTableName = "TLHST";
        SType = "Date";
        Label = "Calculation Base Date";
        Index = "1";
    }
    OUT MIR-LOAN-CAT-CD-T[5]
    {
        Length ="3";
        FieldGroup = "Table3";
        CodeSource = "DataModel";
        CodeType = "LOAN-CAT-CD";
        DBTableName = "TLHST";
        SType = "Text";
        Label = "Loan Category (Policy Change Code)";
        Index = "1";
    }
    OUT MIR-LOAN-INT-AMT-T[5]
    {
        Length = "15";
        FieldGroup = "Table3";
        DBTableName = "TLHST";
        SType = "Currency";
        Label = "Interest Amount";
        Index = "1";
    }
    OUT MIR-LOAN-REPAY-AMT-T[5]
    {
        Signed;        
        Length = "15";
        FieldGroup = "Table3";
        DBTableName = "TLHST";
        SType = "Currency";
        Label = "Loan (Repayment) Amount";
        Index = "1";
    }
    OUT MIR-LOAN-BAL-AMT-T[5]
    {
        Length = "15";
        DBTableName = "TLHST";
        FieldGroup = "Table3";
        SType = "Currency";
        Label = "Loan Balance";
        Index = "1";
    }
    OUT MIR-RMRK-TXT-T[10]
    {
        FieldGroup = "Table4";
#*S24186 CHANGES STARTS HERE *           
#        Length ="20";
#*S24186 CHANGES STARTS HERE *           
        Length ="132";        
        DBTableName = "Derived";
        SType = "Text";
        Label = "Remark ";
        Index = "1";
    }

}
