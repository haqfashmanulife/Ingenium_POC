# Converted from PathFinder 2.2 to 3.0 Jun 18, 2004 3:13:54 PM EDT

#*******************************************************************************
#*  Component:   BF9965-P.p                                                    *
#*  Description:                                                               *
#*                                                                             *
#*******************************************************************************
#*  Chg#     Release  Description                                              *
#*                                                                             *
#*  12APR05  FB       NEW FOR PA INQUIRY SCREEN                                *
#*  MFFPI    JE       ADDITIONAL ITEMS FOR BANNER AND BILLING INFORMATION      *
#*                    SA RIDER PREMIUM (BOTH) NUMBER OF SA RIDERS (BANNER)     *
#*                    NUMBER OF COVERAGES COUNT HAS BEEN COMMENTED OUT         *
#*                    BASED ON NEW PRODUCTION BUG FIX                          *
#*  IPPDRC   JE       ADDITIONAL ITEMS FOR IP/DD RIDER INQUIRY SUPPORT         *
#*  RP2012   CTS      ADDED SUB TABLE 4 CODE (MIR-CVG-STBL-4-CD) FOR MISC      *
#*                    SCREEN CHANGES AS APART OF MEDICAL REPRICING             *
#*  MP5001            ADD FIEL-INS-PURP-IND for FIEL changes                   *
#*  RPL012   CTS      ADDED SUB TABLE 3 CODE (MIR-CVG-STBL-3-CD) FOR MISC      *
#*                    SCREEN CHANGES AS PART OF LIMITED PAY                    *
#*  MP5002   CTS      ADD FLEX FUND SURRENDER CHARGE TYPE                      *
#*  EN5679   CTS      ADD PREMIUM NECCESSARY TO EXTEND GRACE PERIOD AS NEW     *
#*                    FIELD TO FUND INQUIRY SECTION AND FIELDS FOR THE NEW     *
#*                    OTHER COVERAGES SECTION.                                 *
#*  EN9547   CTS      COMMENTED OUT THE VARIBALE MIR-BNK-BR-ID1-T[6] DUE TO    *
#*                    DUPLICATE DECLARATION                                    *
#*  C13034   KS       ADD DISASTER CODE TO PA INQUIRY POLICY DETAILS SCREEN    *
#*  M161CA  CTS      ADDITION OF NEW FIELD INIT-PMT-TYP-CD                     *
#*  M241A3  CTS      FILTER SELECTION CHANGES TO IDENTIFY AGE OR DURATION      *
#*  M245B2  CTS      Foreign Currency Formatting 			       *
#*  Q61551  CTS      FRA Currency Code Changes   			       *
#*  M319O1  CTS      FXWL FOREGIN CURRENCY CODE CHANGES                        *
#*  R14127  CTS      CHANGES FOR DISASTER RECOVERY                             *
#*  TDMG24  CTS      INQUIRY SCREEN CHANGES                                    * 
#*  TLB041  CTS      CORPORATE POLICY HOLDER NAME & ADDRESS EXPANSION          *
#*  UYS133  CTS      Addition of PD group size field                           *
#*******************************************************************************

