# Converted from PathFinder 2.2 to 3.0 Jun 18, 2004 3:13:52 PM EDT

#*******************************************************************************
#*  Component:   BF9E81-P.p                                                    *
#*  Description: Conversion DHY TO UL Webservice                               *
#*                                                                             *
#*******************************************************************************
#*                                                                             *
#*  UY3147  CTS      INITIAL VERSION                                           *
#*******************************************************************************

P-STEP BF9E81-P
{
    ATTRIBUTES
    {
        BusinessFunctionId = "9E81";
        BusinessFunctionName = " Conversion DHY TO UL Webservice";
        BusinessFunctionType = "WSCnvr";
        MirName = "CCWM9E81";
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

    INOUT MIR-TRANS-CD
    {
        Key;
        Mandatory;
        Length = "6";
        SType = "Text";
        Label = "TransactionCode";
    }

    IN MIR-CNVR-PRCS-DT
    {
        Key;
        Mandatory;
        Length = "2"; 
        SType = "Date";
        Label = "Requestor Type Code";
    }

    IN MIR-PRCS-CTRL-FLG
    {
        Length ="3";
        SType = "Text";
        Label = "Insurance Type";
    }

    OUT MIR-SML-TYP-CD
    {
        Length ="3";
        CodeSource = "DataModel";
        CodeType = "SML-TYP-CD";
        SType = "Text";
        Label = "Small Type Code";
    }
    OUT MIR-CNVR-APPLCBLTY
    {
        Length = "02";
        SType = "Date";
        Label = "Conversion availability";
    }
    OUT MIR-PRCES-UNDR-WAY-IND
    {
        Length ="1";
        SType = "Indicator";
        Label = "Process underway";
    }
    OUT MIR-EXPRY-DT
    {
        Length = "08";
        SType = "Date";
        Label = "Expiration date";
    }
    OUT MIR-SERV-AGT-ID
    {
        Length ="06";
        SType = "Text";
        Label = "Servicing Agent ID";
    }
    OUT MIR-OWNR-NM-KA
    {
        Length = "32";
        DBTableName = "TCLI";
        SType = "Text";
        Label = "Policyholder Last Name(Kana)";
    }
    OUT MIR-INSRD-NM-KA
    {
        Length = "16";
        DBTableName = "TCLI";		
        SType = "Text";
        Label = "Insured Name　(Kana)";   
	}
    
    OUT MIR-POL-ISS-EFF-DT
    {
        Length = "08";
        SType = "Date";
        DBTableName = "TPOL";				
        Label = "Policy Issue Date";
    }
    OUT MIR-CNVR-BAL-AMT
    {
        Signed;
        Length = "15";
        SType = "Currency";
        Label = "Total Conversion fund";
    }
    OUT MIR-PREM-AFTR-CNVR
    {
        Signed;
        Length = "15";
        SType = "Currency";
        Label = "Premium after conversion adjustment";
    }
	
    OUT MIR-MAT-XPRY-DT
    {
        Length ="08";
        DBTableName = "TCVG";
        SType = "Date";
        Label = "Maturity Date";
    }
    OUT MIR-ELPSD-PER
    {
        Length ="04";
        SType = "Date";
        Label = "Elapsed period";
    }
    OUT MIR-RATE-BOOK-PRM
    {
        Length ="15";
        SType = "Text";
        Label = "Rate book premium";
    }	
    OUT MIR-APL-SIGN-IND
    {
        Length ="1";
        SType = "Indicator";
        Label = "APL - Sign";
    }	
    OUT MIR-APL-AMT
    {
        Length = "15";
        DBTableName = "Derived";
        SType = "Currency";
        Label = "Amount of This APL";
    }
    OUT MIR-LOAN-SIGN-IND
    {
        Length ="1";
        SType = "Indicator";
        Label = "Policy loan - Sign";
    }	
    OUT MIR-LOAN-AMT
    {
        Length = "15";
        DBTableName = "Derived";
        SType = "Currency";
        Label = "Total policy loan";
    }
    OUT MIR-SET-POL-IN-TYP
    {
        Length = "03";
        DBTableName = "TPOL";
        SType = "TEXT";
        Label = "Insurance Type (set policy)";
    }
    OUT MIR-SET-CONN-POL-ID
    {
        Length = "07";
        SType = "Text";
        Label = "Policy Id (set policy)";
    }
    OUT MIR-SET-CONN-POL-MSG
    {
        Length = "26";
        SType = "Text";
        Label = "Set　policy  message";
    }
    OUT MIR-CAU-MSG-1
    {
        Length = "100";
        SType = "Text";
        Label = "Caution message1";
    }
    OUT MIR-CAU-MSG-2
    {
        Length = "100";
        SType = "Text";
        Label = "Caution message2";
    }
    OUT MIR-AUTHR-NM
    {
        Length = "16";
        SType = "Text";
        Label = "Creator's name";
    }
    OUT MIR-DT-OF-CRTN-DT
    {
        Length = "08";
        DBTableName = "TPOL";
        SType = "Date";		
        Label = "Date of creation";
    }
    OUT MIR-CNVR-NUM
    {
        Length = "10";
        SType = "Text";		
        Label = "Conversion number";
    }
    OUT MIR-CNVR-CALC-DT
    {
        Length = "06";
        SType = "Date";		
        Label = "Conversion calculation date";
    }
    OUT MIR-OWN-NM-KA-LAST
    {
        Length = "16";
        DBTableName = "TCLI";
        SType = "Text";		
        Label = "Policyholder's last name";
    }
    OUT MIR-OWN-NM-KA-FIRST
    {
        Length = "08";
        DBTableName = "TCLI";
        SType = "Text";		
        Label = "Policyholder's first name";
    }
    OUT MIR-OWN-BTH-DT
    {
        Length = "08";
        DBTableName = "TCLI";
        SType = "Date";		
        Label = "Policyholder's date of birth";
    }
    OUT MIR-OWN-SEX-CD
    {
        Length = "01";
        DBTableName = "TCLI";
        SType = "Text";		
        Label = "Policyholder's sex";
    }
    OUT MIR-INSRD-NM-KA-FIRST
    {
        Length = "08";
        DBTableName = "TCLI";
        SType = "Text";		
        Label = "Insured's last name";
    }
    OUT MIR-INSRD-NM-KA-LAST
    {
        Length = "08";
        DBTableName = "TCLI";
        SType = "Text";		
        Label = "Insured's first name";
    }
    OUT MIR-INSRD-BTH-DT
    {
        Length = "08";
        DBTableName = "TCLI";
        SType = "Date";		
        Label = "Insured's date of birth";
    }
    OUT MIR-INSRD-SEX-CD
    {
        Length = "01";
        DBTableName = "TCLI";
        SType = "Text";		
        Label = "Insured's sex";
    }			
    OUT MIR-EMP-CD
    {
        Length = "06";
        SType = "Text";		
        Label = "Employee code";
    }
    OUT MIR-POL-UNDR-CNV-IND
    {
        Length = "01";
        SType = "Indicator";		
        Label = "Under Conversion Process FLG";
    }
    OUT MIR-POL-INFO-CHNG-IND
    {
        Length = "01";
        SType = "Indicator";		
        Label = "Information change indicator";
    }
    OUT MIR-POL-CNVR-TYP-CD
    {
        Length = "02";
        SType = "Text";		
        Label = "Conversion type code";
    }
    OUT MIR-POL-DIG-CHCK-IND
    {
        Length = "01";
        SType = "Text";				
        Label = "Check digit";
    }
    OUT MIR-TYPE-1
    {
        Length = "03";
        SType = "Text";		
        Label = "Type 1";
    }
    OUT MIR-POL-ID-1
    {
        Length = "07";
        DBTableName = "TPOL";		
        SType = "Text";		
        Label = "Policy ID 1";
    }
    OUT MIR-POL-ISS-EFF-DT-1
    {
        Length = "08";
        DBTableName = "TPOL";				
        SType = "Date";		
        Label = "Policy issue date 1";
    }
    OUT MIR-POL-PMT-MODE-CD-1
    {
        Length = "02";
        SType = "Text";		
        Label = "Payment mode 1";
    }
    OUT MIR-MAT-XPRY-DT-1
    {
        Length = "03";
        DBTableName = "TPOL";							
        SType = "Date";		
        Label = "Date of maturity 1";
    }
    OUT MIR-FLEX-FUND-V1-1
    {
        Length = "15";
        SType = "Text";		
        Label = "Flex Fund V1";
    }
    OUT MIR-FLEX-SPND-1
    {
        Length = "15";
        SType = "Text";		
        Label = "Flex Fund SP1";
    }
    OUT MIR-SE-5-V1-1
    {
        Length = "15";
        SType = "Text";		
        Label = "SE5V1";
    }
    OUT MIR-SE-5-SP1-1
    {
        Length = "15";
        SType = "Text";		
        Label = "SE5SP1";
    }
    OUT MIR-ESC-CHRG-AMT-1
    {
        Length = "15";
        SType = "Text";		
        Label = "ESC charge amount 1";
    }
    OUT MIR-MNTH-STD-P1-1
    {
        Length = "15";
        SType = "Text";		
        Label = "Monthly standard P 1";
    }
    OUT MIR-DTH-BNFT-AMT1-1
    {
        Length = "15";
        SType = "Text";		
        Label = "Death benefit amount 1";
    }
    OUT MIR-HOSP-BNFT-AMT1-1
    {
        Length = "15";
        SType = "Text";		
        Label = "Hosp. benefit amount 1";
    }
    OUT MIR-PD-PREM-AMT1-1
    {
        Length = "15";
        SType = "Text";		
        Label = "Paid premium 1";
    }
    OUT MIR-LOAN-BAL-AMT-1
    {
        Length = "15";
        SType = "Text";		
        Label = "Loan 1";
    }
    OUT MIR-ADJST-AFYC-1
    {
        Length = "15";
        SType = "Text";		
        Label = "Adjusted AFYC";
    }
    OUT MIR-PREM-SUB-CMSN-1
    {
        Length = "15";
        SType = "Text";		
        Label = "Premium subject to commission 1";
    }
    OUT MIR-FAC-SUB-CMSN-1
    {
        Length = "15";
        SType = "Text";		
        Label = "Face amount subject to commission 1";
    }
    OUT MIR-PD-PREM-YRS-1
    {
        Length = "03";
        SType = "Text";		
        Label = "Number of paid premiums reported";
    }
    OUT MIR-TYPE-2
    {
        Length = "03";
        SType = "Text";		
        Label = "Type 2";
    }
    OUT MIR-POL-ID-2
    {
        Length = "07";
        DBTableName = "TPOL";		
        SType = "Text";		
        Label = "Policy ID 2";
    }
    OUT MIR-POL-ISS-EFF-DT-2
    {
        Length = "08";
        DBTableName = "TPOL";				
        SType = "Date";		
        Label = "Policy issue date 2";
    }
    OUT MIR-POL-PMT-MODE-CD-2
    {
        Length = "02";
        SType = "Text";		
        Label = "Payment mode 2";
    }
    OUT MIR-MAT-XPRY-DT-2
    {
        Length = "03";
        DBTableName = "TPOL";							
        SType = "Date";		
        Label = "Date of maturity 2";
    }
    OUT MIR-FLEX-FUND-V1-2
    {
        Length = "15";
        SType = "Text";		
        Label = "Flex Fund V2";
    }
    OUT MIR-FLEX-SPND-2
    {
        Length = "15";
        SType = "Text";		
        Label = "Flex Fund SP2";
    }
    OUT MIR-SE-5-V1-2
    {
        Length = "15";
        SType = "Text";		
        Label = "SE5V2";
    }
    OUT MIR-SE-5-SP1-2
    {
        Length = "15";
        SType = "Text";		
        Label = "SE5SP2";
    }
    OUT MIR-ESC-CHRG-AMT-2
    {
        Length = "15";
        SType = "Text";		
        Label = "ESC charge amount 2";
    }
    OUT MIR-MNTH-STD-P1-2
    {
        Length = "15";
        SType = "Text";		
        Label = "Monthly standard P 2";
    }
    OUT MIR-DTH-BNFT-AMT1-2
    {
        Length = "15";
        SType = "Text";		
        Label = "Death benefit amount 2";
    }
    OUT MIR-HOSP-BNFT-AMT1-2
    {
        Length = "15";
        SType = "Text";		
        Label = "Hosp. benefit amount 2";
    }
    OUT MIR-PD-PREM-AMT1-2
    {
        Length = "15";
        SType = "Text";		
        Label = "Paid premium 2";
    }
    OUT MIR-LOAN-BAL-AMT-2
    {
        Length = "15";
        SType = "Text";		
        Label = "Loan 2";
    }
    OUT MIR-ADJST-AFYC-2
    {
        Length = "15";
        SType = "Text";		
        Label = "Adjusted AFYC 2";
    }
    OUT MIR-PREM-SUB-CMSN-2
    {
        Length = "15";
        SType = "Text";		
        Label = "Premium subject to commission 2";
    }
    OUT MIR-FAC-SUB-CMSN-2
    {
        Length = "15";
        SType = "Text";		
        Label = "Face amount subject to commission 2";
    }
    OUT MIR-PD-PREM-YRS-2
    {
        Length = "03";
        SType = "Text";		
        Label = "Number of paid premiums reported 2";
    }
    OUT MIR-TYPE-3
    {
        Length = "03";
        SType = "Text";		
        Label = "Type 3";
    }
    OUT MIR-POL-ID-3
    {
        Length = "07";
        DBTableName = "TPOL";		
        SType = "Text";		
        Label = "Policy ID 3";
    }
    OUT MIR-POL-ISS-EFF-DT-3
    {
        Length = "08";
        DBTableName = "TPOL";				
        SType = "Date";		
        Label = "Policy issue date 3";
    }
    OUT MIR-POL-PMT-MODE-CD-3
    {
        Length = "02";
        SType = "Text";		
        Label = "Payment mode 3";
    }
    OUT MIR-MAT-XPRY-DT-3
    {
        Length = "03";
        DBTableName = "TPOL";							
        SType = "Date";		
        Label = "Date of maturity 3";
    }
    OUT MIR-FLEX-FUND-V1-3
    {
        Length = "15";
        SType = "Text";		
        Label = "Flex Fund V3";
    }
    OUT MIR-FLEX-SPND-3
    {
        Length = "15";
        SType = "Text";		
        Label = "Flex Fund SP3";
    }
    OUT MIR-SE-5-V1-3
    {
        Length = "15";
        SType = "Text";		
        Label = "SE5V3";
    }
    OUT MIR-SE-5-SP1-3
    {
        Length = "15";
        SType = "Text";		
        Label = "SE5SP3";
    }
    OUT MIR-ESC-CHRG-AMT-3
    {
        Length = "15";
        SType = "Text";		
        Label = "ESC charge amount 3";
    }
    OUT MIR-MNTH-STD-P1-3
    {
        Length = "15";
        SType = "Text";		
        Label = "Monthly standard P 3";
    }
    OUT MIR-DTH-BNFT-AMT1-3
    {
        Length = "15";
        SType = "Text";		
        Label = "Death benefit amount 3";
    }
    OUT MIR-HOSP-BNFT-AMT1-3
    {
        Length = "15";
        SType = "Text";		
        Label = "Hosp. benefit amount 3";
    }
    OUT MIR-PD-PREM-AMT1-3
    {
        Length = "15";
        SType = "Text";		
        Label = "Paid premium 3";
    }
    OUT MIR-LOAN-BAL-AMT-3
    {
        Length = "15";
        SType = "Text";		
        Label = "Loan 3";
    }
    OUT MIR-ADJST-AFYC-3
    {
        Length = "15";
        SType = "Text";		
        Label = "Adjusted AFYC 3";
    }
    OUT MIR-PREM-SUB-CMSN-3
    {
        Length = "15";
        SType = "Text";		
        Label = "Premium subject to commission 3";
    }
    OUT MIR-FAC-SUB-CMSN-3
    {
        Length = "15";
        SType = "Text";		
        Label = "Face amount subject to commission 3";
    }
    OUT MIR-PD-PREM-YRS-3
    {
        Length = "03";
        SType = "Text";		
        Label = "Number of paid premiums reported 3";
    }
    OUT MIR-TYPE-4
    {
        Length = "03";
        SType = "Text";		
        Label = "Type 4";
    }
    OUT MIR-POL-ID-4
    {
        Length = "07";
        DBTableName = "TPOL";		
        SType = "Text";		
        Label = "Policy ID 4";
    }
    OUT MIR-POL-ISS-EFF-DT-4
    {
        Length = "08";
        DBTableName = "TPOL";				
        SType = "Date";		
        Label = "Policy issue date 4";
    }
    OUT MIR-POL-PMT-MODE-CD-4
    {
        Length = "02";
        SType = "Text";		
        Label = "Payment mode 4";
    }
    OUT MIR-MAT-XPRY-DT-4
    {
        Length = "03";
        DBTableName = "TPOL";							
        SType = "Date";		
        Label = "Date of maturity 4";
    }
    OUT MIR-FLEX-FUND-V1-4
    {
        Length = "15";
        SType = "Text";		
        Label = "Flex Fund V4";
    }
    OUT MIR-FLEX-SPND-4
    {
        Length = "15";
        SType = "Text";		
        Label = "Flex Fund SP4";
    }
    OUT MIR-SE-5-V1-4
    {
        Length = "15";
        SType = "Text";		
        Label = "SE5V4";
    }
    OUT MIR-SE-5-SP1-4
    {
        Length = "15";
        SType = "Text";		
        Label = "SE5SP4";
    }
    OUT MIR-ESC-CHRG-AMT-4
    {
        Length = "15";
        SType = "Text";		
        Label = "ESC charge amount 4";
    }
    OUT MIR-MNTH-STD-P1-4
    {
        Length = "15";
        SType = "Text";		
        Label = "Monthly standard P 4";
    }
    OUT MIR-DTH-BNFT-AMT1-4
    {
        Length = "15";
        SType = "Text";		
        Label = "Death benefit amount 4";
    }
    OUT MIR-HOSP-BNFT-AMT1-4
    {
        Length = "15";
        SType = "Text";		
        Label = "Hosp. benefit amount 4";
    }
    OUT MIR-PD-PREM-AMT1-4
    {
        Length = "15";
        SType = "Text";		
        Label = "Paid premium 4";
    }
    OUT MIR-LOAN-BAL-AMT-4
    {
        Length = "15";
        SType = "Text";		
        Label = "Loan 4";
    }
    OUT MIR-ADJST-AFYC-4
    {
        Length = "15";
        SType = "Text";		
        Label = "Adjusted AFYC 4";
    }
    OUT MIR-PREM-SUB-CMSN-4
    {
        Length = "15";
        SType = "Text";		
        Label = "Premium subject to commission 4";
    }
    OUT MIR-FAC-SUB-CMSN-4
    {
        Length = "15";
        SType = "Text";		
        Label = "Face amount subject to commission 4";
    }
    OUT MIR-PD-PREM-YRS-4
    {
        Length = "03";
        SType = "Text";		
        Label = "Number of paid premiums reported 4";
    }
    OUT MIR-TYPE-5
    {
        Length = "03";
        SType = "Text";		
        Label = "Type 5";
    }
    OUT MIR-POL-ID-5
    {
        Length = "07";
        DBTableName = "TPOL";		
        SType = "Text";		
        Label = "Policy ID 5";
    }
    OUT MIR-POL-ISS-EFF-DT-5
    {
        Length = "08";
        DBTableName = "TPOL";				
        SType = "Date";		
        Label = "Policy issue date 5";
    }
    OUT MIR-POL-PMT-MODE-CD-5
    {
        Length = "02";
        SType = "Text";		
        Label = "Payment mode 5";
    }
    OUT MIR-MAT-XPRY-DT-5
    {
        Length = "03";
        DBTableName = "TPOL";							
        SType = "Date";		
        Label = "Date of maturity 5";
    }
    OUT MIR-FLEX-FUND-V1-5
    {
        Length = "15";
        SType = "Text";		
        Label = "Flex Fund V5";
    }
    OUT MIR-FLEX-SPND-5
    {
        Length = "15";
        SType = "Text";		
        Label = "Flex Fund SP5";
    }
    OUT MIR-SE-5-V1-5
    {
        Length = "15";
        SType = "Text";		
        Label = "SE5V5";
    }
    OUT MIR-SE-5-SP1-5
    {
        Length = "15";
        SType = "Text";		
        Label = "SE5SP5";
    }
    OUT MIR-ESC-CHRG-AMT-5
    {
        Length = "15";
        SType = "Text";		
        Label = "ESC charge amount 5";
    }
    OUT MIR-MNTH-STD-P1-5
    {
        Length = "15";
        SType = "Text";		
        Label = "Monthly standard P 5";
    }
    OUT MIR-DTH-BNFT-AMT1-5
    {
        Length = "15";
        SType = "Text";		
        Label = "Death benefit amount 5";
    }
    OUT MIR-HOSP-BNFT-AMT1-5
    {
        Length = "15";
        SType = "Text";		
        Label = "Hosp. benefit amount 5";
    }
    OUT MIR-PD-PREM-AMT1-5
    {
        Length = "15";
        SType = "Text";		
        Label = "Paid premium 5";
    }
    OUT MIR-LOAN-BAL-AMT-5
    {
        Length = "15";
        SType = "Text";		
        Label = "Loan 5";
    }
    OUT MIR-ADJST-AFYC-5
    {
        Length = "15";
        SType = "Text";		
        Label = "Adjusted AFYC 5";
    }
    OUT MIR-PREM-SUB-CMSN-5
    {
        Length = "15";
        SType = "Text";		
        Label = "Premium subject to commission 5";
    }
    OUT MIR-FAC-SUB-CMSN-5
    {
        Length = "15";
        SType = "Text";		
        Label = "Face amount subject to commission 5";
    }
    OUT MIR-PD-PREM-YRS-5
    {
        Length = "03";
        SType = "Text";		
        Label = "Number of paid premiums reported 5";
    }
    OUT MIR-ONL-ERR-CODE
    {
        Length = "05";
        SType = "Text";		
        Label = "Online Error Code";
    }
    OUT MIR-MSG-TXT-DESC
    {
        Length = "100";
        SType = "Text";
        Label = "Error Messages";
    }
    OUT MIR-OWN-NM-KJ
    {
        Length = "64";
        DBTableName = "TCLI";		
        SType = "Text";		
        Label = "Policyholder's name (kanji)";
    }
    OUT MIR-INSRD-NM-KJ
    {
        Length = "32";
        DBTableName = "TCLI";		
        SType = "Text";		
        Label = "Insured's name (kanji)";
    }
    OUT MIR-INSRD-SEX-CD1
    {
        Length = "04";
        CodeSource = "EDIT";
        CodeType = "SEX";
        SType = "Text";
        Label = "InsuredGender";
    }
    OUT MIR-INSRD-AGE-NUM
    {
        Length = "02";
        DBTableName = "TCLI";		
        SType = "Text";		
        Label = "Issue age";
    }
    OUT MIR-INS-TYP-CD
    {
        Length = "32";		
        SType = "Text";		
        Label = "Insurance type";
    }
    OUT MIR-POL-BILL-TYP-CD
    {
        Length = "14";		
        SType = "Text";		
        Label = "Payment method";
    }
    OUT MIR-PREM-AMT
    {
        Length = "11";		
        SType = "Text";		
        Label = "Premium";
    }
    OUT MIR-UNIT-PD-REM
    {
        Length = "02";		
        SType = "Text";		
        Label = "Unit (premium)";
    }
    OUT MIR-POL-MSG-STAT 
    {
        Length = "12";		
        SType = "Text";		
        Label = "Message about policy status";
    }
    OUT MIR-POL-DET-DESC-1
    {
        Length = "18";
        CodeSource = "EDIT";
        CodeType = "PRLRG";		
        SType = "Text";		
        Label = "Policy details 1";
    }
    OUT MIR-PERI1-NUM-1
    {
        Length = "03";
        CodeSource = "EDIT";
        CodeType = "TPER";		
        SType = "Text";		
        Label = "Policy period 1";
    }
    OUT MIR-PMT-PER1
    {
        Length = "02";
        SType = "Text";		
        Label = "Payment period 1";
    }
    OUT MIR-WDTH-1
    {
        Length = "02";
        SType = "Text";		
        Label = "Width 1";
    }
    OUT MIR-CVG-AMT1
    {
        Length = "11";
        DBTableName = "TCVG";
        SType = "Text";		
        Label = "Coverage amount 1";
    }
    OUT MIR-UNIT-CPREM-1
    {
        Length = "02";
        CodeSource = "EDIT";
        CodeType = "TPER";		
        SType = "Text";		
        Label = "Unit (coverage amount) 1";
    }
    OUT MIR-CVG-MPREM-AMT-1
    {
        Length = "11";
        DBTableName = "TCVG";
        SType = "Text";		
        Label = "Premium 1";
    }
    OUT MIR-UNIT-PREM1
    {
        Length = "11";
        CodeSource = "EDIT";
        CodeType = "TPER";		
        SType = "Text";		
        Label = "Unit (premium) 1";
    }
    OUT MIR-POL-DET-DESC-2
    {
        Length = "18";
        CodeSource = "EDIT";
        CodeType = "PRLRG";		
        SType = "Text";		
        Label = "Policy details 2";
    }
    OUT MIR-PERI1-NUM-2
    {
        Length = "03";
        CodeSource = "EDIT";
        CodeType = "TPER";		
        SType = "Text";		
        Label = "Policy period 2";
    }
    OUT MIR-PMT-PER2
    {
        Length = "02";
        SType = "Text";		
        Label = "Payment period 2";
    }
    OUT MIR-WDTH-2
    {
        Length = "02";
        SType = "Text";		
        Label = "Width 2";
    }
    OUT MIR-CVG-AMT2
    {
        Length = "15";
        DBTableName = "TCVG";
        SType = "Text";		
        Label = "Coverage amount 2";
    }
    OUT MIR-UNIT-CPREM-2
    {
        Length = "02";
        CodeSource = "EDIT";
        CodeType = "TPER";		
        SType = "Text";		
        Label = "Unit (coverage amount) 2";
    }
    OUT MIR-CVG-MPREM-AMT-2
    {
        Length = "15";
        DBTableName = "TCVG";
        SType = "Text";		
        Label = "Premium 2";
    }
    OUT MIR-UNIT-PREM2
    {
        Length = "11";
        CodeSource = "EDIT";
        CodeType = "TPER";		
        SType = "Text";		
        Label = "Unit (premium) 2";
    }
    OUT MIR-POL-DET-DESC-3
    {
        Length = "18";
        CodeSource = "EDIT";
        CodeType = "PRLRG";		
        SType = "Text";		
        Label = "Policy details 3";
    }
    OUT MIR-PERI1-NUM-3
    {
        Length = "03";
        CodeSource = "EDIT";
        CodeType = "TPER";		
        SType = "Text";		
        Label = "Policy period 3";
    }
    OUT MIR-PMT-PER3
    {
        Length = "02";
        SType = "Text";		
        Label = "Payment period 3";
    }
    OUT MIR-WDTH-3
    {
        Length = "02";
        SType = "Text";		
        Label = "Width 3";
    }
    OUT MIR-CVG-AMT3
    {
        Length = "15";
        DBTableName = "TCVG";
        SType = "Text";		
        Label = "Coverage amount 3";
    }
    OUT MIR-UNIT-CPREM-3
    {
        Length = "02";
        CodeSource = "EDIT";
        CodeType = "TPER";		
        SType = "Text";		
        Label = "Unit (coverage amount) 3";
    }
    OUT MIR-CVG-MPREM-AMT-3
    {
        Length = "15";
        DBTableName = "TCVG";
        SType = "Text";		
        Label = "Premium 3";
    }
    OUT MIR-UNIT-PREM3
    {
        Length = "11";
        CodeSource = "EDIT";
        CodeType = "TPER";		
        SType = "Text";		
        Label = "Unit (premium) 3";
    }
    OUT MIR-POL-DET-DESC-4
    {
        Length = "18";
        CodeSource = "EDIT";
        CodeType = "PRLRG";		
        SType = "Text";		
        Label = "Policy details 4";
    }
    OUT MIR-PERI1-NUM-4
    {
        Length = "03";
        CodeSource = "EDIT";
        CodeType = "TPER";		
        SType = "Text";		
        Label = "Policy period 4";
    }
    OUT MIR-PMT-PER4
    {
        Length = "02";
        SType = "Text";		
        Label = "Payment period 4";
    }
    OUT MIR-WDTH-4
    {
        Length = "02";
        SType = "Text";		
        Label = "Width 4";
    }
    OUT MIR-CVG-AMT4
    {
        Length = "15";
        DBTableName = "TCVG";
        SType = "Text";		
        Label = "Coverage amount 4";
    }
    OUT MIR-UNIT-CPREM-4
    {
        Length = "02";
        CodeSource = "EDIT";
        CodeType = "TPER";		
        SType = "Text";		
        Label = "Unit (coverage amount) 4";
    }
    OUT MIR-CVG-MPREM-AMT-4
    {
        Length = "15";
        DBTableName = "TCVG";
        SType = "Text";		
        Label = "Premium 4";
    }
    OUT MIR-UNIT-PREM4
    {
        Length = "11";
        CodeSource = "EDIT";
        CodeType = "TPER";		
        SType = "Text";		
        Label = "Unit (premium) 4";
    }
    OUT MIR-POL-DET-DESC-5
    {
        Length = "18";
        CodeSource = "EDIT";
        CodeType = "PRLRG";		
        SType = "Text";		
        Label = "Policy details 5";
    }
    OUT MIR-PERI1-NUM-5
    {
        Length = "03";
        CodeSource = "EDIT";
        CodeType = "TPER";		
        SType = "Text";		
        Label = "Policy period 5";
    }
    OUT MIR-PMT-PER5
    {
        Length = "02";
        SType = "Text";		
        Label = "Payment period 5";
    }
    OUT MIR-WDTH-5
    {
        Length = "02";
        SType = "Text";		
        Label = "Width 5";
    }
    OUT MIR-CVG-AMT5
    {
        Length = "15";
        DBTableName = "TCVG";
        SType = "Text";		
        Label = "Coverage amount 5";
    }
    OUT MIR-UNIT-CPREM-5
    {
        Length = "02";
        CodeSource = "EDIT";
        CodeType = "TPER";		
        SType = "Text";		
        Label = "Unit (coverage amount) 5";
    }
    OUT MIR-CVG-MPREM-AMT-5
    {
        Length = "15";
        DBTableName = "TCVG";
        SType = "Text";		
        Label = "Premium 5";
    }
    OUT MIR-UNIT-PREM5
    {
        Length = "11";
        CodeSource = "EDIT";
        CodeType = "TPER";		
        SType = "Text";		
        Label = "Unit (premium) 5";
    }
    OUT MIR-POL-DET-DESC-6
    {
        Length = "18";
        CodeSource = "EDIT";
        CodeType = "PRLRG";		
        SType = "Text";		
        Label = "Policy details 6";
    }
    OUT MIR-PERI1-NUM-6
    {
        Length = "03";
        CodeSource = "EDIT";
        CodeType = "TPER";		
        SType = "Text";		
        Label = "Policy period 6";
    }
    OUT MIR-PMT-PER6
    {
        Length = "02";
        SType = "Text";		
        Label = "Payment period 6";
    }
    OUT MIR-WDTH-6
    {
        Length = "02";
        SType = "Text";		
        Label = "Width 6";
    }
    OUT MIR-CVG-AMT6
    {
        Length = "15";
        DBTableName = "TCVG";
        SType = "Text";		
        Label = "Coverage amount 6";
    }
    OUT MIR-UNIT-CPREM-6
    {
        Length = "02";
        CodeSource = "EDIT";
        CodeType = "TPER";		
        SType = "Text";		
        Label = "Unit (coverage amount) 6";
    }
    OUT MIR-CVG-MPREM-AMT-6
    {
        Length = "15";
        DBTableName = "TCVG";
        SType = "Text";		
        Label = "Premium 6";
    }
    OUT MIR-UNIT-PREM6
    {
        Length = "11";
        CodeSource = "EDIT";
        CodeType = "TPER";		
        SType = "Text";		
        Label = "Unit (premium) 6";
    }
    OUT MIR-POL-DET-DESC-7
    {
        Length = "18";
        CodeSource = "EDIT";
        CodeType = "PRLRG";		
        SType = "Text";		
        Label = "Policy details 7";
    }
    OUT MIR-PERI1-NUM-7
    {
        Length = "03";
        CodeSource = "EDIT";
        CodeType = "TPER";		
        SType = "Text";		
        Label = "Policy period 7";
    }
    OUT MIR-PMT-PER7
    {
        Length = "02";
        SType = "Text";		
        Label = "Payment period 7";
    }
    OUT MIR-WDTH-7
    {
        Length = "02";
        SType = "Text";		
        Label = "Width 7";
    }
    OUT MIR-CVG-AMT7
    {
        Length = "15";
        DBTableName = "TCVG";
        SType = "Text";		
        Label = "Coverage amount 7";
    }
    OUT MIR-UNIT-CPREM-7
    {
        Length = "02";
        CodeSource = "EDIT";
        CodeType = "TPER";		
        SType = "Text";		
        Label = "Unit (coverage amount) 7";
    }
    OUT MIR-CVG-MPREM-AMT-7
    {
        Length = "15";
        DBTableName = "TCVG";
        SType = "Text";		
        Label = "Premium 7";
    }
    OUT MIR-UNIT-PREM7
    {
        Length = "11";
        CodeSource = "EDIT";
        CodeType = "TPER";		
        SType = "Text";		
        Label = "Unit (premium) 7";
    }	
    OUT MIR-POL-DET-DESC-8
    {
        Length = "18";
        CodeSource = "EDIT";
        CodeType = "PRLRG";		
        SType = "Text";		
        Label = "Policy details 8";
    }
    OUT MIR-PERI1-NUM-8
    {
        Length = "03";
        CodeSource = "EDIT";
        CodeType = "TPER";		
        SType = "Text";		
        Label = "Policy period 8";
    }
    OUT MIR-PMT-PER8
    {
        Length = "02";
        SType = "Text";		
        Label = "Payment period 8";
    }
    OUT MIR-WDTH-8
    {
        Length = "02";
        SType = "Text";		
        Label = "Width 8";
    }
    OUT MIR-CVG-AMT8
    {
        Length = "15";
        DBTableName = "TCVG";
        SType = "Text";		
        Label = "Coverage amount 8";
    }
    OUT MIR-UNIT-CPREM-8
    {
        Length = "02";
        CodeSource = "EDIT";
        CodeType = "TPER";		
        SType = "Text";		
        Label = "Unit (coverage amount) 8";
    }
    OUT MIR-CVG-MPREM-AMT-8
    {
        Length = "15";
        DBTableName = "TCVG";
        SType = "Text";		
        Label = "Premium 8";
    }
    OUT MIR-UNIT-PREM8
    {
        Length = "11";
        CodeSource = "EDIT";
        CodeType = "TPER";		
        SType = "Text";		
        Label = "Unit (premium) 8";
    }
    OUT MIR-POL-DET-DESC-9
    {
        Length = "18";
        CodeSource = "EDIT";
        CodeType = "PRLRG";		
        SType = "Text";		
        Label = "Policy details 9";
    }
    OUT MIR-PERI1-NUM-9
    {
        Length = "03";
        CodeSource = "EDIT";
        CodeType = "TPER";		
        SType = "Text";		
        Label = "Policy period 9";
    }
    OUT MIR-PMT-PER9
    {
        Length = "02";
        SType = "Text";		
        Label = "Payment period 9";
    }
    OUT MIR-WDTH-9
    {
        Length = "02";
        SType = "Text";		
        Label = "Width 9";
    }
    OUT MIR-CVG-AMT9
    {
        Length = "15";
        DBTableName = "TCVG";
        SType = "Text";		
        Label = "Coverage amount 9";
    }
    OUT MIR-UNIT-CPREM-9
    {
        Length = "02";
        CodeSource = "EDIT";
        CodeType = "TPER";		
        SType = "Text";		
        Label = "Unit (coverage amount) 9";
    }
    OUT MIR-CVG-MPREM-AMT-9
    {
        Length = "15";
        DBTableName = "TCVG";
        SType = "Text";		
        Label = "Premium 9";
    }
    OUT MIR-UNIT-PREM9
    {
        Length = "11";
        CodeSource = "EDIT";
        CodeType = "TPER";		
        SType = "Text";		
        Label = "Unit (premium) 9";
    }
    OUT MIR-POL-DET-DESC-10
    {
        Length = "18";
        CodeSource = "EDIT";
        CodeType = "PRLRG";		
        SType = "Text";		
        Label = "Policy details 10";
    }
    OUT MIR-PERI1-NUM-10
    {
        Length = "03";
        CodeSource = "EDIT";
        CodeType = "TPER";		
        SType = "Text";		
        Label = "Policy period 10";
    }
    OUT MIR-PMT-PER10
    {
        Length = "02";
        SType = "Text";		
        Label = "Payment period 10";
    }
    OUT MIR-WDTH-10
    {
        Length = "02";
        SType = "Text";		
        Label = "Width 10";
    }
    OUT MIR-CVG-AMT10
    {
        Length = "15";
        DBTableName = "TCVG";
        SType = "Text";		
        Label = "Coverage amount 10";
    }
    OUT MIR-UNIT-CPREM-10
    {
        Length = "02";
        CodeSource = "EDIT";
        CodeType = "TPER";		
        SType = "Text";		
        Label = "Unit (coverage amount) 10";
    }
    OUT MIR-CVG-MPREM-AMT-10
    {
        Length = "15";
        DBTableName = "TCVG";
        SType = "Text";		
        Label = "Premium 10";
    }
    OUT MIR-UNIT-PREM10
    {
        Length = "11";
        CodeSource = "EDIT";
        CodeType = "TPER";		
        SType = "Text";		
        Label = "Unit (premium) 10";
    }
    OUT MIR-POL-DET-DESC-11
    {
        Length = "18";
        CodeSource = "EDIT";
        CodeType = "PRLRG";		
        SType = "Text";		
        Label = "Policy details 11";
    }
    OUT MIR-PERI1-NUM-11
    {
        Length = "03";
        CodeSource = "EDIT";
        CodeType = "TPER";		
        SType = "Text";		
        Label = "Policy period 11";
    }
    OUT MIR-PMT-PER11
    {
        Length = "02";
        SType = "Text";		
        Label = "Payment period 11";
    }
    OUT MIR-WDTH-11
    {
        Length = "02";
        SType = "Text";		
        Label = "Width 11";
    }
    OUT MIR-CVG-AMT11
    {
        Length = "15";
        DBTableName = "TCVG";
        SType = "Text";		
        Label = "Coverage amount 11";
    }
    OUT MIR-UNIT-CPREM-11
    {
        Length = "02";
        CodeSource = "EDIT";
        CodeType = "TPER";		
        SType = "Text";		
        Label = "Unit (coverage amount) 11";
    }
    OUT MIR-CVG-MPREM-AMT-11
    {
        Length = "15";
        DBTableName = "TCVG";
        SType = "Text";		
        Label = "Premium 11";
    }
    OUT MIR-UNIT-PREM11
    {
        Length = "11";
        CodeSource = "EDIT";
        CodeType = "TPER";		
        SType = "Text";		
        Label = "Unit (premium) 11";
    }
    OUT MIR-POL-DET-DESC-12
    {
        Length = "18";
        CodeSource = "EDIT";
        CodeType = "PRLRG";		
        SType = "Text";		
        Label = "Policy details 12";
    }
    OUT MIR-PERI1-NUM-12
    {
        Length = "03";
        CodeSource = "EDIT";
        CodeType = "TPER";		
        SType = "Text";		
        Label = "Policy period 12";
    }
    OUT MIR-PMT-PER12
    {
        Length = "02";
        SType = "Text";		
        Label = "Payment period 12";
    }
    OUT MIR-WDTH-12
    {
        Length = "02";
        SType = "Text";		
        Label = "Width 12";
    }
    OUT MIR-CVG-AMT12
    {
        Length = "15";
        DBTableName = "TCVG";
        SType = "Text";		
        Label = "Coverage amount 12";
    }
    OUT MIR-UNIT-CPREM-12
    {
        Length = "02";
        CodeSource = "EDIT";
        CodeType = "TPER";		
        SType = "Text";		
        Label = "Unit (coverage amount) 12";
    }
    OUT MIR-CVG-MPREM-AMT-12
    {
        Length = "15";
        DBTableName = "TCVG";
        SType = "Text";		
        Label = "Premium 12";
    }
    OUT MIR-UNIT-PREM12
    {
        Length = "11";
        CodeSource = "EDIT";
        CodeType = "TPER";		
        SType = "Text";		
        Label = "Unit (premium) 12";
    }	
    OUT MIR-POL-DET-DESC-13
    {
        Length = "18";
        CodeSource = "EDIT";
        CodeType = "PRLRG";		
        SType = "Text";		
        Label = "Policy details 13";
    }
    OUT MIR-PERI1-NUM-13
    {
        Length = "03";
        CodeSource = "EDIT";
        CodeType = "TPER";		
        SType = "Text";		
        Label = "Policy period 13";
    }
    OUT MIR-PMT-PER13
    {
        Length = "02";
        SType = "Text";		
        Label = "Payment period 13";
    }
    OUT MIR-WDTH-13
    {
        Length = "02";
        SType = "Text";		
        Label = "Width 13";
    }
    OUT MIR-CVG-AMT13
    {
        Length = "15";
        DBTableName = "TCVG";
        SType = "Text";		
        Label = "Coverage amount 13";
    }
    OUT MIR-UNIT-CPREM-13
    {
        Length = "02";
        CodeSource = "EDIT";
        CodeType = "TPER";		
        SType = "Text";		
        Label = "Unit (coverage amount) 13";
    }
    OUT MIR-CVG-MPREM-AMT-13
    {
        Length = "15";
        DBTableName = "TCVG";
        SType = "Text";		
        Label = "Premium 13";
    }
    OUT MIR-UNIT-PREM13
    {
        Length = "11";
        CodeSource = "EDIT";
        CodeType = "TPER";		
        SType = "Text";		
        Label = "Unit (premium) 13";
    }
    OUT MIR-POL-DET-DESC-14
    {
        Length = "18";
        CodeSource = "EDIT";
        CodeType = "PRLRG";		
        SType = "Text";		
        Label = "Policy details 14";
    }
    OUT MIR-PERI1-NUM-14
    {
        Length = "03";
        CodeSource = "EDIT";
        CodeType = "TPER";		
        SType = "Text";		
        Label = "Policy period 14";
    }
    OUT MIR-PMT-PER14
    {
        Length = "02";
        SType = "Text";		
        Label = "Payment period 14";
    }
    OUT MIR-WDTH-14
    {
        Length = "02";
        SType = "Text";		
        Label = "Width 14";
    }
    OUT MIR-CVG-AMT14
    {
        Length = "15";
        DBTableName = "TCVG";
        SType = "Text";		
        Label = "Coverage amount 14";
    }
    OUT MIR-UNIT-CPREM-14
    {
        Length = "02";
        CodeSource = "EDIT";
        CodeType = "TPER";		
        SType = "Text";		
        Label = "Unit (coverage amount) 14";
    }
    OUT MIR-CVG-MPREM-AMT-14
    {
        Length = "15";
        DBTableName = "TCVG";
        SType = "Text";		
        Label = "Premium 14";
    }
    OUT MIR-UNIT-PREM14
    {
        Length = "11";
        CodeSource = "EDIT";
        CodeType = "TPER";		
        SType = "Text";		
        Label = "Unit (premium) 14";
    }
    OUT MIR-POL-DET-DESC-15
    {
        Length = "18";
        CodeSource = "EDIT";
        CodeType = "PRLRG";		
        SType = "Text";		
        Label = "Policy details 15";
    }
    OUT MIR-PERI1-NUM-15
    {
        Length = "03";
        CodeSource = "EDIT";
        CodeType = "TPER";		
        SType = "Text";		
        Label = "Policy period 15";
    }
    OUT MIR-PMT-PER15
    {
        Length = "02";
        SType = "Text";		
        Label = "Payment period 15";
    }
    OUT MIR-WDTH-15
    {
        Length = "02";
        SType = "Text";		
        Label = "Width 15";
    }
    OUT MIR-CVG-AMT15
    {
        Length = "15";
        DBTableName = "TCVG";
        SType = "Text";		
        Label = "Coverage amount 15";
    }
    OUT MIR-UNIT-CPREM-15
    {
        Length = "02";
        CodeSource = "EDIT";
        CodeType = "TPER";		
        SType = "Text";		
        Label = "Unit (coverage amount) 15";
    }
    OUT MIR-CVG-MPREM-AMT-15
    {
        Length = "15";
        DBTableName = "TCVG";
        SType = "Text";		
        Label = "Premium 15";
    }
    OUT MIR-UNIT-PREM15
    {
        Length = "11";
        CodeSource = "EDIT";
        CodeType = "TPER";		
        SType = "Text";		
        Label = "Unit (premium) 15";
    }
    OUT MIR-POL-DET-DESC-16
    {
        Length = "18";
        CodeSource = "EDIT";
        CodeType = "PRLRG";		
        SType = "Text";		
        Label = "Policy details 16";
    }
    OUT MIR-PERI1-NUM-16
    {
        Length = "03";
        CodeSource = "EDIT";
        CodeType = "TPER";		
        SType = "Text";		
        Label = "Policy period 16";
    }
    OUT MIR-PMT-PER16
    {
        Length = "02";
        SType = "Text";		
        Label = "Payment period 16";
    }
    OUT MIR-WDTH-16
    {
        Length = "02";
        SType = "Text";		
        Label = "Width 16";
    }
    OUT MIR-CVG-AMT16
    {
        Length = "15";
        DBTableName = "TCVG";
        SType = "Text";		
        Label = "Coverage amount 16";
    }
    OUT MIR-UNIT-CPREM-16
    {
        Length = "02";
        CodeSource = "EDIT";
        CodeType = "TPER";		
        SType = "Text";		
        Label = "Unit (coverage amount) 16";
    }
    OUT MIR-CVG-MPREM-AMT-16
    {
        Length = "15";
        DBTableName = "TCVG";
        SType = "Text";		
        Label = "Premium 16";
    }
    OUT MIR-UNIT-PREM16
    {
        Length = "11";
        CodeSource = "EDIT";
        CodeType = "TPER";		
        SType = "Text";		
        Label = "Unit (premium) 16";
    }
    OUT MIR-POL-DET-DESC-17
    {
        Length = "18";
        CodeSource = "EDIT";
        CodeType = "PRLRG";		
        SType = "Text";		
        Label = "Policy details 17";
    }
    OUT MIR-PERI1-NUM-17
    {
        Length = "03";
        CodeSource = "EDIT";
        CodeType = "TPER";		
        SType = "Text";		
        Label = "Policy period 17";
    }
    OUT MIR-PMT-PER17
    {
        Length = "02";
        SType = "Text";		
        Label = "Payment period 17";
    }
    OUT MIR-WDTH-17
    {
        Length = "02";
        SType = "Text";		
        Label = "Width 17";
    }
    OUT MIR-CVG-AMT17
    {
        Length = "15";
        DBTableName = "TCVG";
        SType = "Text";		
        Label = "Coverage amount 17";
    }
    OUT MIR-UNIT-CPREM-17
    {
        Length = "02";
        CodeSource = "EDIT";
        CodeType = "TPER";		
        SType = "Text";		
        Label = "Unit (coverage amount) 17";
    }
    OUT MIR-CVG-MPREM-AMT-17
    {
        Length = "15";
        DBTableName = "TCVG";
        SType = "Text";		
        Label = "Premium 17";
    }
    OUT MIR-UNIT-PREM17
    {
        Length = "11";
        CodeSource = "EDIT";
        CodeType = "TPER";		
        SType = "Text";		
        Label = "Unit (premium) 17";
    }
    OUT MIR-POL-DET-DESC-18
    {
        Length = "18";
        CodeSource = "EDIT";
        CodeType = "PRLRG";		
        SType = "Text";		
        Label = "Policy details 18";
    }
    OUT MIR-PERI1-NUM-18
    {
        Length = "03";
        CodeSource = "EDIT";
        CodeType = "TPER";		
        SType = "Text";		
        Label = "Policy period 18";
    }
    OUT MIR-PMT-PER18
    {
        Length = "02";
        SType = "Text";		
        Label = "Payment period 18";
    }
    OUT MIR-WDTH-18
    {
        Length = "02";
        SType = "Text";		
        Label = "Width 18";
    }
    OUT MIR-CVG-AMT18
    {
        Length = "15";
        DBTableName = "TCVG";
        SType = "Text";		
        Label = "Coverage amount 18";
    }
    OUT MIR-UNIT-CPREM-18
    {
        Length = "02";
        CodeSource = "EDIT";
        CodeType = "TPER";		
        SType = "Text";		
        Label = "Unit (coverage amount) 18";
    }
    OUT MIR-CVG-MPREM-AMT-18
    {
        Length = "15";
        DBTableName = "TCVG";
        SType = "Text";		
        Label = "Premium 18";
    }
    OUT MIR-UNIT-PREM18
    {
        Length = "11";
        CodeSource = "EDIT";
        CodeType = "TPER";		
        SType = "Text";		
        Label = "Unit (premium) 18";
    }
    OUT MIR-POL-DET-DESC-19
    {
        Length = "18";
        CodeSource = "EDIT";
        CodeType = "PRLRG";		
        SType = "Text";		
        Label = "Policy details 19";
    }
    OUT MIR-PERI1-NUM-19
    {
        Length = "03";
        CodeSource = "EDIT";
        CodeType = "TPER";		
        SType = "Text";		
        Label = "Policy period 19";
    }
    OUT MIR-PMT-PER19
    {
        Length = "02";
        SType = "Text";		
        Label = "Payment period 19";
    }
    OUT MIR-WDTH-19
    {
        Length = "02";
        SType = "Text";		
        Label = "Width 19";
    }
    OUT MIR-CVG-AMT19
    {
        Length = "15";
        DBTableName = "TCVG";
        SType = "Text";		
        Label = "Coverage amount 19";
    }
    OUT MIR-UNIT-CPREM-19
    {
        Length = "02";
        CodeSource = "EDIT";
        CodeType = "TPER";		
        SType = "Text";		
        Label = "Unit (coverage amount) 19";
    }
    OUT MIR-CVG-MPREM-AMT-19
    {
        Length = "15";
        DBTableName = "TCVG";
        SType = "Text";		
        Label = "Premium 19";
    }
    OUT MIR-UNIT-PREM19
    {
        Length = "11";
        CodeSource = "EDIT";
        CodeType = "TPER";		
        SType = "Text";		
        Label = "Unit (premium) 19";
    }
    OUT MIR-POL-DET-DESC-20
    {
        Length = "18";
        CodeSource = "EDIT";
        CodeType = "PRLRG";		
        SType = "Text";		
        Label = "Policy details 20";
    }
    OUT MIR-PERI1-NUM-20
    {
        Length = "03";
        CodeSource = "EDIT";
        CodeType = "TPER";		
        SType = "Text";		
        Label = "Policy period 20";
    }
    OUT MIR-PMT-PER20
    {
        Length = "02";
        SType = "Text";		
        Label = "Payment period 20";
    }
    OUT MIR-WDTH-20
    {
        Length = "02";
        SType = "Text";		
        Label = "Width 20";
    }
    OUT MIR-CVG-AMT20
    {
        Length = "15";
        DBTableName = "TCVG";
        SType = "Text";		
        Label = "Coverage amount 20";
    }
    OUT MIR-UNIT-CPREM-20
    {
        Length = "02";
        CodeSource = "EDIT";
        CodeType = "TPER";		
        SType = "Text";		
        Label = "Unit (coverage amount) 20";
    }
    OUT MIR-CVG-MPREM-AMT-20
    {
        Length = "15";
        DBTableName = "TCVG";
        SType = "Text";		
        Label = "Premium 20";
    }
    OUT MIR-UNIT-PREM20
    {
        Length = "11";
        CodeSource = "EDIT";
        CodeType = "TPER";		
        SType = "Text";		
        Label = "Unit (premium) 20";
    }
    OUT MIR-POL-DET-DESC-21
    {
        Length = "18";
        CodeSource = "EDIT";
        CodeType = "PRLRG";		
        SType = "Text";		
        Label = "Policy details 21";
    }
    OUT MIR-PERI1-NUM-21
    {
        Length = "03";
        CodeSource = "EDIT";
        CodeType = "TPER";		
        SType = "Text";		
        Label = "Policy period 21";
    }
    OUT MIR-PMT-PER21
    {
        Length = "02";
        SType = "Text";		
        Label = "Payment period 21";
    }
    OUT MIR-WDTH-21
    {
        Length = "02";
        SType = "Text";		
        Label = "Width 21";
    }
    OUT MIR-CVG-AMT21
    {
        Length = "15";
        DBTableName = "TCVG";
        SType = "Text";		
        Label = "Coverage amount 21";
    }
    OUT MIR-UNIT-CPREM-21
    {
        Length = "02";
        CodeSource = "EDIT";
        CodeType = "TPER";		
        SType = "Text";		
        Label = "Unit (coverage amount) 21";
    }
    OUT MIR-CVG-MPREM-AMT-21
    {
        Length = "15";
        DBTableName = "TCVG";
        SType = "Text";		
        Label = "Premium 21";
    }
    OUT MIR-UNIT-PREM21
    {
        Length = "11";
        CodeSource = "EDIT";
        CodeType = "TPER";		
        SType = "Text";		
        Label = "Unit (premium) 21";
    }
    OUT MIR-POL-DET-DESC-22
    {
        Length = "18";
        CodeSource = "EDIT";
        CodeType = "PRLRG";		
        SType = "Text";		
        Label = "Policy details 22";
    }
    OUT MIR-PERI1-NUM-22
    {
        Length = "03";
        CodeSource = "EDIT";
        CodeType = "TPER";		
        SType = "Text";		
        Label = "Policy period 22";
    }
    OUT MIR-PMT-PER22
    {
        Length = "02";
        SType = "Text";		
        Label = "Payment period 22";
    }
    OUT MIR-WDTH-22
    {
        Length = "02";
        SType = "Text";		
        Label = "Width 22";
    }
    OUT MIR-CVG-AMT22
    {
        Length = "15";
        DBTableName = "TCVG";
        SType = "Text";		
        Label = "Coverage amount 22";
    }
    OUT MIR-UNIT-CPREM-22
    {
        Length = "02";
        CodeSource = "EDIT";
        CodeType = "TPER";		
        SType = "Text";		
        Label = "Unit (coverage amount) 22";
    }
    OUT MIR-CVG-MPREM-AMT-22
    {
        Length = "15";
        DBTableName = "TCVG";
        SType = "Text";		
        Label = "Premium 22";
    }
    OUT MIR-UNIT-PREM22
    {
        Length = "11";
        CodeSource = "EDIT";
        CodeType = "TPER";		
        SType = "Text";		
        Label = "Unit (premium) 22";
    }
    OUT MIR-POL-DET-DESC-23
    {
        Length = "18";
        CodeSource = "EDIT";
        CodeType = "PRLRG";		
        SType = "Text";		
        Label = "Policy details 23";
    }
    OUT MIR-PERI1-NUM-23
    {
        Length = "03";
        CodeSource = "EDIT";
        CodeType = "TPER";		
        SType = "Text";		
        Label = "Policy period 23";
    }
    OUT MIR-PMT-PER23
    {
        Length = "02";
        SType = "Text";		
        Label = "Payment period 23";
    }
    OUT MIR-WDTH-23
    {
        Length = "02";
        SType = "Text";		
        Label = "Width 23";
    }
    OUT MIR-CVG-AMT23
    {
        Length = "15";
        DBTableName = "TCVG";
        SType = "Text";		
        Label = "Coverage amount 23";
    }
    OUT MIR-UNIT-CPREM-23
    {
        Length = "02";
        CodeSource = "EDIT";
        CodeType = "TPER";		
        SType = "Text";		
        Label = "Unit (coverage amount) 23";
    }
    OUT MIR-CVG-MPREM-AMT-23
    {
        Length = "15";
        DBTableName = "TCVG";
        SType = "Text";		
        Label = "Premium 23";
    }
    OUT MIR-UNIT-PREM23
    {
        Length = "11";
        CodeSource = "EDIT";
        CodeType = "TPER";		
        SType = "Text";		
        Label = "Unit (premium) 23";
    }
    OUT MIR-POL-DET-DESC-24
    {
        Length = "18";
        CodeSource = "EDIT";
        CodeType = "PRLRG";		
        SType = "Text";		
        Label = "Policy details 24";
    }
    OUT MIR-PERI1-NUM-24
    {
        Length = "03";
        CodeSource = "EDIT";
        CodeType = "TPER";		
        SType = "Text";		
        Label = "Policy period 24";
    }
    OUT MIR-PMT-PER24
    {
        Length = "02";
        SType = "Text";		
        Label = "Payment period 24";
    }
    OUT MIR-WDTH-24
    {
        Length = "02";
        SType = "Text";		
        Label = "Width 24";
    }
    OUT MIR-CVG-AMT24
    {
        Length = "15";
        DBTableName = "TCVG";
        SType = "Text";		
        Label = "Coverage amount 24";
    }
    OUT MIR-UNIT-CPREM-24
    {
        Length = "02";
        CodeSource = "EDIT";
        CodeType = "TPER";		
        SType = "Text";		
        Label = "Unit (coverage amount) 24";
    }
    OUT MIR-CVG-MPREM-AMT-24
    {
        Length = "15";
        DBTableName = "TCVG";
        SType = "Text";		
        Label = "Premium 24";
    }
    OUT MIR-UNIT-PREM24
    {
        Length = "11";
        CodeSource = "EDIT";
        CodeType = "TPER";		
        SType = "Text";		
        Label = "Unit (premium) 24";
    }
    OUT MIR-POL-DET-DESC-25
    {
        Length = "18";
        CodeSource = "EDIT";
        CodeType = "PRLRG";		
        SType = "Text";		
        Label = "Policy details 25";
    }
    OUT MIR-PERI1-NUM-25
    {
        Length = "03";
        CodeSource = "EDIT";
        CodeType = "TPER";		
        SType = "Text";		
        Label = "Policy period 25";
    }
    OUT MIR-PMT-PER25
    {
        Length = "02";
        SType = "Text";		
        Label = "Payment period 25";
    }
    OUT MIR-WDTH-25
    {
        Length = "02";
        SType = "Text";		
        Label = "Width 25";
    }
    OUT MIR-CVG-AMT25
    {
        Length = "15";
        DBTableName = "TCVG";
        SType = "Text";		
        Label = "Coverage amount 25";
    }
    OUT MIR-UNIT-CPREM-25
    {
        Length = "02";
        CodeSource = "EDIT";
        CodeType = "TPER";		
        SType = "Text";		
        Label = "Unit (coverage amount) 25";
    }
    OUT MIR-CVG-MPREM-AMT-25
    {
        Length = "15";
        DBTableName = "TCVG";
        SType = "Text";		
        Label = "Premium 25";
    }
    OUT MIR-UNIT-PREM25
    {
        Length = "11";
        CodeSource = "EDIT";
        CodeType = "TPER";		
        SType = "Text";		
        Label = "Unit (premium) 25";
    }
    OUT MIR-POL-DET-DESC-26
    {
        Length = "18";
        CodeSource = "EDIT";
        CodeType = "PRLRG";		
        SType = "Text";		
        Label = "Policy details 26";
    }
    OUT MIR-PERI1-NUM-26
    {
        Length = "03";
        CodeSource = "EDIT";
        CodeType = "TPER";		
        SType = "Text";		
        Label = "Policy period 26";
    }
    OUT MIR-PMT-PER26
    {
        Length = "02";
        SType = "Text";		
        Label = "Payment period 26";
    }
    OUT MIR-WDTH-26
    {
        Length = "02";
        SType = "Text";		
        Label = "Width 26";
    }
    OUT MIR-CVG-AMT26
    {
        Length = "15";
        DBTableName = "TCVG";
        SType = "Text";		
        Label = "Coverage amount 26";
    }
    OUT MIR-UNIT-CPREM-26
    {
        Length = "02";
        CodeSource = "EDIT";
        CodeType = "TPER";		
        SType = "Text";		
        Label = "Unit (coverage amount) 26";
    }
    OUT MIR-CVG-MPREM-AMT-26
    {
        Length = "15";
        DBTableName = "TCVG";
        SType = "Text";		
        Label = "Premium 26";
    }
    OUT MIR-UNIT-PREM26
    {
        Length = "11";
        CodeSource = "EDIT";
        CodeType = "TPER";		
        SType = "Text";		
        Label = "Unit (premium) 26";
    }
    OUT MIR-MSG-DESC-1
    {
        Length = "76";
        SType = "Text";		
        Label = "Message";
    }
    OUT MIR-MSG-DESC-2
    {
        Length = "76";
        SType = "Text";		
        Label = "Message";
    }
    OUT MIR-MSG-DESC-3
    {
        Length = "76";
        SType = "Text";		
        Label = "Message";
    }
    OUT MIR-MSG-DESC-4
    {
        Length = "76";
        SType = "Text";		
        Label = "Message";
    }
    OUT MIR-MSG-DESC-5
    {
        Length = "76";
        SType = "Text";		
        Label = "Message";
    }	
    OUT MIR-PMT-STBL1-CD
    {
        Length = "14";
        DBTableName = "TCVG";		
        SType = "Text";		
        Label = "Payment period";
    }
    OUT MIR-POL-PERIOD
    {
        Length = "28";
        CodeSource = "EDIT";
        CodeType = "TSTB1";		
        SType = "Text";		
        Label = "Policy period";
    }
    OUT MIR-PREM-PMT-MTHD
    {
        Length = "18";
        SType = "Text";		
        Label = "Premium payment method";
    }
    OUT MIR-LMPSM-BNFT-AMT
    {
        Length = "10";
        DBTableName = "TPOL";		
        SType = "Text";		
        Label = "Lump-sum benefit amount";
    }
    OUT MIR-UNIT-LMPSM-BNFT
    {
        Length = "02";
        CodeSource = "EDIT";
        CodeType = "TPER";		
        SType = "Text";		
        Label = "Unit (lump-sum benefit amount)";
    }
    OUT MIR-CVG-DTH-BNFT-AMT
    {
        Length = "11";
        DBTableName = "TCVG";		
        SType = "Text";		
        Label = "Death benefit ";
    }
    OUT MIR-UNIT-DTH-BNFT
    {
        Length = "02";
        CodeSource = "EDIT";
        CodeType = "TPER";				
        SType = "Text";		
        Label = "Unit (death benefit)";
    }
    OUT MIR-BAS-WL-BNFT-AMT
    {
        Length = "11";
        DBTableName = "TCVG";		
        SType = "Text";		
        Label = "Whole life coverage part";
    }
    OUT MIR-UNIT-WL-BNFT
    {
        Length = "02";
        CodeSource = "EDIT";
        CodeType = "TPER";				
        SType = "Text";		
        Label = "Unit (whole life coverage part)";
    }
    OUT MIR-BAS-TRM-BNFT-AMT
    {
        Length = "11";
        DBTableName = "TCVG";		
        SType = "Text";		
        Label = "Term coverage part";
    }
    OUT MIR-UNIT-TRM-BNFT
    {
        Length = "02";
        CodeSource = "EDIT";
        CodeType = "TPER";				
        SType = "Text";		
        Label = "Unit (term coverage part)";
    }
    OUT MIR-TITLE-TERM-CVG
    {
        Length = "06";
        CodeSource = "EDIT";
        CodeType = "TPER";				
        SType = "Text";		
        Label = "Title  (term coverage part)";
    }	
    OUT MIR-ANN-CVG-PART
    {
        Length = "11";
        DBTableName = "TCVG";		
        SType = "Text";		
        Label = "Annuity coverage part";
    }		
    OUT MIR-UNIT-ANN-BNFT
    {
        Length = "06";
        CodeSource = "EDIT";
        CodeType = "TPER";				
        SType = "Text";		
        Label = "Unit (annuity coverage part)";
    }
	OUT MIR-SUR-BNFT-AMT
    {
        Length = "11";
        DBTableName = "TCVG";		
        SType = "Text";		
        Label = "Survival benefit coverage part";
    }
    OUT MIR-UNIT-SUR-BNFT
    {
        Length = "02";
        CodeSource = "EDIT";
        CodeType = "TPER";				
        SType = "Text";		
        Label = "Unit (survival benefit coverage part)";
    }
    OUT MIR-SUR-BNFT-CVG-DTLS
    {
        Length = "28";
        CodeSource = "EDIT";
        CodeType = "TPER";				
        SType = "Text";		
        Label = "Survival benefit coverage details";
    }
	OUT MIR-BAS-MAT-BNFT-AMT
    {
        Length = "11";
        DBTableName = "TCVG";		
        SType = "Text";		
        Label = "Maturity benefit";
    }
    OUT MIR-UNIT-MAT-BNFT
    {
        Length = "02";
        CodeSource = "EDIT";
        CodeType = "TPER";				
        SType = "Text";		
        Label = "Unit (maturity benefit)";
    }
	OUT MIR-BAS-ACC-BNFT-AMT
    {
        Length = "11";
        DBTableName = "TCVG";		
        SType = "Text";		
        Label = "Accidental death benefit";
    }
    OUT MIR-UNIT-ACC-BNFT
    {
        Length = "02";
        CodeSource = "EDIT";
        CodeType = "TPER";				
        SType = "Text";		
        Label = "Unit (accidental death benefit)";
    }
	OUT MIR-DREAD-BNFT-AMT
    {
        Length = "11";
        DBTableName = "TCVG";		
        SType = "Text";		
        Label = "Dread Disease benefit";
    }
    OUT MIR-UNIT-DREAD-BNFT
    {
        Length = "02";
        CodeSource = "EDIT";
        CodeType = "TPER";				
        SType = "Text";		
        Label = "Unit (dread disease benefit)";
    }
	OUT MIR-DREAD-TITLE
    {
        Length = "08";
        CodeSource = "EDIT";
        CodeType = "TPER";				
        SType = "Text";		
        Label = "Policy period - title";
    }
    OUT MIR-DREAD-SUB1-PERIOD
    {
        Length = "04";
        CodeSource = "EDIT";
        CodeType = "TPER";				
        SType = "Text";		
        Label = "Dread Disease policy period";
    }
    OUT MIR-UNIT-DREAD-PERIOD
    {
        Length = "02";
        CodeSource = "EDIT";
        CodeType = "TPER";				
        SType = "Text";		
        Label = "Unit (Dread Disease policy period)";
    }
	OUT MIR-DISE-HOSP-TITLE
    {
        Length = "16";
        CodeSource = "EDIT";
        CodeType = "TPER";				
        SType = "Text";		
        Label = "Title (Disease Hospitalization";
    }
    OUT MIR-DISE-BNFT-TYPE
    {
        Length = "02";
        CodeSource = "EDIT";
        CodeType = "TPER";				
        SType = "Text";		
        Label = "Benefit type (Disease Hosp)";
    }
	OUT MIR-UNIT-DISE-BNFT-TYP 
    {
        Length = "04";
        CodeSource = "EDIT";
        CodeType = "TPER";				
        SType = "Text";		
        Label = "Unit of benefit type (Disease Hosp)";
    }
    OUT MIR-DLY-AMT-DISE-TIT
    {
        Length = "04";
        CodeSource = "EDIT";
        CodeType = "TPER";				
        SType = "Text";		
        Label = "Daily amount - title (Disease Hosp)";
    }
	OUT MIR-DISE-BNFT-AMT 
    {
        Length = "06";
        DBTableName = "TCVG";		
        SType = "Text";		
        Label = "Disease Hosp benefit - daily amount";
    }
	OUT MIR-UNIT-DISE-HOSP-TYP 
    {
        Length = "02";
        CodeSource = "EDIT";
        CodeType = "TPER";				
        SType = "Text";		
        Label = "Unit (Disease Hosp)";
    }
    OUT MIR-POL-PER-DIS-HOS-TIT
    {
        Length = "08";
        CodeSource = "EDIT";
        CodeType = "TPER";				
        SType = "Text";		
        Label = "Policy period - title (Disease Hosp)";
    }
	OUT MIR-DIS-HOSP-POL-PER
    {
        Length = "02";
        CodeSource = "EDIT";
        CodeType = "TPER";				
        SType = "Text";		
        Label = "Policy period (Disease Hosp)";
    }
    OUT MIR-DIS-HOSP-POL-TIT-PER
    {
        Length = "02";
        CodeSource = "EDIT";
        CodeType = "TPER";				
        SType = "Text";		
        Label = "Policy period - unit (Disease Hosp)";
    }
	OUT MIR-TIT-ACCD-HOSP 
    {
        Length = "16";
        CodeSource = "EDIT";
        CodeType = "TPER";				
        SType = "Text";		
        Label = "Title (Accidental Hosp)";
    }
    OUT MIR-ACC-HOSP-BNFT-TYP
    {
        Length = "02";
        CodeSource = "EDIT";
        CodeType = "TPER";				
        SType = "Text";		
        Label = "Benefit type (Accidental Hosp)";
    }
	OUT MIR-UNIT-ACC-BNFT-TYP
    {
        Length = "04";
        CodeSource = "EDIT";
        CodeType = "TPER";				
        SType = "Text";		
        Label = "Benefit type - unit (Accidental Hosp)";
    }
    OUT MIR-DLY-AMT-ACC-HOP-TIT
    {
        Length = "15";
        CodeSource = "EDIT";
        CodeType = "TPER";				
        SType = "Text";		
        Label = "Daily amount - title (Accidental Hosp)";
    }
	OUT MIR-ACC-HOSP-BNFT-AMT 
    {
        Length = "06";
        DBTableName = "TCVG";
        SType = "Text";		
        Label = "Accidental Hosp benefit - daily amount";
    }
    OUT MIR-UNIT-ACC-HOSP-TYP
    {
        Length = "02";
        CodeSource = "EDIT";
        CodeType = "TPER";				
        SType = "Text";		
        Label = "Unit (Accidental Hosp)";
    }
	OUT MIR-POL-PER-ACC-HOS-TIT
    {
        Length = "08";
        CodeSource = "EDIT";
        CodeType = "TPER";				
        SType = "Text";		
        Label = "Policy period - title (Accidental Hosp)";
    }
    OUT MIR-ACC-HOSP-POL-PER
    {
        Length = "02";
        CodeSource = "EDIT";
        CodeType = "TPER";				
        SType = "Text";		
        Label = "Policy period (Accidental Hosp)";
    }
	OUT MIR-ACC-HOSP-POL-TIT-PER
    {
        Length = "02";
        CodeSource = "EDIT";
        CodeType = "TPER";				
        SType = "Text";		
        Label = "Policy period - unit (Accidental Hosp)";
    }
    OUT MIR-TIT-ADLT-DISE
    {
        Length = "16";
        CodeSource = "EDIT";
        CodeType = "TPER";				
        SType = "Text";		
        Label = "Title (Adult Disease)";
    }
	OUT MIR-ADLT-DISE-BNFT-TYP
    {
        Length = "02";
        CodeSource = "EDIT";
        CodeType = "TPER";				
        SType = "Text";		
        Label = "Benefit type (Adult Disease)";
    }
    OUT MIR-UNIT-ADLT-BNFT-TYP
    {
        Length = "04";
        CodeSource = "EDIT";
        CodeType = "TPER";				
        SType = "Text";		
        Label = "Benefit type - unit  (Adult Disease)";
    }
	OUT MIR-DLY-AMT-ADLT-DISE-TIT
    {
        Length = "04";
        CodeSource = "EDIT";
        CodeType = "TPER";						
        SType = "Text";		
        Label = "Daily amount - title (Adult Disease)";
    }
    OUT MIR-ADLT-DISE-BNFT-AMT
    {
        Length = "06";
        DBTableName = "TCVG";
        SType = "Text";		
        Label = "Adult Disease Hosp - daily amount";
    }
	OUT MIR-UNIT-ADLT-DISE-TYP
    {
        Length = "02";
        CodeSource = "EDIT";
        CodeType = "TPER";				
        SType = "Text";		
        Label = "Unit (Adult Disease)";
    }
    OUT MIR-POL-PER-ADLT-DISE-TIT
    {
        Length = "08";
        CodeSource = "EDIT";
        CodeType = "TPER";				
        SType = "Text";		
        Label = "Policy period - title (Adult Disease)";
    }
	OUT MIR-ADLT-DISE-POL-PER
    {
        Length = "02";
        CodeSource = "EDIT";
        CodeType = "TPER";						
        SType = "Text";		
        Label = "Policy period (Adult Disease)";
    }
    OUT MIR-ADLT-DISE-POL-TIT-PER
    {
        Length = "02";
        CodeSource = "EDIT";
        CodeType = "TPER";								
        SType = "Text";		
        Label = "Policy period - unit (Adult Disease)";
    }
	OUT MIR-TIT-BNFT-FEM-DIS
    {
        Length = "06";
        CodeSource = "EDIT";
        CodeType = "TPER";				
        SType = "Text";		
        Label = "Benefit type - title (Female Disease)";
    }
    OUT MIR-DLY-AMT-TIT-FEM-DIS
    {
        Length = "04";
        CodeSource = "EDIT";
        CodeType = "TPER";				
        SType = "Text";		
        Label = "Daily amount - title (Female Disease)";
    }
	OUT MIR-FEM-DIS-HOSP-DLY-AMT
    {
        Length = "15";
        DBTableName = "TCVG";
        SType = "Text";		
        Label = "Female Disease Hosp - daily amount";
    }
    OUT MIR-UNIT-FEM-DISE-TYP
    {
        Length = "02";
        CodeSource = "EDIT";
        CodeType = "TPER";								
        SType = "Text";		
        Label = "Unit (Female Disease)";
    }
	OUT MIR-POL-PER-FEM-DIS-TIT
    {
        Length = "08";
        CodeSource = "EDIT";
        CodeType = "TPER";				
        SType = "Text";		
        Label = "Policy period - title (Female Disease)";
    }
    OUT MIR-POL-PER-FEM-DIS-STB1
    {
        Length = "02";
        CodeSource = "EDIT";
        CodeType = "TPER";				
        SType = "Text";		
        Label = "Policy period (Female Disease)";
    }
	OUT MIR-POL-PER-FEM-DISE-UNIT
    {
        Length = "02";
        CodeSource = "EDIT";
        CodeType = "TPER";										
        SType = "Text";		
        Label = "Policy period - unit (Female Disease)";
    }
    OUT MIR-TIT-DISCH-BNFT
    {
        Length = "14";
        CodeSource = "EDIT";
        CodeType = "TPER";						
        SType = "Text";		
        Label = "Title (Discharge)";
    }
	OUT MIR-DISCH-BNFT-AMT
    {
        Length = "07";
        DBTableName = "TCVG";				
        SType = "Text";		
        Label = "Discharge Benefit";
    }
    OUT MIR-UNIT-DISCH-BNFT-TYP
    {
        Length = "02";
        CodeSource = "EDIT";
        CodeType = "TPER";				
        SType = "Text";		
        Label = "Unit (Discharge)";
    }
	OUT MIR-ADD-DISCH-TIT
    {
        Length = "24";
        CodeSource = "EDIT";
        CodeType = "TPER";										
        SType = "Text";		
        Label = "Additional Discharge - title (Discharge)";
    }
    OUT MIR-POL-PER-ADD-DISCH-TIT
    {
        Length = "08";
        CodeSource = "EDIT";
        CodeType = "TPER";						
        SType = "Text";		
        Label = "Policy period - title (Discharge)";
    }
	OUT MIR-ADD-DISCH-POL-TIT-PER
    {
        Length = "02";
        CodeSource = "EDIT";
        CodeType = "TPER";						
        SType = "Text";		
        Label = "Policy period (Discharge)";
    }
    OUT MIR-ADD-DICH-POL-PER
    {
        Length = "02";
        CodeSource = "EDIT";
        CodeType = "TPER";				
        SType = "Text";		
        Label = "Policy period - unit (Discharge)";
    }
	OUT MIR-TIT-OUT-PTNT-TIT
    {
        Length = "04";
        CodeSource = "EDIT";
        CodeType = "TPER";										
        SType = "Text";		
        Label = "Daily amount - title (Outpatient)";
    }
    OUT MIR-OUT-PTNT-DLY-AMT
    {
        Length = "06";
        DBTableName = "TCVG";						
        SType = "Text";		
        Label = "Outpatient benefit - daily amount";
    }
	OUT MIR-UNIT-OUT-DLY-AMT
    {
        Length = "02";
        CodeSource = "EDIT";
        CodeType = "TPER";								
        SType = "Text";		
        Label = "Unit (Outpatient)";
    }
    OUT MIR-POL-PER-OUT-PTNT
    {
        Length = "08";
        CodeSource = "EDIT";
        CodeType = "TPER";				
        SType = "Text";		
        Label = "Policy period - title (Outpatient)";
    }
	OUT MIR-POL-PER-OUT-SUB1
    {
        Length = "02";
        CodeSource = "EDIT";
        CodeType = "TPER";										
        SType = "Text";		
        Label = "Policy period (Outpatient))";
    }
    OUT MIR-POL-PER-OUT-SUB1-UNIT
    {
        Length = "02";
        CodeSource = "EDIT";
        CodeType = "TPER";								
        SType = "Text";		
        Label = "Policy period - unit (Outpatient)";
    }
	OUT MIR-LONG-TRM-HOSP-BNFT-AMT
    {
        Length = "07";
        DBTableName = "TCVG";						
        SType = "Text";		
        Label = "Long Term Hosp benefit - daily amount";
    }
    OUT MIR-UNIT-LONG-TERM-HOSP-TYP
    {
        Length = "02";
        CodeSource = "EDIT";
        CodeType = "TPER";				
        SType = "Text";		
        Label = "Unit (Long Term Hosp)";
    }
	OUT MIR-POL-PER-LONG-TERM-HOSP-TIT
    {
        Length = "08";
        CodeSource = "EDIT";
        CodeType = "TPER";										
        SType = "Text";		
        Label = "Policy period - title (Long Term Hosp)";
    }
    OUT MIR-POL-PER-LONG-TERM-HOSP
    {
        Length = "02";
        CodeSource = "EDIT";
        CodeType = "TPER";								
        SType = "Text";		
        Label = "Policy period (Long Term Hosp)";
    }
	OUT MIR-LONG-TERM-HOP-SUB1
    {
        Length = "02";
        CodeSource = "EDIT";
        CodeType = "TPER";						
        SType = "Text";		
        Label = "Policy period - unit (Long Term Hosp)";
    }
    OUT MIR-DSBLTY-BNFT-AMT-MIN
    {
        Length = "11";
        DBTableName = "TCVG";								
        SType = "Text";		
        Label = "Disability benefit (MIN)";
    }
	OUT MIR-UNIT-DSBLTY-BNFT-TYP-MIN
    {
        Length = "02";
        DBTableName = "TCVG";								
        SType = "Text";		
        Label = "Unit (Disability MIN)";
    }
    OUT MIR-DSBLTY-BNFT-WDTH
    {
        Length = "02";
        CodeSource = "EDIT";
        CodeType = "TPER";								
        SType = "Text";		
        Label = "Width";
    }
	OUT MIR-DSBLTY-BNFT-AMT-MAX
    {
        Length = "11";
        DBTableName = "TCVG";		
        SType = "Text";		
        Label = "Disability benefit (MAX)";
    }
    OUT MIR-UNIT-DSBLTY-BNFT-TYP-MAX
    {
        Length = "02";
        CodeSource = "EDIT";
        CodeType = "TPER";								
        SType = "Text";		
        Label = "Unit (Disability MAX)";
    }
    OUT MIR-POL-PER-DIS-BNFT-TIT
    {
        Length = "08";
        CodeSource = "EDIT";
        CodeType = "TPER";								
        SType = "Text";		
        Label = "Policy Period - title (Disability)";
    }
	OUT MIR-POL-PER-DIS-BNFT-SUB1
    {
        Length = "02";
        CodeSource = "EDIT";
        CodeType = "TPER";								
        SType = "Text";		
        Label = "Policy Period (Disability)";
    }
    OUT MIR-POL-PER-DIS-BNFT-UNIT
    {
        Length = "02";
        CodeSource = "EDIT";
        CodeType = "TPER";								
        SType = "Text";		
        Label = "Policy Period - unit (Disability)";
    }
    OUT MIR-OTHR-CVG-NAME-1
    {
        Length = "18";
        CodeSource = "EDIT";
        CodeType = "TPER";								
        SType = "Text";		
        Label = "Other coverage name 1";
    }
	OUT MIR-OTHR-CVG-AMT-1
    {
        Length = "10";
        DBTableName = "TCVG";
        SType = "Text";		
        Label = "Other coverage amount 1";
    }
    OUT MIR-OTHR-CVG-UNIT-1
    {
        Length = "02";
        CodeSource = "EDIT";
        CodeType = "TPER";								
        SType = "Text";		
        Label = "Unit (Other) 1";
    }
    OUT MIR-OTHR-CVG-NAME-2
    {
        Length = "18";
        CodeSource = "EDIT";
        CodeType = "TPER";								
        SType = "Text";		
        Label = "Other coverage name 2";
    }
	OUT MIR-OTHR-CVG-AMT-2
    {
        Length = "10";
        DBTableName = "TCVG";
        SType = "Text";		
        Label = "Other coverage amount 2";
    }
    OUT MIR-OTHR-CVG-UNIT-2
    {
        Length = "02";
        CodeSource = "EDIT";
        CodeType = "TPER";								
        SType = "Text";		
        Label = "Unit (Other) 2";
    }
    OUT MIR-OTHR-CVG-NAME-3
    {
        Length = "18";
        CodeSource = "EDIT";
        CodeType = "TPER";								
        SType = "Text";		
        Label = "Other coverage name 3";
    }
	OUT MIR-OTHR-CVG-AMT-3
    {
        Length = "10";
        DBTableName = "TCVG";
        SType = "Text";		
        Label = "Other coverage amount 3";
    }
    OUT MIR-OTHR-CVG-UNIT-3
    {
        Length = "02";
        CodeSource = "EDIT";
        CodeType = "TPER";								
        SType = "Text";		
        Label = "Unit (Other) 3";
    }
    OUT MIR-OTHR-CVG-NAME-4
    {
        Length = "18";
        CodeSource = "EDIT";
        CodeType = "TPER";								
        SType = "Text";		
        Label = "Other coverage name 4";
    }
	OUT MIR-OTHR-CVG-AMT-4
    {
        Length = "10";
        DBTableName = "TCVG";
        SType = "Text";		
        Label = "Other coverage amount 4";
    }
    OUT MIR-OTHR-CVG-UNIT-4
    {
        Length = "02";
        CodeSource = "EDIT";
        CodeType = "TPER";								
        SType = "Text";		
        Label = "Unit (Other) 4";
    }
    OUT MIR-OTHR-CVG-NAME-5
    {
        Length = "18";
        CodeSource = "EDIT";
        CodeType = "TPER";								
        SType = "Text";		
        Label = "Other coverage name 5";
    }
	OUT MIR-OTHR-CVG-AMT-5
    {
        Length = "10";
        DBTableName = "TCVG";
        SType = "Text";		
        Label = "Other coverage amount 5";
    }
    OUT MIR-OTHR-CVG-UNIT-5
    {
        Length = "02";
        CodeSource = "EDIT";
        CodeType = "TPER";								
        SType = "Text";		
        Label = "Unit (Other) 5";
    }
    OUT MIR-OTHR-CVG-NAME-6
    {
        Length = "18";
        CodeSource = "EDIT";
        CodeType = "TPER";								
        SType = "Text";		
        Label = "Other coverage name 6";
    }
	OUT MIR-OTHR-CVG-AMT-6
    {
        Length = "10";
        DBTableName = "TCVG";
        SType = "Text";		
        Label = "Other coverage amount 6";
    }
    OUT MIR-OTHR-CVG-UNIT-6
    {
        Length = "02";
        CodeSource = "EDIT";
        CodeType = "TPER";								
        SType = "Text";		
        Label = "Unit (Other) 6";
    }
    OUT MIR-OTHR-CVG-NAME-7
    {
        Length = "18";
        CodeSource = "EDIT";
        CodeType = "TPER";								
        SType = "Text";		
        Label = "Other coverage name 7";
    }
	OUT MIR-OTHR-CVG-AMT-7
    {
        Length = "10";
        DBTableName = "TCVG";
        SType = "Text";		
        Label = "Other coverage amount 7";
    }
    OUT MIR-OTHR-CVG-UNIT-7
    {
        Length = "02";
        CodeSource = "EDIT";
        CodeType = "TPER";								
        SType = "Text";		
        Label = "Unit (Other) 7";
    }
}	
