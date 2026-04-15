# Converted from PathFinder 2.2 to 3.0 Jun 18, 2004 3:13:52 PM EDT

#*******************************************************************************
#*  Component:   BF6920-P.p                                                    *
#*  Description:                                                               *
#*                                                                             *
#*******************************************************************************
#*  Chg#    Release  Description                                               *
#*                                                                             *
#*  014590  6.0      New for release 6.0                                       *
#*  016736  611J     Code cleanup                                              *
#*  017150  612J     Remove Currency Decimals = "2"                            *
#*  01PR21  TMC      Added Next Fund Survivorship Benefit Date                 *
#*  01PT02  TMC      Added Reprint Date and Number                             *
#*  02BL13  DPK      Last Billing Notice Date                                  *
#*  02GL57  DPK      CWA Suspense Account and Refund                           *
#*                                                                             *
#*  NWLOP3  CTS      ADD NEW FIELD INTIAL CWA PROCESS DATE FOR                 *
#*  NWLOP3           NWL POLICIES PROCESSED THRU PA,WMD AND MGA                *
#*  M161CA  CTS      ADDITION OF NEW FIELD INIT-PMT-TYP-CD                     *
#*  MP245R  CTS      CHANGES FOR BILLING FIELDS FOR SPWL POLICIES              *
#*  M271O1  CTS      FRA Foreign Currency Formatting 			       *
#*  M319O1  CTS      FXWL Foreign Currency Formatting                          *
#*  TDMG24  CTS      INQUIRY SCREEN CHANGES                                    * 
#*  UYS133  CTS      Addition of PD group size field                           *
#*  UYSD11  CTS      ADDIITION OF UNISYS MIGRATION TYPE CODE                   *
#*******************************************************************************

