# Converted from PathFinder 2.2 to 3.0 Jun 18, 2004 3:12:16 PM EDT

#*******************************************************************************
#*  Component:   BF0150-O.s                                                    *
#*  Description:                                                               *
#*                                                                             *
#*******************************************************************************
#*  Chg#    Release  Description                                               *
#*                                                                             *
#*  014590  6.0      New for release 6.0                                       *
#*  016109  602J     Free Fund Transfer Provision                              *
#*  017150  612J     Remove Currency Decimals = "2"                            *
#*  01PR21  EKM      Survivorship Benefit Date                                 *
#*  02BL13  DPK      Last Billing Notice Date                                  *
#*  02BL63  KRW      Add date of Policy's first PAC draw                       *
#*  02GL03  MAW      ADD POL-BT-SUSP-AMT, POL-PD-SUSP-AMT, POL-CC-SUSP-AMT     *
#*  02PR17  WBP      ADD CASH BACK BONUS FIELDS                                *
#*  02GL57  DPK      CWA Suspense Account and Refund                           *
#*  PR006E  CSS      ADD CASH BACK BONUS FIELDS (MIR-CBB-MRB-LST-PD-AMT  and   *
#*  PR006E           MIR-CBB-MRB-LTD-PD-AMT)                                   *
#*  PR0001  ROC      20% MVA Free Withdrawal                                   *
#*  M00011  ROC      OUTSTANDING DISBURSEMENTS, ADD FIELDS:                    *
#*  M00011              OS-DISB-SURR-AMT, OS-DISB-MAT-AMT, OS-DISB-DTH-AMT     *
#*  M00011              OS-DISB-CLM-AMT, OS-DISB-AD-AMT                        *
#*  M00011              OS-DISB-SURR-DT, OS-DISB-MAT-DT, OS-DISB-DTH-DT        *
#*  M00011              OS-DISB-CLM-DT, OS-DISB-AD-DT                          *
#*  P03322  CLB      TEMPORARY CHANGE FOR CANCELLING DXFR RECORDS UNTIL CHANGE *
#*  P03322           REQUEST MFF097 IS IMPLEMENTED.                            *
#*  NWLBCA  CTS      ADDED FOLLOWING FIELDS FOR TRAD POLICIES PROCESSING:      *
#*                      MIR-OVR-SHRT-PREM-AMT                                  *
#*                      MIR-OVR-SHRT-PREM-DT                                   *
#*  NWLLRP  CTS      ADDED FOLLOWING FIELDS FOR LOAN REPAYMENT:                *
#*                      MIR-LOAN-XCES-SHRT-AMT                                 *
#*                      MIR-LOAN-XCES-SHRT-DT                                  *
#*  NWLLTC  CTS      CHANGES DONE TO ADD NEW FIELDS FOR LOAN PROCESSING        *
#*  Q10123  CTS      M161CA - CHANGES DONE FOR CREDIT CARD                     *
#*  C15454  CTS      ADDED DISASTER LAPSE DATE                                 *
#*  M245B2  CTS      Foreign Currency Formatting 			       *
#*  MP245R  CTS      CHANGES FOR DISBURSEMENT CURRENCY CODE                    *
#*  Q50535  CTS      FIX AS PART OF M245B2                                     *
# Converted from PathFinder 2.2 to 3.0 Jun 18, 2004 3:12:16 PM EDT
#*  R10428  CTS      RLSE0010428 - SCREEN CHANGE - PROTECTED POLICY UPDATE     *
#*                   SCREEN                                                    *
#*  M271O1  CTS      CHANGES DONE AS PART OF FRA                               * 
#*  M271A7  CTS      Online Screen Changes done as part of FRA                 *
#*  M319O1  CTS      FXWL Currency Code Changes                                *
#*  Q88344  CTS      FXWL Currency Code Changes                                * 
#*  Q91591  CTS      FXWL currency code changes for loan                       *
#*  R14127  CTS      CHANGES FOR DISASTER RECOVERY                             *
#*  TDM13B  CTS      CHANGES AS PART OF NWL/NWL2 POLICY                        *
#*  TDM13B           PAYMENT COMPLETION PROCESSING                             *
#*  118579  CTS      CHANGES DONE TO CORRECT THE FIELD PREMIUM PAYMENT         *
#*  118579           DESCRIPTION                                               *
#*  FFF10R  CTS      CHANGES DONE FOR CC SUSPENSE HANDLING                     *
#*  UYS025  CTS      ADVANCE PAYMENT RESERVE AMOUNT FIELD ADDED                *
#*  UYS133  CTS      Addition of PD group size field                           *
#*  S21749  CTS      BUG FIX FOR UDSD-1749                                     *
#*******************************************************************************

