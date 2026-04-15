
#*******************************************************************************
#*  Component:   BF9965-O.s                                                    *
#*  Description:                                                               *
#*                                                                             *
#*******************************************************************************
#*  Chg#     Release  Description                                              *
#*                                                                             *
#*  FT2001   AT       New screen for PA Inquiry                                *
#*  12APR05  FB       REORGINIZED TO ADJUST P-STEP                             *
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
#*                    OTHER COVERAGES SECTION                                  *
#*  C13034   KS       ADD DISASTER CODE TO PA INQUIRY POLICY DETAILS SCREEN    *
#*  M161CA  CTS      ADDITION OF NEW FIELD INIT-PMT-TYP-CD                     *
#*  M241A3  CTS      FILTER SELECTION CHANGES TO IDENTIFY AGE OR DURATION      *
#*  M245B2  CTS      Foreign Currency Formatting 			       *
#*  Q61551  CTS      FRA Currency Code Changes   			       *
#*  M319O1  CTS      FXWL Currency Code Changes                                *
#*  R14127  CTS      CHANGES FOR DISASTER RECOVERY                             *
#*  TDMG24  CTS      INQUIRY SCREEN CHANGES                                    * 
#*  TLB041  CTS      CORPORATE POLICY HOLDER NAME & ADDRESS EXPANSION          *
#*  UYS133  CTS      Addition of PD group size field                           *
#*******************************************************************************