P-STEP BF9965-P
{
    ATTRIBUTES
    {
        BusinessFunctionId = "9965";
        BusinessFunctionName = "PA - Policy Inquiry";
        BusinessFunctionType = "Retrieve";
        MirName = "CCWM9965";
    }

    OUT LSIR-RETURN-CD;

    OUT MIR-RETRN-CD;

    INOUT MIR-SCRN-PATH-IND;

    INOUT MIR-POL-CVG-REC-CTR;

    INOUT MIR-SAVE-POL-ID-BASE;

    INOUT MIR-HAS-VAR-IND;

    IN MIR-POL-ID-BASE
    {
        Key;
        Mandatory;
        Length = "9";
        DBTableName = "TPOL";
        DefaultSession = "MIR-POL-ID-BASE";
        SType = "Text";
        Label = "Policy ID";
    }

    IN MIR-POL-ID-SFX
    {
        Key;
        Length = "1";
        DBTableName = "TPOL";
        DefaultSession = "MIR-POL-ID-SFX";
        SType = "Text";
        Label = "Suffix";
    }

    OUT MIR-DV-OWN-CLI-NM
    {
        #TLB041 CHANGES START HERE
	#Length = "75";
	Length = "100";
        #TLB041 CHANGES END HERE
        DBTableName = "Derived";
        SType = "Text";
        Label = "Owner Name";
    }

    OUT MIR-POL-PD-TO-DT-NUM
    {
        Length = "10";
        DBTableName = "TPOL";
        SType = "Text";
        Label = "Policy Paid to Date";
    }

#* MFFPI - THIS HAS BEEN COMMENTED OUT
#    OUT MIR-POL-CVG-REC-CTR
#    {
#        Length = "40";
#        DBTableName = "TPOL";
#        SType = "Text";
#        Label = "Number of Coverages on This Policy";
#    }
#
    OUT MIR-POL-CSTAT-CD
    {
        Length = "40";
        CodeSource = "DataModel";
        CodeType = "POL-CSTAT-CD";
        DBTableName = "TPOL";
        SType = "Text";
        Label = "Current Policy Status";
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
  

    OUT MIR-POL-GRS-APREM-AMT
    {
        Signed;
        Length = "15";
        DBTableName = "TPOL";
        SType = "Currency";
        Label = "Amount of Gross Annual Premium";
    }

    OUT MIR-POL-MPREM-AMT
    {
        Signed;
        Length = "15";
        DBTableName = "TPOL";
        SType = "Currency";
        Label = "Modal Premium as of Paid to Date";
    }

    OUT MIR-POL-UL-SHRT-AMT
    {
        Signed;
        Length = "15";
        DBTableName = "TPOL";
        SType = "Currency";
        Label = "Shortage Amount";
    }

    OUT MIR-POL-CNVR-TYP-CD
    {
        Length = "2";
        CodeSource = "DataModel";
        CodeType = "CNVR-TYP-CD";
        DBTableName = "TPOL";
        SType = "Text";
        Label = "Conversion Policy Type Code";
    }

#* MFFPI
    OUT MIR-DV-TOT-SA-PREM-AMT
    {
        Signed;
        Length = "15";
        DBTableName = "TCVG";
        SType = "Currency";
        Label = "SA Rider Premium";
    }

    OUT MIR-DV-POL-FND-CVG-REC-CTR
    {
        Length = "2";
        DBTableName = "TCVG";
        SType = "Text";
        Label = "Number of SA Riders";
    }

#*                                                 Basic Information
    OUT MIR-PLAN-ID
    {
        Length = "40";
        CodeSource = "EDIT";
        CodeType = "PLAN";
        DBTableName = "TPOL";
        SType = "Text";
        Label = "Plan ID";
    }

    OUT MIR-POL-ISS-EFF-DT
    {
        Length = "10";
        DBTableName = "TPOL";
        SType = "Date";
        Label = "Issue Date of the Policy";
    }

    OUT MIR-RECPT-DT-T[20]
    {
        Length = "10";
        FieldGroup = "Table20";
        DBTableName = "TCWAR";
        SType = "Date";
        Label = "Receipt Date";
        Index = "1";
    }

    OUT MIR-PROD-APP-TYP-CD
    {
        Length = "2";
        CodeSource = "DataModel";
        CodeType = "POL-PROD-APP-TYP";
        DBTableName = "TPOL";
        SType = "Text";
        Label = "Product Application Type Code";
    }

    OUT MIR-POL-SUB-STAT-CD
    {
        Length = "40";
        CodeSource = "EDIT";
        CodeType = "SUBSC";
        DBTableName = "TPOL";
        SType = "Selection";
        Label = "Policy Sub Status";
    }

    OUT MIR-AGT-UWG-FAIL-IND
    {
        Length = "1";
        CodeSource = "DataModel";
        CodeType = "CNTRCT-REL-TYP";
        DBTableName = "TPOL";
        SType = "Text";
        Label = "Contract Relationship Type";
    }

    OUT MIR-FREE-WTHDR-DT
    {
        Length = "10";
        DBTableName = "TPOL";
        SType = "Date";
        Label = "Last Free Withdrawal Date";
    }

#*                                               Agent Information
    OUT MIR-DV-SERV-AGT-NM
    {
        Length = "75";
        DBTableName = "Derived";
        SType = "Text";
        Label = "Servicing Agent Name";
    }

    OUT MIR-SERV-AGT-ID
    {
        Length = "6";
        DBTableName = "TPOL";
        SType = "Text";
        Label = "Servicing Agent ID";
    }

    OUT MIR-SERV-BR-ID
    {
        Length = "5";
        CodeSource = "XTAB";
        CodeType = "BRCH";
        DBTableName = "TPOL";
        SType = "Text";
        Label = "Servicing Agent's Branch";
    }

    OUT MIR-SERV-SO-ID
    {
        Length = "5";
        CodeSource = "XTAB";
        CodeType = "SALE";
        DBTableName = "TAG";
        SType = "Text";
        Label = "Servicing Agent's Sales Office";
    }

    OUT MIR-PREV-SERV-AGT-ID
    {
        Length = "6";
        DBTableName = "TPOL";
        SType = "Text";
        Label = "Previous Servicing Agent";
    }

    OUT MIR-AGT-ID-T[2]
    {
        Length = "6";
        FieldGroup = "Table2";
        KeyColumn;
        DBTableName = "TPOLW";
        SType = "Text";
        Label = "Writing Agent Number";
        Index = "1";
    }

    OUT MIR-DV-AGT-CLI-NM-T[2]
    {
        Length = "30";
        FieldGroup = "Table2";
        DBTableName = "Derived";
        SType = "Text";
        Label = "Agent Name";
        Index = "1";
    }

    OUT MIR-POL-AGT-SHR-PCT-T[2]
    {
        Length = "5";
        Decimals = "2";
        FieldGroup = "Table2";
        DBTableName = "TPOLW";
        SType = "Percent";
        Label = "Agent's Share Percentage";
        Index = "1";
    }

    OUT MIR-POL-AGT-TYP-CD-T[2]
    {
        Length = "1";
        FieldGroup = "Table2";
        CodeSource = "DataModel";
        CodeType = "CVG-AGT-TYP-CD";
        DBTableName = "TPOLW";
        SType = "Text";
        Label = "Agent Type";
        Index = "1";
    }

#*                                               Owner Information
    OUT MIR-DV-OWN-CLI-NM-KJ
    {
        #TLB041 CHANGES START HERE
        #Length = "75";
        Length = "100";
        #TLB041 CHANGES END HERE
        DBTableName = "Derived";
        SType = "Text";
        Label = "Owner Name";
    }

    OUT MIR-OWNER-CLI-ID
    {
        Length = "10";
        FieldGroup = "Table6";
        DBTableName = "TPOLC";
        SType = "Text";
        Label = "Client Number";
        Index = "1";
    }

    OUT MIR-CLI-BTH-DT
    {
        Length = "10";
        DBTableName = "TCLI";
        SType = "Date";
        Label = "Birth Date";
    }

    OUT MIR-CLI-SEX-CD
    {
        Length = "40";
        CodeSource = "DataModel";
        CodeType = "CLI-SEX-CD";
        DBTableName = "TCLI";
        SType = "Text";
        Label = "Sex";
    }

    OUT MIR-CLI-ADDR-LOC-CD
    {
        Length = "8";
        DBTableName = "TCLIA";
        SType = "Text";
        Label = "Address Code";
    }

    OUT MIR-CLI-PSTL-CD
    {
        Length = "9";
        DBTableName = "TCLIA";
        SType = "Text";
        Label = "Postal/Zip Code";
    }

#*  C13034 Changes Start

    OUT MIR-DSASTR-CD
    {
        DBTableName = "TPOL";
        CodeSource = "EDIT";
        CodeType = "DSAST";
        Length = "1";
        SType = "Text";
        Label = "Disaster Code";
    }    

#*  C13034 Changes End

#*  R14127 Changes Start

    OUT MIR-DSASTR-SUB-CD
    {
        DBTableName = "TPOL";
        CodeSource = "EDIT";
        CodeType = "DSTSB";
        Length = "2";
        SType = "Text";
        Label = "Disaster Sub Code";
    }    

#*  R14127 Changes End
    OUT MIR-CLI-PREFCT-TXT
    {
        Length = "11";
        DBTableName = "TCLIA";
        SType = "Text";
        Label = "Prefecture";
    }

    OUT MIR-CLI-KA-PREFCT-TXT
    {
        Length = "11";
        DBTableName = "TCLIA";
        SType = "Text";
        Label = "Prefecture";
    }

    OUT MIR-CLI-CITY-NM-TXT-T[2]
    {
        Length = "30";
        FieldGroup = "Table5";
        DBTableName = "TCLIA";
        SType = "Text";
        Label = "City";
        Index = "1";
    }

    OUT MIR-CLI-KA-CITY-TXT
    {
        Length = "30";
        DBTableName = "TCLIA";
        SType = "Text";
        Label = "City";
    }

    OUT MIR-CLI-ADDR-LN-1-TXT-T[2]
    {
        Length = "30";
        FieldGroup = "Table5";
        DBTableName = "TCLIA";
        SType = "Text";
        Label = "Address";
        Index = "1";
    }

    OUT MIR-CLI-KA-NGHBRHD-TXT
    {
        Length = "30";
        DBTableName = "TCLIA";
        SType = "Text";
        Label = "Neighborhood";
    }

    OUT MIR-CLI-ADDR-ADDL-TXT-T[2]
    {
        MixedCase;
        Length = "72";
        DBTableName = "TCLIA";
        SType = "Text";
        Label = "Samakata-bu";
    }

    OUT MIR-CLI-ADDR-CNTCT-TXT
    {
        Length = "50";
        DBTableName = "TCLIA";
        SType = "Text";
        Label = "Phone Number";
    }

    OUT MIR-CLI-CNTCT-ID-CD-T[5]
    {
        Key;
        Length = "2";
        FieldGroup = "Table5";
        CodeSource = "EDIT";
        CodeType = "CNTID";
        DBTableName = "TCLIC";
        SType = "Text";
        Label = "Contact Type";
        Index = "1";
    }

    OUT MIR-CLI-CNTCT-ID-TXT-T[5]
    {
        Length = "50";
        FieldGroup = "Table5";
        DBTableName = "TCLIC";
        SType = "Text";
        Label = "Identification Code";
        Index = "1";
    }

#*                                               Bank Information
    OUT MIR-BNK-ID
    {
        Length = "4";
        DBTableName = "TPDRW";
        SType = "Text";
        Label = "Bank Number";
    }

    OUT MIR-BNK-BR-ID
    {
        Length = "5";
        DBTableName = "TPDRW";
        SType = "Text";
        Label = "Branch Number";
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
        Length = "17";
        DBTableName = "TPDRW";
        SType = "Text";
        Label = "Account Number";
    }

    OUT MIR-DV-PAYR-CLI-NM
    {
        Length = "75";
        DBTableName = "Derived";
        SType = "Text";
        Label = "Payor Name";
    }

    OUT MIR-PAC-CLI-ID
    {
        Length = "10";
        DBTableName = "TPOLC";
        SType = "Text";
        Label = "Client Number";
    }

#*                                               Payroll Deduction Information
    OUT MIR-DV-LBILL-CLI-NM
    {
        Length = "75";
        DBTableName = "Derived";
        SType = "Text";
        Label = "Payroll Deduction Name";
    }

    OUT MIR-DV-LBILL-CLI-ID
    {
        Length = "10";
        DBTableName = "Derived";
        SType = "Text";
        Label = "Payroll Deduction Client ID";
    }

#*                                               Assignment Information
    OUT MIR-POL-ASIGN-IND
    {
        Length = "1";
        DBTableName = "TPOL";
        SType = "Indicator";
        Label = "Policy Assigned Indicator";
    }

    OUT MIR-POL-ASIGN-DT
    {
        Length = "10";
        DBTableName = "TPOL";
        SType = "Date";
        Label = "Policy Assigned Date";
    }

    OUT MIR-DV-ASIGN-CLI-ID-T[5]
    {
        Length = "10";
        FieldGroup = "Table4";
        KeyColumn;
        DBTableName = "Derived";
        SType = "Text";
        Label = "Assignee Client ID";
        Index = "1";
    }

    OUT MIR-DV-ASIGN-CLI-NM-T[5]
    {
        Length = "30";
        FieldGroup = "Table4";
        DBTableName = "Derived";
        SType = "Text";
        Label = "Assignee Name";
        Index = "1";
    }

    OUT MIR-DV-ASIGN-ADDR-CD-T[5]
    {
        Length = "40";
        FieldGroup = "Table4";
        CodeSource = "EDIT";
        CodeType = "ADTYP";
        DBTableName = "Derived";
        SType = "Text";
        Label = "Assignee Client Address Type";
        Index = "1";
    }

    OUT MIR-DV-ASIGN-SUB-CD-T[5]
    {
        Length = "40";
        FieldGroup = "Table4";
        CodeSource = "DataModel";
        CodeType = "DV-ASIGN-SUB-CD";
        DBTableName = "Derived";
        SType = "Text";
        Label = "Assignee Client Relationship Type";
        Index = "1";
    }

#*                                               Billing Information
    OUT MIR-POL-BILL-TYP-CD
    {
        Length = "1";
        CodeSource = "DataModel";
        CodeType = "POL-BILL-TYP-CD";
        DBTableName = "TPOL";
        SType = "Text";
        #M161CA START
        #Label = "Policy Billing Method";
        Label = "Policy Billing Method(Subsequent Premium)";
        #M161CA END
    }

    #M161CA START
    OUT MIR-INIT-PMT-TYP-CD
    {
        DisplayOnly;
        Length = "1";
        CodeSource = "DataModel";
        CodeType = "INIT-PMT-TYP-CD";
        SType = "Text";
        Label = "Payment Route (First Premium)";
    }
    #M161CA END
    OUT MIR-POL-BILL-MODE-CD
    {
        Length = "40";
        CodeSource = "DataModel";
        CodeType = "POL-BILL-MODE-CD";
        DBTableName = "TPOL";
        SType = "Text";
        Label = "Policy Billing Mode";
    }

    OUT MIR-POL-PAC-DRW-DY
    {
        Length = "2";
        DBTableName = "TPOL";
        SType = "Number";
        Label = "Billing Draw Day";
    }

    OUT MIR-POL-SNDRY-AMT
    {
        Signed;
        Length = "13";
        DBTableName = "TPOL";
        SType = "Currency";
        Label = "Sundry Payment Amount";
    }

    OUT MIR-POL-BILL-TO-DT-NUM
    {
        Length = "10";
        DBTableName = "TPOL";
        SType = "Date";
        Label = "Bill to Date";
    }


    OUT MIR-POL-PAC-RETRN-2-DT
    {
        Length = "10";
        DBTableName = "TPOL";
        SType = "Date";
        Label = "Date of Most Recently Returned Cheque";
    }

    OUT MIR-POL-PAC-RETRN-2-CD
    {
        Length = "1";
        CodeSource = "DataModel";
        CodeType = "PAC-DRW-RETRN-CD";
        DBTableName = "TPOL";
        SType = "Text";
        Label = "Reason Most Recent Cheque Returned";
    }

    OUT MIR-POL-PAC-RETRN-1-DT
    {
        Length = "10";
        DBTableName = "TPOL";
        SType = "Date";
        Label = "Date of Returned Cheque";
    }

    OUT MIR-POL-PAC-RETRN-1-CD
    {
        Length = "40";
        CodeSource = "DataModel";
        CodeType = "PAC-DRW-RETRN-CD";
        DBTableName = "TPOL";
        SType = "Text";
        Label = "Reason of Returned Cheque";
    }

#*                                               Bill Restricted Information
    OUT MIR-RBILL-EFF-DT
    {
        Length = "10";
        DBTableName = "TRSTB";
        SType = "Date";
        Label = "Restrict Billing Effective Date";
    }

    OUT MIR-RBILL-END-DT
    {
        Length = "10";
        DBTableName = "TRSTB";
        SType = "Date";
        Label = "Restrict Billing End Date";
    }

    OUT MIR-RBILL-MISC-1-CD
    {
        Length = "40";
        DBTableName = "TRSTB";
        SType = "Text";
        Label = "Restrict Billing Code 1";
    }

    OUT MIR-RBILL-MISC-2-CD
    {
        Length = "40";
        DBTableName = "TRSTB";
        SType = "Text";
        Label = "Restrict Billing Code 2";
    }

#*                                               Other Financial Values
    OUT MIR-POL-MISC-SUSP-AMT
    {
        Signed;
        Length = "19";
        DBTableName = "TPOL";
        SType = "Currency";
        Label = "Miscellaneous Suspense";
    }

    OUT MIR-POL-OS-DISB-AMT
    {
        Signed;
        Length = "19";
        DBTableName = "TPOL";
        SType = "Currency";
        Label = "Outstanding Disbursements";
    }

    OUT MIR-POST-LAPS-SURR-AMT
    {
        Signed;
        Length = "17";
        DBTableName = "TPOL";
        SType = "Currency";
        Label = "Post Lapse Surrender Amount";
    }

    OUT MIR-OS-DISB-SURR-AMT
    {
        Signed;
        Length = "19";
        DBTableName = "TPOL";
        SType = "Currency";
        Label = "Outstanding Disbursements - Surrender";
    }

    OUT MIR-POL-BT-SUSP-AMT
    {
        Signed;
        Length = "13";
        DBTableName = "TPOL";
        SType = "Currency";
        Label = "Bank Transfer Suspense";
    }

    OUT MIR-OS-DISB-MAT-AMT
    {
        Signed;
        Length = "19";
        DBTableName = "TPOL";
        SType = "Currency";
        Label = "Outstanding Disbursements - Maturity";
    }

    OUT MIR-POL-PD-SUSP-AMT
    {
        Signed;
        Length = "13";
        DBTableName = "TPOL";
        SType = "Currency";
        Label = "Payroll Deduction Suspense";
    }

    OUT MIR-OS-DISB-DTH-AMT
    {
        Signed;
        Length = "19";
        DBTableName = "TPOL";
        SType = "Currency";
        Label = "Outstanding Disbursements - Death";
    }

    OUT MIR-POL-CC-SUSP-AMT
    {
        Signed;
        Length = "13";
        DBTableName = "TPOL";
        SType = "Currency";
        Label = "Cash Collection Suspense";
    }

    OUT MIR-OS-DISB-CLM-AMT
    {
        Signed;
        Length = "19";
        DBTableName = "TPOL";
        SType = "Currency";
        Label = "Outstanding Disbursements - Claims";
    }

    OUT MIR-POL-CWA-SUSP-AMT
    {
        Signed;
        Length = "15";
        DBTableName = "TPOL";
        SType = "Currency";
        Label = "Cash with App Suspense";
    }

    OUT MIR-OS-DISB-AD-AMT
    {
        Signed;
        Length = "19";
        DBTableName = "TPOL";
        SType = "Currency";
        Label = "Outstanding Disbursements - Accidental Death";
    }

#*                                               Basic Coverage Information
    INOUT MIR-CVG-NUM
    {
        Length = "2";
        DBTableName = "TCVG";
        SType = "Text";
        Label = "Coverage Number";
    }

    OUT MIR-CVG-NUM-T[20]
    {
        Length = "2";
        FieldGroup = "Table20";
        KeyColumn;
        DBTableName = "TCVG";
        SType = "Text";
        Label = "Coverage Number";
        Index = "1";
    }

    OUT MIR-PLAN-ID-T[20]
    {
        Length = "40";
        FieldGroup = "Table20";
        CodeSource = "EDIT";
        CodeType = "PLAN";
        DBTableName = "TCVG";
        SType = "Text";
        Label = "Type of Plan";
        Index = "1";
    }

    OUT MIR-CVG-ILLUS-CD-T[20]
    {
        Length = "1";
        CodeSource = "EDIT";
        CodeType = "ILLUS";
        DBTableName = "TCVG";
        SType = "Text";
        Label = "Illustration Type";
    }

    OUT MIR-CVG-SEX-CD-T[20]
    {
        Length = "40";
        FieldGroup = "Table20";
        CodeSource = "DataModel";
        CodeType = "CVG-SEX-CD";
        DBTableName = "TCVG";
        SType = "Text";
        Label = "Sex";
        Index = "1";
    }

    OUT MIR-CVG-RT-AGE-T[20]
    {
        Length = "3";
        Decimals = "0";
        FieldGroup = "Table20";
        DBTableName = "TCVG";
        SType = "Number";
        Label = "Rate Age";
        Index = "1";
    }

    OUT MIR-DV-INSRD-CLI-NM-T[20]
    {
        Length = "75";
        FieldGroup = "Table20";
        DBTableName = "Derived";
        SType = "Text";
        Label = "Insured's Name";
        Index = "1";
    }

    OUT MIR-INSRD-CLI-ID-T[20]
    {
        Length = "10";
        FieldGroup = "Table20";
        DBTableName = "TCVGC";
        SType = "Text";
        Label = "Client Number of Lives Insured";
        Index = "1";
    }

    OUT MIR-CVG-FACE-AMT-T[20]
    {
        Signed;
        Length = "16";
        FieldGroup = "Table20";
        DBTableName = "TCVG";
        SType = "Currency";
        Label = "Face Amount";
        Index = "1";
    }

    OUT MIR-CVG-ISS-EFF-DT-T[20]
    {
        Length = "10";
        FieldGroup = "Table20";
        DBTableName = "TCVG";
        SType = "Date";
        Label = "Issue Date";
        Index = "1";
    }

    OUT MIR-CVG-CSTAT-CD-T[20]
    {
        Length = "40";
        FieldGroup = "Table20";
        CodeSource = "DataModel";
        CodeType = "CVG-CSTAT-CD";
        DBTableName = "TCVG";
        SType = "Text";
        Label = "Coverage Status";
        Index = "1";
    }

    OUT MIR-CVG-STBL-1-CD-T[20]
    {
        Length = "40";
        FieldGroup = "Table20";
#* M241A3 changes START here* 
        CodeSource = "CSOM9D29";        
	FilterFields = "2";
        FilterField1 = "MIR-PLAN-ID-T"; 
        FilterField2 = "MIR-CVG-STBL-1-CD-T";
#       CodeSource = "EDIT";
#       CodeType = "STB1";
#* M241A3 changes END here* 
        DBTableName = "TCVG";
        SType = "Text";
        Label = "Sub-table 1";
        Index = "1";
    }

    OUT MIR-CVG-STBL-2-CD-T[20]
    {
        Length = "40";
        FieldGroup = "Table20";
        CodeSource = "EDIT";
        CodeType = "STB2";
        DBTableName = "TCVG";
        SType = "Text";
        Label = "Sub-table 2";
        Index = "1";
    }
#* RPL012- Misc Screen Changes start
    OUT MIR-CVG-STBL-3-CD-T[20]
    {
        Length = "5";
        FieldGroup = "Table20";
        CodeSource = "EDIT";
        CodeType = "STB3";
        DBTableName = "TCVG";
        SType ="Text";
        Label = "Premium Payment Period";
        Index = "1";
    }
#* RPL012- Misc Screen Changes end
#* RP2012- Misc Screen Changes
    OUT MIR-CVG-STBL-4-CD-T[20]
    {
        Length = "40";
        FieldGroup = "Table20";
        CodeSource = "EDIT";
        CodeType = "STB4";
        DBTableName = "TCVG";
        SType = "Text";
        Label = "Remarks";
        Index = "1";
    }
#* RP2012- Misc Screen Changes
#*                                               Coverage Details
    OUT MIR-CVG-BASIC-PREM-AMT-T[20]
    {
        Signed;
        Length = "15";
        FieldGroup = "Table20";
        DBTableName = "TCVG";
        SType = "Currency";
        Label = "Annual Premium";
        Index = "1";
    }

    OUT MIR-CVG-MPREM-AMT-T[20]
    {
        Signed;
        Length = "15";
        FieldGroup = "Table20";
        DBTableName = "TCVG";
        SType = "Currency";
        Label = "Mode Premium";
        Index = "1";
    }

    OUT MIR-CVG-RESTR-PREM-IND-T[20]
    {
        Length = "1";
        FieldGroup = "Table20";
        DBTableName = "TCVG";
        SType = "Indicator";
        Label = "Automatic premium calculation has been restricted";
        Index = "1";
    }

    OUT MIR-CVG-PAR-CD-T[20]
    {
        Length = "40";
        FieldGroup = "Table20";
        CodeSource = "DataModel";
        CodeType = "CVG-PAR-CD";
        DBTableName = "TCVG";
        SType = "Text";
        Label = "Dividend Option";
        Index = "1";
    }

    OUT MIR-CVG-PFEE-AMT-T[20]
    {
        Signed;
        Length = "11";
        FieldGroup = "Table20";
        DBTableName = "TCVG";
        SType = "Currency";
        Label = "Flat Policy Fee";
        Index = "1";
    }

#* IPDDRC                                        Converted Face Amount
    OUT MIR-CVG-NUM2-T[20]
    {
        Length = "2";
        FieldGroup = "Table20";
        KeyColumn;
        DBTableName = "TCVG";
        SType = "Text";
        Label = "Coverage Number";
        Index = "1";
    }

    OUT MIR-PLAN-ID2-T[20]
    {
        Length = "40";
        FieldGroup = "Table20";
        CodeSource = "EDIT";
        CodeType = "PLAN";
        DBTableName = "TCVG";
        SType = "Text";
        Label = "Type of Plan";
        Index = "1";
    }

    OUT MIR-CVG-PCFA-AMT-T[20]
    {
        Signed;
        Length = "15";
        FieldGroup = "Table20";
        DBTableName = "TCVG";
        SType = "Currency";
        Label = "Present Converted Face Amount";
        Index = "1";
    }

    OUT MIR-CVG-DV-PCFA-NXT2-AMT-T[20]
    {
        Signed;
        Length = "15";
        FieldGroup = "Table20";
        DBTableName = "Derived";
        SType = "Currency";
        Label = "Converted Face Amount at Next MV + 2 Years";
        Index = "1";
    }

    OUT MIR-CVG-ACFA-AMT-T[20]
    {
        Signed;
        Length = "15";
        FieldGroup = "Table20";
        DBTableName = "TCVG";
        SType = "Currency";
        Label = "Average Converted Face Amount";
        Index = "1";
    }

    OUT MIR-CVG-DV-PCFA-GPD-AMT-T[20]
    {
        Signed;
        Length = "15";
        FieldGroup = "Table20";
        DBTableName = "Derived";
        SType = "Currency";
        Label = "Converted Face Amount for Guaranteed Period";
        Index = "1";
    }

#* EN5679
#*                                               Other Coverages Information

    OUT MIR-DV-INSRD-CLI-NM2-T[20]
    {
        Length = "75";
        FieldGroup = "Table12";
        DBTableName = "Derived";
        SType = "Text";
        Label = "Insured Client Name";
        Index = "1";
    }

    OUT MIR-DV-OTH-CLI-ID-T[20]
    {
        Length = "10";
        FieldGroup = "Table20";
        DBTableName = "TCVGC";
        SType = "Text";
        Label = "Insured Client's ID";
        Index = "1";
    }

    OUT MIR-CLI-TCB-IND-T[20]
    {
      Length = "1";
      FieldGroup = "Table20";
      Index = "1";
      DBTableName = "TCLIU";
      SType = "Indicator";
      Label = "Terminal Care Benefits";
    }

    OUT MIR-CLI-LNB-IND-T[20]
    {
      Length = "1";
      FieldGroup = "Table20";
      Index = "1";
      DBTableName = "TCLIU";
      SType = "Indicator";
      Label = "Living Needs Benefits";
    }

    OUT MIR-SUBST-CLMT-IND-T[20]
    {
      Length = "1";
      FieldGroup = "Table20";
      Index = "1";
      DBTableName = "TCLIU";
      SType = "Indicator";
      Label = "Substitute Claimant Rider";
    }

#*                                               Beneficiary Information
    OUT MIR-DV-BENEF-CLI-ID-T[20]
    {
        Length = "10";
        FieldGroup = "Table20";
        DBTableName = "Derived";
        SType = "Text";
        Label = "Client Number of Beneficiary";
        Index = "1";
    }

    OUT MIR-DV-INSRD-NM-T[20]
    {
        Length = "51";
        FieldGroup = "Table20";
        DBTableName = "Derived";
        SType = "Text";
        Label = "Insured's Name";
        Index = "1";
    }

    OUT MIR-BNFY-SEQ-NUM-T[20]
    {
        Length = "3";
        FieldGroup = "Table20";
        DBTableName = "TBENE";
        SType = "Text";
        Label = "Sequence Number";
        Index = "1";
    }

    OUT MIR-CLI-ID-T[20]
    {
        Length = "10";
        FieldGroup = "Table20";
        DBTableName = "TBENE";
        SType = "Text";
        Label = "Client Number";
        Index = "1";
    }

    OUT MIR-BNFY-NM-T[20]
    {
        #TLB041 CHANGES START HERE
        #Length = "75";
        Length = "100";
        #TLB041 CHANGES END HERE
        FieldGroup = "Table20";
        DBTableName = "TBENE";
        SType = "Text";
        Label = "Beneficiary's Name";
        Index = "1";
    }

    OUT MIR-BNFY-TYP-CD-T[20]
    {
        Length = "1";
        FieldGroup = "Table20";
        CodeSource = "DataModel";
        CodeType = "BNFY-TYP-CD";
        DBTableName = "TBENE";
        SType = "Text";
        Label = "Beneficiary Type";
        Index = "1";
    }

    OUT MIR-BNFY-DESGNT-CD-T[20]
    {
        Length = "40";
        FieldGroup = "Table20";
        CodeSource = "DataModel";
        CodeType = "BNFY-DESGNT-CD";
        DBTableName = "TBENE";
        SType = "Text";
        Label = "Designation";
        Index = "1";
    }

    OUT MIR-BNFY-PRCDS-PCT-T[20]
    {
        Length = "3";
        Decimals = "0";
        FieldGroup = "Table20";
        DBTableName = "TBENE";
        SType = "Percent";
        Label = "Percentage";
        Index = "1";
    }

    OUT MIR-BNFY-REL-INSRD-CD-T[20]
    {
        Length = "40";
        FieldGroup = "Table20";
        CodeSource = "EDIT";
        CodeType = "BTOI";
        DBTableName = "TBENE";
        SType = "Text";
        Label = "Relation to Insured";
        Index = "1";
    }

    OUT MIR-BNFY-MINR-IND-T[20]
    {
        Length = "1";
        FieldGroup = "Table20";
        DBTableName = "TBENE";
        SType = "Indicator";
        Label = "Beneficiary is a minor";
        Index = "1";
    }

#*                                               Selection Method
    OUT MIR-DV-INSRD-CLI-NM1-T[20]
    {
        Length = "75";
        FieldGroup = "Table12";
        DBTableName = "Derived";
        SType = "Text";
        Label = "Name";
        Index = "1";
    }

    OUT MIR-DV-SEL-CLI-ID-T[20]
    {
        Length = "10";
        FieldGroup = "Table20";
        DBTableName = "TCVGC";
        SType = "Text";
        Label = "Client Number of Lives Insured";
        Index = "1";
    }

  OUT MIR-UW-TYP-CD-T[20]
   {
    Mandatory;
    Length = "1";
    CodeSource = "DataModel";
    CodeType = "UW-TYP-CD";
    DBTableName = "TCLIU";
    SType = "Text";
    Label = "Level of Underwriting";
    CodeSource = "DataModel";
    SType = "Selection";
    FieldGroup = "Table20";
    Index = "1";
   }

#*                                               Billing Activity
    OUT MIR-APPL-CTL-PRCES-DT1-T[6]
    {
        Length = "10";
        FieldGroup = "Table1";
        DBTableName = "TBAC";
        SType = "Date";
        Label = "System Date";
        Index = "1";
    }

    OUT MIR-PREV-UPDT-DT1-T[6]
    {
        Length = "10";
        FieldGroup = "Table1";
        DBTableName = "TBAC";
        SType = "Date";
        Label = "Status Date";
        Index = "1";
    }

    OUT MIR-DRW-STAT-CD1-T[6]
    {
        Length = "15";
        FieldGroup = "Table1";
        CodeSource = "DataModel";
        CodeType = "DRW-STAT-CD";
        DBTableName = "TBAC";
        SType = "Text";
        Label = "Status";
        Index = "1";
    }

    OUT MIR-FND-SRC-CD1-T[6]
    {
        Length = "01";
        FieldGroup = "Table1";
        CodeSource = "DataModel";
        CodeType = "FND-SRC-CD";
        DBTableName = "TBAC";
        SType = "Text";
        Label = "Source of Funds";
        Index = "1";
    }

    OUT MIR-BNK-ID1-T[6]
    {
        Length = "04";
        FieldGroup = "Table1";
        DBTableName = "TBAC";
        SType = "Text";
        Label = "Bank";
        Index = "1";
    }
    
#EN9547 CHANGES START HERE
#    OUT MIR-BNK-BR-ID1-T[6]
#    {
#        Length = "05";
#        FieldGroup = "Table1";
#        DBTableName = "TBAC";
#        SType = "Text";
#        Label = "Branch";
#        Index = "1";
#    }
#EN9547 CHANGES END HERE
    OUT MIR-BNK-BR-ID1-T[6]
    {
        Length = "05";
        FieldGroup = "Table1";
        DBTableName = "TBAC";
        SType = "Text";
        Label = "Branch";
        Index = "1";
    }

    OUT MIR-BNK-ACCT-ID1-T[6]
    {
        Length = "17";
        FieldGroup = "Table1";
        DBTableName = "TBAC";
        SType = "Text";
        Label = "Account";
        Index = "1";
    }

    OUT MIR-DRW-DT1-T[6]
    {
        Length = "10";
        FieldGroup = "Table1";
        DBTableName = "TBAC";
        SType = "Date";
        Label = "Draw Date";
        Index = "1";
    }

    OUT MIR-PREM-AMT1-T[6]
    {
        Length = "13";
        FieldGroup = "Table1";
        DBTableName = "TBAC";
        SType = "Currency";
        Label = "Total Billed";
        Index = "1";
    }

    OUT MIR-RECV-AMT1-T[6]
    {
        Length = "13";
        FieldGroup = "Table1";
        DBTableName = "TBAC";
        SType = "Currency";
        Label = "Total Received";
        Index = "1";
    }

    OUT MIR-RECV-DT1-T[6]
    {
        Length = "10";
        FieldGroup = "Table1";
        DBTableName = "TBAC";
        SType = "Date";
        Label = "Payment Received Date";
        Index = "1";
    }

    OUT MIR-UNSUCS-REASN-CD1-T[6]
    {
        Length = "01";
        FieldGroup = "Table1";
        CodeSource = "DataModel";
        CodeType = "UNSUCS-REASN-CD";
        DBTableName = "TBAC";
        SType = "Text";
        Label = "Unsuccessful Reason Code";
        Index = "1";
    }

    OUT MIR-BILL-TYP-CD1-T[6]
    {
        Length = "15";
        FieldGroup = "Table1";
        CodeSource = "DataModel";
        CodeType = "BILL-TYP-CD";
        DBTableName = "TBAC";
        SType = "Text";
        Label = "Bill Method";
        Index = "1";
    }

    OUT MIR-BILL-MODE-CD1-T[6]
    {
        Length = "15";
        FieldGroup = "Table1";
        CodeSource = "DataModel";
        CodeType = "BILL-MODE-CD";
        DBTableName = "TBAC";
        SType = "Text";
        Label = "Bill Mode";
        Index = "1";
    }

#*                                               Policy Information
    OUT MIR-UL-LAPS-STRT-DT
    {
        Length = "10";
        DBTableName = "TPOL";
        SType = "Date";
        Label = "Lapse Start Date";
    }

    OUT MIR-POL-CEAS-DT
    {
        Length = "10";
        DBTableName = "TPOL";
        SType = "Date";
        Label = "Policy Cease Date";
    }

#*                                               Old Policy Information
    OUT MIR-SUB-CAT-CD
    {
        Length = "3";
        DBTableName = "TPOLK";
        SType = "Text";
        Label = "Sub Category";
    }

    OUT MIR-ORIG-POL-ID
    {
        Length = "7";
        DBTableName = "TPOLK";
        SType = "Text";
        Label = "Original Policy Number";
    }

    OUT MIR-MY-KEMPO-TYP-CD
    {
        Length = "1";
        DBTableName = "TPOL";
        SType = "Text";
        Label = "My Kempo Type Code";
    }

#*                                               Fund Inquiry
    OUT MIR-DV-POL-BASE-CV-EX-ESC-AMT
    {
        Signed;
        Length = "17";
        DBTableName = "Derived";
        SType = "Currency";
        Label = "Base Cash Value Excluding ESC";
    }

    OUT MIR-DV-POL-BASE-CV-AMT
    {
        Signed;
        Length = "17";
        DBTableName = "Derived";
        SType = "Currency";
        Label = "Base Cash Value";
    }

    OUT MIR-DV-SURR-CHRG-AMT
    {
        Signed;
        Length = "15";
        DBTableName = "Derived";
        SType = "Currency";
        Label = "Surrender Charge";
    }

    OUT MIR-CF-MKTVAL-ADJ-AMT
    {
        Signed;
        Length = "15";
        DBTableName = "TCFLW";
        SType = "Currency";
        Label = "Market Value Adjustment";
    }

    OUT MIR-DV-POL-CSV-AMT
    {
        Signed;
        Length = "15";
        DBTableName = "Derived";
        SType = "Currency";
        Label = "Cash Surrender Value";
    }

# EN5679

    OUT MIR-GRACE-EXT-PREM-AMT
    {
           Signed;
           Length = "17";
           DBTableName = "Derived";
           SType = "Currency";
           Label = "Premium necessary to extend grace period";
    }

#*                                               History
    OUT MIR-CF-EFF-DT1-T[6]
    {
        Length = "10";
        FieldGroup = "Table50";
        DBTableName = "TCFLW";
        SType = "Date";
        Label = "Cash Flow Effective Date";
        Index = "1";
    }

    OUT MIR-DV-FND-BAL-EX-ESC-AMT1-T[6]
    {
        Signed;
        Length = "15";
        FieldGroup = "Table50";
        DBTableName = "TCFLW";
        SType = "Currency";
        Label = "Fund Balance Excluding Esc Amount";
        Index = "1";
    }

    OUT MIR-CF-FND-BAL-AMT1-T[6]
    {
        Signed;
        Length = "15";
        FieldGroup = "Table50";
        DBTableName = "TCFLW";
        SType = "Currency";
        Label = "Current Amount";
        Index = "1";
    }

    OUT MIR-CF-TRXN-CD1-T[6]
    {
        Length = "40";
        FieldGroup = "Table50";
        CodeSource = "DataModel";
        CodeType = "CF-TRXN-CD";
        DBTableName = "TCFLW";
        SType = "Text";
        Label = "Transaction Type";
        Index = "1";
    }

    OUT MIR-CF-REASN-CD1-T[6]
    {
        Length = "40";
        FieldGroup = "Table50";
        CodeSource = "DataModel";
        CodeType = "CF-REASN-CD";
        DBTableName = "TCFLW";
        SType = "Text";
        Label = "Transaction Reason";
        Index = "1";
    }

    OUT MIR-CF-FND-TRXN-AMT1-T[6]
    {
        Signed;
        Length = "15";
        FieldGroup = "Table50";
        DBTableName = "TCFLW";
        SType = "Currency";
        Label = "Net Deposit Amount";
        Index = "1";
    }

    OUT MIR-CF-CLI-TRXN-AMT1-T[6]
    {
        Signed;
        Length = "15";
        FieldGroup = "Table50";
        DBTableName = "TCFLW";
        SType = "Currency";
        Label = "Gross Amount";
        Index = "1";
    }

    OUT MIR-CF-INT-PCT1-T[6]
    {
        Signed;
        Length = "7";
        Decimals = "4";
        FieldGroup = "Table50";
        DBTableName = "TCFLW";
        SType = "Percent";
        Label = "Interest Rate";
        Index = "1";
    }

    OUT MIR-ACUM-INT-LTD-AMT1-T[6]
    {
        Signed;
        Length = "15";
        FieldGroup = "Table50";
        DBTableName = "TCFLW";
        SType = "Currency";
        Label = "Accumulated Cash Flow Interest Paid Amount";
        Index = "1";
    }

    OUT MIR-CF-STAT-CD1-T[6]
    {
        Length = "40";
        FieldGroup = "Table50";
        CodeSource = "DataModel";
        CodeType = "CF-STAT-CD";
        DBTableName = "TCFLW";
        SType = "Text";
        Label = "Cash Flow Status";
        Index = "1";
    }
    OUT MIR-FIEL-INS-PURP-IND
    {
        Length = "1";
        DBTableName = "TPOL";
        SType = "Indicator";
        Label = "FIEL(Insurance Purpose)";
    }
# MP5002
    OUT MIR-SURR-CHRG-TYP-CD
    {
        Length = "1";
        CodeSource = "EDIT";
        CodeType = "MVAL";
        DBTableName = "TPOL";
        SType = "Text";
        Label = " FlexFund Surrender Charge Type";
    }
    
#M245B2 CHANGES START HERE     
    INOUT MIR-POL-CRCY-CD
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
#M245B2 CHANGES END HERE 

#Q61551 CHANGES START HERE     

    INOUT MIR-PREM-CRCY-CD
    {
         Length = "2";
         SType = "Hidden";
         Label = "Currency";
    } 
#Q61551 CHANGES END HERE
#M319O1 CHANGES START HERE
    INOUT MIR-OS-DISB-CRCY-CD
    {
       
       Length = "2";
       SType = "Hidden";
       Label = "Currency";
    }
#M319O1 CHANGES END HERE
#UYS133 CHANGES START
    OUT MIR-PD-GR-TYP-CD
    {
        Length = "1";
        CodeSource = "DataModel";
        CodeType = "PD-GR-TYP-CD";
        DBTableName = "TPOL";
        SType = "Text";
        Label = "PD group size";
    }
#UYS133 CHANGES END
}
