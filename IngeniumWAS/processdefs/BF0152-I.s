# Converted from PathFinder 2.2 to 3.0 Jun 18, 2004 3:12:16 PM EDT

#*******************************************************************************
#*  Component:   BF0152-I.s                                                    *
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
#*  02BL63  KRW      Add date of Policy's first PAC (BT) draw                  *
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
#*                                                                             *
#*  NWLLRP  CTS     LOAN REPAYMANT:                                            *
#*                      MIR-LOAN-XCES-SHRT-AMT                                 *
#*                      MIR-LOAN-XCES-SHRT-DT                                  *
#*  NWLLTC  CTS      CHANGES DONE TO ADD NEW FIELDS FOR LOAN PROCESSING        *
#*  Q10123  CTS      M161CA - CHANGES DONE FOR CREDIT CARD                     *
#*  C15454  CTS      ADDED DISASTER LAPSE DATE                                 *
#*  M245B2  CTS      Foreign Currency Formatting 			       *
#*  R10428  CTS      RLSE0010428 - SCREEN CHANGE - PROTECTED POLICY UPDATE     *
#*                   SCREEN                                                    *
#*  M271O1  CTS      FRA Foreign Currency Formatting 			       *
#*  M271A7  CTS      Online Screen Changes done as part of FRA                 *
#*  Q60885  CTS      FRA CURRENCY CODE CHANGES   			       *
#*  M319O1  CTS      FXWL Currency Code Changes                                * 
#*  Q88344  CTS      FXWL Currency Code Changes                                * 
#*  R14127  CTS      CHANGES FOR DISASTER RECOVERY                             * 
#*  TDM13B  CTS      CHANGES AS PART OF NWL/NWL2 POLICY                        *
#*  TDM13B           PAYMENT COMPLETION PROCESSING                             *
#*  118579  CTS      CHANGES DONE TO CORRECT THE FIELD PREMIUM PAYMENT         *
#*  118579           DESCRIPTION                                               *
#*  FFF10R  CTS      CHANGES DONE FOR CC SUSPENSE HANDLING                     *
#*  UYS025  CTS      ADVANCE PAYMENT RESERVE AMOUNT FIELD ADDED                *
#*  UYS133  CTS      Addition of PD group size field                           *
#*******************************************************************************

