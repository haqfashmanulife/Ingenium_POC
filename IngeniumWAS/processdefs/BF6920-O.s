# Converted from PathFinder 2.2 to 3.0 Jun 18, 2004 3:12:59 PM EDT

#*******************************************************************************
#*  Component:   BF6920-O.s                                                    *
#*  Description:                                                               *
#*                                                                             *
#*******************************************************************************
#*  Chg#    Release  Description                                               *
#*                                                                             *
#*  014590  6.0      New for release 6.0                                       *
#*  016736  611J     code cleanup                                              *
#*  017150  612J     Remove Currency Decimals = "2"                            *
#*  01PR21  TMC      Added Next Fund Survivorship Benefit Date                 *
#*  01PT02  TMC      Added Reprint Date and Number                             *
#*  02BL13  DPK      Last Billing Notice Date                                  *
#*  02GL57  DPK      CWA Suspense Account and Refund                           *
#*                                                                             *
#*  NWLOP3  CTS      ADD NEW FIELD INTIAL CWA PROCESS DATE FOR                 *
#*  NWLOP3           NWL POLICIES PROCESSED THRU PA,WMD AND MGA                *
#*  M161CA  CTS      ADDITION OF NEW FIELD INIT-PMT-TYP-CD                     *
#*  M245B2  CTS      Foreign Currency Formatting                               *
#*  MP245R  CTS      CHANGES FOR BILLING FILEDS FOR SPWL POLICIES              *
#*  M271O1  CTS      FRA Foreign Currency Formatting 			       *
#*  M319O1  CTS      FXWL Currency Code Changes                                *
#*  TDMG24  CTS      INQUIRY SCREEN CHANGES                                    * 
#*  UYS133  CTS      Addition of PD group size field                           *
#*  UYSD11  CTS      ADDIITION OF UNISYS MIGRATION TYPE CODE                   *
#*******************************************************************************