S-STEP BF0150-O
{
    ATTRIBUTES
    {
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

    IN MIR-AFR-THRSHD-PERI-CD
    {
        DisplayOnly;
        Length = "1";
        CodeSource = "DataModel";
        CodeType = "AFR-THRSHD-PERI-CD";
        SType = "Text";
        Label = "Threshold Period";
    }

    IN MIR-CASL-PMT-PYR-AMT
    {
#M245B2 CHANGES START HERE    
        CurrencyCode = "MIR-POL-CRCY-CD";
#M245B2 CHANGES END HERE 
        DisplayOnly;
        Signed;
        Length = "15";
        SType = "Currency";
        Label = "Previous Year's Casual Payment";
    }

    IN MIR-CASL-PMT-YTD-AMT
    {
#M245B2 CHANGES START HERE    
        CurrencyCode = "MIR-POL-CRCY-CD";
#M245B2 CHANGES END HERE 
        DisplayOnly;
        Signed;
        Length = "15";
        SType = "Currency";
        Label = "Casual Payments Year to Date";
    }

    IN MIR-DIV-DCLR-LTD-AMT
    {
#M245B2 CHANGES START HERE    
        CurrencyCode = "MIR-POL-CRCY-CD";
#M245B2 CHANGES END HERE 
        DisplayOnly;
        Signed;
        Length = "15";
        SType = "Currency";
        Label = "Total Dividends Declared";
    }

    IN MIR-DIV-DCLR-YTD-AMT
    {
#M245B2 CHANGES START HERE    
        CurrencyCode = "MIR-POL-CRCY-CD";
#M245B2 CHANGES END HERE 
        DisplayOnly;
        Signed;
        Length = "13";
        SType = "Currency";
        Label = "Dividends Declared Year to Date";
    }

    IN MIR-DOD-CRNT-INT-AMT
    {
#M245B2 CHANGES START HERE    
        CurrencyCode = "MIR-POL-CRCY-CD";
#M245B2 CHANGES END HERE 
        DisplayOnly;
        Signed;
        Length = "11";
        SType = "Currency";
        Label = "Dividends on Deposit Interest";
    }

    IN MIR-DV-OWN-CLI-NM
    {
        DisplayOnly;
        Length = "75";
        SType = "Text";
        Label = "Owner Name";
    }

    IN MIR-FREE-WTHDR-CD
    {
        DisplayOnly;
        Length = "1";
        CodeSource = "DataModel";
        CodeType = "FREE-WTHDR-CD";
        SType = "Text";
        Label = "Free Withdrawal";
    }

#TDM13B CHANGES START HERE
    IN MIR-PREM-PMT-CMPLT-IND
    {
        DisplayOnly;
        Length = "1";
        SType = "Indicator";
# 118579 changes begin      
#       Label = "Premium Payment Completion";
	Label = "Base Policy Premium Payment Completion";
# 118579 changes end 
    }    
#TDM13B CHANGES END HERE         
    
    IN MIR-FREE-WTHDR-PERI-CD
    {
        DisplayOnly;
        Length = "1";
        CodeSource = "DataModel";
        CodeType = "FREE-WTHDR-PERI-CD";
        SType = "Text";
        Label = "Free Withdrawals - Period";
    }

    IN MIR-FREE-WTHDR-QTY
    {
        DisplayOnly;
        Length = "3";
        SType = "Text";
        Label = "Free Withdrawals - Number Remaining";
    }

    IN MIR-FREE-WTHDR-TOT-AMT
    {
#M245B2 CHANGES START HERE    
        CurrencyCode = "MIR-POL-CRCY-CD";
#M245B2 CHANGES END HERE 
        DisplayOnly;
        Signed;
        Length = "15";
        SType = "Currency";
        Label = "Free Withdrawal - Amount Taken";
    }

    IN MIR-FREE-WTHDR-DUR
    {
        DisplayOnly;
        Length = "3";
        SType = "Text";
        Label = "Free Withdrawal Duration";
    }

    IN MIR-FREE-WTHDR-DT
    {
        DisplayOnly;
        Length = "10";
        SType = "Date";
        Label = "Free Withdrawal Date";
    }

    IN MIR-FREE-XFER-CD
    {
        DisplayOnly;
        Length = "1";
        CodeSource = "DataModel";
        CodeType = "PLAN-FREE-XFER-CD";
        SType = "Text";
        Label = "Free Transfer";
    }

    IN MIR-FREE-XFER-PERI-CD
    {
        DisplayOnly;
        Length = "1";
        CodeSource = "DataModel";
        CodeType = "FREE-XFER-PERI-CD";
        SType = "Text";
        Label = "Free Transfers - Period";
    }

    IN MIR-FREE-XFER-QTY
    {
        DisplayOnly;
        Length = "2";
        SType = "Text";
        Label = "Free Transfers - Number Remaining";
    }

    IN MIR-FREE-XFER-TOT-AMT
    {
#M245B2 CHANGES START HERE    
        CurrencyCode = "MIR-POL-CRCY-CD";
#M245B2 CHANGES END HERE 
        DisplayOnly;
        Signed;
        Length = "15";
        SType = "Currency";
        Label = "Free Transfer - Amount Taken";
    }

    IN MIR-LIF-MXPMT-PYR-AMT
    {
#M245B2 CHANGES START HERE    
        CurrencyCode = "MIR-POL-CRCY-CD";
#M245B2 CHANGES END HERE 
        DisplayOnly;
        Signed;
        Length = "13";
        SType = "Currency";
        Label = "Previous Year - Maximum Payment Allowed";
    }

    IN MIR-LOAN-AMT-T[3]
    {
#M245B2 CHANGES START HERE    
        CurrencyCode = "MIR-POL-CRCY-CD";
#M245B2 CHANGES END HERE 
        DisplayOnly;
        Signed;
        Length = "15";
        FieldGroup = "Table3";
        SType = "Currency";
        Label = "Total Policy Loan";
        Index = "1";
    }

    IN MIR-LOAN-ANNV-AMT-T[3]
    {
#M245B2 CHANGES START HERE    
        CurrencyCode = "MIR-POL-CRCY-CD";
#M245B2 CHANGES END HERE 
        DisplayOnly;
        Signed;
        Length = "15";
        FieldGroup = "Table3";
        SType = "Currency";
        Label = "Anniversary Loan Balance";
        Index = "1";
    }

    IN MIR-LOAN-AVB-AMT-T[3]
    {
#M245B2 CHANGES START HERE    
        CurrencyCode = "MIR-POL-CRCY-CD";
#M245B2 CHANGES END HERE 
        DisplayOnly;
        Signed;
        Length = "15";
        FieldGroup = "Table3";
        SType = "Currency";
        Label = "Average Loan Balance";
        Index = "1";
    }

    IN MIR-LOAN-DT-T[3]
    {
        DisplayOnly;
        Length = "10";
        FieldGroup = "Table3";
        KeyColumn;
        SType = "Date";
        Label = "Effective Date";
        Index = "1";
    }

    IN MIR-LOAN-INT-BILL-AMT-T[3]
    {
#M245B2 CHANGES START HERE    
        CurrencyCode = "MIR-POL-CRCY-CD";
#M245B2 CHANGES END HERE 
        DisplayOnly;
        Signed;
        Length = "13";
        FieldGroup = "Table3";
        SType = "Currency";
        Label = "Loan Interest Billed";
        Index = "1";
    }

    IN MIR-LOAN-INT-MAX-RT-T[3]
    {
        DisplayOnly;
        Length = "5";
        Decimals = "5";
        FieldGroup = "Table3";
        SType = "Percent";
        Label = "Maximum Loan Interest Rate";
        Index = "1";
    }

    IN MIR-LOAN-INT-RT-T[3]
    {
        DisplayOnly;
        Length = "5";
        Decimals = "5";
        FieldGroup = "Table3";
        SType = "Percent";
        Label = "Loan Interest Rate";
        Index = "1";
    }

    IN MIR-LOAN-INT-TYP-CD-T[3]
    {
        DisplayOnly;
        Length = "1";
        FieldGroup = "Table3";
        CodeSource = "DataModel";
        CodeType = "LOAN-INT-TYP-CD";
        SType = "Text";
        Label = "Loan Interest Rate Type";
        Index = "1";
    }

    IN MIR-LOAN-INT-YTD-AMT-T[3]
    {
#M245B2 CHANGES START HERE    
        CurrencyCode = "MIR-POL-CRCY-CD";
#M245B2 CHANGES END HERE 
        DisplayOnly;
        Signed;
        Length = "13";
        FieldGroup = "Table3";
        SType = "Currency";
        Label = "Loan Interest Paid / Capitalized Year to Date";
        Index = "1";
    }

    IN MIR-LOAN-PREV-ANNV-AMT-T[3]
    {
#M245B2 CHANGES START HERE    
        CurrencyCode = "MIR-POL-CRCY-CD";
#M245B2 CHANGES END HERE 
        DisplayOnly;
        Signed;
        Length = "15";
        FieldGroup = "Table3";
        SType = "Currency";
        Label = "Previous Anniversary Loan Balance";
        Index = "1";
    }

    IN MIR-POL-ACCT-PAR-CD
    {
        DisplayOnly;
        Length = "1";
        CodeSource = "DataModel";
        CodeType = "POL-ACCT-PAR-CD";
        SType = "Text";
        Label = "Dividend Option";
    }

    IN MIR-POL-AFR-ALLOC-CD
    {
        DisplayOnly;
        Length = "1";
        CodeSource = "DataModel";
        CodeType = "POL-AFR-ALLOC-CD";
        SType = "Text";
        Label = "Automatic Face Amount Reduction Allocation";
    }

    IN MIR-POL-AFR-THRSHD-AMT
    {
#M245B2 CHANGES START HERE    
#M271O1 CHANGES START HERE CHANGING CURRENCY CODE  
      # CurrencyCode = "MIR-POL-CRCY-CD";
        CurrencyCode = "MIR-PREM-CRCY-CD";
#M271O1 CHANGES END HERE 
#M245B2 CHANGES END HERE 
        DisplayOnly;
        Signed;
        Length = "13";
        SType = "Currency";
        Label = "Threshold Amount";
    }

    IN MIR-POL-ANPAYO-LTD-AMT
    {
#M245B2 CHANGES START HERE    
#M271O1 CHANGES START HERE CHANGING CURRENCY CODE  
      # CurrencyCode = "MIR-POL-CRCY-CD";
        CurrencyCode = "MIR-PREM-CRCY-CD";
#M271O1 CHANGES END HERE 
#M245B2 CHANGES END HERE 
        DisplayOnly;
        Signed;
        Length = "11";
        SType = "Currency";
        Label = "Accumulated Payments Life to Date";
    }

    IN MIR-POL-ANPAYO-PMT-DT
    {
        DisplayOnly;
        Length = "10";
        SType = "Date";
        Label = "Last Payment Date";
    }

    IN MIR-POL-ANPAYO-PYR-AMT
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
        Label = "Previous Year's Total Payments";
    }

    IN MIR-POL-ANPAYO-YTD-AMT
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
        Label = "Accumulated Payments Year to Date";
    }

    IN MIR-POL-ANTY-SUSP-AMT
    {
#M245B2 CHANGES START HERE    
        CurrencyCode = "MIR-POL-CRCY-CD";
#M245B2 CHANGES END HERE 
        DisplayOnly;
        Signed;
        Length = "13";
        SType = "Currency";
        Label = "Annuity Suspense";
    }

    IN MIR-POL-BASE-CVG-NUM
    {
        DisplayOnly;
        Length = "2";
        SType = "Text";
        Label = "Base Coverage Number";
    }

    IN MIR-POL-BT-STRT-DT
    {
        DisplayOnly;
        Length = "10";
        SType = "Date";
        Label = "BT Policy First Draw Date";
    }    

    IN MIR-POL-CRNT-PSUR-AMT
    {
#M245B2 CHANGES START HERE    
        CurrencyCode = "MIR-POL-CRCY-CD";
#M245B2 CHANGES END HERE 
        DisplayOnly;
        Signed;
        Length = "15";
        SType = "Currency";
        Label = "Total Surrenders for All Coverages - Current Period";
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

    IN MIR-POL-DIV-SUSP-AMT
    {
#M245B2 CHANGES START HERE    
        CurrencyCode = "MIR-POL-CRCY-CD";
#M245B2 CHANGES END HERE 
        DisplayOnly;
        Signed;
        Length = "13";
        SType = "Currency";
        Label = "Dividend Suspense";
    }

    IN MIR-POL-DOD-ACUM-AMT
    {
#M245B2 CHANGES START HERE    
        CurrencyCode = "MIR-POL-CRCY-CD";
#M245B2 CHANGES END HERE 
        DisplayOnly;
        Signed;
        Length = "15";
        SType = "Currency";
        Label = "Dividends on Deposit";
    }

    IN MIR-POL-DOD-AVB-AMT
    {
#M245B2 CHANGES START HERE    
        CurrencyCode = "MIR-POL-CRCY-CD";
#M245B2 CHANGES END HERE 
        DisplayOnly;
        Signed;
        Length = "15";
        SType = "Currency";
        Label = "Dividend Average Balance";
    }

    IN MIR-POL-DOD-INT-RT
    {
        DisplayOnly;
        Signed;
        Length = "5";
        Decimals = "5";
        SType = "Percent";
        Label = "Current Dividend Interest Rate";
    }

    IN MIR-POL-GL-ACCT-TYP-CD
    {
        DisplayOnly;
        Length = "1";
        SType = "Text";
        Label = "Policy Account Type";
    }

    IN MIR-POL-LIF-MXPMT-AMT
    {
#M245B2 CHANGES START HERE    
        CurrencyCode = "MIR-POL-CRCY-CD";
#M245B2 CHANGES END HERE 
        DisplayOnly;
        Signed;
        Length = "13";
        SType = "Currency";
        Label = "Maximum Payment (LIF Policy)";
    }

    IN MIR-POL-LOCK-FND-IND
    {
        DisplayOnly;
        Length = "1";
        SType = "Indicator";
        Label = "Policy has locked-in funds";
    }

    IN MIR-POL-MISC-SUSP-AMT
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
        Label = "Miscellaneous Suspense";
    }

    IN MIR-POL-MISC-SUSP-DT
    {
        DisplayOnly;
        Length = "10";
        SType = "Date";
        Label = "Miscellaneous Suspense Account Last Updated";
    }

    IN MIR-POL-OS-DISB-AMT
    {
#MP245R CHANGES START HERE    
        CurrencyCode = "MIR-OS-DISB-CRCY-CD";
#MP245R CHANGES END HERE 
        DisplayOnly;
        Signed;
        Length = "17";
        SType = "Currency";
        Label = "Outstanding Disbursements";
    }

    IN MIR-POL-OS-DISB-DT
    {
        DisplayOnly;
        Length = "10";
        SType = "Date";
        Label = "Outstanding Disbursements Account Last Updated";
    }

    IN MIR-OS-DISB-SURR-AMT
    {
#MP245R CHANGES START HERE    
        CurrencyCode = "MIR-OS-DISB-CRCY-CD";
#MP245R CHANGES END HERE 
        DisplayOnly;
        Signed;
        Length = "17";
        SType = "Currency";
        Label = "Outstanding Disbursements - Surrender";
    }

    IN MIR-OS-DISB-SURR-DT
    {
        DisplayOnly;
        Length = "10";
        SType = "Date";
        Label = "Outstanding Disbursements Surrender Date";
    }

    IN MIR-OS-DISB-MAT-AMT
    {
#MP245R CHANGES START HERE    
        CurrencyCode = "MIR-OS-DISB-CRCY-CD";
#MP245R CHANGES END HERE 
        DisplayOnly;
        Signed;
        Length = "17";
        SType = "Currency";
        Label = "Outstanding Disbursements - Maturity";
    }

    IN MIR-OS-DISB-MAT-DT
    {
        DisplayOnly;
        Length = "10";
        SType = "Date";
        Label = "Outstanding Disbursements Maturity Date";
    }

    IN MIR-OS-DISB-DTH-AMT
    {
#MP245R CHANGES START HERE    
        CurrencyCode = "MIR-OS-DISB-CRCY-CD";
#MP245R CHANGES END HERE 
        DisplayOnly;
        Signed;
        Length = "17";
        SType = "Currency";
        Label = "Outstanding Disbursements - Death";
    }

    IN MIR-OS-DISB-DTH-DT
    {
        DisplayOnly;
        Length = "10";
        SType = "Date";
        Label = "Outstanding Disbursements Death Date";
    }

    IN MIR-OS-DISB-CLM-AMT
    {
#MP245R CHANGES START HERE    
        CurrencyCode = "MIR-OS-DISB-CRCY-CD";
#MP245R CHANGES END HERE 
        DisplayOnly;
        Signed;
        Length = "17";
        SType = "Currency";
        Label = "Outstanding Disbursements - Claims";
    }

    IN MIR-OS-DISB-CLM-DT
    {
        DisplayOnly;
        Length = "10";
        SType = "Date";
        Label = "Outstanding Disbursements Claims Date";
    }

    IN MIR-OS-DISB-AD-AMT
    {
#MP245R CHANGES START HERE    
        CurrencyCode = "MIR-OS-DISB-CRCY-CD";
#MP245R CHANGES END HERE 
        DisplayOnly;
        Signed;
        Length = "17";
        SType = "Currency";
        Label = "Outstanding Disbursements - Accidental Death";
    }
     
    IN MIR-OS-DISB-AD-DT
    {
        DisplayOnly;
        Length = "10";
        SType = "Date";
        Label = "Outstanding Disbursements Accidental Death Date";
    }