S-STEP BF0152-I
{
    ATTRIBUTES
    {
        Type = "Input";
        FocusField = "MIR-POL-PREV-FACE-AMT";
        FocusFrame = "ContentFrame";
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

    INOUT MIR-AFR-THRSHD-PERI-CD
    {
        Length = "1";
        CodeSource = "DataModel";
        CodeType = "AFR-THRSHD-PERI-CD";
        SType = "Selection";
        Label = "Threshold Period";
    }

    INOUT MIR-CASL-PMT-PYR-AMT
    {
#M245B2 CHANGES START HERE    
        CurrencyCode = "MIR-POL-CRCY-CD";
#M245B2 CHANGES END HERE 
        Signed;
        Length = "15";
        SType = "Currency";
        Label = "Previous Year's Casual Payment";
    }

    INOUT MIR-CASL-PMT-YTD-AMT
    {
#M245B2 CHANGES START HERE    
        CurrencyCode = "MIR-POL-CRCY-CD";
#M245B2 CHANGES END HERE 
        Signed;
        Length = "15";
        SType = "Currency";
        Label = "Casual Payments Year to Date";
    }

    INOUT MIR-DIV-DCLR-LTD-AMT
    {
#M245B2 CHANGES START HERE    
        CurrencyCode = "MIR-POL-CRCY-CD";
#M245B2 CHANGES END HERE 
        Signed;
        Length = "15";
        SType = "Currency";
        Label = "Total Dividends Declared";
    }

    INOUT MIR-DIV-DCLR-YTD-AMT
    {
#M245B2 CHANGES START HERE    
        CurrencyCode = "MIR-POL-CRCY-CD";
#M245B2 CHANGES END HERE 
        Signed;
        Length = "13";
        SType = "Currency";
        Label = "Dividends Declared Year to Date";
    }

    INOUT MIR-DOD-CRNT-INT-AMT
    {
#M245B2 CHANGES START HERE    
        CurrencyCode = "MIR-POL-CRCY-CD";
#M245B2 CHANGES END HERE 
        Signed;
        Length = "11";
        SType = "Currency";
        Label = "Dividends on Deposit Interest";
    }

    INOUT MIR-FREE-WTHDR-CD
    {
        Length = "1";
        CodeSource = "DataModel";
        CodeType = "FREE-WTHDR-CD";
        SType = "Selection";
        Label = "Free Withdrawal";
    }

    INOUT MIR-FREE-WTHDR-PERI-CD
    {
        Length = "1";
        CodeSource = "DataModel";
        CodeType = "FREE-WTHDR-PERI-CD";
        SType = "Selection";
        Label = "Free Withdrawals - Period";
    }

    INOUT MIR-FREE-WTHDR-QTY
    {
        Length = "3";
        SType = "Text";
        Label = "Free Withdrawals - Number Remaining";
    }

    INOUT MIR-FREE-WTHDR-TOT-AMT
    {
#M245B2 CHANGES START HERE    
        CurrencyCode = "MIR-POL-CRCY-CD";
#M245B2 CHANGES END HERE 
        Signed;
        Length = "15";
        SType = "Currency";
        Label = "Free Withdrawal - Amount Taken";
    }

    INOUT MIR-FREE-WTHDR-DUR
    {
        Length = "3";
        SType = "Text";
        Label = "Free Withdrawal Duration";
    }

    INOUT MIR-FREE-WTHDR-DT
    {
        Length = "10";
        SType = "Date";
        Label = "Free Withdrawal Date";
    }

    INOUT MIR-FREE-XFER-CD
    {
        Length = "1";
        CodeSource = "DataModel";
        CodeType = "PLAN-FREE-XFER-CD";
        SType = "Selection";
        Label = "Free Transfer";
    }

    INOUT MIR-FREE-XFER-PERI-CD
    {
        Length = "1";
        CodeSource = "DataModel";
        CodeType = "FREE-XFER-PERI-CD";
        SType = "Selection";
        Label = "Free Transfers - Period";
    }

    INOUT MIR-FREE-XFER-QTY
    {
        Length = "3";
        SType = "Text";
        Label = "Free Transfers - Number Remaining";
    }

    INOUT MIR-FREE-XFER-TOT-AMT
    {
#M245B2 CHANGES START HERE    
        CurrencyCode = "MIR-POL-CRCY-CD";
#M245B2 CHANGES END HERE 
        Signed;
        Length = "15";
        SType = "Currency";
        Label = "Free Transfer - Amount Taken";
    }

    INOUT MIR-LIF-MXPMT-PYR-AMT
    {
#M245B2 CHANGES START HERE    
        CurrencyCode = "MIR-POL-CRCY-CD";
#M245B2 CHANGES END HERE 
        Signed;
#M245B2 CHANGES START HERE        
#        Length = "15";
        Length = "16";
#M245B2 CHANGES END HERE 
        SType = "Currency";
        Label = "Previous Year - Maximum Payment Allowed";
    }

    INOUT MIR-LOAN-AMT-T[3]
    {
#M245B2 CHANGES START HERE    
        CurrencyCode = "MIR-POL-CRCY-CD";
#M245B2 CHANGES END HERE 
        Signed;
        Length = "15";
        FieldGroup = "Table3";
        SType = "Currency";
        Label = "Total Policy Loan";
        Index = "1";
    }

    INOUT MIR-LOAN-ANNV-AMT-T[3]
    {
#M245B2 CHANGES START HERE    
        CurrencyCode = "MIR-POL-CRCY-CD";
#M245B2 CHANGES END HERE 
        Signed;
        Length = "15";
        FieldGroup = "Table3";
        SType = "Currency";
        Label = "Anniversary Loan Balance";
        Index = "1";
    }

    INOUT MIR-LOAN-AVB-AMT-T[3]
    {
#M245B2 CHANGES START HERE    
        CurrencyCode = "MIR-POL-CRCY-CD";
#M245B2 CHANGES END HERE 
        Signed;
        Length = "15";
        FieldGroup = "Table3";
        SType = "Currency";
        Label = "Average Loan Balance";
        Index = "1";
    }

    INOUT MIR-LOAN-DT-T[3]
    {
        Length = "10";
        FieldGroup = "Table3";
        KeyColumn;
        SType = "Date";
        Label = "Effective Date";
        Index = "1";
    }

    INOUT MIR-LOAN-INT-BILL-AMT-T[3]
    {
#M245B2 CHANGES START HERE    
        CurrencyCode = "MIR-POL-CRCY-CD";
#M245B2 CHANGES END HERE 
        Signed;
        Length = "13";
        FieldGroup = "Table3";
        SType = "Currency";
        Label = "Loan Interest Billed";
        Index = "1";
    }

    INOUT MIR-LOAN-INT-MAX-RT-T[3]
    {
        Length = "5";
        Decimals = "5";
        FieldGroup = "Table3";
        SType = "Percent";
        Label = "Maximum Loan Interest Rate";
        Index = "1";
    }

    INOUT MIR-LOAN-INT-RT-T[3]
    {
        Length = "5";
        Decimals = "5";
        FieldGroup = "Table3";
        SType = "Percent";
        Label = "Loan Interest Rate";
        Index = "1";
    }

    INOUT MIR-LOAN-INT-TYP-CD-T[3]
    {
        Length = "1";
        FieldGroup = "Table3";
        CodeSource = "DataModel";
        CodeType = "LOAN-INT-TYP-CD";
        SType = "Selection";
        Label = "Loan Interest Rate Type";
        Index = "1";
    }

    INOUT MIR-LOAN-INT-YTD-AMT-T[3]
    {
#M245B2 CHANGES START HERE    
        CurrencyCode = "MIR-POL-CRCY-CD";
#M245B2 CHANGES END HERE 
        Signed;
        Length = "13";
        FieldGroup = "Table3";
        SType = "Currency";
        Label = "Loan Interest Paid / Capitalized Year to Date";
        Index = "1";
    }

    INOUT MIR-LOAN-PREV-ANNV-AMT-T[3]
    {
#M245B2 CHANGES START HERE    
        CurrencyCode = "MIR-POL-CRCY-CD";
#M245B2 CHANGES END HERE 
        Signed;
        Length = "15";
        FieldGroup = "Table3";
        SType = "Currency";
        Label = "Previous Anniversary Loan Balance";
        Index = "1";
    }

    INOUT MIR-POL-ACCT-PAR-CD
    {
        Length = "1";
        CodeSource = "DataModel";
        CodeType = "POL-ACCT-PAR-CD";
        SType = "Selection";
        Label = "Dividend Option";
    }

    INOUT MIR-POL-AFR-ALLOC-CD
    {
        Length = "1";
        CodeSource = "DataModel";
        CodeType = "POL-AFR-ALLOC-CD";
        SType = "Selection";
        Label = "Automatic Face Amount Reduction Allocation";
    }

    INOUT MIR-POL-AFR-THRSHD-AMT
    {
#M245B2 CHANGES START HERE    
        CurrencyCode = "MIR-POL-CRCY-CD";
#M245B2 CHANGES END HERE 
        Signed;
#M245B2 CHANGES START HERE        
#        Length = "13";
        Length = "14";
#M245B2 CHANGES START HERE
        SType = "Currency";
        Label = "Threshold Amount";
    }

    INOUT MIR-POL-ANPAYO-LTD-AMT
    {
#M245B2 CHANGES START HERE    
        CurrencyCode = "MIR-POL-CRCY-CD";
#M245B2 CHANGES END HERE 
        Signed;
        Length = "11";
        SType = "Currency";
        Label = "Accumulated Payments Life to Date";
    }

    INOUT MIR-POL-ANPAYO-PMT-DT
    {
        Length = "10";
        SType = "Date";
        Label = "Last Payment Date";
    }

    INOUT MIR-POL-ANPAYO-PYR-AMT
    {
#M245B2 CHANGES START HERE    
        CurrencyCode = "MIR-POL-CRCY-CD";
#M245B2 CHANGES END HERE 
        Signed;
        Length = "15";
        SType = "Currency";
        Label = "Previous Year's Total Payments";
    }

    INOUT MIR-POL-ANPAYO-YTD-AMT
    {
#M245B2 CHANGES START HERE    
        CurrencyCode = "MIR-POL-CRCY-CD";
#M245B2 CHANGES END HERE 
        Signed;
        Length = "15";
        SType = "Currency";
        Label = "Accumulated Payments Year to Date";
    }

    INOUT MIR-POL-ANTY-SUSP-AMT
    {
#M245B2 CHANGES START HERE    
        CurrencyCode = "MIR-POL-CRCY-CD";
#M245B2 CHANGES END HERE 
        Signed;
        Length = "13";
        SType = "Currency";
        Label = "Annuity Suspense";
    }

    INOUT MIR-POL-BASE-CVG-NUM
    {
        Length = "2";
        SType = "Text";
        Label = "Base Coverage Number";
    }

    INOUT MIR-POL-BT-STRT-DT
    {
        Length = "10";
        SType = "Date";
        Label = "BT Policy First Draw Date";
    }

    INOUT MIR-POL-CRNT-PSUR-AMT
    {
#M245B2 CHANGES START HERE    
        CurrencyCode = "MIR-POL-CRCY-CD";
#M245B2 CHANGES END HERE 
        Signed;
        Length = "15";
        SType = "Currency";
        Label = "Total Surrenders for All Coverages - Current Period";
    }

    INOUT MIR-POL-CSTAT-CD
    {
        Length = "40";
        CodeSource = "DataModel";
        CodeType = "POL-CSTAT-CD";
        SType = "Selection";
        Label = "Policy Status";
    }

    INOUT MIR-POL-DIV-SUSP-AMT
    {
#M245B2 CHANGES START HERE    
        CurrencyCode = "MIR-POL-CRCY-CD";
#M245B2 CHANGES END HERE 
        Signed;
        Length = "13";
        SType = "Currency";
        Label = "Dividend Suspense";
    }

    INOUT MIR-POL-DOD-ACUM-AMT
    {
#M245B2 CHANGES START HERE    
        CurrencyCode = "MIR-POL-CRCY-CD";
#M245B2 CHANGES END HERE 
        Signed;
        Length = "15";
        SType = "Currency";
        Label = "Dividends on Deposit";
    }

    INOUT MIR-POL-DOD-AVB-AMT
    {
#M245B2 CHANGES START HERE    
        CurrencyCode = "MIR-POL-CRCY-CD";
#M245B2 CHANGES END HERE 
        Signed;
        Length = "15";
        SType = "Currency";
        Label = "Dividend Average Balance";
    }

    INOUT MIR-POL-DOD-INT-RT
    {
        Signed;
        Length = "5";
        Decimals = "5";
        SType = "Percent";
        Label = "Current Dividend Interest Rate";
    }

    INOUT MIR-POL-GL-ACCT-TYP-CD
    {
        Length = "1";
        SType = "Text";
        Label = "Policy Account Type";
    }

    INOUT MIR-POL-LIF-MXPMT-AMT
    {
#M245B2 CHANGES START HERE    
        CurrencyCode = "MIR-POL-CRCY-CD";
#M245B2 CHANGES END HERE 
        Signed;
        Length = "13";
        SType = "Currency";
        Label = "Maximum Payment (LIF Policy)";
    }

    INOUT MIR-POL-LOCK-FND-IND
    {
        Length = "1";
        SType = "Indicator";
        Label = "Policy has locked-in funds";
    }

    INOUT MIR-POL-MISC-SUSP-AMT
    {
#M245B2 CHANGES START HERE  
#M271O1 CHANGES START HERE CHANGING CURRENCY CODE  
      # CurrencyCode = "MIR-POL-CRCY-CD";
        CurrencyCode = "MIR-PREM-CRCY-CD";
#M271O1 CHANGES END HERE 
#M245B2 CHANGES END HERE 
        Signed;
        Length = "17";
        SType = "Currency";
        Label = "Miscellaneous Suspense";
    }

    INOUT MIR-POL-MISC-SUSP-DT
    {
        Length = "10";
        SType = "Date";
        Label = "Miscellaneous Suspense Account Last Updated";
    }

    INOUT MIR-POL-OS-DISB-AMT
    {
#M245B2 CHANGES START HERE 
#R10428 CHANGES START HERE
#        CurrencyCode = "MIR-POL-CRCY-CD";
        CurrencyCode = "MIR-OS-DISB-CRCY-CD";
#R10428 CHANGES END HERE
#M245B2 CHANGES END HERE 
        Signed;
        Length = "17";
        SType = "Currency";
        Label = "Outstanding Disbursements";
    }

    INOUT MIR-POL-OS-DISB-DT
    {
        Length = "10";
        SType = "Date";
        Label = "Outstanding Disbursements Account Last Updated";
    }

    INOUT MIR-OS-DISB-SURR-AMT
    {
#M245B2 CHANGES START HERE    
#R10428 CHANGES START HERE
#        CurrencyCode = "MIR-POL-CRCY-CD";
        CurrencyCode = "MIR-OS-DISB-CRCY-CD";
#R10428 CHANGES END HERE
#M245B2 CHANGES END HERE 
        Signed;
        Length = "17";
        SType = "Currency";
        Label = "Outstanding Disbursements - Surrender";
    }

    INOUT MIR-OS-DISB-SURR-DT
    {
        Length = "10";
        SType = "Date";
        Label = "Outstanding Disbursements Surrender Date";
    }

    INOUT MIR-OS-DISB-MAT-AMT
    {
#M245B2 CHANGES START HERE    
#R10428 CHANGES START HERE
#        CurrencyCode = "MIR-POL-CRCY-CD";
	CurrencyCode = "MIR-OS-DISB-CRCY-CD";
#R10428 CHANGES END HERE
#M245B2 CHANGES END HERE 
        Signed;
        Length = "17";
        SType = "Currency";
        Label = "Outstanding Disbursements - Maturity";
    }

    INOUT MIR-OS-DISB-MAT-DT
    {
        Length = "10";
        SType = "Date";
        Label = "Outstanding Disbursements Maturity Date";
    }

    INOUT MIR-OS-DISB-DTH-AMT
    {
#M245B2 CHANGES START HERE    
#R10428 CHANGES START HERE
#        CurrencyCode = "MIR-POL-CRCY-CD";
	CurrencyCode = "MIR-OS-DISB-CRCY-CD";
#R10428 CHANGES END HERE
#M245B2 CHANGES END HERE 
        Signed;
        Length = "17";
        SType = "Currency";
        Label = "Outstanding Disbursements - Death";
    }

    INOUT MIR-OS-DISB-DTH-DT
    {
        Length = "10";
        SType = "Date";
        Label = "Outstanding Disbursements Death Date";
    }

    INOUT MIR-OS-DISB-CLM-AMT
    {
#M245B2 CHANGES START HERE    
#R10428 CHANGES START HERE
#        CurrencyCode = "MIR-POL-CRCY-CD";
	CurrencyCode = "MIR-OS-DISB-CRCY-CD";
#R10428 CHANGES END HERE
#M245B2 CHANGES END HERE 
        Signed;
        Length = "17";
        SType = "Currency";
        Label = "Outstanding Disbursements - Claims";
    }

    INOUT MIR-OS-DISB-CLM-DT
    {
        Length = "10";
        SType = "Date";
        Label = "Outstanding Disbursements Claims Date";
    }

    INOUT MIR-OS-DISB-AD-AMT
    {
#M245B2 CHANGES START HERE    
#R10428 CHANGES START HERE
#        CurrencyCode = "MIR-POL-CRCY-CD";
	CurrencyCode = "MIR-OS-DISB-CRCY-CD";
#R10428 CHANGES END HERE
#M245B2 CHANGES END HERE 
        Signed;
        Length = "17";
        SType = "Currency";
        Label = "Outstanding Disbursements - Accidental Death";
    }
     
    INOUT MIR-OS-DISB-AD-DT
    {
        Length = "10";
        SType = "Date";
        Label = "Outstanding Disbursements Accidental Death Date";
    }
# NWLLTC CHANGES STARTS HERE
    INOUT MIR-OS-DISB-LOAN-AMT
    {
#M245B2 CHANGES START HERE    
#R10428 CHANGES START HERE
#        CurrencyCode = "MIR-POL-CRCY-CD";
	CurrencyCode = "MIR-OS-DISB-CRCY-CD";
#R10428 CHANGES END HERE
#M245B2 CHANGES END HERE 
        Signed;
#M245B2 CHANGES START HERE        
#        Length = "15";
        Length = "16";
#M245B2 CHANGES END HERE 
        SType = "Currency";
        Label = "Outstanding Disbursements - Loan";
    }
#M271A7 CHANGES START HERE  
    
    INOUT MIR-OS-DISB-RFND-AMT
    {
        Signed;
        Length = "15";
    	DBTableName = "TPOL";
    	SType = "Currency";
        Label = "OS Disb - JPY Premium";
    }
    
    INOUT MIR-OS-DISB-RFND-DT
    {
    	Length = "10";
    	DBTableName = "TPOL";
    	SType = "Date";
        Label = "OS Disb - JPY Premium Last Updated";
    }

#M271A7 CHANGES END HERE
     
    INOUT MIR-OS-DISB-LOAN-DT
    {
        Length = "10";
        SType = "Date";
        Label = "Outstanding Disbursements Loan Date";
    }
#R10428 CHANGES START HERE 
    INOUT MIR-OS-DISB-SRVBEN-AMT
    {
        CurrencyCode = "MIR-OS-DISB-CRCY-CD";
        Signed;
        Length = "17";
        SType = "Currency";
        Label = "Outstanding Disbursements - UL Survivor Benefit";
    }

    INOUT MIR-OS-DISB-SRVBEN-DT
    {
        Length = "10";
        SType = "Date";
        Label = "Outstanding Disbursements UL Survivor Benefit Account Last Updated";
    }

    INOUT MIR-POL-PDF-SUSP-AMT
    {
        CurrencyCode = "MIR-PMT-CRCY-CD";
        Signed;
        Length = "13";
        SType = "Currency";
        Label = "Premium Deposit Fund Suspense";
    }

    INOUT MIR-POL-PDF-SUSP-DT
    {
        Length = "10";
        SType = "Date";
        Label = "Premium Deposit Fund Suspense Account Last Updated";
    }

    INOUT MIR-POST-LAPS-SURR-AMT
    {
        CurrencyCode = "MIR-OS-DISB-CRCY-CD";
        Signed;
        Length = "15";
        SType = "Currency";
        Label = "Post Lapse Surrender Amount";
    }

    INOUT MIR-DHY-SPREM-SUSP-AMT
    {
        CurrencyCode = "MIR-POL-CRCY-CD";
        Signed;
        Length = "17";
        SType = "Currency";
        Label = " Conversion Single Premium Suspense";
    }

    INOUT MIR-DHY-SPREM-SUSP-DT
    {
        Length = "10";
        SType = "Date";
        Label = " Conversion Single Premium Suspense Account Last Updated";
    }

    INOUT MIR-DHY-RSRV-SUSP-AMT
    {
        CurrencyCode = "MIR-POL-CRCY-CD";
        Signed;
        Length = "17";
        SType = "Currency";
        Label = " Conversion Reserve Suspense";
    }

    INOUT MIR-DHY-RSRV-SUSP-DT
    {
        Length = "10";
        SType = "Date";
        Label = "Conversion Reserve Suspense Account Last Updated";
    }

    INOUT MIR-DHY-OS-DISB-AMT
    {
        CurrencyCode = "MIR-POL-CRCY-CD";
        Signed;
        Length = "17";
        SType = "Currency";
        Label = " Conversion Outstanding Disbursements";
    }

    INOUT MIR-DHY-OS-DISB-DT
    {
        Length = "10";
        SType = "Date";
        Label = "Conversion Outstanding Disbursements Account Last Updated";
    }

    INOUT MIR-INIT-PREM-SUSP-AMT
    {
#M319O1 CHANGES START HERE
      # CurrencyCode ="MIR-PMT-CRCY-CD";
        CurrencyCode = "MIR-PREM-CRCY-CD";
#M319O1 CHANGES END HERE
        Signed;
        Length = "17";
        SType = "Currency";
        Label = "Accrual Initial Premium Suspense";
    }

    INOUT MIR-INIT-PREM-SUSP-DT
    {
        Length = "10";
        SType = "Date";
        Label = "Accrual Initial Premium Suspense Account Last Updated";
    }
    
#UYS025 CHANGES START HERE

    INOUT MIR-ADV-PMT-RSRV-AMT
    {  
        Signed;
        Length = "15";
        SType = "Currency";
        Label = "Advance Payment Reserve Amount";
    } 
#UYS025 CHANGES ENDS HERE  

    INOUT MIR-OS-DISB-CRCY-CD
    {
        Length = "2";
        SType = "Hidden";
        Label = "Currency";
    }               
    
#R10428 CHANGES ENDS HERE
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
#NWLLTC CHANGES ENDS HERE
    INOUT MIR-POL-BT-SUSP-AMT
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
        Signed;
#M245B2 CHANGES START HERE        
#        Length = "13";
        Length = "14";
#M245B2 CHANGES START HERE
        SType = "Currency";
        Label = "Bank Transfer Suspense";
    }

    INOUT MIR-POL-BT-SUSP-DT
    {
        Length = "10";
        SType = "Date";
        Label = "Bank Transfer Suspense Account Last Updated";
    }

    INOUT MIR-POL-PD-SUSP-AMT
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
        Signed;
#M245B2 CHANGES START HERE        
#        Length = "13";
        Length = "14";
#M245B2 CHANGES START HERE
        SType = "Currency";
        Label = "Payroll Deduction Suspense";
    }

    INOUT MIR-POL-PD-SUSP-DT
    {
        Length = "10";
        SType = "Date";
        Label = "Payroll Deduction Suspense Account Last Updated";
    }

    INOUT MIR-POL-CC-SUSP-AMT
    {
#M245B2 CHANGES START HERE    
#M271O1 CHANGES START HERE CHANGING CURRENCY CODE  
      # CurrencyCode = "MIR-POL-CRCY-CD";
#M319O1 CHANGES START HERE
      # CurrencyCode = "MIR-PREM-CRCY-CD";
#FFF10R CHANGES STARTS HERE      
      # CurrencyCode = "MIR-PMT-CRCY-CD"; 
        CurrencyCode = "MIR-CC-SUSP-CRCY-CD";       
#FFF10R CHANGES ENDS HERE        
#M319O1 CHANGES END HERE
#M271O1 CHANGES END HERE 
#M245B2 CHANGES END HERE 
        Signed;
#M245B2 CHANGES START HERE        
#        Length = "13";
        Length = "14";
#M245B2 CHANGES START HERE 
        SType = "Currency";
        Label = "Cash Collection Suspense";
    }

    INOUT MIR-POL-CC-SUSP-DT
    {
        Length = "10";
        SType = "Date";
        Label = "Cash Collection Suspense Account Last Updated";
    }

    INOUT MIR-POL-CWA-SUSP-AMT
    {
#M245B2 CHANGES START HERE    
        CurrencyCode = "MIR-PMT-CRCY-CD";
#M245B2 CHANGES END HERE 
        Signed;
#M245B2 CHANGES START HERE        
#        Length = "13";
        Length = "14";
#M245B2 CHANGES START HERE   
        DBTableName = "TPOL";
        SType = "Currency";
        Label = "Cash with App Suspense";
    }

    INOUT MIR-POL-CWA-SUSP-DT
    {
        Length = "10";
        DBTableName = "TPOL";
        SType = "Date";
        Label = "Cash with App Suspense Account Last Updated";
    }

    INOUT MIR-CSH-RFND-SUSP-AMT
    {
#M245B2 CHANGES START HERE    
        CurrencyCode = "MIR-PMT-CRCY-CD";
#M245B2 CHANGES END HERE 
        Signed;
#M245B2 CHANGES START HERE        
#        Length = "13";
        Length = "14";
#M245B2 CHANGES START HERE   
        DBTableName = "TPOL";
        SType = "Currency";
        Label = "Cash Refund Suspense";
    }

    INOUT MIR-CSH-RFND-SUSP-DT
    {
        Length = "10";
        DBTableName = "TPOL";
        SType = "Date";
        Label = "Cash Refund Suspense Account Last Updated";
    }
 
    INOUT MIR-POL-OYT-AMT
    {
#M245B2 CHANGES START HERE    
        CurrencyCode = "MIR-POL-CRCY-CD";
#M245B2 CHANGES END HERE 
        Length = "13";
#M245B2 CHANGES START HERE          
#        Decimals = "0";
#M245B2 CHANGES END HERE  
        SType = "Currency";
        Label = "One Year Term Purchased with Dividend";
    }

    INOUT MIR-POL-PAC-DRW-DT
    {
        Length = "10";
        SType = "Date";
        Label = "Deposit Date";
    }

    INOUT MIR-POL-PAR-CVG-NUM
    {
        Length = "2";
        SType = "Text";
        Label = "First Par Coverage Number";
    }