S-STEP BF6920-O
{
    ATTRIBUTES
    {
        BusinessFunctionType = "General";
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

    IN MIR-APPL-CTL-PRCES-DT
    {
        DisplayOnly;
        Length = "10";
        DefaultSession = "LSIR-PRCES-DT";
        SType = "Date";
        Label = "Process Date";
    }

    IN MIR-POL-ID-BASE
    {
        Key;
        DisplayOnly;
        Length = "9";
        DefaultSession = "MIR-POL-ID-BASE";
        SType = "Text";
        Label = "Policy Id";
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

    IN MIR-APP-FORM-TYP-ID
    {
        DisplayOnly;
        Length = "40";
        CodeSource = "EDIT";
        CodeType = "AFTT";
        SType = "Text";
        Label = "Application Form Type";
    }

    IN MIR-BNFY-TYP-CD
    {
        DisplayOnly;
        Length = "40";
        CodeSource = "DataModel";
        CodeType = "BNFY-TYP-CD";
        SType = "Text";
        Label = "Beneficiary Type";
    }

    IN MIR-CLI-CHRTY-IND
    {
        DisplayOnly;
        Length = "1";
        SType = "Indicator";
        Label = "Owner has been identified as a charity";
    }

    IN MIR-CLI-CNFD-IND
    {
        DisplayOnly;
        Length = "1";
        SType = "Indicator";
        Label = "Access to client information is confidential";
    }

    IN MIR-CLI-CRNT-LOC-CD
    {
        DisplayOnly;
        Length = "40";
        CodeSource = "EDIT";
        CodeType = "LOCAT";
        SType = "Text";
        Label = "Province/State";
    }

    IN MIR-CLI-LANG-CD
    {
        DisplayOnly;
        Length = "40";
        CodeSource = "EDIT";
        CodeType = "LANG";
        SType = "Text";
        Label = "Correspondence Language";
    }

    IN MIR-CONN-OPTL-POL-ID-BASE
    {
        DisplayOnly;
        Length = "9";
        SType = "Text";
        Label = "Optional Policy ID";
    }

    IN MIR-CONN-OPTL-POL-ID-SFX
    {
        DisplayOnly;
        Length = "1";
        SType = "Text";
        Label = "Optional Policy Suffix";
    }

    IN MIR-DV-AMEX-XIST-IND
    {
        DisplayOnly;
        Length = "1";
        SType = "Indicator";
        Label = "Amendments, endorsements or exclusions have been created";
    }

    IN MIR-DV-LOAN-VALU-AMT
    {
#M245B2 CHANGES START HERE    
        CurrencyCode = "MIR-POL-CRCY-CD";
#M245B2 CHANGES END HERE 
        DisplayOnly;
        Signed;
        Length = "17";
        SType = "Currency";
        Label = "Loan Value Amount";
    }

    IN MIR-DV-NET-CV-MODE-QTY
    {
        DisplayOnly;
        Length = "8";
        SType = "Text";
        Label = "Net Cash Value - Number of Modes";
    }

    IN MIR-DV-OWN-CLI-NM
    {
        DisplayOnly;
        Length = "75";
        SType = "Text";
        Label = "Owner Name";
    }

    IN MIR-DV-POL-CSV-AMT
    {
#M245B2 CHANGES START HERE    
        CurrencyCode = "MIR-POL-CRCY-CD";
#M245B2 CHANGES END HERE 
        DisplayOnly;
        Signed;
        Length = "19";
        SType = "Currency";
        Label = "Cash Surrender Value";
    }

    IN MIR-DV-POL-REPL-IND
    {
        DisplayOnly;
        Length = "1";
        SType = "Indicator";
        Label = "This is a replacement policy";
    }

    IN MIR-DV-REL-XIST-IND
    {
        DisplayOnly;
        Length = "1";
        SType = "Indicator";
        Label = "Owner Relationship Exists";
    }

    IN MIR-DV-VPO-PU-YR-QTY
    {
        DisplayOnly;
        Length = "4";
        SType = "Text";
        Label = "Vanishing Premium Year";
    }

    IN MIR-LATST-ACTV-DT
    {
        DisplayOnly;
        Length = "10";
        SType = "Date";
        Label = "Last Transaction Date";
    }

    IN MIR-LINK-POL-ISS-IND
    {
        DisplayOnly;
        Length = "1";
        SType = "Indicator";
        Label = "Linked Policy";
    }

    IN MIR-LOAN-INT-BILL-AMT
    {
#M245B2 CHANGES START HERE    
        CurrencyCode = "MIR-POL-CRCY-CD";
#M245B2 CHANGES END HERE 
        DisplayOnly;
        Signed;
        Length = "15";
        SType = "Currency";
        Label = "Loan Interest Billed - APL";
    }

    IN MIR-LOAN-INT-BILL-AMT-2
    {
#M245B2 CHANGES START HERE    
        CurrencyCode = "MIR-POL-CRCY-CD";
#M245B2 CHANGES END HERE  
        DisplayOnly;
        Signed;
        Length = "15";
        SType = "Currency";
        Label = "Loan Interest Billed - Cash";
    }

    IN MIR-NXT-PERI-STMT-DT
    {
        DisplayOnly;
        Length = "10";
        SType = "Date";
        Label = "Next Statement Date";
    }

    IN MIR-PLAN-ID
    {
        DisplayOnly;
        Length = "40";
        CodeSource = "EDIT";
        CodeType = "PLAN";
        SType = "Text";
        Label = "Plan";
    }

    IN MIR-POL-APL-IND
    {
        DisplayOnly;
        Length = "1";
        SType = "Indicator";
        Label = "Automatic premium loan is a separate option from nonforfeiture";
    }

    IN MIR-POL-APP-RECV-DT
    {
        DisplayOnly;
        Length = "10";
        SType = "Date";
        Label = "Application Received Date";
    }

    IN MIR-POL-APP-SIGN-DT
    {
        DisplayOnly;
        Length = "10";
        SType = "Date";
        Label = "Application Signed Date";
    }

    IN MIR-POL-BILL-MODE-CD
    {
        DisplayOnly;
        Length = "40";
        CodeSource = "DataModel";
#MP245R CHANGES START
#CodeType = "POL-BILL-MODE-CD";
      CodeType = "POL-DV-BILL-MODE-CD";
#MP245R CHANGES ENDS
        SType = "Text";
        Label = "Premium Mode";
    }

    IN MIR-POL-BILL-TO-DT-NUM
    {
        DisplayOnly;
        Length = "10";
        SType = "Text";
        Label = "Billed to Date";
    }

    IN MIR-POL-BILL-TYP-CD
    {
        DisplayOnly;
        Length = "40";
        CodeSource = "DataModel";
        CodeType = "POL-BILL-TYP-CD";
        SType = "Text";
        #M161CA START
        #Label = "Billing Type";
        Label = "Billing Type(Subsequent Premium)";
        #M161CA END
    }

    #M161CA START
    IN MIR-INIT-PMT-TYP-CD
    {
        DisplayOnly;
        Length = "40";
        CodeSource = "DataModel";
        CodeType = "INIT-PMT-TYP-CD";
        SType = "Text";
        Label = "Payment Route (First Premium)";
    }    
    #M161CA END
    IN MIR-POL-CLI-REL-SUB-CD
    {
        DisplayOnly;
        Length = "40";
        CodeSource = "DataModel";
        CodeType = "POL-CLI-REL-SUB-CD";
        SType = "Text";
        Label = "Relationship Type";
    }

    IN MIR-POL-CNFD-IND
    {
        DisplayOnly;
        Length = "1";
        SType = "Indicator";
        Label = "Policy has been designated as confidential";
    }

    IN MIR-POL-CRCY-CD
    {
        DisplayOnly;
        Length = "40";
        CodeSource = "XTAB";
        CodeType = "CURR";
        SType = "Text";
        Label = "Currency";
    }

    IN MIR-POL-CSTAT-CD
    {
        DisplayOnly;
        Length = "40";
        CodeSource = "DataModel";
        CodeType = "POL-CSTAT-CD";
        SType = "Text";
        Label = "Policy Status";
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

# UYSD11 CHANGES BEGINS HERE
    IN MIR-USYS-MIGR-POL-IND
    {    
        DisplayOnly;
        Length = "1";
        SType = "Indicator";
        Label = "Migrated Policy";
    }
# UYSD11 CHANGES ENDS HERE

    IN MIR-POL-CTRY-CD
    {
        DisplayOnly;
        Length = "40";
        CodeSource = "XTAB";
        CodeType = "CNTRY";
        SType = "Text";
        Label = "Country";
    }

    IN MIR-POL-CVG-REC-CTR
    {
        DisplayOnly;
        Length = "2";
        SType = "Text";
        Label = "Number of Coverages";
    }

    IN MIR-POL-DIV-OPT-CD
    {
        DisplayOnly;
        Length = "40";
        CodeSource = "DataModel";
        CodeType = "POL-DIV-OPT-CD";
        SType = "Text";
        Label = "Policy Dividend Option";
    }

    IN MIR-POL-FINAL-DISP-DT
    {
        DisplayOnly;
        Length = "10";
        SType = "Date";
        Label = "Final Disposition Date";
    }

    IN MIR-POL-FREE-LK-END-DT
    {
        DisplayOnly;
        Length = "10";
        SType = "Date";
        Label = "Free Look End Date";
    }

    IN MIR-POL-ISS-EFF-DT
    {
        DisplayOnly;
        Length = "10";
        SType = "Date";
        Label = "Policy Issue Date";
    }

    IN MIR-POL-ISS-LOC-CD
    {
        DisplayOnly;
        Length = "40";
        CodeSource = "EDIT";
        CodeType = "LOCAT";
        SType = "Text";
        Label = "Issue Location";
    }

    IN MIR-POL-LOAN-REPAY-AMT
    {
#M245B2 CHANGES START HERE    
        CurrencyCode = "MIR-POL-CRCY-CD";
#M245B2 CHANGES END HERE 
        DisplayOnly;
        Signed;
        Length = "15";
        SType = "Currency";
        Label = "Loan Repayment Amount";
    }

    IN MIR-POL-MAIL-DT
    {
        DisplayOnly;
        Length = "10";
        SType = "Date";
        Label = "Policy Mailed Date";
    }

    IN MIR-POL-MAIL-REASN-CD
    {
        DisplayOnly;
        Length = "40";
        SType = "Text";
        Label = "Reason Duplicate Policy Mailed";
    }

    IN MIR-POL-MPREM-AMT
    {
#M245B2 CHANGES START HERE    
#M271O1 CHANGES START HERE CHANGING CURRENCY CODE  
      # CurrencyCode = "MIR-POL-CRCY-CD";
        CurrencyCode = "MIR-PREM-CRCY-CD";
#M271O1 CHANGES END HERE 
#M245B2 CHANGES END HERE 
        DisplayOnly;
        Signed;
        Length = "17";
        SType = "Currency";
        Label = "Mode Premium Amount";
    }

    IN MIR-POL-NFO-CD
    {
        DisplayOnly;
        Length = "40";
        CodeSource = "DataModel";
        CodeType = "POL-NFO-CD";
        SType = "Text";
        Label = "Non-forfeiture Option";
    }

    IN MIR-POL-NOTI-DEPT-ID-T[2]
    {
        DisplayOnly;
        Length = "40";
        FieldGroup = "Table2";
        CodeSource = "EDIT";
        CodeType = "DEPT";
        SType = "Text";
        Label = "Notify Information - Department";
        Index = "1";
    }

    IN MIR-POL-NOTI-DT-T[2]
    {
        DisplayOnly;
        Length = "10";
        FieldGroup = "Table2";
        KeyColumn;
        SType = "Date";
        Label = "Date Notices Produced";
        Index = "1";
    }

    IN MIR-POL-NOTI-MO-DUR-T[2]
    {
        DisplayOnly;
        Length = "2";
        FieldGroup = "Table2";
        SType = "Text";
        Label = "Frequency of Notices - Months";
        Index = "1";
    }

    IN MIR-POL-NOTI-QTY-T[2]
    {
        DisplayOnly;
        Length = "2";
        FieldGroup = "Table2";
        SType = "Text";
        Label = "Number of Notifications Produced";
        Index = "1";
    }

    IN MIR-POL-NOTI-REASN-CD-T[2]
    {
        DisplayOnly;
        Length = "40";
        FieldGroup = "Table2";
        CodeSource = "EDIT";
        CodeType = "NOTRE";
        SType = "Text";
        Label = "Notification Reason";
        Index = "1";
    }

    IN MIR-NXT-FND-SRVBEN-DT
    {
        DisplayOnly;
        Length = "10";
        SType = "Date";
        Label = "Next Fund Survivorship Benefit Date";
    }

    IN MIR-POL-OPTL-CD
    {
        DisplayOnly;
        Length = "40";
        CodeSource = "DataModel";
        CodeType = "POL-OPTL-CD";
        SType = "Text";
        Label = "Optional Policy";
    }

    IN MIR-POL-PD-TO-DT-NUM
    {
        DisplayOnly;
        Length = "10";
        SType = "Text";
        Label = "Paid to Date";
    }

    IN MIR-POL-PREM-DSCNT-PCT
    {
        DisplayOnly;
        Signed;
        Length = "7";
        Decimals = "3";
        SType = "Percent";
        Label = "Policy Discount Percentage";
    }

    IN MIR-POL-PREV-CSTAT-CD
    {
        DisplayOnly;
        Length = "4";
        CodeSource = "DataModel";
        CodeType = "POL-CSTAT-CD";
        SType = "Text";
        Label = "Previous Policy Status";
    }

    IN MIR-POL-PRT-DT
    {
        DisplayOnly;
        Length = "10";
        SType = "Date";
        Label = "Policy Contract Printed Date";
    }

    IN MIR-POL-PRT-QTY
    {
        DisplayOnly;
        Length = "2";
        SType = "Text";
        Label = "Number of Times Certificate Printed";
    }

    IN MIR-POL-REINS-CD
    {
        DisplayOnly;
        Length = "40";
        CodeSource = "DataModel";
        CodeType = "POL-REINS-CD";
        SType = "Text";
        Label = "Reinsurance";
    }

    IN MIR-POL-REJ-REASN-CD
    {
        DisplayOnly;
        Length = "40";
        CodeSource = "DataModel";
        CodeType = "POL-REJ-REASN-CD";
        SType = "Text";
        Label = "Rejection Reason";
    }

    IN MIR-POL-REPRT-DT
    {
        DisplayOnly;
        Length = "10";
        SType = "Date";
        Label = "Certificate Reprint Date";
    }

    IN MIR-POL-RUSH-IND
    {
        DisplayOnly;
        Length = "40";
        SType = "Indicator";
        Label = "High-priority Processing";
    }

    IN MIR-POL-SNDRY-AMT
    {
#M245B2 CHANGES START HERE    
#M271O1 CHANGES START HERE CHANGING CURRENCY CODE  
      # CurrencyCode = "MIR-POL-CRCY-CD";
        CurrencyCode = "MIR-PREM-CRCY-CD";
#M271O1 CHANGES END HERE 
#M245B2 CHANGES END HERE 
        DisplayOnly;
        Signed;
        Length = "15";
        SType = "Currency";
        Label = "Sundry Amount";
    }

    IN MIR-POL-STAT-CHNG-DT
    {
        DisplayOnly;
        Length = "10";
        SType = "Date";
        Label = "Policy Status Last Changed";
    }

    IN MIR-POL-SUPRES-ISS-IND
    {
        DisplayOnly;
        Length = "1";
        SType = "Indicator";
        Label = "Suppress automatic issue / settlement process";
    }

    IN MIR-POL-TOT-BILL-AMT
    {
#M245B2 CHANGES START HERE    
#M271O1 CHANGES START HERE CHANGING CURRENCY CODE  
      # CurrencyCode = "MIR-POL-CRCY-CD";
#M319O1 CHANGES START HERE      
      # CurrencyCode = "MIR-PREM-CRCY-CD";
        CurrencyCode = "MIR-PMT-CRCY-CD";
#M319O1 CHANGES ENDS HERE        
#M271O1 CHANGES END HERE 
#M245B2 CHANGES END HERE 
        DisplayOnly;
        Signed;
        Length = "17";
        SType = "Currency";
        Label = "Amount Billed";
    }

    IN MIR-PREM-RECALC-OPT-CD
    {
        DisplayOnly;
        Length = "40";
        CodeSource = "DataModel";
        CodeType = "PREM-RECALC-OPT-CD";
        SType = "Text";
        Label = "Premium Recalculation Option";
    }

    IN MIR-PREV-FILE-MAINT-DT
    {
        DisplayOnly;
        Length = "10";
        SType = "Date";
        Label = "Last Maintain Date";
    }

    IN MIR-PREV-PERI-STMT-DT
    {
        DisplayOnly;
        Length = "10";
        SType = "Date";
        Label = "Previous Statement Date";
    }

    IN MIR-SBSDRY-CO-ID
    {
        DisplayOnly;
        Length = "40";
        CodeSource = "EDIT";
        CodeType = "SUBCO";
        SType = "Text";
        Label = "Sub Company";
    }

    IN MIR-UNMTCH-MAIL-IND
    {
        DisplayOnly;
        Length = "1";
        SType = "Indicator";
        Label = "Information is still outstanding";
    }
     
    IN MIR-PREV-BILL-NOTI-DT
    {
        DisplayOnly;
        Length = "10";
        SType = "Date";
        Label = "Last Billing Notice Date";
    }
    
    IN MIR-CWA-PRCES-DT
    {
        DisplayOnly;
        Length = "10";
        SType = "Date";
        Label = "Initial CWA Process Date";
    }
    
    IN MIR-POL-CSH-RFND-CD
    {
        DisplayOnly;
        Length = "40";
        CodeSource = "DataModel";
        CodeType = "POL-CSH-RFND-CD";
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