P-STEP BF6920-P
{
    ATTRIBUTES
    {
        BusinessFunctionId = "6920";
        BusinessFunctionName = "Policy Inquiry - General";
        BusinessFunctionType = "General";
        MirName = "CCWM6920";
    }

    OUT LSIR-RETURN-CD;

    OUT MIR-RETRN-CD;

    INOUT MIR-APPL-CTL-PRCES-DT
    {
        Mandatory;
        Length = "10";
        DBTableName = "TMAST";
        DefaultSession = "LSIR-PRCES-DT";
        SType = "Date";
        Label = "Process Date";
    }

    IN MIR-POL-ID-BASE
    {
        Key;
        Mandatory;
        Length = "9";
        DBTableName = "TPOL";
        DefaultSession = "MIR-POL-ID-BASE";
        SType = "Text";
        Label = "Policy Id";
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

    OUT MIR-APP-FORM-TYP-ID
    {
        Length = "40";
        CodeSource = "EDIT";
        CodeType = "AFTT";
        DBTableName = "TAFTT";
        SType = "Text";
        Label = "Application Form Type";
    }

    OUT MIR-BNFY-TYP-CD
    {
        Length = "40";
        CodeSource = "DataModel";
        CodeType = "BNFY-TYP-CD";
        DBTableName = "TBENE";
        SType = "Text";
        Label = "Beneficiary Type";
    }

    OUT MIR-CLI-CHRTY-IND
    {
        Length = "1";
        DBTableName = "TCLI";
        SType = "Indicator";
        Label = "Owner has been identified as a charity";
    }

    OUT MIR-CLI-CNFD-IND
    {
        Length = "1";
        DBTableName = "TCLI";
        SType = "Indicator";
        Label = "Access to client information is confidential";
    }

    OUT MIR-CLI-CRNT-LOC-CD
    {
        Length = "40";
        CodeSource = "CTLC";
        CodeType = "CLOC";
        DBTableName = "TCLIA";
        SType = "Text";
        Label = "Province/State";
    }

    OUT MIR-CLI-LANG-CD
    {
        Length = "40";
        CodeSource = "EDIT";
        CodeType = "LANG";
        DBTableName = "TCLI";
        SType = "Text";
        Label = "Correspondence Language";
    }

    OUT MIR-CONN-OPTL-POL-ID-BASE
    {
        Length = "9";
        DBTableName = "TPOL";
        SType = "Text";
        Label = "Optional Policy ID";
    }

    OUT MIR-CONN-OPTL-POL-ID-SFX
    {
        Length = "1";
        DBTableName = "TPOL";
        SType = "Text";
        Label = "Optional Policy Suffix";
    }

    OUT MIR-DV-AMEX-XIST-IND
    {
        Length = "1";
        DBTableName = "Derived";
        SType = "Indicator";
        Label = "Amendments, endorsements or exclusions have been created";
    }

    OUT MIR-DV-LOAN-VALU-AMT
    {
        Signed;
        Length = "17";
        DBTableName = "Derived";
        SType = "Currency";
        Label = "Loan Value Amount";
    }

    OUT MIR-DV-NET-CV-MODE-QTY
    {
        Length = "8";
        DBTableName = "Derived";
        SType = "Text";
        Label = "Net Cash Value - Number of Modes";
    }

    OUT MIR-DV-OWN-CLI-NM
    {
        Length = "75";
        DBTableName = "Derived";
        SType = "Text";
        Label = "Owner Name";
    }

    OUT MIR-DV-POL-CSV-AMT
    {
        Signed;
        Length = "19";
        DBTableName = "Derived";
        SType = "Currency";
        Label = "Cash Surrender Value";
    }

    OUT MIR-DV-POL-REPL-IND
    {
        Length = "1";
        DBTableName = "Derived";
        SType = "Indicator";
        Label = "This is a replacement policy";
    }

    OUT MIR-DV-REL-XIST-IND
    {
        Length = "1";
        DBTableName = "Derived";
        SType = "Indicator";
        Label = "Owner Relationship Exists";
    }

    OUT MIR-DV-VPO-PU-YR-QTY
    {
        Length = "4";
        DBTableName = "Derived";
        SType = "Text";
        Label = "Vanishing Premium Year";
    }

    OUT MIR-LATST-ACTV-DT
    {
        Length = "10";
        DBTableName = "TPOL";
        SType = "Date";
        Label = "Last Transaction Date";
    }

    OUT MIR-LINK-POL-ISS-IND
    {
        Length = "1";
        DBTableName = "TPOL";
        SType = "Indicator";
        Label = "Linked Policy";
    }

    OUT MIR-LOAN-INT-BILL-AMT
    {
        Signed;
        Length = "15";
        DBTableName = "TPOLL";
        SType = "Currency";
        Label = "Loan Interest Billed - APL";
    }

    OUT MIR-LOAN-INT-BILL-AMT-2
    {
        Signed;
        Length = "15";
        DBTableName = "TPOLL";
        SType = "Currency";
        Label = "Loan Interest Billed - Cash";
    }

    OUT MIR-NXT-PERI-STMT-DT
    {
        Length = "10";
        DBTableName = "TPOL";
        SType = "Date";
        Label = "Next Statement Date";
    }

    OUT MIR-PLAN-ID
    {
        Length = "40";
        CodeSource = "EDIT";
        CodeType = "PLAN";
        DBTableName = "TPOL";
        SType = "Text";
        Label = "Plan";
    }

    OUT MIR-POL-APL-IND
    {
        Length = "1";
        DBTableName = "TPOL";
        SType = "Indicator";
        Label = "Automatic premium loan is a separate option from nonforfeiture";
    }

    OUT MIR-POL-APP-RECV-DT
    {
        Length = "10";
        DBTableName = "TPOL";
        SType = "Date";
        Label = "Application Received Date";
    }

    OUT MIR-POL-APP-SIGN-DT
    {
        Length = "10";
        DBTableName = "TPOL";
        SType = "Date";
        Label = "Application Signed Date";
    }

    OUT MIR-POL-BILL-MODE-CD
    {
        Length = "40";
        CodeSource = "DataModel";
#MP245R CHANGES START
#CodeType = "POL-BILL-MODE-CD";
      CodeType = "POL-DV-BILL-MODE-CD";
#MP245R CHANGES ENDS
        DBTableName = "TPOL";
        SType = "Text";
        Label = "Premium Mode";
    }

    OUT MIR-POL-BILL-TO-DT-NUM
    {
        Length = "10";
        DBTableName = "TPOL";
        SType = "Text";
        Label = "Billed to Date";
    }

    OUT MIR-POL-BILL-TYP-CD
    {
        Length = "40";
        CodeSource = "DataModel";
        CodeType = "POL-BILL-TYP-CD";
        DBTableName = "TPOL";
        SType = "Text";
        #M161CA START
        #Label = "Billing Type";
        Label = "Billing Type(Subsequent Premium)";
        #M161CA END
    }

    #M161CA START
    OUT MIR-INIT-PMT-TYP-CD
    {
        Length = "40";
        CodeSource = "DataModel";
        CodeType = "INIT-PMT-TYP-CD";
        DBTableName = "TPOL";
        SType = "Text";
        Label = "Payment Route (First Premium)";
    }
    #M161CA END
    OUT MIR-POL-CLI-REL-SUB-CD
    {
        Length = "40";
        CodeSource = "DataModel";
        CodeType = "POL-CLI-REL-SUB-CD";
        DBTableName = "TPOLC";
        SType = "Text";
        Label = "Relationship Type";
    }

    OUT MIR-POL-CNFD-IND
    {
        Length = "1";
        DBTableName = "TPOL";
        SType = "Indicator";
        Label = "Policy has been designated as confidential";
    }

    OUT MIR-POL-CRCY-CD
    {
        Length = "40";
        CodeSource = "XTAB";
        CodeType = "CURR";
        DBTableName = "TPOL";
        SType = "Text";
        Label = "Currency";
    }

    OUT MIR-POL-CSTAT-CD
    {
        Length = "40";
        CodeSource = "DataModel";
        CodeType = "POL-CSTAT-CD";
        DBTableName = "TPOL";
        SType = "Text";
        Label = "Policy Status";
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

#UYSD11 CHANGES START HERE

    OUT MIR-USYS-MIGR-POL-IND
    {    
        Length = "1";
        DBTableName = "TPOL";
        SType = "Indicator";
        Label = "Migrated Policy";
    }

# UYSD11 CHANGES END HERE   

    OUT MIR-POL-CTRY-CD
    {
        Length = "40";
        CodeSource = "XTAB";
        CodeType = "CNTRY";
        DBTableName = "TPOL";
        SType = "Text";
        Label = "Country";
    }

    OUT MIR-POL-CVG-REC-CTR
    {
        Length = "2";
        DBTableName = "TPOL";
        SType = "Text";
        Label = "Number of Coverages";
    }

    OUT MIR-POL-DIV-OPT-CD
    {
        Length = "40";
        CodeSource = "DataModel";
        CodeType = "POL-DIV-OPT-CD";
        DBTableName = "TPOL";
        SType = "Text";
        Label = "Policy Dividend Option";
    }

    OUT MIR-POL-FINAL-DISP-DT
    {
        Length = "10";
        DBTableName = "TPOL";
        SType = "Date";
        Label = "Final Disposition Date";
    }

    OUT MIR-POL-FREE-LK-END-DT
    {
        Length = "10";
        DBTableName = "TPOL";
        SType = "Date";
        Label = "Free Look End Date";
    }

    OUT MIR-POL-ISS-EFF-DT
    {
        Length = "10";
        DBTableName = "TPOL";
        SType = "Date";
        Label = "Policy Issue Date";
    }

    OUT MIR-POL-ISS-LOC-CD
    {
        Length = "40";
        CodeSource = "CTLC";
        CodeType = "ILOC";
        DBTableName = "TPOL";
        SType = "Text";
        Label = "Issue Location";
    }

    OUT MIR-POL-LOAN-REPAY-AMT
    {
        Signed;
        Length = "15";
        DBTableName = "TPOL";
        SType = "Currency";
        Label = "Loan Repayment Amount";
    }

    OUT MIR-POL-MAIL-DT
    {
        Length = "10";
        DBTableName = "TPOL";
        SType = "Date";
        Label = "Policy Mailed Date";
    }

    OUT MIR-POL-MAIL-REASN-CD
    {
        Length = "40";
        DBTableName = "TPOL";
        SType = "Text";
        Label = "Reason Duplicate Policy Mailed";
    }

    OUT MIR-POL-MPREM-AMT
    {
        Signed;
        Length = "17";
        DBTableName = "TPOL";
        SType = "Currency";
        Label = "Mode Premium Amount";
    }

    OUT MIR-POL-NFO-CD
    {
        Length = "40";
        CodeSource = "DataModel";
        CodeType = "POL-NFO-CD";
        DBTableName = "TPOL";
        SType = "Text";
        Label = "Non-forfeiture Option";
    }

    OUT MIR-POL-NOTI-DEPT-ID-T[2]
    {
        Length = "40";
        FieldGroup = "Table2";
        CodeSource = "EDIT";
        CodeType = "DEPT";
        DBTableName = "TPOLN";
        SType = "Text";
        Label = "Notify Information - Department";
        Index = "1";
    }

    OUT MIR-POL-NOTI-DT-T[2]
    {
        Length = "10";
        FieldGroup = "Table2";
        KeyColumn;
        DBTableName = "TPOLN";
        SType = "Date";
        Label = "Date Notices Produced";
        Index = "1";
    }

    OUT MIR-POL-NOTI-MO-DUR-T[2]
    {
        Length = "2";
        FieldGroup = "Table2";
        DBTableName = "TPOLN";
        SType = "Text";
        Label = "Frequency of Notices - Months";
        Index = "1";
    }

    OUT MIR-POL-NOTI-QTY-T[2]
    {
        Length = "2";
        FieldGroup = "Table2";
        DBTableName = "TPOLN";
        SType = "Text";
        Label = "Number of Notifications Produced";
        Index = "1";
    }

    OUT MIR-POL-NOTI-REASN-CD-T[2]
    {
        Length = "40";
        FieldGroup = "Table2";
        CodeSource = "EDIT";
        CodeType = "NOTRE";
        DBTableName = "TPOLN";
        SType = "Text";
        Label = "Notification Reason";
        Index = "1";
    }

    OUT MIR-NXT-FND-SRVBEN-DT
    {
        Length = "10";
        DBTableName = "TPOL";
        SType = "Date";
        Label = "Next Fund Survivorship Benefit Date";
    }

    OUT MIR-POL-OPTL-CD
    {
        Length = "40";
        CodeSource = "DataModel";
        CodeType = "POL-OPTL-CD";
        DBTableName = "TPOL";
        SType = "Text";
        Label = "Optional Policy";
    }

    OUT MIR-POL-PD-TO-DT-NUM
    {
        Length = "10";
        DBTableName = "TPOL";
        SType = "Text";
        Label = "Paid to Date";
    }

    OUT MIR-POL-PREM-DSCNT-PCT
    {
        Signed;
        Length = "7";
        Decimals = "3";
        DBTableName = "TPOL";
        SType = "Percent";
        Label = "Policy Discount Percentage";
    }

    OUT MIR-POL-PREV-CSTAT-CD
    {
        Length = "4";
        CodeSource = "DataModel";
        CodeType = "POL-CSTAT-CD";
        DBTableName = "TPOL";
        SType = "Text";
        Label = "Previous Policy Status";
    }

    OUT MIR-POL-PRT-DT
    {
        Length = "10";
        DBTableName = "TPOL";
        SType = "Date";
        Label = "Policy Contract Printed Date";
    }

    OUT MIR-POL-PRT-QTY
    {
        Length = "2";
        DBTableName = "TPOL";
        SType = "Text";
        Label = "Number of Times Certificate Printed";
    }

    OUT MIR-POL-REINS-CD
    {
        Length = "40";
        CodeSource = "DataModel";
        CodeType = "POL-REINS-CD";
        DBTableName = "TPOL";
        SType = "Text";
        Label = "Reinsurance";
    }

    OUT MIR-POL-REJ-REASN-CD
    {
        Length = "40";
        CodeSource = "DataModel";
        CodeType = "POL-REJ-REASN-CD";
        DBTableName = "TPOL";
        SType = "Text";
        Label = "Rejection Reason";
    }

    OUT MIR-POL-REPRT-DT
    {
        Length = "10";
        DBTableName = "TPOL";
        SType = "Date";
        Label = "Certificate Reprint Date";
    }

    OUT MIR-POL-RUSH-IND
    {
        Length = "40";
        DBTableName = "TPOL";
        SType = "Indicator";
        Label = "High-priority Processing";
    }

    OUT MIR-POL-SNDRY-AMT
    {
        Signed;
        Length = "15";
        DBTableName = "TPOL";
        SType = "Currency";
        Label = "Sundry Amount";
    }

    OUT MIR-POL-STAT-CHNG-DT
    {
        Length = "10";
        DBTableName = "TPOL";
        SType = "Date";
        Label = "Policy Status Last Changed";
    }

    OUT MIR-POL-SUPRES-ISS-IND
    {
        Length = "1";
        DBTableName = "TPOL";
        SType = "Indicator";
        Label = "Suppress automatic issue / settlement process";
    }

    OUT MIR-POL-TOT-BILL-AMT
    {
        Signed;
        Length = "17";
        DBTableName = "TPOL";
        SType = "Currency";
        Label = "Amount Billed";
    }

    OUT MIR-PREM-RECALC-OPT-CD
    {
        Length = "40";
        CodeSource = "DataModel";
        CodeType = "PREM-RECALC-OPT-CD";
        DBTableName = "TPOL";
        SType = "Text";
        Label = "Premium Recalculation Option";
    }

    OUT MIR-PREV-FILE-MAINT-DT
    {
        Length = "10";
        DBTableName = "TPOL";
        SType = "Date";
        Label = "Last Maintain Date";
    }

    OUT MIR-PREV-PERI-STMT-DT
    {
        Length = "10";
        DBTableName = "TPOL";
        SType = "Date";
        Label = "Previous Statement Date";
    }

    OUT MIR-SBSDRY-CO-ID
    {
        Length = "40";
        CodeSource = "EDIT";
        CodeType = "SUBCO";
        DBTableName = "TPOL";
        SType = "Text";
        Label = "Sub Company";
    }

    OUT MIR-UNMTCH-MAIL-IND
    {
        Length = "1";
        DBTableName = "TPOL";
        SType = "Indicator";
        Label = "Information is still outstanding";
    }

    OUT MIR-PREV-BILL-NOTI-DT
    {
        Length = "10";
        DBTableName = "TPOL";
        SType = "Date";
        Label = "Last Billing Notice Date";
    }
    
    OUT MIR-CWA-PRCES-DT
    {
        Length = "10";
        DBTableName = "TPOL";
        SType = "Date";
        Label = "Initial CWA Process Date";
    }

    OUT MIR-POL-CSH-RFND-CD
    {
        Length = "40";
        CodeSource = "DataModel";
        CodeType = "POL-CSH-RFND-CD";
        DBTableName = "TPOL";
        SType = "Text";
        Label = "Cash Refund";
    }
#M271O1 CHANGES START HERE  
         
    INOUT MIR-PREM-CRCY-CD
    {
        Length = "2";
        SType = "Hidden";
        Label = "Currency";
    }  
#M271O1 CHANGES END HERE 
#M319O1 CHANGES START HERE  
         
    INOUT MIR-PMT-CRCY-CD
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