#TDM13B CHANGES START HERE    
    INOUT MIR-PREM-PMT-CMPLT-IND
    {
        Length = "1";
        SType = "Indicator";
        Label = "Premium Payment Completion Indicator";
# 118579 changes begin      
#       Label = "Premium Payment Completion";
	Label = "Base Policy Premium Payment Completion";
# 118579 changes end 
    }     
#TDM13B CHANGES END HERE

    INOUT MIR-POL-PDF-AMT
    {
#M245B2 CHANGES START HERE  
#M271O1 CHANGES START HERE CHANGING CURRENCY CODE  
      # CurrencyCode = "MIR-POL-CRCY-CD";
        CurrencyCode = "MIR-PREM-CRCY-CD";
#M271O1 CHANGES END HERE 
#M245B2 CHANGES END HERE 
        Signed;
        Length = "13";
        SType = "Currency";
        Label = "Premium Deposit Funds";
    }

    INOUT MIR-POL-PDF-AVB-AMT
    {
#M245B2 CHANGES START HERE    
#M271O1 CHANGES START HERE CHANGING CURRENCY CODE  
      # CurrencyCode = "MIR-POL-CRCY-CD";
        CurrencyCode = "MIR-PREM-CRCY-CD";
#M271O1 CHANGES END HERE 
#M245B2 CHANGES END HERE 
        Signed;
        Length = "13";
        SType = "Currency";
        Label = "Premium Deposit Funds Average Balance";
    }

    INOUT MIR-POL-PDF-INT-AMT
    {
#M245B2 CHANGES START HERE    
#M271O1 CHANGES START HERE CHANGING CURRENCY CODE  
      # CurrencyCode = "MIR-POL-CRCY-CD";
        CurrencyCode = "MIR-PREM-CRCY-CD";
#M271O1 CHANGES END HERE 
#M245B2 CHANGES END HERE 
        Signed;
        Length = "11";
        SType = "Currency";
        Label = "Interest Accrued on Premium Deposit Funds";
    }

    INOUT MIR-POL-PDF-INT-RT
    {
        Signed;
        Length = "5";
        Decimals = "5";
        SType = "Percent";
        Label = "Premium Deposit Funds Interest Rate";
    }

    INOUT MIR-POL-PD-TO-DT-NUM
    {
        Length = "10";
        SType = "Text";
        Label = "Paid to Date";
    }

    INOUT MIR-POL-PREM-SUSP-AMT
    {
#M245B2 CHANGES START HERE  
#M271O1 CHANGES START HERE CHANGING CURRENCY CODE  
      # CurrencyCode = "MIR-POL-CRCY-CD";
        CurrencyCode = "MIR-PREM-CRCY-CD";
#M271O1 CHANGES END HERE 
#M245B2 CHANGES END HERE 
        Signed;
        Length = "17";
        SType = "Currency";
        Label = "Premium Suspense";
    }

    INOUT MIR-POL-PREM-SUSP-DT
    {
        Length = "10";
        SType = "Date";
        Label = "Premium Suspense Account Last Updated";
    }

    INOUT MIR-POL-PREV-ANNV-DUR
    {
        Length = "3";
        SType = "Text";
        Label = "Last Anniversary Duration";
    }

    INOUT MIR-POL-PREV-DIV-DUR
    {
        Length = "3";
        SType = "Text";
        Label = "Dividend Duration";
    }

    INOUT MIR-POL-PREV-FACE-AMT
    {
#M245B2 CHANGES START HERE    
        CurrencyCode = "MIR-POL-CRCY-CD";
#M245B2 CHANGES END HERE 
        Signed;
        Length = "15";
        SType = "Currency";
        Label = "Original Face Amount";
    }

    INOUT MIR-POL-PREV-MODE-CD
    {
        Length = "2";
        CodeSource = "DataModel";
        CodeType = "POL-PREV-MODE-CD";
        SType = "Selection";
        Label = "Last Premium Mode";
    }

    INOUT MIR-POL-PREV-MODE-FCT
    {
        Signed;
        Length = "9";
        Decimals = "7";
        SType = "Number";
        Label = "Last Mode Factor";
    }

    INOUT MIR-POL-PREV-PFEE-FCT
    {
        Signed;
        Length = "9";
        Decimals = "7";
        SType = "Number";
        Label = "Last Policy Fee Factor";
    }

    INOUT MIR-POL-PREV-PSUR-AMT
    {
#M245B2 CHANGES START HERE    
        CurrencyCode = "MIR-POL-CRCY-CD";
#M245B2 CHANGES END HERE 
        Signed;
        Length = "15";
        SType = "Currency";
        Label = "Total Surrenders for All Coverages - Previous Period";
    }

    INOUT MIR-POL-PREV-RESET-YR
    {
        Length = "4";
        SType = "Year";
        Label = "Year";
    }

    INOUT MIR-POL-REG-TOT-AMT
    {
#M245B2 CHANGES START HERE    
        CurrencyCode = "MIR-POL-CRCY-CD";
#M245B2 CHANGES END HERE 
        Signed;
        Length = "13";
        SType = "Currency";
        Label = "Total Registered Savings Amount";
    }

    INOUT MIR-POL-RRIF-MNPMT-AMT
    {
#M245B2 CHANGES START HERE    
        CurrencyCode = "MIR-POL-CRCY-CD";
#M245B2 CHANGES END HERE 
        Signed;
        Length = "13";
        SType = "Currency";
        Label = "Minimum Payment";
    }

    INOUT MIR-POL-SURR-LOAN-AMT
    {
#M245B2 CHANGES START HERE    
        CurrencyCode = "MIR-POL-CRCY-CD";
#M245B2 CHANGES END HERE 
        Signed;
        Length = "15";
        SType = "Currency";
        Label = "Surrendered Loan Amount";
    }

    INOUT MIR-POL-TOT-AFR-AMT
    {
#M245B2 CHANGES START HERE    
        CurrencyCode = "MIR-POL-CRCY-CD";
#M245B2 CHANGES END HERE 
        Signed;
        Length = "15";
        SType = "Currency";
        Label = "Previous Face Amount Decreases";
    }

    INOUT MIR-POL-TOT-BILL-AMT
    {
#M245B2 CHANGES START HERE    
#M319O1 CHANGES START HERE
      # CurrencyCode = "MIR-POL-CRCY-CD";
        CurrencyCode = "MIR-PMT-CRCY-CD";
#M319O1 CHANGES END HERE
#M245B2 CHANGES END HERE 
        Signed;
        Length = "15";
        SType = "Currency";
        Label = "Amount Billed";
    }

    INOUT MIR-POL-TRMN-PUA-AMT
    {
#M245B2 CHANGES START HERE    
        CurrencyCode = "MIR-POL-CRCY-CD";
#M245B2 CHANGES END HERE 
        Signed;
        Length = "15";
        SType = "Currency";
        Label = "Surrendered Paid-up Additions";
    }

    INOUT MIR-PREV-BILL-TYP-CD
    {
        Length = "1";
        CodeSource = "DataModel";
        CodeType = "POL-BILL-TYP-CD";
        SType = "Selection";
        Label = "Last Billing Type";
    }

    INOUT MIR-PREV-PD-TO-DT-NUM
    {
        Length = "10";
        SType = "Text";
        Label = "Last Paid to Date";
    }

    INOUT MIR-PUA-LTD-FACE-AMT
    {
#M245B2 CHANGES START HERE    
        CurrencyCode = "MIR-POL-CRCY-CD";
#M245B2 CHANGES END HERE 
        Signed;
        Length = "15";
        SType = "Currency";
        Label = "Total Paid-up Additions";
    }

    INOUT MIR-PUA-YTD-FACE-AMT
    {
#M245B2 CHANGES START HERE    
        CurrencyCode = "MIR-POL-CRCY-CD";
#M245B2 CHANGES END HERE 
        Signed;
        Length = "15";
        SType = "Currency";
        Label = "Current Paid-up Additions";
    }

    INOUT MIR-REG-CNTRB-1-AMT-T[2]
    {
#M245B2 CHANGES START HERE    
        CurrencyCode = "MIR-POL-CRCY-CD";
#M245B2 CHANGES END HERE 
        Signed;
        Length = "13";
        FieldGroup = "Table2";
        SType = "Currency";
        Label = "Contributions: March - December";
        Index = "1";
    }

    INOUT MIR-REG-CNTRB-2-AMT-T[2]
    {
#M245B2 CHANGES START HERE    
        CurrencyCode = "MIR-POL-CRCY-CD";
#M245B2 CHANGES END HERE 
        Signed;
        Length = "13";
        FieldGroup = "Table2";
        SType = "Currency";
        Label = "Contributions: January - February";
        Index = "1";
    }

    INOUT MIR-REG-CNTRB-RECPT-DT
    {
        Length = "10";
        SType = "Date";
        Label = "Last Receipt Requested Date";
    }

    INOUT MIR-REG-CNTRB-SPCL-AMT-T[2]
    {
#M245B2 CHANGES START HERE    
        CurrencyCode = "MIR-POL-CRCY-CD";
#M245B2 CHANGES END HERE 
        Signed;
        Length = "13";
        FieldGroup = "Table2";
        SType = "Currency";
        Label = "Special Receipt Amount";
        Index = "1";
    }

    INOUT MIR-REG-CNTRB-XFER-DT
    {
        Length = "10";
        SType = "Date";
        Label = "Contribution / Transfer Date";
    }

    INOUT MIR-REG-RECPT-1-AMT-T[2]
    {
#M245B2 CHANGES START HERE    
        CurrencyCode = "MIR-POL-CRCY-CD";
#M245B2 CHANGES END HERE 
        Signed;
        Length = "13";
        FieldGroup = "Table2";
        SType = "Currency";
        Label = "Amount Receipted: March - December";
        Index = "1";
    }

    INOUT MIR-REG-RECPT-2-AMT-T[2]
    {
#M245B2 CHANGES START HERE    
        CurrencyCode = "MIR-POL-CRCY-CD";
#M245B2 CHANGES END HERE 
        Signed;
        Length = "13";
        FieldGroup = "Table2";
        SType = "Currency";
        Label = "Amount Receipted: January - February";
        Index = "1";
    }

    INOUT MIR-RRIF-MNPMT-PYR-AMT
    {
#M245B2 CHANGES START HERE    
        CurrencyCode = "MIR-POL-CRCY-CD";
#M245B2 CHANGES END HERE 
        Signed;
        Length = "13";
        SType = "Currency";
        Label = "Previous Year";
    }

    INOUT MIR-SFB-NEG-SUSP-IND
    {
        Length = "1";
        SType = "Indicator";
        Label = "Negative premium suspense is allowed";
    }

    INOUT MIR-SFB-NEG-SUSP-QTY
    {
        Length = "2";
        SType = "Text";
        Label = "Negative Premium Limit";
    }

    INOUT MIR-SFB-NXT-BILL-AMT
    {
#M245B2 CHANGES START HERE    
#M319O1 CHANGES START HERE
      # CurrencyCode = "MIR-POL-CRCY-CD";
        CurrencyCode = "MIR-PMT-CRCY-CD";
#M319O1 CHANGES END HERE
#M245B2 CHANGES END HERE 
        Signed;
        Length = "15";
        SType = "Currency";
        Label = "Current Billing Amount";
    }

    INOUT MIR-SURR-DIV-ACUM-AMT
    {
#M245B2 CHANGES START HERE    
        CurrencyCode = "MIR-POL-CRCY-CD";
#M245B2 CHANGES END HERE 
        Signed;
        Length = "15";
        SType = "Currency";
        Label = "Surrendered Accumulated Dividends on Deposit";
    }

    INOUT MIR-TRMN-PUA-REASN-CD
    {
        Length = "1";
        SType = "Text";
        Label = "Paid-up Additions Termination Reason";
    }

    INOUT MIR-UL-LAPS-NOTI-AMT
    {
#M245B2 CHANGES START HERE    
        CurrencyCode = "MIR-POL-CRCY-CD";
#M245B2 CHANGES END HERE 
        Signed;
        Length = "13";
        SType = "Currency";
        Label = "Reactivate Policy Amount";
    }

    INOUT MIR-XHBT-CRNT-LOC-CD
    {
        Length = "2";
        CodeSource = "CTLC";
        CodeType = "CLOC";
        FilterFields = "1";
        FilterField1 = "MIR-USER-SESN-CTRY-CD";
        SType = "Selection";
        Label = "Exhibit Current Location";
    }

    INOUT MIR-XHBT-ISS-LOC-CD
    {
        Length = "2";
        CodeSource = "CTLC";
        CodeType = "ILOC";
        FilterFields = "1";
        FilterField1 = "MIR-USER-SESN-CTRY-CD";
        SType = "Selection";
        Label = "Exhibit Issue Location";
    }

    INOUT MIR-NXT-FND-SRVBEN-DT
    {
        Length = "10";
        SType = "Date";
        Label = "Next Fund Survivorship Benefit Date";
    }

    INOUT MIR-PREV-BILL-NOTI-DT
    {
        Length = "10";
        SType = "Date";
        Label = "Last Billing Notice Date";
    }

    INOUT MIR-CBB-LST-PD-YR
    {
        Length = "4";
        SType = "Text";
        Label = "Cash Back Bonus Year Last Paid";
    }

    INOUT MIR-CBB-RBB-LST-PD-AMT
    {
#M245B2 CHANGES START HERE    
        CurrencyCode = "MIR-POL-CRCY-CD";
#M245B2 CHANGES END HERE 
        Signed;
#M245B2 CHANGES START HERE        
#        Length = "15";
        Length = "16";
#M245B2 CHANGES END HERE 
        SType = "Currency";
        Label = "Cash Back Bonus Rate Banding Amount Last Paid";
    }

    INOUT MIR-CBB-RBB-LTD-PD-AMT
    {
#M245B2 CHANGES START HERE    
        CurrencyCode = "MIR-POL-CRCY-CD";
#M245B2 CHANGES END HERE 
        Signed;
#M245B2 CHANGES START HERE         
#        Length = "17";
         Length = "18";  
#M245B2 CHANGES END HERE 
        SType = "Currency";
        Label = "Cash Back Bonus Rate Banding Total Paid";
    }

    INOUT MIR-CBB-CMB-LST-PD-AMT
    {
#M245B2 CHANGES START HERE    
        CurrencyCode = "MIR-POL-CRCY-CD";
#M245B2 CHANGES END HERE 
        Signed;
#M245B2 CHANGES START HERE        
#        Length = "15";
        Length = "16";
#M245B2 CHANGES END HERE 
        SType = "Currency";
        Label = "Cash Back Bonus Collection Method Amount Last Paid";
    }

    INOUT MIR-CBB-CMB-LTD-PD-AMT
    {
#M245B2 CHANGES START HERE    
        CurrencyCode = "MIR-POL-CRCY-CD";
#M245B2 CHANGES END HERE 
        Signed;
#M245B2 CHANGES START HERE         
#        Length = "17";
         Length = "18";  
#M245B2 CHANGES END HERE 
        SType = "Currency";
        Label = "Cash Back Bonus Collection Method Total Paid";
    }

    INOUT MIR-CBB-MRB-LST-PD-AMT
    {
#M245B2 CHANGES START HERE    
        CurrencyCode = "MIR-POL-CRCY-CD";
#M245B2 CHANGES END HERE 
        Signed;
#M245B2 CHANGES START HERE        
#        Length = "15";
        Length = "16";
#M245B2 CHANGES END HERE 
        SType = "Currency";
        Label = "Cash Back Bonus Medical Rider Amount Last Paid";
    }

    INOUT MIR-CBB-MRB-LTD-PD-AMT
    {
#M245B2 CHANGES START HERE    
        CurrencyCode = "MIR-POL-CRCY-CD";
#M245B2 CHANGES END HERE 
        Signed;
#M245B2 CHANGES START HERE         
#        Length = "17";
         Length = "18";  
#M245B2 CHANGES END HERE 
        SType = "Currency";
        Label = "Cash Back Bonus Medical Rider Total Paid";
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

    IN MIR-DV-OWN-CLI-NM
    {
        DisplayOnly;
        Length = "75";
        SType = "Text";
        Label = "Owner Name";
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

    INOUT MIR-CNCL-SA-XFER-IND
    {
        Length = "1";
        SType = "Indicator";
        Label = "Cancel SA Transfer";
    }
    
# Changes for NWLBCA starts here
    INOUT MIR-OVR-SHRT-PREM-AMT
    {
#M245B2 CHANGES START HERE  
#M271O1 CHANGES START HERE CHANGING CURRENCY CODE  
      # CurrencyCode = "MIR-POL-CRCY-CD";
#M319O1 CHANGES START HERE
      # CurrencyCode = "MIR-PREM-CRCY-CD";
#FFF10R CHANGES STARTS HERE      
      # CurrencyCode = "MIR-PMT-CRCY-CD"; 
        CurrencyCode = "MIR-OVR-SHRT-PREM-CRCY-CD"; 
#FFF10R CHANGES ENDS HERE
#M319O1 CHANGES END HERE
#M271O1 CHANGES END HERE 
#M245B2 CHANGES END HERE 
        Signed;
#M245B2 CHANGES START HERE        
#        Length = "15";
        Length = "16";
#M245B2 CHANGES END HERE 
        DBTableName = "TPOL";
        SType = "Currency";
        Label = "Over/Short Premium";
    }
    
    INOUT MIR-OVR-SHRT-PREM-DT
    {
        Length = "10";
        DBTableName = "TPOL";
        SType = "Date";
        Label = "Over Short Premium Last Updated";
    }
# Changes for NWLBCA ends here
# Changes for NWLLRP starts here
    INOUT MIR-LOAN-XCES-SHRT-AMT
    {
#M245B2 CHANGES START HERE    
#M319O1 CHANGES START HERE
      # CurrencyCode = "MIR-POL-CRCY-CD";  
        CurrencyCode = "MIR-PMT-CRCY-CD";     
#M319O1 CHANGES END HERE
#M245B2 CHANGES END HERE 
        Signed;
        Length = "13";
        DBTableName = "TPOL";
        SType = "Currency";
        Label = "Excess / Short Loan Interest";
    }

    INOUT MIR-LOAN-XCES-SHRT-DT
    {
        Length = "10";
        DBTableName = "TPOL";
        SType = "Date";
        Label = "Excess /  Short Loan Interest Account  Last Updated";
    }
# Changes for NWLLRP ends here
# M161CA CHANGES STARTS HERE    
    
    INOUT MIR-CRC-RECV-AMT
    {
#M245B2 CHANGES START HERE    
#Q60885 CHANGES START HERE
        #CurrencyCode = "MIR-POL-CRCY-CD";
#Q88344 CHANGES START HERE
      # CurrencyCode = "MIR-PREM-CRCY-CD";      
        CurrencyCode = "MIR-PMT-CRCY-CD";        
#Q88344 CHANGES END HERE
#Q60885 CHANGES END HERE         
#        Length = "17";
         Length = "18";
#M245B2 CHANGES END HERE  
        DBTableName = "TPOL";
        SType = "Currency";
        Label = "Receivable Amount";
    }
    INOUT MIR-CRC-RECV-UPDT-DT
    {
        Length = "10";
        DBTableName = "TPOL";
        SType = "Date";
        Label = "Receivable Account Last Updated";
    }
    
# M161CA CHANGES END HERE
    
# C15454 changes begin
 
 INOUT MIR-DSASTR-LAPS-DT
    {
        Length = "10";
        DBTableName = "TPOL";
        SType = "Date";
        Label = "Disaster Lapse Date";
    }    
# C15454 changes end

    # R14127 changes begin
    
        INOUT MIR-DSASTR-CD
        {
            Length = "1";
            CodeSource = "EDIT";
            CodeType = "DSAST";
            SType = "Text";
            Label = "Disaster Code";
        } 
    
        INOUT MIR-DSASTR-SUB-CD
        {
            Length = "2";        
            CodeSource = "EDIT";
            CodeType = "DSTSB";
            SType = "Selection";
            Label = "Disaster Sub Code";
        }    
    # R14127 changes end
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
#M271O1 CHANGES START HERE  
         
    INOUT MIR-PREM-CRCY-CD
    {
        Length = "2";
        SType = "Hidden";
        Label = "Currency";
    }  
#M271O1 CHANGES END HERE 
#UYS133 CHANGES START
    INOUT MIR-PD-GR-TYP-CD
    {
        Length = "1";
        CodeSource = "DataModel";
        CodeType = "PD-GR-TYP-CD";
        SType = "Text";
        Label = "PD group size";
    }
#UYS133 CHANGES END

#S45969 CHANGES START

    INOUT MIR-STR3-ERR-CD
    {
        Length = "1";
        CodeSource = "DataModel";
        CodeType = "STR3-ERR-CD";
        SType = "Selection";
        Label = "STREAM 3 Error";
    }

#S45969 CHANGES ENDS
}