S-STEP BF9965-O
{
    ATTRIBUTES
    {
        BusinessFunctionType = "Retrieve";
        Type = "Output";
        DelEmptyRows;
        FocusField = "OKButton";
        FocusFrame = "ButtonFrame";
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

    OUT index
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
        Label = "Policy ID";
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

    IN MIR-DV-OWN-CLI-NM
    {
        DisplayOnly;
        #TLB041 CHANGES START HERE 
        #Length = "75";
        Length = "100";
        #TLB041 CHANGES END HERE
        SType = "Text";
        Label = "Owner Name";
    }

    IN MIR-POL-PD-TO-DT-NUM
    {
        DisplayOnly;
        Length = "10";
        SType = "Text";
        Label = "Policy Paid to Date";
    }

#* MFFPI - THIS HAS BEEN COMMENTED OUT
#    IN MIR-POL-CVG-REC-CTR
#    {
#        DisplayOnly;
#        Length = "40";
#        SType = "Text";
#        Label = "Number of Coverages on This Policy";
#    }
#
    IN MIR-POL-CSTAT-CD
    {
        DisplayOnly;
        Length = "40";
        CodeSource = "DataModel";
        CodeType = "POL-CSTAT-CD";
        SType = "Text";
        Label = "Current Policy Status";
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


    IN MIR-POL-GRS-APREM-AMT
    {
#M245B2 CHANGES START HERE    
        CurrencyCode="MIR-POL-CRCY-CD";
#M245B2 CHANGES END HERE    
        DisplayOnly;
        Signed;
        Length = "15";
        SType = "Currency";
        Label = "Amount of Gross Annual Premium";
    }

    IN MIR-POL-MPREM-AMT
    {
#M245B2 CHANGES START HERE    
        CurrencyCode="MIR-POL-CRCY-CD";
#M245B2 CHANGES END HERE    
        DisplayOnly;
        Signed;
        Length = "15";
        SType = "Currency";
        Label = "Modal Premium as of Paid to Date";
    }

    IN MIR-POL-UL-SHRT-AMT
    {
#M245B2 CHANGES START HERE    
        CurrencyCode="MIR-POL-CRCY-CD";
#M245B2 CHANGES END HERE    
        DisplayOnly;
        Length = "13";
        SType = "Currency";
        Label = "Planned Periodic Premium Amount";
    }

    IN  MIR-POL-CNVR-TYP-CD
    {
        DisplayOnly;
        Length = "2";
        CodeSource = "DataModel";
        CodeType = "CNVR-TYP-CD";
        SType = "Text";
        Label = "Conversion Policy Type Code";
    }

#* MFFPI
    IN MIR-DV-TOT-SA-PREM-AMT
    {
#M245B2 CHANGES START HERE    
        CurrencyCode="MIR-POL-CRCY-CD";
#M245B2 CHANGES END HERE    
        Signed;
        Length = "15";
        SType = "Currency";
        Label = "SA Rider Premium";
    }

    IN MIR-DV-POL-FND-CVG-REC-CTR
    {
        Length = "2";
        SType = "Text";
        Label = "Number of SA Riders";
    }

#*                                                 Basic Information

    IN MIR-PLAN-ID
    {
        DisplayOnly;
        Length = "40";
        CodeSource = "EDIT";
        CodeType = "PLAN";
        DBTableName = "TPOL";
        SType = "Text";
        Label = "Plan ID";
    }

    IN MIR-POL-ISS-EFF-DT
    {
        DisplayOnly;
        Length = "10";
        SType = "Date";
        Label = "Issue Date of the Policy";
    }

    IN MIR-RECPT-DT-T[20]
    {
        DisplayOnly;
        Length = "10";
        FieldGroup = "Table20";
        SType = "Date";
        Label = "Application Received Date";
        Index = "1";
    }

    IN MIR-PROD-APP-TYP-CD
    {
        DisplayOnly;
        Length = "2";
        CodeSource = "DataModel";
        CodeType = "POL-PROD-APP-TYP";
        SType = "Text";
        Label = "Product Application Type Code";
    }

    IN MIR-POL-SUB-STAT-CD
    {
        DisplayOnly;
        Length = "40";
        CodeSource = "EDIT";
        CodeType = "SUBSC";
        SType = "Text";
        Label = "Policy Sub Status";
    }


    IN MIR-AGT-UWG-FAIL-IND
    {
        DisplayOnly;
        Length = "1";
        CodeSource = "DataModel";
        CodeType = "CNTRCT-REL-TYP";
        SType = "Text";
        Label = "Contract Relationship Type";
    }

    IN MIR-FREE-WTHDR-DT
    {
        DisplayOnly;
        Length = "10";
        SType = "Date";
        Label = "Last Free Withdrawal Date";
    }

#*                                               Agent Information

    IN MIR-DV-SERV-AGT-NM
    {
        DisplayOnly;
        Length = "75";
        SType = "Text";
        Label = "Servicing Agent Name";
    }

    IN MIR-SERV-AGT-ID
    {
        DisplayOnly;
        Length = "6";
        SType = "Text";
        Label = "Servicing Agent ID";
    }

    IN MIR-SERV-BR-ID
    {
        DisplayOnly;
        Length = "5";
        CodeSource = "XTAB";
        CodeType = "BRCH";
        SType = "Text";
        Label = "Servicing Agent's Branch";
    }

    IN MIR-SERV-SO-ID
    {
        DisplayOnly;
        Length = "5";
        CodeSource = "XTAB";
        CodeType = "SALE";
        SType = "Text";
        Label = "Servicing Agent's Sales Office";
    }

   IN MIR-PREV-SERV-AGT-ID
    {
        DisplayOnly;
        Length = "6";
        SType = "Text";
        Label = "Previous Servicing Agent";
    }

    IN MIR-AGT-ID-T[2]
    {
        DisplayOnly;
        Length = "6";
        FieldGroup = "Table2";
        KeyColumn;
        SType = "Text";
        Label = "Writing Agent Number";
        Index = "1";
    }

    IN MIR-DV-AGT-CLI-NM-T[2]
    {
        DisplayOnly;
        Length = "30";
        FieldGroup = "Table2";
        SType = "Text";
        Label = "Agent Name";
        Index = "1";
    }

    IN MIR-POL-AGT-SHR-PCT-T[2]
    {
        DisplayOnly;
        Length = "5";
        Decimals = "2";
        FieldGroup = "Table2";
        SType = "Percent";
        Label = "Agent's Share Percentage";
        Index = "1";
    }

    IN MIR-POL-AGT-TYP-CD-T[2]
    {
        DisplayOnly;
        Length = "1";
        FieldGroup = "Table2";
        CodeSource = "DataModel";
        CodeType = "CVG-AGT-TYP-CD";
        SType = "Text";
        Label = "Agent Type";
        Index = "1";
    }

#*                                               Owner Information

    IN MIR-DV-OWN-CLI-NM-KJ
    {
        DisplayOnly;
        #TLB041 CHANGES START HERE
        #Length = "75";
        Length = "100";
        #TLB041 CHANGES END HERE
        SType = "Text";
        Label = "Owner Name";
    }

    IN MIR-OWNER-CLI-ID
    {
        DisplayOnly;
        Length = "10";
        SType = "Text";
        Label = "Owner ID";
    }

    IN MIR-CLI-BTH-DT
    {
        DisplayOnly;
        Length = "10";
        SType = "Date";
        Label = "Birth Date";
    }

     IN MIR-CLI-SEX-CD
    {
        DisplayOnly;
        Length = "40";
        CodeSource = "DataModel";
        CodeType = "CLI-SEX-CD";
        SType = "Text";
        Label = "Sex";
    }

    IN MIR-CLI-ADDR-LOC-CD
    {
        DisplayOnly;
        Length = "8";
        SType = "Text";
        Label = "Address Code";
    }

    IN MIR-CLI-PSTL-CD
    {
        DisplayOnly;
        Length = "9";
        SType = "Text";
        Label = "Postal/Zip Code";
    }

# C13034 changes begin

    IN MIR-DSASTR-CD
    {
        DisplayOnly;
        Length = "1";
        CodeSource = "EDIT";
        CodeType = "DSAST";
        SType = "Text";
        Label = "Disaster Code";
    }    
# C13034 changes end

# R14127 changes begin

    IN MIR-DSASTR-SUB-CD
    {
        DisplayOnly;
        Length = "2";
        CodeSource = "EDIT";
        CodeType = "DSTSB";
        SType = "Text";
        Label = "Disaster Code";
    }    
# R14127 changes end
    IN MIR-CLI-PREFCT-TXT
    {
        DisplayOnly;
        Length = "11";
        SType = "Text";
        Label = "Prefecture";
    }

    IN MIR-CLI-KA-PREFCT-TXT
    {
        DisplayOnly;
        Length = "11";
        SType = "Text";
        Label = "Prefecture";
    }

    IN MIR-CLI-CITY-NM-TXT-T[2]
    {
        DisplayOnly;
        Length = "30";
        FieldGroup = "Table5";
        SType = "Text";
        Label = "City";
        Index = "1";
    }

    IN MIR-CLI-KA-CITY-TXT
    {
        DisplayOnly;
        Length = "30";
        SType = "Text";
        Label = "City";
    }

    IN MIR-CLI-ADDR-LN-1-TXT-T[2]
    {
        DisplayOnly;
        Length = "30";
        FieldGroup = "Table5";
        SType = "Text";
        Label = "Address";
        Index = "1";
    }

    IN MIR-CLI-KA-NGHBRHD-TXT
    {
        DisplayOnly;
        Length = "30";
        SType = "Text";
        Label = "Neighborhood";
    }

    IN MIR-CLI-ADDR-ADDL-TXT-T[2]
    {
        DisplayOnly;
        Length = "72";
        FieldGroup = "Table5";
        SType = "Text";
        Label = "Samakata-bu";
        Index = "1";
    }

     IN MIR-CLI-ADDR-CNTCT-TXT
    {
        DisplayOnly;
        Length = "50";
        SType = "Text";
        Label = "Phone Number";
    }

    IN MIR-CLI-CNTCT-ID-CD-T[5]
    {
        Key;
        DisplayOnly;
        Length = "2";
        FieldGroup = "Table5";
        CodeSource = "EDIT";
        CodeType = "CNTID";
        SType = "Text";
        Label = "Contact Type";
        Index = "1";
    }

    IN MIR-CLI-CNTCT-ID-TXT-T[5]
    {
        DisplayOnly;
        Length = "6";
        FieldGroup = "Table5";
        SType = "Text";
        Label = "Identification Code";
        Index = "1";
    }

#*                                               Bank Information

    IN MIR-BNK-ID
    {
        DisplayOnly;
        Length = "4";
        SType = "Text";
        Label = "Bank Number";
    }

    IN MIR-BNK-BR-ID
    {
        DisplayOnly;
        Length = "5";
        SType = "Text";
        Label = "Branch Number";
    }

    IN MIR-BNK-ACCT-TYP-CD
    {
        DisplayOnly;
        Length = "40";
        CodeSource = "EDIT";
        CodeType = "ACTYP";
        SType = "Text";
        Label = "Account Type";
    }

    IN MIR-BNK-ACCT-ID
    {
        DisplayOnly;
        Length = "17";
        SType = "Text";
        Label = "Account Number";
    }

    IN MIR-DV-PAYR-CLI-NM
    {
        DisplayOnly;
        Length = "75";
        SType = "Text";
        Label = "Payor Name";
    }

    IN MIR-PAC-CLI-ID
    {
        DisplayOnly;
        Length = "10";
        SType = "Text";
        Label = "Client Number";
    }

#*                                               Payroll Deduction Information

    IN MIR-DV-LBILL-CLI-NM
    {
        DisplayOnly;
        Length = "75";
        SType = "Text";
        Label = "Payroll Deduction Name";
    }

    IN MIR-DV-LBILL-CLI-ID
    {
        DisplayOnly;
        Length = "10";
        SType = "Text";
        Label = "Payroll Deduction Client ID";
    }

#*                                               Assignment Information

    IN MIR-POL-ASIGN-IND
    {
        DisplayOnly;
        Length = "1";
        SType = "Indicator";
        Label = "Policy Assigned Indicator";
    }

    IN MIR-POL-ASIGN-DT
    {
        DisplayOnly;
        Length = "10";
        SType = "Date";
        Label = "Policy Assigned Date";
    }

    IN MIR-DV-ASIGN-CLI-ID-T[5]
    {
        DisplayOnly;
        Length = "10";
        FieldGroup = "Table4";
        KeyColumn;
        SType = "Text";
        Label = "Assignee Client ID";
        Index = "1";
    }

    IN MIR-DV-ASIGN-CLI-NM-T[5]
    {
        DisplayOnly;
        Length = "30";
        FieldGroup = "Table4";
        SType = "Text";
        Label = "Assignee Name";
        Index = "1";
    }

    IN MIR-DV-ASIGN-ADDR-CD-T[5]
    {
        DisplayOnly;
        Length = "40";
        FieldGroup = "Table4";
        CodeSource = "EDIT";
        CodeType = "ADTYP";
        SType = "Text";
        Label = "Assignee Client Address Type";
        Index = "1";
    }


    IN MIR-DV-ASIGN-SUB-CD-T[5]
    {
        DisplayOnly;
        Length = "40";
        FieldGroup = "Table4";
        CodeSource = "DataModel";
        CodeType = "DV-ASIGN-SUB-CD";
        SType = "Text";
        Label = "Assignee Client Relationship Type";
        Index = "1";
    }

#*                                               Billing Information

    IN MIR-POL-BILL-TYP-CD
    {
        DisplayOnly;
        Length = "1";
        CodeSource = "DataModel";
        CodeType = "POL-BILL-TYP-CD";
        SType = "Text";
        #M161CA START
        #Label = "Policy Billing Method";
        Label = "Policy Billing Method(Subsequent Premium)";
        #M161CA END
    }

    #M161CA START
    IN MIR-INIT-PMT-TYP-CD
    {
        DisplayOnly;
        Length = "1";
        CodeSource = "DataModel";
        CodeType = "INIT-PMT-TYP-CD";
        SType = "Text";
        Label = "Payment Route (First Premium)";
    }
    #M161CA END
    IN MIR-POL-BILL-MODE-CD
    {
        DisplayOnly;
        Length = "40";
        CodeSource = "DataModel";
        CodeType = "POL-BILL-MODE-CD";
        SType = "Text";
        Label = "Policy Billing Mode";
    }

    IN MIR-POL-PAC-DRW-DY
    {
        DisplayOnly;
        Length = "10";
        SType = "Day";
        Label = "Billing Draw Day";
    }

    IN MIR-POL-SNDRY-AMT
    {
#M245B2 CHANGES START HERE    
        CurrencyCode="MIR-POL-CRCY-CD";
#M245B2 CHANGES END HERE    
        DisplayOnly;
        Signed;
        Length = "13";
        SType = "Currency";
        Label = "Sundry Payment Amount";
    }

    IN MIR-POL-BILL-TO-DT-NUM
    {
        DisplayOnly;
        Length = "10";
        DBTableName = "TPOL";
        SType = "Date";
        Label = "Bill to Date";
    }

    IN MIR-POL-PAC-RETRN-2-DT
    {
        DisplayOnly;
        Length = "10";
        DBTableName = "TPOL";
        SType = "Date";
        Label = "Return PAC Cheque Date 2";
    }

    IN MIR-POL-PAC-RETRN-2-CD
    {
        DisplayOnly;
        Length = "1";
        CodeSource = "DataModel";
        CodeType = "PAC-DRW-RETRN-CD";
        DBTableName = "TPOL";
        SType = "Text";
        Label = "Return PAC Cheque Reason (2)";
    }

    IN MIR-POL-PAC-RETRN-1-DT
    {
        DisplayOnly;
        Length = "10";
        DBTableName = "TPOL";
        SType = "Date";
        Label = "Return PAC Cheque Date 1";
    }

    IN MIR-POL-PAC-RETRN-1-CD
    {
        DisplayOnly;
        Length = "40";
        CodeSource = "DataModel";
        CodeType = "PAC-DRW-RETRN-CD";
        DBTableName = "TPOL";
        SType = "Text";
        Label = "Return PAC Cheque Reason (1)";
    }


#*                                               Bill Restricted Information

    IN MIR-RBILL-EFF-DT
    {
        DisplayOnly;
        Length = "10";
        SType = "Date";
        Label = "Restrict Billing Effective Date";
    }

    IN MIR-RBILL-END-DT
    {
        DisplayOnly;
        Length = "10";
        SType = "Date";
        Label = "Restrict Billing End Date";
    }

    IN MIR-RBILL-MISC-1-CD
    {
        DisplayOnly;
        Length = "40";
        SType = "Text";
        Label = "Restrict Billing Code #1";
    }

    IN MIR-RBILL-MISC-2-CD
    {
        DisplayOnly;
        Length = "40";
        SType = "Text";
        Label = "Restrict BIlling Code #2";
    }

#*                                               Other Financial Values

    IN MIR-POL-MISC-SUSP-AMT
    {
#M245B2 CHANGES START HERE    
        CurrencyCode="MIR-POL-CRCY-CD";
#M245B2 CHANGES END HERE    
        DisplayOnly;
        Signed;
        Length = "19";
        SType = "Currency";
        Label = "Miscellaneous Suspense";
    }

    IN MIR-POL-OS-DISB-AMT
    {
#M245B2 CHANGES START HERE    
#M319O1 CHANGES START HERE
      # CurrencyCode="MIR-POL-CRCY-CD"; 
        CurrencyCode="MIR-OS-DISB-CRCY-CD";
#M319O1 CHANGES END HERE
#M245B2 CHANGES END HERE    
        DisplayOnly;
        Signed;
        Length = "19";
        SType = "Currency";
        Label = "Outstanding Disbursements";
    }

    IN MIR-POST-LAPS-SURR-AMT
    {
#M245B2 CHANGES START HERE    
        CurrencyCode="MIR-POL-CRCY-CD";
#M245B2 CHANGES END HERE        
        DisplayOnly;
        Signed;
        Length = "17";
        SType = "Currency";
        Label = "Post Lapse Surrender Amount";
    }

    IN MIR-OS-DISB-SURR-AMT
    {
#M245B2 CHANGES START HERE    
        CurrencyCode="MIR-POL-CRCY-CD";
#M245B2 CHANGES END HERE    
        DisplayOnly;
        Signed;
        Length = "19";
        SType = "Currency";
        Label = "Outstanding Disbursements - Surrender";
    }

    IN MIR-POL-BT-SUSP-AMT
    {
#M245B2 CHANGES START HERE    
        CurrencyCode="MIR-POL-CRCY-CD";
#M245B2 CHANGES END HERE    
        DisplayOnly;
        Signed;
        Length = "13";
        SType = "Currency";
        Label = "Bank Transfer Suspense";
    }

    IN MIR-OS-DISB-MAT-AMT
    {
#M245B2 CHANGES START HERE    
        CurrencyCode="MIR-POL-CRCY-CD";
#M245B2 CHANGES END HERE    
        DisplayOnly;
        Signed;
        Length = "19";
        SType = "Currency";
        Label = "Outstanding Disbursements - Maturity";
    }

    IN MIR-POL-PD-SUSP-AMT
    {
#M245B2 CHANGES START HERE    
        CurrencyCode="MIR-POL-CRCY-CD";
#M245B2 CHANGES END HERE    
        DisplayOnly;
        Signed;
        Length = "13";
        SType = "Currency";
        Label = "Payroll Deduction Suspense";
    }

    IN MIR-OS-DISB-DTH-AMT
    {
#M245B2 CHANGES START HERE    
        CurrencyCode="MIR-POL-CRCY-CD";
#M245B2 CHANGES END HERE    
        DisplayOnly;
        Signed;
        Length = "19";
        SType = "Currency";
        Label = "Outstanding Disbursements - Death";
    }

    IN MIR-POL-CC-SUSP-AMT
    {
#M245B2 CHANGES START HERE    
        CurrencyCode="MIR-POL-CRCY-CD";
#M245B2 CHANGES END HERE    
        DisplayOnly;
        Signed;
        Length = "13";
        SType = "Currency";
        Label = "Cash Collection Suspense";
    }

    IN MIR-OS-DISB-CLM-AMT
    {
#M245B2 CHANGES START HERE    
        CurrencyCode="MIR-POL-CRCY-CD";
#M245B2 CHANGES END HERE    
        DisplayOnly;
        Signed;
        Length = "19";
        SType = "Currency";
        Label = "Outstanding Disbursements - Claims";
    }

    IN MIR-POL-CWA-SUSP-AMT
    {
#M245B2 CHANGES START HERE    
        CurrencyCode = "MIR-PMT-CRCY-CD";
#M245B2 CHANGES END HERE    
        DisplayOnly;
        Signed;
        Length = "13";
        SType = "Currency";
        Label = "Cash with App Suspense";
    }

    IN MIR-OS-DISB-AD-AMT
    {
#M245B2 CHANGES START HERE    
        CurrencyCode="MIR-POL-CRCY-CD";
#M245B2 CHANGES END HERE    
        DisplayOnly;
        Signed;
        Length = "19";
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

    IN MIR-CVG-NUM-T[20]
    {
        DisplayOnly;
        Length = "2";
        FieldGroup = "Table20";
        KeyColumn;
        SType = "Text";
        Label = "Coverage Number";
        Index = "1";
    }

    IN MIR-PLAN-ID-T[20]
    {
        DisplayOnly;
        Length = "40";
        FieldGroup = "Table20";
        CodeSource = "EDIT";
        CodeType = "PLAN";
        SType = "Text";
        Label = "Type of Plan";
        Index = "1";
    }

    IN MIR-CVG-ILLUS-CD-T[20]
    {
        DisplayOnly;
        Length = "1";
        CodeSource = "EDIT";
        CodeType = "ILLUS";
        DBTableName = "TCVG";
        SType = "Text";
        Label = "Illustration Type";
    }

    IN MIR-CVG-SEX-CD-T[20]
    {
        DisplayOnly;
        Length = "40";
        FieldGroup = "Table20";
        CodeSource = "DataModel";
        CodeType = "CVG-SEX-CD";
        SType = "Text";
        Label = "Sex";
        Index = "1";
    }

    IN MIR-CVG-RT-AGE-T[20]
    {
        DisplayOnly;
        Length = "3";
        Decimals = "0";
        FieldGroup = "Table20";
        SType = "Number";
        Label = "Rate Age";
        Index = "1";
    }

    IN MIR-DV-INSRD-CLI-NM-T[20]
    {
        DisplayOnly;
        Length = "75";
        FieldGroup = "Table20";
        SType = "Text";
        Label = "Insured's Name";
        Index = "1";
    }

    IN MIR-INSRD-CLI-ID-T[20]
    {
        DisplayOnly;
        Length = "10";
        FieldGroup = "Table20";
        SType = "Text";
        Label = "Client Number of Lives Insured";
        Index = "1";
    }

    IN MIR-CVG-FACE-AMT-T[20]
    {
#M245B2 CHANGES START HERE    
        CurrencyCode="MIR-POL-CRCY-CD";
#M245B2 CHANGES END HERE    
        DisplayOnly;
        Signed;
        Length = "16";
        FieldGroup = "Table20";
        SType = "Currency";
        Label = "Face Amount";
        Index = "1";
    }

    IN MIR-CVG-ISS-EFF-DT-T[20]
    {
        DisplayOnly;
        Length = "10";
        FieldGroup = "Table20";
        SType = "Date";
        Label = "Issue Date";
        Index = "1";
    }

    IN MIR-CVG-CSTAT-CD-T[20]
    {
        DisplayOnly;
        Length = "40";
        FieldGroup = "Table20";
        CodeSource = "DataModel";
        CodeType = "CVG-CSTAT-CD";
        SType = "Text";
        Label = "Coverage Status";
        Index = "1";
    }

    IN MIR-CVG-STBL-1-CD-T[20]
    {
        DisplayOnly;
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
        SType = "Text";
        Label = "Sub-table 1";
        Index = "1";
    }

    IN MIR-CVG-STBL-2-CD-T[20]
    {
        DisplayOnly;
        Length = "40";
        FieldGroup = "Table20";
        CodeSource = "EDIT";
        CodeType = "STB2";
        SType = "Text";
        Label = "Sub-table 2";
        Index = "1";
    }
#*   RPL012- Misc Screen Changes start
    IN MIR-CVG-STBL-3-CD-T[20]
    {
        DisplayOnly;
        Length = "5";
        FieldGroup = "Table20";
#* M241A3 changes START here*  
        CodeSource = "CSOM9D30";        
        FilterFields = "2";
        FilterField1 = "MIR-PLAN-ID-T";
        FilterField2 = "MIR-CVG-STBL-3-CD-T";
 #       CodeSource = "EDIT";
 #       CodeType = "STB3";
 #* M241A3 changes END here*  
        SType = "Text";
        Label = "Premium Payment Period";
        Index = "1";
    }
#*   RPL012- Misc Screen Changes end
#*   RP2012- Misc Screen Changes start
    IN MIR-CVG-STBL-4-CD-T[20]
    {
        DisplayOnly;
        Length = "2";
        FieldGroup = "Table20";
        CodeSource = "EDIT";
        CodeType = "STB4";
        SType = "Text";
        Label = "Remarks";
        Index = "1";
    }

#*  RP2012- Misc Screen Changes end
#*                                               Coverage Details

    IN MIR-CVG-BASIC-PREM-AMT-T[20]
    {
#M245B2 CHANGES START HERE    
        CurrencyCode="MIR-POL-CRCY-CD";
#M245B2 CHANGES END HERE    
        Signed;
        Length = "15";
        FieldGroup = "Table20";
        DBTableName = "TCVG";
        SType = "Currency";
        Label = "Annual Premium";
        Index = "1";
    }

    IN MIR-CVG-MPREM-AMT-T[20]
    {
#M245B2 CHANGES START HERE    
        CurrencyCode="MIR-POL-CRCY-CD";
#M245B2 CHANGES END HERE    
        Signed;
        Length = "15";
        FieldGroup = "Table20";
        DBTableName = "TCVG";
        SType = "Currency";
        Label = "Mode Premium";
        Index = "1";
    }

    IN MIR-CVG-RESTR-PREM-IND-T[20]
    {
        Length = "1";
        FieldGroup = "Table20";
        DBTableName = "TCVG";
        SType = "Indicator";
        Label = "Automatic premium calculation has been restricted";
        Index = "1";
    }

    IN MIR-CVG-PAR-CD-T[20]
    {
        DisplayOnly;
        Length = "40";
        FieldGroup = "Table20";
        CodeSource = "DataModel";
        CodeType = "CVG-PAR-CD";
        SType = "Text";
        Label = "Dividend Option";
        Index = "1";
    }

    IN MIR-CVG-PFEE-AMT-T[20]
    {
#M245B2 CHANGES START HERE    
        CurrencyCode="MIR-POL-CRCY-CD";
#M245B2 CHANGES END HERE    
        Signed;
        Length = "11";
        FieldGroup = "Table20";
        DBTableName = "TCVG";
        SType = "Currency";
        Label = "Flat Policy Fee";
        Index = "1";
    }

#* IPDDRC                                        Converted Face Amount
    IN MIR-CVG-NUM2-T[20]
    {
        Length = "2";
        FieldGroup = "Table20";
        KeyColumn;
        DBTableName = "TCVG";
        SType = "Text";
        Label = "Coverage Number";
        Index = "1";
    }

    IN MIR-PLAN-ID2-T[20]
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

    IN MIR-CVG-PCFA-AMT-T[20]
    {
#M245B2 CHANGES START HERE    
        CurrencyCode="MIR-POL-CRCY-CD";
#M245B2 CHANGES END HERE   
        Signed;
        Length = "15";
        FieldGroup = "Table20";
        DBTableName = "TCVG";
        SType = "Currency";
        Label = "Present Converted Face Amount";
        Index = "1";
    }

    IN MIR-CVG-DV-PCFA-NXT2-AMT-T[20]
    {
#M245B2 CHANGES START HERE    
        CurrencyCode="MIR-POL-CRCY-CD";
#M245B2 CHANGES END HERE    
        Signed;
        Length = "15";
        FieldGroup = "Table20";
        DBTableName = "Derived";
        SType = "Currency";
        Label = "Converted Face Amount at Next MV + 2 Years";
        Index = "1";
    }

    IN MIR-CVG-ACFA-AMT-T[20]
    {
#M245B2 CHANGES START HERE    
        CurrencyCode="MIR-POL-CRCY-CD";
#M245B2 CHANGES END HERE    
        Signed;
        Length = "15";
        FieldGroup = "Table20";
        DBTableName = "TCVG";
        SType = "Currency";
        Label = "Average Converted Face Amount";
        Index = "1";
    }

    IN MIR-CVG-DV-PCFA-GPD-AMT-T[20]
    {
#M245B2 CHANGES START HERE    
        CurrencyCode="MIR-POL-CRCY-CD";
#M245B2 CHANGES END HERE    
        Signed;
        Length = "15";
        FieldGroup = "Table20";
        DBTableName = "Derived";
        SType = "Currency";
        Label = "Converted Face Amount for Guaranteed Period";
        Index = "1";
    }

#*                                               Beneficiary Information
    IN MIR-DV-BENEF-CLI-ID-T[20]
    {
        DisplayOnly;
        Length = "10";
        FieldGroup = "Table20";
        SType = "Text";
        Label = "Client Number of Beneficiary";
        Index = "1";
    }

    IN MIR-DV-INSRD-NM-T[20]
    {
        Length = "51";
        FieldGroup = "Table20";
        DBTableName = "Derived";
        SType = "Text";
        Label = "Insured's Name";
        Index = "1";
    }

    IN MIR-BNFY-SEQ-NUM-T[20]
    {
        DisplayOnly;
        Length = "3";
        FieldGroup = "Table20";
        SType = "Text";
        Label = "Sequence Number";
        Index = "1";
    }

    IN MIR-CLI-ID-T[20]
    {
      DisplayOnly;
      Length = "10";
      FieldGroup = "Table1";
      SType = "Text";
      Label = "Payor ID";
      Index = "1";
    }

    IN MIR-BNFY-NM-T[20]
    {
        DisplayOnly;
        #TLB041 CHANGES START HERE
        #Length = "75";
        Length = "100";
        #TLB041 CHANGES END HERE
        FieldGroup = "Table20";
        SType = "Text";
        Label = "Beneficiary's Name";
        Index = "1";
    }

    IN MIR-BNFY-TYP-CD-T[20]
    {
        DisplayOnly;
        Length = "1";
        FieldGroup = "Table20";
        CodeSource = "DataModel";
        CodeType = "BNFY-TYP-CD";
        SType = "Text";
        Label = "Beneficiary Type";
        Index = "1";
    }


    IN MIR-BNFY-DESGNT-CD-T[20]
    {
        DisplayOnly;
        Length = "40";
        FieldGroup = "Table20";
        CodeSource = "DataModel";
        CodeType = "BNFY-DESGNT-CD";
        SType = "Text";
        Label = "Designation";
        Index = "1";
    }

    IN MIR-BNFY-PRCDS-PCT-T[20]
    {
        DisplayOnly;
        Length = "3";
        Decimals = "0";
        FieldGroup = "Table20";
        SType = "Percent";
        Label = "Percentage";
        Index = "1";
    }

    IN MIR-BNFY-REL-INSRD-CD-T[20]
    {
        DisplayOnly;
        Length = "40";
        FieldGroup = "Table20";
        CodeSource = "EDIT";
        CodeType = "BTOI";
        SType = "Text";
        Label = "Relation to Insured";
        Index = "1";
    }

    IN MIR-BNFY-MINR-IND-T[20]
    {
        DisplayOnly;
        Length = "1";
        FieldGroup = "Table20";
        SType = "Indicator";
        Label = "Beneficiary is a minor";
        Index = "1";
    }

    IN MIR-DV-INSRD-CLI-NM1-T[20]
    {
        DisplayOnly;
        Length = "75";
        FieldGroup = "Table20";
        SType = "Text";
        Label = "Insured's Name";
        Index = "1";
    }

    IN MIR-DV-SEL-CLI-ID-T[20]
    {
        DisplayOnly;
        Length = "10";
        FieldGroup = "Table1";
        SType = "Text";
        Label = "Payor ID";
        Index = "1";
    }

    IN MIR-UW-TYP-CD-T[20]
    {
        DisplayOnly;
        Length = "1";
        FieldGroup = "Table20";
        Index = "1";
        CodeSource = "DataModel";
        CodeType = "UW-TYP-CD";
        SType = "Text";
        Label = "Level of Underwriting";
    }

#* EN5679
#*                                               Other Coverages Information

    IN MIR-DV-INSRD-CLI-NM2-T[20]
    {
        DisplayOnly;
        Length = "75";
        FieldGroup = "Table20";
        SType = "Text";
        Label = "Insured Client Name";
        Index = "1";
    }

    IN MIR-DV-OTH-CLI-ID-T[20]
    {
        DisplayOnly;
        Length = "10";
        FieldGroup = "Table1";
        SType = "Text";
        Label = "Insured Client's ID";
        Index = "1";
    }

    IN MIR-CLI-TCB-IND-T[20] 
    {
      DisplayOnly;
      Length = "1";
      FieldGroup = "Table20";
      Index = "1";
      SType = "Indicator";
      Label = "Terminal Care Benefits";
    }

    IN MIR-CLI-LNB-IND-T[20] 
    {
      DisplayOnly;
      Length = "1";
      FieldGroup = "Table20";
      Index = "1";
      SType = "Indicator";
      Label = "Living Needs Benefits";
    }

    IN MIR-SUBST-CLMT-IND-T[20]
    {
      DisplayOnly;
      Length = "1";
      FieldGroup = "Table20";
      Index = "1";
      SType = "Indicator";
      Label = "Substitute Claimant Rider";
    }

#*                                               Billing Activity

    IN MIR-APPL-CTL-PRCES-DT1-T[6]
  {
    DisplayOnly;
    Length = "10";
    FieldGroup = "Table1";
    SType = "Date";
    Label = "System Date";
    Index = "1";
  }

  IN MIR-PREV-UPDT-DT1-T[6]
  {
    DisplayOnly;
    Length = "10";
    FieldGroup = "Table1";
    SType = "Date";
    Label = "Status Date";
    Index = "1";
  }

  IN MIR-DRW-STAT-CD1-T[6]
  {
    DisplayOnly;
    Length = "15";
    FieldGroup = "Table1";
    CodeSource = "DataModel";
    CodeType = "DRW-STAT-CD";
    SType = "Text";
    Label = "Status";
    Index = "1";
  }

  IN MIR-FND-SRC-CD1-T[6]
  {
    DisplayOnly;
    Length = "01";
    FieldGroup = "Table1";
    CodeSource = "DataModel";
    CodeType = "FND-SRC-CD";
    SType = "Text";
    Label = "Source of Funds";
    Index = "1";
  }

  IN MIR-BNK-ID1-T[6]
  {
    DisplayOnly;
    Length = "04";
    FieldGroup = "Table1";
    SType = "Text";
    Label = "Bank";
    Index = "1";
  }

  IN MIR-BNK-BR-ID1-T[6]
  {
    DisplayOnly;
    Length = "05";
    FieldGroup = "Table1";
    SType = "Text";
    Label = "Branch";
    Index = "1";
  }

  IN MIR-BNK-ACCT-ID1-T[6]
  {
    DisplayOnly;
    Length = "17";
    FieldGroup = "Table1";
    SType = "Text";
    Label = "Account";
    Index = "1";
  }

  IN MIR-DRW-DT1-T[6]
  {
    DisplayOnly;
    Length = "10";
    FieldGroup = "Table1";
    SType = "Date";
    Label = "Draw Date";
    Index = "1";
  }

  IN MIR-PREM-AMT1-T[6]
  {
#M245B2 CHANGES START HERE    
#Q61551 CHANGES START HERE 
        #CurrencyCode="MIR-POL-CRCY-CD";
         CurrencyCode="MIR-PREM-CRCY-CD";
#Q61551 CHANGES END HERE         
#M245B2 CHANGES END HERE  
    DisplayOnly;
    Length = "13";
    FieldGroup = "Table1";
    SType = "Currency";
    Label = "Total Billed";
    Index = "1";
  }

  IN MIR-RECV-AMT1-T[6]
  {
#M245B2 CHANGES START HERE    
        CurrencyCode="MIR-PMT-CRCY-CD";
#M245B2 CHANGES END HERE  
    DisplayOnly;
    Length = "13";
    FieldGroup = "Table1";
    SType = "Currency";
    Label = "Total Received";
    Index = "1";
  }

  IN MIR-RECV-DT1-T[6]
   {
    DisplayOnly;
    Length = "10";
    FieldGroup = "Table1";
    DBTableName = "TBAC";
    SType = "Date";
    Label = "Payment Received Date";
    Index = "1";
    }

  IN MIR-UNSUCS-REASN-CD1-T[6]
  {
    DisplayOnly;
    Length = "01";
    FieldGroup = "Table1";
    CodeSource = "DataModel";
    CodeType = "UNSUCS-REASN-CD";
    SType = "Text";
    Label = "Unsuccessful Reason Code";
    Index = "1";
  }

  IN MIR-BILL-TYP-CD1-T[6]
  {
    DisplayOnly;
    Length = "15";
    FieldGroup = "Table1";
    CodeSource = "DataModel";
    CodeType = "BILL-TYP-CD";
    SType = "Text";
    Label = "Bill Method";
    Index = "1";
  }

  IN MIR-BILL-MODE-CD1-T[6]
  {
    DisplayOnly;
    Length = "15";
    FieldGroup = "Table1";
    CodeSource = "DataModel";
    CodeType = "BILL-MODE-CD";
    SType = "Text";
    Label = "Bill Mode";
    Index = "1";
  }

#*                                               Policy Information

    IN MIR-UL-LAPS-STRT-DT
    {
        DisplayOnly;
        Length = "10";
        SType = "Date";
        Label = "Lapse Start Date";
    }

    IN MIR-POL-CEAS-DT
    {
        DisplayOnly;
        Length = "10";
        SType = "Date";
        Label = "Policy Cease Date";
    }

#*                                               Old Policy Information

    IN MIR-SUB-CAT-CD
    {
        DisplayOnly;
        Length = "3";
        SType = "Text";
        Label = "Sub Category";
    }

    IN MIR-ORIG-POL-ID
    {
        DisplayOnly;
        Length = "7";
        SType = "Text";
        Label = "Original Policy Number";
    }

    IN MIR-MY-KEMPO-TYP-CD
    {
        DisplayOnly;
        Length = "1";
        SType = "Text";
        Label = "My Kempo Type Code";
    }

#*                                               Fund Inquiry

    IN MIR-DV-POL-BASE-CV-EX-ESC-AMT
    {
#M245B2 CHANGES START HERE    
        CurrencyCode="MIR-POL-CRCY-CD";
#M245B2 CHANGES END HERE   
        DisplayOnly;
        Signed;
        Length = "17";
        SType = "Currency";
        Label = "Base Cash Value Excluding ESC";
    }

    IN MIR-DV-POL-BASE-CV-AMT
    {
#M245B2 CHANGES START HERE    
        CurrencyCode="MIR-POL-CRCY-CD";
#M245B2 CHANGES END HERE    
        DisplayOnly;
        Signed;
        Length = "17";
        SType = "Currency";
        Label = "Base Cash Value";
    }

    IN MIR-DV-SURR-CHRG-AMT
    {
#M245B2 CHANGES START HERE    
        CurrencyCode="MIR-POL-CRCY-CD";
#M245B2 CHANGES END HERE    
        DisplayOnly;
        Signed;
        Length = "15";
        SType = "Currency";
        Label = "Surrender Charge";
    }

    IN MIR-CF-MKTVAL-ADJ-AMT
    {
#M245B2 CHANGES START HERE    
        CurrencyCode="MIR-POL-CRCY-CD";
#M245B2 CHANGES END HERE  
        DisplayOnly;
        Signed;
        Length = "15";
        SType = "Currency";
        Label = "Market Value Adjustment";
    }

    IN MIR-DV-POL-CSV-AMT
    {
#M245B2 CHANGES START HERE    
        CurrencyCode="MIR-POL-CRCY-CD";
#M245B2 CHANGES END HERE    
        DisplayOnly;
        Signed;
        Length = "15";
        SType = "Currency";
        Label = "Cash Surrender Value";
    }

# EN5679

    IN MIR-GRACE-EXT-PREM-AMT
    {
#M245B2 CHANGES START HERE    
        CurrencyCode="MIR-POL-CRCY-CD";
#M245B2 CHANGES END HERE   
           DisplayOnly;
           Signed;
           Length = "17";
           DBTableName = "Derived";
           SType = "Currency";
           Label = "Premium necessary to extend grace period";
    }

#*                                               History

    IN MIR-CF-EFF-DT1-T[6]
    {
        DisplayOnly;
        Length = "10";
        FieldGroup = "Table6";
        SType = "Date";
        Label = "Cash Flow Effective Date";
        Index = "1";
    }

    IN MIR-DV-FND-BAL-EX-ESC-AMT1-T[6]
    {
#M245B2 CHANGES START HERE    
        CurrencyCode="MIR-POL-CRCY-CD";
#M245B2 CHANGES END HERE    
        DisplayOnly;
        Signed;
        Length = "15";
        FieldGroup = "Table6";
        SType = "Currency";
        Label = "Base Cash Value Excluding ESC";
        Index = "1";
    }

    IN MIR-CF-FND-BAL-AMT1-T[6]
    {
#M245B2 CHANGES START HERE    
        CurrencyCode="MIR-POL-CRCY-CD";
#M245B2 CHANGES END HERE   
        DisplayOnly;
        Signed;
        Length = "15";
        FieldGroup = "Table6";
        SType = "Currency";
        Label = "Current Amount";
        Index = "1";
    }

    IN MIR-CF-TRXN-CD1-T[6]
    {
        DisplayOnly;
        Length = "40";
        FieldGroup = "Table6";
        CodeSource = "DataModel";
        CodeType = "CF-TRXN-CD";
        SType = "Text";
        Label = "Transaction Type";
        Index = "1";
    }

    IN MIR-CF-REASN-CD1-T[6]
    {
        DisplayOnly;
        Length = "40";
        FieldGroup = "Table6";
        CodeSource = "DataModel";
        CodeType = "CF-REASN-CD";
        SType = "Text";
        Label = "Transaction Reason";
        Index = "1";
    }

    IN MIR-CF-FND-TRXN-AMT1-T[6]
    {
#M245B2 CHANGES START HERE    
        CurrencyCode="MIR-POL-CRCY-CD";
#M245B2 CHANGES END HERE    
        DisplayOnly;
        Signed;
        Length = "15";
        FieldGroup = "Table6";
        SType = "Currency";
        Label = "Net Deposit Amount";
        Index = "1";
    }

    IN MIR-CF-CLI-TRXN-AMT1-T[6]
    {
#M245B2 CHANGES START HERE    
        CurrencyCode="MIR-POL-CRCY-CD";
#M245B2 CHANGES END HERE   
        DisplayOnly;
        Signed;
        Length = "15";
        FieldGroup = "Table6";
        SType = "Currency";
        Label = "Gross Amount";
        Index = "1";
    }

    IN MIR-CF-INT-PCT1-T[6]
    {
        DisplayOnly;
        Signed;
        Length = "7";
        Decimals = "4";
        FieldGroup = "Table6";
        SType = "Percent";
        Label = "Interest Rate";
        Index = "1";
    }

    IN MIR-ACUM-INT-LTD-AMT1-T[6]
    {
#M245B2 CHANGES START HERE    
        CurrencyCode="MIR-POL-CRCY-CD";
#M245B2 CHANGES END HERE    
        DisplayOnly;
        Signed;
        Length = "15";
        FieldGroup = "Table6";
        SType = "Currency";
        Label = "Accumulated Cash Flow Interest Paid Amount";
        Index = "1";
    }

    IN MIR-CF-STAT-CD1-T[6]
    {
        DisplayOnly;
        Length = "40";
        FieldGroup = "Table6";
        CodeSource = "DataModel";
        CodeType = "CF-STAT-CD";
        SType = "Text";
        Label = "Cash Flow Status";
        Index = "1";
    }
    IN MIR-FIEL-INS-PURP-IND
    {
        DisplayOnly;
        Length = "1";
        SType = "Indicator";
        Label = "FIEL(Insurance Purpose)";
    }
# MP5002
    IN MIR-SURR-CHRG-TYP-CD
    {
        DisplayOnly;
        Length = "1";
        CodeSource = "EDIT";
        CodeType = "MVAL";
        SType = "Text";
        Label = " FlexFund Surrender Charge Type";
    }
    
#M245B2 CHANGES START HERE    
   IN MIR-POL-CRCY-CD
   {   
        Length = "2";
        SType = "Hidden";
        Label = "Currency";
        
    } 
    
    IN MIR-PMT-CRCY-CD
    {
         Length = "2";
         SType = "Hidden";
         Label = "Currency";
    }          
#M245B2 CHANGES END HERE

#Q61551 CHANGES START HERE     

    IN MIR-PREM-CRCY-CD
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
    IN MIR-PD-GR-TYP-CD
    {
        DisplayOnly;
        Length = "1";
        CodeSource = "DataModel";
        CodeType = "PD-GR-TYP-CD";
        SType = "Text";
        Label = "PD group size";
    }
#UYS133 CHANGES END    
}