#NWLLTC CHANGES STARTS HERE
    IN MIR-OS-DISB-LOAN-AMT
    {
#MP245R CHANGES START HERE    
        CurrencyCode = "MIR-OS-DISB-CRCY-CD";
#MP245R CHANGES END HERE 
        DisplayOnly;
        Signed;
        Length = "15";
        SType = "Currency";
        Label = "Outstanding Disbursements - Loan";
    }
     
#M271A7 CHANGES START HERE    

   IN MIR-OS-DISB-RFND-AMT
    {
        DisplayOnly;
	Signed;
	Length = "15";
	SType = "Currency";
        Label = "OS Disb - JPY Premium";
    }     
    IN MIR-OS-DISB-RFND-DT
    {
    	Length = "10";
    	DBTableName = "TPOL";
    	SType = "Date";
        Label = "OS Disb - JPY Premium Last Updated";
    }

#M271A7 CHANGES END HERE    
    IN MIR-OS-DISB-LOAN-DT
    {
        DisplayOnly;
        Length = "10";
        SType = "Date";
        Label = "Outstanding Disbursements Loan Date";
    }
#NWLLTC CHANGES ENDS HERE
    IN MIR-POL-BT-SUSP-AMT
    {
#M245B2 CHANGES START HERE 
#M271O1 CHANGES START HERE CHANGING CURRENCY CODE  
      # CurrencyCode = "MIR-POL-CRCY-CD";
#M319O1 CHANGES START HERE
      # CurrencyCode = "MIR-PREM-CRCY-CD";
        CurrencyCode = "MIR-PMT-CRCY-CD";
#M319O1 CHANGES END HERE
#M271O1 CHANGES END HERE 
#M245B2 CHANGES END HERE 
        DisplayOnly;
        Signed;
        Length = "13";
        SType = "Currency";
        Label = "Bank Transfer Suspense";
    }

    IN MIR-POL-BT-SUSP-DT
    {
        DisplayOnly;
        Length = "10";
        SType = "Date";
        Label = "Bank Transfer Suspense Account Last Updated";
    }

    IN MIR-POL-PD-SUSP-AMT
    {
#M245B2 CHANGES START HERE  
#M271O1 CHANGES START HERE CHANGING CURRENCY CODE  
      # CurrencyCode = "MIR-POL-CRCY-CD";
#M319O1 CHANGES START HERE      
      # CurrencyCode = "MIR-PREM-CRCY-CD";
        CurrencyCode = "MIR-PMT-CRCY-CD";
#M319O1 CHANGES END HERE        
#M271O1 CHANGES END HERE 
#M245B2 CHANGES END HERE 
        DisplayOnly;
        Signed;
        Length = "13";
        SType = "Currency";
        Label = "Payroll Deduction Suspense";
    }

    IN MIR-POL-PD-SUSP-DT
    {
        DisplayOnly;
        Length = "10";
        SType = "Date";
        Label = "Payroll Deduction Suspense Account Last Updated";
    }

    IN MIR-POL-CC-SUSP-AMT
    {
#M245B2 CHANGES START HERE   
#M271O1 CHANGES START HERE CHANGING CURRENCY CODE  
      # CurrencyCode = "MIR-POL-CRCY-CD";
#M319O1 CHANGES START HERE
      # CurrencyCode = "MIR-PREM-CRCY-CD";
#FFF10R CHANGES START HERE
      # CurrencyCode = "MIR-PMT-CRCY-CD";
        CurrencyCode = "MIR-CC-SUSP-CRCY-CD";
#FFF10R CHANGES END HERE
#M319O1 CHANGES END HERE
#M271O1 CHANGES END HERE 
#M245B2 CHANGES END HERE 
        DisplayOnly;
        Signed;
        Length = "13";
        SType = "Currency";
        Label = "Cash Collection Suspense";
    }

    IN MIR-POL-CC-SUSP-DT
    {
        DisplayOnly;
        Length = "10";
        SType = "Date";
        Label = "Cash Collection Suspense Account Last Updated";
    }

    IN MIR-POL-OYT-AMT
    {
#M245B2 CHANGES START HERE    
        CurrencyCode = "MIR-POL-CRCY-CD";
#M245B2 CHANGES END HERE 
        DisplayOnly;
        Length = "13";
#M245B2 CHANGES START HERE        
#        Decimals = "0";
#M245B2 CHANGES END HERE
        SType = "Currency";
        Label = "One Year Term Purchased with Dividend";
    }

    IN MIR-POL-PAC-DRW-DT
    {
        DisplayOnly;
        Length = "10";
        SType = "Date";
        Label = "Deposit Date";
    }

    IN MIR-POL-PAR-CVG-NUM
    {
        DisplayOnly;
        Length = "2";
        SType = "Text";
        Label = "First Par Coverage Number";
    }

    IN MIR-POL-PDF-AMT
    {
#M245B2 CHANGES START HERE 
#M271O1 CHANGES START HERE CHANGING CURRENCY CODE  
      # CurrencyCode = "MIR-POL-CRCY-CD";
        CurrencyCode = "MIR-PREM-CRCY-CD";
#M271O1 CHANGES END HERE 
#M245B2 CHANGES END HERE 
        DisplayOnly;
        Signed;
        Length = "13";
        SType = "Currency";
        Label = "Premium Deposit Funds";
    }

    IN MIR-POL-PDF-AVB-AMT
    {
#M245B2 CHANGES START HERE   
#M271O1 CHANGES START HERE CHANGING CURRENCY CODE  
      # CurrencyCode = "MIR-POL-CRCY-CD";
        CurrencyCode = "MIR-PREM-CRCY-CD";
#M271O1 CHANGES END HERE 
#M245B2 CHANGES END HERE 
        DisplayOnly;
        Signed;
        Length = "13";
        SType = "Currency";
        Label = "Premium Deposit Funds Average Balance";
    }

    IN MIR-POL-PDF-INT-AMT
    {
#M245B2 CHANGES START HERE    
#M271O1 CHANGES START HERE CHANGING CURRENCY CODE  
      # CurrencyCode = "MIR-POL-CRCY-CD";
        CurrencyCode = "MIR-PREM-CRCY-CD";
#M271O1 CHANGES END HERE 
#M245B2 CHANGES END HERE 
        DisplayOnly;
        Signed;
        Length = "11";
        SType = "Currency";
        Label = "Interest Accrued on Premium Deposit Funds";
    }

    IN MIR-POL-PDF-INT-RT
    {
        DisplayOnly;
        Signed;
        Length = "5";
        Decimals = "5";
        SType = "Percent";
        Label = "Premium Deposit Funds Interest Rate";
    }

    IN MIR-POL-PD-TO-DT-NUM
    {
        DisplayOnly;
        Length = "10";
        SType = "Text";
        Label = "Paid to Date";
    }

    IN MIR-POL-PREM-SUSP-AMT
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
        Label = "Premium Suspense";
    }

    IN MIR-POL-PREM-SUSP-DT
    {
        DisplayOnly;
        Length = "10";
        SType = "Date";
        Label = "Premium Suspense Account Last Updated";
    }

    IN MIR-POL-PREV-ANNV-DUR
    {
        DisplayOnly;
        Length = "3";
        SType = "Text";
        Label = "Last Anniversary Duration";
    }

    IN MIR-POL-PREV-DIV-DUR
    {
        DisplayOnly;
        Length = "3";
        SType = "Text";
        Label = "Dividend Duration";
    }

    IN MIR-POL-PREV-FACE-AMT
    {
#M245B2 CHANGES START HERE    
        CurrencyCode = "MIR-POL-CRCY-CD";
#M245B2 CHANGES END HERE 
        DisplayOnly;
        Signed;
        Length = "15";
        SType = "Currency";
        Label = "Original Face Amount";
    }

    IN MIR-POL-PREV-MODE-CD
    {
        DisplayOnly;
        Length = "2";
        CodeSource = "DataModel";
        CodeType = "POL-PREV-MODE-CD";
        SType = "Text";
        Label = "Last Premium Mode";
    }

    IN MIR-POL-PREV-MODE-FCT
    {
        DisplayOnly;
        Signed;
        Length = "9";
        Decimals = "7";
        SType = "Number";
        Label = "Last Mode Factor";
    }

    IN MIR-POL-PREV-PFEE-FCT
    {
        DisplayOnly;
        Signed;
        Length = "9";
        Decimals = "7";
        SType = "Number";
        Label = "Last Policy Fee Factor";
    }

    IN MIR-POL-PREV-PSUR-AMT
    {
#M245B2 CHANGES START HERE    
        CurrencyCode = "MIR-POL-CRCY-CD";
#M245B2 CHANGES END HERE 
        DisplayOnly;
        Signed;
        Length = "15";
        SType = "Currency";
        Label = "Total Surrenders for All Coverages - Previous Period";
    }

    IN MIR-POL-PREV-RESET-YR
    {
        DisplayOnly;
        Length = "4";
        SType = "Year";
        Label = "Year";
    }

    IN MIR-POL-REG-TOT-AMT
    {
#M245B2 CHANGES START HERE    
#M271A7 CHANGES START HERE CHANGING CURRENCY CODE  
      # CurrencyCode = "MIR-POL-CRCY-CD";
        CurrencyCode = "MIR-PREM-CRCY-CD";
#M271A7 CHANGES END HERE 
#M245B2 CHANGES END HERE 
        DisplayOnly;
        Signed;
        Length = "13";
        SType = "Currency";
        Label = "Total Registered Savings Amount";
    }

    IN MIR-POL-RRIF-MNPMT-AMT
    {
#M245B2 CHANGES START HERE    
        CurrencyCode = "MIR-POL-CRCY-CD";
#M245B2 CHANGES END HERE 
        DisplayOnly;
        Signed;
        Length = "13";
        SType = "Currency";
        Label = "Minimum Payment";
    }

    IN MIR-POL-SURR-LOAN-AMT
    {
#M245B2 CHANGES START HERE    
        CurrencyCode = "MIR-POL-CRCY-CD";
#M245B2 CHANGES END HERE 
        DisplayOnly;
        Signed;
        Length = "15";
        SType = "Currency";
        Label = "Surrendered Loan Amount";
    }

    IN MIR-POL-TOT-AFR-AMT
    {
#M245B2 CHANGES START HERE    
        CurrencyCode = "MIR-POL-CRCY-CD";
#M245B2 CHANGES END HERE 
        DisplayOnly;
        Signed;
        Length = "15";
        SType = "Currency";
        Label = "Previous Face Amount Decreases";
    }

    IN MIR-POL-TOT-BILL-AMT
    {
#M245B2 CHANGES START HERE  
#M271O1 CHANGES START HERE CHANGING CURRENCY CODE  
      # CurrencyCode = "MIR-POL-CRCY-CD";
#M319O1 CHANGES START HERE      
      # CurrencyCode = "MIR-PREM-CRCY-CD";
        CurrencyCode = "MIR-PMT-CRCY-CD";
#M319O1 CHANGES END HERE        
#M271O1 CHANGES END HERE 
#M245B2 CHANGES END HERE 
        DisplayOnly;
        Signed;
        Length = "15";
        SType = "Currency";
        Label = "Amount Billed";
    }

    IN MIR-POL-TRMN-PUA-AMT
    {
#M245B2 CHANGES START HERE    
        CurrencyCode = "MIR-POL-CRCY-CD";
#M245B2 CHANGES END HERE 
        DisplayOnly;
        Signed;
        Length = "15";
        SType = "Currency";
        Label = "Surrendered Paid-up Additions";
    }

    IN MIR-PREV-BILL-TYP-CD
    {
        DisplayOnly;
        Length = "1";
        CodeSource = "DataModel";
        CodeType = "POL-BILL-TYP-CD";
        SType = "Text";
        Label = "Last Billing Type";
    }

    IN MIR-PREV-PD-TO-DT-NUM
    {
        DisplayOnly;
        Length = "10";
        SType = "Text";
        Label = "Last Paid to Date";
    }

    IN MIR-PUA-LTD-FACE-AMT
    {
#M245B2 CHANGES START HERE    
        CurrencyCode = "MIR-POL-CRCY-CD";
#M245B2 CHANGES END HERE 
        DisplayOnly;
        Signed;
        Length = "15";
        SType = "Currency";
        Label = "Total Paid-up Additions";
    }

    IN MIR-PUA-YTD-FACE-AMT
    {
#M245B2 CHANGES START HERE    
        CurrencyCode = "MIR-POL-CRCY-CD";
#M245B2 CHANGES END HERE 
        DisplayOnly;
        Signed;
        Length = "15";
        SType = "Currency";
        Label = "Current Paid-up Additions";
    }

    IN MIR-REG-CNTRB-1-AMT-T[2]
    {
#M245B2 CHANGES START HERE    
        CurrencyCode = "MIR-POL-CRCY-CD";
#M245B2 CHANGES END HERE 
        DisplayOnly;
        Signed;
        Length = "13";
        FieldGroup = "Table2";
        SType = "Currency";
        Label = "Contributions: March - December";
        Index = "1";
    }

    IN MIR-REG-CNTRB-2-AMT-T[2]
    {
#M245B2 CHANGES START HERE    
        CurrencyCode = "MIR-POL-CRCY-CD";
#M245B2 CHANGES END HERE 
        DisplayOnly;
        Signed;
        Length = "13";
        FieldGroup = "Table2";
        SType = "Currency";
        Label = "Contributions: January - February";
        Index = "1";
    }

    IN MIR-REG-CNTRB-RECPT-DT
    {
        DisplayOnly;
        Length = "10";
        SType = "Date";
        Label = "Last Receipt Requested Date";
    }

    IN MIR-REG-CNTRB-SPCL-AMT-T[2]
    {
#M245B2 CHANGES START HERE    
        CurrencyCode = "MIR-POL-CRCY-CD";
#M245B2 CHANGES END HERE 
        DisplayOnly;
        Signed;
        Length = "13";
        FieldGroup = "Table2";
        SType = "Currency";
        Label = "Special Receipt Amount";
        Index = "1";
    }

    IN MIR-REG-CNTRB-XFER-DT
    {
        DisplayOnly;
        Length = "10";
        SType = "Date";
        Label = "Contribution / Transfer Date";
    }

    IN MIR-REG-RECPT-1-AMT-T[2]
    {
#M245B2 CHANGES START HERE    
        CurrencyCode = "MIR-POL-CRCY-CD";
#M245B2 CHANGES END HERE 
        DisplayOnly;
        Signed;
        Length = "13";
        FieldGroup = "Table2";
        SType = "Currency";
        Label = "Amount Receipted: March - December";
        Index = "1";
    }

    IN MIR-REG-RECPT-2-AMT-T[2]
    {
#M245B2 CHANGES START HERE    
        CurrencyCode = "MIR-POL-CRCY-CD";
#M245B2 CHANGES END HERE 
        DisplayOnly;
        Signed;
        Length = "13";
        FieldGroup = "Table2";
        SType = "Currency";
        Label = "Amount Receipted: January - February";
        Index = "1";
    }

    IN MIR-RRIF-MNPMT-PYR-AMT
    {
#M245B2 CHANGES START HERE    
        CurrencyCode = "MIR-POL-CRCY-CD";
#M245B2 CHANGES END HERE 
        DisplayOnly;
        Signed;
        Length = "13";
        SType = "Currency";
        Label = "Previous Year";
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

    IN MIR-SFB-NEG-SUSP-IND
    {
        DisplayOnly;
        Length = "1";
        SType = "Indicator";
        Label = "Negative premium suspense is allowed";
    }

    IN MIR-SFB-NEG-SUSP-QTY
    {
        DisplayOnly;
        Length = "2";
        SType = "Text";
        Label = "Negative Premium Limit";
    }

    IN MIR-SFB-NXT-BILL-AMT
    {
#M245B2 CHANGES START HERE    
#M271O1 CHANGES START HERE CHANGING CURRENCY CODE  
      # CurrencyCode = "MIR-POL-CRCY-CD";
#M319O1 CHANGES START HERE      
      # CurrencyCode = "MIR-PREM-CRCY-CD";
        CurrencyCode = "MIR-PMT-CRCY-CD";
#M319O1 CHANGES END HERE        
#M271O1 CHANGES END HERE 
#M245B2 CHANGES END HERE 
        DisplayOnly;
        Signed;
        Length = "15";
        SType = "Currency";
        Label = "Current Billing Amount";
    }

    IN MIR-SURR-DIV-ACUM-AMT
    {
#M245B2 CHANGES START HERE    
        CurrencyCode = "MIR-POL-CRCY-CD";
#M245B2 CHANGES END HERE 
        DisplayOnly;
        Signed;
        Length = "15";
        SType = "Currency";
        Label = "Surrendered Accumulated Dividends on Deposit";
    }

    IN MIR-TRMN-PUA-REASN-CD
    {
        DisplayOnly;
        Length = "1";
        SType = "Text";
        Label = "Paid-up Additions Termination Reason";
    }

    IN MIR-UL-LAPS-NOTI-AMT
    {
#M245B2 CHANGES START HERE    
        CurrencyCode = "MIR-POL-CRCY-CD";
#M245B2 CHANGES END HERE 
        DisplayOnly;
        Signed;
        Length = "13";
        SType = "Currency";
        Label = "Reactivate Policy Amount";
    }

    IN MIR-XHBT-CRNT-LOC-CD
    {
        DisplayOnly;
        Length = "2";
        CodeSource = "CTLC";
        CodeType = "CLOC";
        FilterFields = "1";
        FilterField1 = "MIR-USER-SESN-CTRY-CD";
        SType = "Text";
        Label = "Exhibit Current Location";
    }

    IN MIR-XHBT-ISS-LOC-CD
    {
        DisplayOnly;
        Length = "2";
        CodeSource = "CTLC";
        CodeType = "ILOC";
        FilterFields = "1";
        FilterField1 = "MIR-USER-SESN-CTRY-CD";
        SType = "Text";
        Label = "Exhibit Issue Location";
    }

    IN MIR-NXT-FND-SRVBEN-DT
    {
        DisplayOnly;
        Length = "10";
        SType = "Date";
        Label = "Next Fund Survivorship Benefit Date";
    }

    IN MIR-PREV-BILL-NOTI-DT
    {
        DisplayOnly;
        Length = "10";
        SType = "Date";
        Label = "Last Billing Notice Date";
    }

    IN MIR-CBB-LST-PD-YR
    {
        DisplayOnly;
        Length = "4";
        SType = "Text";
        Label = "Cash Back Bonus Year Last Paid";
    }

    IN MIR-CBB-RBB-LST-PD-AMT
    {
#M245B2 CHANGES START HERE    
        CurrencyCode = "MIR-POL-CRCY-CD";
#M245B2 CHANGES END HERE 
        DisplayOnly;
        Signed;
        Length = "15";
        SType = "Currency";
        Label = "Cash Back Bonus Rate Banding Amount Last Paid";
    }

    IN MIR-CBB-RBB-LTD-PD-AMT
    {
#M245B2 CHANGES START HERE    
        CurrencyCode = "MIR-POL-CRCY-CD";
#M245B2 CHANGES END HERE 
        DisplayOnly;
        Signed;
        Length = "17";
        SType = "Currency";
        Label = "Cash Back Bonus Rate Banding Total Paid";
    }

    IN MIR-CBB-CMB-LST-PD-AMT
    {
#M245B2 CHANGES START HERE    
        CurrencyCode = "MIR-POL-CRCY-CD";
#M245B2 CHANGES END HERE 
        DisplayOnly;
        Signed;
        Length = "15";
        SType = "Currency";
        Label = "Cash Back Bonus Collection Method Amount Last Paid";
    }

    IN MIR-CBB-CMB-LTD-PD-AMT
    {
#M245B2 CHANGES START HERE    
        CurrencyCode = "MIR-POL-CRCY-CD";
#M245B2 CHANGES END HERE 
        DisplayOnly;
        Signed;
        Length = "17";
        SType = "Currency";
        Label = "Cash Back Bonus Collection Method Total Paid";
    }

    IN MIR-CBB-MRB-LST-PD-AMT
    {
#M245B2 CHANGES START HERE    
        CurrencyCode = "MIR-POL-CRCY-CD";
#M245B2 CHANGES END HERE 
        DisplayOnly;
        Signed;
        Length = "15";
        SType = "Currency";
        Label = "Cash Back Bonus Medical Rider Amount Last Paid";
    }

    IN MIR-CBB-MRB-LTD-PD-AMT
    {
#M245B2 CHANGES START HERE    
        CurrencyCode = "MIR-POL-CRCY-CD";
#M245B2 CHANGES END HERE 
        DisplayOnly;
        Signed;
        Length = "17";
        SType = "Currency";
        Label = "Cash Back Bonus Medical Rider Total Paid";
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

    IN MIR-POL-CWA-SUSP-DT
    {
        DisplayOnly;
        Length = "10";
        SType = "Date";
        Label = "Cash with App Suspense Account Last Updated";
    }

    IN MIR-CSH-RFND-SUSP-AMT
    {
#M245B2 CHANGES START HERE    
        CurrencyCode = "MIR-PMT-CRCY-CD";
#M245B2 CHANGES END HERE 
        DisplayOnly;
        Signed;
        Length = "13";
        SType = "Currency";
        Label = "Cash Refund Suspense";
    }

    IN MIR-CSH-RFND-SUSP-DT
    {
        DisplayOnly;
        Length = "10";
        SType = "Date";
        Label = "Cash Refund Suspense Account Last Updated";
    }
     
    IN MIR-CNCL-SA-XFER-IND
    {
        DisplayOnly;
        Length = "1";
        SType = "Indicator";
        Label = "Cancel SA Transfer";
    }
    
# Changes for NWLBCA starts here
    IN MIR-OVR-SHRT-PREM-AMT
    {
#M245B2 CHANGES START HERE   
#M271O1 CHANGES START HERE CHANGING CURRENCY CODE  
      # CurrencyCode = "MIR-POL-CRCY-CD";
#M319O1 CHANGES START HERE      
      # CurrencyCode = "MIR-PREM-CRCY-CD";
#FFF10R CHANGES START HERE      
        CurrencyCode = "MIR-OVR-SHRT-PREM-CRCY-CD"; 
#FFF10R CHANGES END HERE        
#M319O1 CHANGES END HERE
#M271O1 CHANGES END HERE 
#M245B2 CHANGES END HERE 
    	Signed;
	Length = "15";
        DBTableName = "TPOL";
        SType = "Currency";
        Label = "Over / Short Premium";
    }

    IN MIR-OVR-SHRT-PREM-DT
    {
        Length = "10";
        DBTableName = "TPOL";
        SType = "Date";
        Label = "Over / Short Premium Last Updated";
    }
# Changes for NWLBCA ends here
# Changes for NWLLRP starts here
    IN MIR-LOAN-XCES-SHRT-AMT
    {
#M245B2 CHANGES START HERE    
#M319O1 CHANGES START HERE
      # CurrencyCode = "MIR-POL-CRCY-CD";      
#Q91591 CHANGES START HERE      
      # CurrencyCode = "MIR-PMT-CRCY-CD";
        CurrencyCode = "MIR-POL-CRCY-CD";      
#Q91591 CHANGES END HERE 
#M319O1 CHANGES END HERE        
#M245B2 CHANGES END HERE 
    	Signed;
	    Length = "13";
        DBTableName = "TPOL";
        SType = "Currency";
        Label = "Excess / Short Loan Interest";
    }

    IN MIR-LOAN-XCES-SHRT-DT
    {
        Length = "10";
        DBTableName = "TPOL";
        SType = "Date";
        Label = "Excess / Short Loan Interest Account Last Updated";
    }
# Changes for NWLLRP ends here

# M161CA CHANGES STARTS HERE    
    
    IN MIR-CRC-RECV-AMT
    {
        DisplayOnly;
        Length = "17";
#M245B2 CHANGES STARTS HERE     
#M271O1 CHANGES START HERE CHANGING CURRENCY CODE  
      # CurrencyCode = "MIR-POL-CRCY-CD";
#Q88344 CHANGES START HERE
      # CurrencyCode = "MIR-PREM-CRCY-CD";      
        CurrencyCode = "MIR-PMT-CRCY-CD";        
#Q88344 CHANGES END HERE
#M271O1 CHANGES END HERE 
#        SType = "text";
         SType = "Currency";
#M245B2 CHANGES ENDS HERE         
        Label = "Receivable Amount";
    }
    IN MIR-CRC-RECV-UPDT-DT
    {
        DisplayOnly;
        Length = "10";
        SType = "text";
        Label = "Receivable Account Last Updated";
    }
    
# M161CA CHANGES END HERE  
# C15454 changes begin
 
     IN MIR-DSASTR-LAPS-DT
     {
         DisplayOnly;
         Length = "10";
         DBTableName = "TPOL";
         SType = "Date";
         Label = "Disaster Lapse Date";
     }    
# C15454 changes end
#M245B2 CHANGES START HERE
     INOUT MIR-POL-CRCY-CD
     {
         
         Length = "2";
         SType = "Hidden";
         Label = "Currency";
     }
#M245B2 CHANGES END HERE 

#Q50535 CHANGES START HERE      
     INOUT MIR-PMT-CRCY-CD
      {
          
          Length = "2";
          SType = "Hidden";
          Label = "Currency";
     }
#Q50535 CHANGES ENDS HERE
#MP245R CHANGES STARTS HERE     
   INOUT MIR-OS-DISB-CRCY-CD
        {
         
             Length = "2";
             SType = "Hidden";
             Label = "Currency";
        }               
#MP245R CHANGES ENDS HERE        
#FFF10R CHANGES START HERE 
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
#FFF10R CHANGES ENDS HERE 
#R10428 CHANGES STARTS HERE 
 IN MIR-OS-DISB-SRVBEN-AMT
    {
        DisplayOnly;
        CurrencyCode = "MIR-OS-DISB-CRCY-CD";
        Signed;
        Length = "17";
        SType = "Currency";
        Label = "Outstanding Disbursements - UL Survivor Benefit";
    }

    IN MIR-OS-DISB-SRVBEN-DT
    {
        DisplayOnly;
        Length = "10";
        SType = "Date";
        Label = "Outstanding Disbursements UL Survivor Benefit Account Last Updated";
    }

    IN MIR-POL-PDF-SUSP-AMT
    {
        DisplayOnly;
        CurrencyCode = "MIR-PMT-CRCY-CD";
        Signed;
        Length = "13";
        SType = "Currency";
        Label = "Premium Deposit Fund Suspense";
    }

    IN MIR-POL-PDF-SUSP-DT
    {
        DisplayOnly;
        Length = "10";
        SType = "Date";
        Label = "Premium Deposit Fund Suspense Account Last Updated";
    }

    IN MIR-POST-LAPS-SURR-AMT
    {
        DisplayOnly;
        CurrencyCode = "MIR-OS-DISB-CRCY-CD";
        Signed;
        Length = "15";
        SType = "Currency";
        Label = "Post Lapse Surrender Amount";
    }

    IN MIR-DHY-SPREM-SUSP-AMT
    {
        DisplayOnly;
        CurrencyCode = "MIR-POL-CRCY-CD";
        Signed;
        Length = "17";
        SType = "Currency";
        Label = " Conversion Single Premium Suspense";
    }

    IN MIR-DHY-SPREM-SUSP-DT
    {
        DisplayOnly;
        Length = "10";
        SType = "Date";
        Label = " Conversion Single Premium Suspense Account Last Updated";
    }

    IN MIR-DHY-RSRV-SUSP-AMT
    {
        DisplayOnly;
        CurrencyCode = "MIR-POL-CRCY-CD";
        Signed;
        Length = "17";
        SType = "Currency";
        Label = " Conversion Reserve Suspense";
    }

    IN MIR-DHY-RSRV-SUSP-DT
    {
        DisplayOnly;
        Length = "10";
        SType = "Date";
        Label = "Conversion Reserve Suspense Account Last Updated";
    }

    IN MIR-DHY-OS-DISB-AMT
    {
        DisplayOnly;
        CurrencyCode = "MIR-POL-CRCY-CD";
        Signed;
        Length = "17";
        SType = "Currency";
        Label = " Conversion Outstanding Disbursements";
    }

    IN MIR-DHY-OS-DISB-DT
    {
        DisplayOnly;
        Length = "10";
        SType = "Date";
        Label = "Conversion Outstanding Disbursements Account Last Updated";
    }

    IN MIR-INIT-PREM-SUSP-AMT
    {
        DisplayOnly;
#M319O1 CHANGES START HERE        
      # CurrencyCode = "MIR-PMT-CRCY-CD";
        CurrencyCode = "MIR-PREM-CRCY-CD";
#M319O1 CHANGES END HERE        
        Signed;
        Length = "17";
        SType = "Currency";
        Label = "Accrual Initial Premium Suspense";
    }

    IN MIR-INIT-PREM-SUSP-DT
    {
        DisplayOnly;
        Length = "10";
        SType = "Date";
        Label = "Accrual Initial Premium Suspense Account Last Updated";
    }

#UYS025 CHANGES START HERE

    IN MIR-ADV-PMT-RSRV-AMT
    {  
        DisplayOnly;
        Signed;
#S21749 CHANGE STARTS HERE
#        Length = "13";
        Length = "15";
#S21749 CHANGE ENDS HERE
        SType = "Currency";
        Label = "Advance Payment Reserve Amount";
    } 
#UYS025 CHANGES ENDS HERE 
#R10428 CHANGES ENDS HERE
#M271O1 CHANGES START HERE   
       INOUT MIR-PREM-CRCY-CD
       {
                      
           Length = "2";
           SType = "Hidden";
           Label = "Currency";
       }
#M271O1 CHANGES END HERE 
# R14127 changes begin
    IN MIR-DSASTR-CD
    {
        DisplayOnly;
        Length = "1";
        CodeSource = "EDIT";
        CodeType = "DSAST";
        SType = "Text";
        Label = "Disaster Code";
    }

    IN MIR-DSASTR-SUB-CD
    {
        DisplayOnly;
        Length = "2";
        CodeSource = "EDIT";
        CodeType = "DSTSB";
        SType = "Text";
        Label = "Disaster Sub Code";
    }
# R14127 changes end
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

 
#S45969 CHANGES START 
    IN MIR-STR3-ERR-CD
    {
        DisplayOnly;
        Length = "1";
        CodeSource = "DataModel";
        CodeType = "STR3-ERR-CD";
        SType = "Text";
        Label = "Stream 3 Error";
    }
#S45969 CHANGES ENDS
 }