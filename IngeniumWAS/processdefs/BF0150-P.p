# Converted from PathFinder 2.2 to 3.0 Jun 18, 2004 3:13:17 PM EDT

#*******************************************************************************
#*  Component:   BF0150-P.p                                                    *
#*  Description:                                                               *
#*                                                                             *
#*******************************************************************************
#*  Chg#    Release  Description                                               *
#*                                                                             *
#*  014590  6.0      New for release 6.0                                       *
#*  016109  6.02J    Free Fund Transfer Provision                              *
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
#*                      OS-DISB-SURR-AMT, OS-DISB-MAT-AMT, OS-DISB-DTH-AMT     *
#*                      OS-DISB-CLM-AMT, OS-DISB-AD-AMT                        *
#*                      OS-DISB-SURR-DT, OS-DISB-MAT-DT, OS-DISB-DTH-DT        *
#*                      OS-DISB-CLM-DT, OS-DISB-AD-DT                          *
#*  NWLBCA  CTS      ADDED FOLLOWING FIELDS FOR TRAD POLICIES PROCESSING:      *
#*                      MIR-OVR-SHRT-PREM-AMT                                  *
#*                      MIR-OVR-SHRT-PREM-DT                                   *
#*  NWLLRP  CTS      ADDED FOLLOWING FIELDS FOR LOAN REPAYMENT:                *
#*                      MIR-LOAN-XCES-SHRT-AMT                                 *
#*                      MIR-LOAN-XCES-SHRT-DT                                  *
#*  NWLLTC  CTS      CHANGES DONE TO ADD NEW FIELDS FOR LOAN PROCESSING        *
#*  M161CA   CTS      Additional items for the Credit card processing          *
#*  C15454  CTS      ADDED DISASTER LAPSE DATE                                 *
#*  M245B2  CTS      Foreign Currency Formatting 			       *
#*  MP245R  CTS      CHANGES FOR DISBURSEMENT CURRENCY CODE       	       *
#*  Q50535  CTS      FIX AS PART OF M245B2                                     *
#*  R10428  CTS      RLSE0010428 - SCREEN CHANGE - PROTECTED POLICY UPDATE     *
#*                   SCREEN                                                    *
#*  M271O1  CTS      FRA Foreign Currency Formatting 			       *
#*  M271A7  CTS      Online Screen Changes done as part of FRA                 *
#*  R14127  CTS      CHANGES FOR DISASTER RECOVERY                             *
#*  118598  CTS      CHANGES DONE TO CORRECT THE FIELD PREMIUM PAYMENT         *
#*  118598           DESCRIPTION                                               *
#*  FFF10R  CTS      CHANGES DONE FOR CC SUSPENSE HANDLING                     *
#*  UYS025  CTS      ADVANCE PAYMENT RESERVE AMOUNT FIELD ADDED                *
#*  UYS133  CTS      Addition of PD group size field                           *
#*******************************************************************************

P-STEP BF0150-P
{
    ATTRIBUTES
    {
        BusinessFunctionId = "0150";
        BusinessFunctionName = "Protected Policy Retrieve";
        BusinessFunctionType = "Retrieve";
        MirName = "CCWM0151";
    }

    OUT LSIR-RETURN-CD;

    OUT MIR-RETRN-CD;

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

    OUT MIR-AFR-THRSHD-PERI-CD
    {
        Length = "1";
        CodeSource = "DataModel";
        CodeType = "AFR-THRSHD-PERI-CD";
        DBTableName = "TPOL";
        SType = "Text";
        Label = "Threshold Period";
    }

    OUT MIR-CASL-PMT-PYR-AMT
    {
        Signed;
        Length = "15";
        DBTableName = "TPOL";
        SType = "Currency";
        Label = "Previous Year's Casual Payment";
    }

    OUT MIR-CASL-PMT-YTD-AMT
    {
        Signed;
        Length = "15";
        DBTableName = "TPOL";
        SType = "Currency";
        Label = "Casual Payments Year to Date";
    }

    OUT MIR-DIV-DCLR-LTD-AMT
    {
        Signed;
        Length = "15";
        DBTableName = "TPOL";
        SType = "Currency";
        Label = "Total Dividends Declared";
    }

    OUT MIR-DIV-DCLR-YTD-AMT
    {
        Signed;
        Length = "13";
        DBTableName = "TPOL";
        SType = "Currency";
        Label = "Dividends Declared Year to Date";
    }

    OUT MIR-DOD-CRNT-INT-AMT
    {
        Signed;
        Length = "11";
        DBTableName = "TPOL";
        SType = "Currency";
        Label = "Dividends on Deposit Interest";
    }

    OUT MIR-DV-OWN-CLI-NM
    {
        Length = "75";
        DBTableName = "Derived";
        SType = "Text";
        Label = "Owner Name";
    }

    OUT MIR-FREE-WTHDR-CD
    {
        Length = "1";
        CodeSource = "DataModel";
        CodeType = "FREE-WTHDR-CD";
        DBTableName = "TPOL";
        SType = "Text";
        Label = "Free Withdrawal";
    }

    OUT MIR-FREE-WTHDR-PERI-CD
    {
        Length = "1";
        CodeSource = "DataModel";
        CodeType = "FREE-WTHDR-PERI-CD";
        DBTableName = "TPOL";
        SType = "Text";
        Label = "Free Withdrawals - Period";
    }

    OUT MIR-FREE-WTHDR-QTY
    {
        Length = "3";
        DBTableName = "TPOL";
        SType = "Text";
        Label = "Free Withdrawals - Number Remaining";
    }

    OUT MIR-FREE-WTHDR-TOT-AMT
    {
        Signed;
        Length = "15";
        DBTableName = "TPOL";
        SType = "Currency";
        Label = "Free Withdrawal - Amount Taken";
    }

    OUT MIR-FREE-WTHDR-DUR
    {
        Length = "3";
        DBTableName = "TPOL";
        SType = "Text";
        Label = "Free Withdrawal Duration";
    }

    OUT MIR-FREE-WTHDR-DT
    {
        Length = "10";
        DBTableName = "TPOL";
        SType = "Date";
        Label = "Last Free Withdrawal Date";
    }

    OUT MIR-FREE-XFER-CD
    {
        Length = "1";
        CodeSource = "DataModel";
        CodeType = "PLAN-FREE-XFER-CD";
        DBTableName = "TPOL";
        SType = "Text";
        Label = "Free Transfer";
    }

    OUT MIR-FREE-XFER-PERI-CD
    {
        Length = "1";
        CodeSource = "DataModel";
        CodeType = "FREE-XFER-PERI-CD";
        DBTableName = "TPOL";
        SType = "Text";
        Label = "Free Transfers - Period";
    }

    OUT MIR-FREE-XFER-QTY
    {
        Length = "2";
        DBTableName = "TPOL";
        SType = "Text";
        Label = "Free Transfers - Number Remaining";
    }

    OUT MIR-FREE-XFER-TOT-AMT
    {
        Signed;
        Length = "15";
        DBTableName = "TPOL";
        SType = "Currency";
        Label = "Free Transfer - Amount Taken";
    }

    OUT MIR-LIF-MXPMT-PYR-AMT
    {
        Signed;
        Length = "13";
        DBTableName = "TPOL";
        SType = "Currency";
        Label = "Previous Year - Maximum Payment Allowed";
    }

    OUT MIR-LOAN-AMT-T[3]
    {
        Signed;
        Length = "15";
        FieldGroup = "Table3";
        DBTableName = "TPOLL";
        SType = "Currency";
        Label = "Total Policy Loan";
        Index = "1";
    }

    OUT MIR-LOAN-ANNV-AMT-T[3]
    {
        Signed;
        Length = "15";
        FieldGroup = "Table3";
        DBTableName = "TPOLL";
        SType = "Currency";
        Label = "Anniversary Loan Balance";
        Index = "1";
    }

    OUT MIR-LOAN-AVB-AMT-T[3]
    {
        Signed;
        Length = "15";
        FieldGroup = "Table3";
        DBTableName = "TPOLL";
        SType = "Currency";
        Label = "Average Loan Balance";
        Index = "1";
    }

    OUT MIR-LOAN-DT-T[3]
    {
        Length = "10";
        FieldGroup = "Table3";
        KeyColumn;
        DBTableName = "TPOLL";
        SType = "Date";
        Label = "Effective Date";
        Index = "1";
    }

    OUT MIR-LOAN-INT-BILL-AMT-T[3]
    {
        Signed;
        Length = "13";
        FieldGroup = "Table3";
        DBTableName = "TPOLL";
        SType = "Currency";
        Label = "Loan Interest Billed";
        Index = "1";
    }

    OUT MIR-LOAN-INT-MAX-RT-T[3]
    {
        Length = "5";
        Decimals = "5";
        FieldGroup = "Table3";
        DBTableName = "TPOLL";
        SType = "Percent";
        Label = "Maximum Loan Interest Rate";
        Index = "1";
    }

    OUT MIR-LOAN-INT-RT-T[3]
    {
        Length = "5";
        Decimals = "5";
        FieldGroup = "Table3";
        DBTableName = "TPOLL";
        SType = "Percent";
        Label = "Loan Interest Rate";
        Index = "1";
    }

    OUT MIR-LOAN-INT-TYP-CD-T[3]
    {
        Length = "1";
        FieldGroup = "Table3";
        CodeSource = "DataModel";
        CodeType = "LOAN-INT-TYP-CD";
        DBTableName = "TPOLL";
        SType = "Text";
        Label = "Loan Interest Rate Type";
        Index = "1";
    }

    OUT MIR-LOAN-INT-YTD-AMT-T[3]
    {
        Signed;
        Length = "13";
        FieldGroup = "Table3";
        DBTableName = "TPOLL";
        SType = "Currency";
        Label = "Loan Interest Paid / Capitalized Year to Date";
        Index = "1";
    }

    OUT MIR-LOAN-PREV-ANNV-AMT-T[3]
    {
        Signed;
        Length = "15";
        FieldGroup = "Table3";
        DBTableName = "TPOLL";
        SType = "Currency";
        Label = "Previous Anniversary Loan Balance";
        Index = "1";
    }

    OUT MIR-POL-ACCT-PAR-CD
    {
        Length = "1";
        CodeSource = "DataModel";
        CodeType = "POL-ACCT-PAR-CD";
        DBTableName = "TPOL";
        SType = "Text";
        Label = "Dividend Option";
    }

    OUT MIR-POL-AFR-ALLOC-CD
    {
        Length = "1";
        CodeSource = "DataModel";
        CodeType = "POL-AFR-ALLOC-CD";
        DBTableName = "TPOL";
        SType = "Text";
        Label = "Automatic Face Amount Reduction Allocation";
    }

    OUT MIR-POL-AFR-THRSHD-AMT
    {
        Signed;
        Length = "13";
        DBTableName = "TPOL";
        SType = "Currency";
        Label = "Threshold Amount";
    }

    OUT MIR-POL-ANPAYO-LTD-AMT
    {
        Signed;
        Length = "11";
        DBTableName = "TPOL";
        SType = "Currency";
        Label = "Accumulated Payments Life to Date";
    }

    OUT MIR-POL-ANPAYO-PMT-DT
    {
        Length = "10";
        DBTableName = "TPOL";
        SType = "Date";
        Label = "Last Payment Date";
    }

    OUT MIR-POL-ANPAYO-PYR-AMT
    {
        Signed;
        Length = "15";
        DBTableName = "TPOL";
        SType = "Currency";
        Label = "Previous Year's Total Payments";
    }

    OUT MIR-POL-ANPAYO-YTD-AMT
    {
        Signed;
        Length = "15";
        DBTableName = "TPOL";
        SType = "Currency";
        Label = "Accumulated Payments Year to Date";
    }

    OUT MIR-POL-ANTY-SUSP-AMT
    {
        Signed;
        Length = "13";
        DBTableName = "TPOL";
        SType = "Currency";
        Label = "Annuity Suspense";
    }

    OUT MIR-POL-BASE-CVG-NUM
    {
        Length = "2";
        DBTableName = "TPOL";
        SType = "Text";
        Label = "Base Coverage Number";
    }

    OUT MIR-POL-BT-STRT-DT
    {
        Length = "10";
        DBTableName = "TPOL";
        SType = "Date";
        Label = "BT Policy First Draw Date";
    }

    OUT MIR-POL-CRNT-PSUR-AMT
    {
        Signed;
        Length = "15";
        DBTableName = "TPOL";
        SType = "Currency";
        Label = "Total Surrenders for All Coverages - Current Period";
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

    OUT MIR-POL-DIV-SUSP-AMT
    {
        Signed;
        Length = "13";
        DBTableName = "TPOL";
        SType = "Currency";
        Label = "Dividend Suspense";
    }

    OUT MIR-POL-DOD-ACUM-AMT
    {
        Signed;
        Length = "15";
        DBTableName = "TPOL";
        SType = "Currency";
        Label = "Dividends on Deposit";
    }

    OUT MIR-POL-DOD-AVB-AMT
    {
        Signed;
        Length = "15";
        DBTableName = "TPOL";
        SType = "Currency";
        Label = "Dividend Average Balance";
    }

    OUT MIR-POL-DOD-INT-RT
    {
        Signed;
        Length = "5";
        Decimals = "5";
        DBTableName = "TPOL";
        SType = "Percent";
        Label = "Current Dividend Interest Rate";
    }

    OUT MIR-POL-GL-ACCT-TYP-CD
    {
        Length = "1";
        DBTableName = "TPOL";
        SType = "Text";
        Label = "Policy Account Type";
    }

    OUT MIR-POL-LIF-MXPMT-AMT
    {
        Signed;
        Length = "13";
        DBTableName = "TPOL";
        SType = "Currency";
        Label = "Maximum Payment (LIF Policy)";
    }

    OUT MIR-POL-LOCK-FND-IND
    {
        Length = "1";
        DBTableName = "TPOL";
        SType = "Indicator";
        Label = "Policy has locked-in funds";
    }

    OUT MIR-POL-MISC-SUSP-AMT
    {
        Signed;
        Length = "17";
        DBTableName = "TPOL";
        SType = "Currency";
        Label = "Miscellaneous Suspense";
    }

    OUT MIR-POL-MISC-SUSP-DT
    {
        Length = "10";
        DBTableName = "TPOL";
        SType = "Date";
        Label = "Miscellaneous Suspense Account Last Updated";
    }

    OUT MIR-POL-OS-DISB-AMT
    {
        Signed;
        Length = "17";
        DBTableName = "TPOL";
        SType = "Currency";
        Label = "Outstanding Disbursements";
    }

    OUT MIR-POL-OS-DISB-DT
    {
        Length = "10";
        DBTableName = "TPOL";
        SType = "Date";
        Label = "Outstanding Disbursements Account Last Updated";
    }
 
    OUT MIR-OS-DISB-SURR-AMT
    {
        Signed;
        Length = "17";
        DBTableName = "TPOL";
        SType = "Currency";
        Label = "Outstanding Disbursements - Surrender";
    }

    OUT MIR-OS-DISB-SURR-DT
    {
        Length = "10";
        DBTableName = "TPOL";
        SType = "Date";
        Label = "Outstanding Disbursements Surrender Date";
    }

    OUT MIR-OS-DISB-MAT-AMT
    {
        Signed;
        Length = "17";
        DBTableName = "TPOL";
        SType = "Currency";
        Label = "Outstanding Disbursements - Maturity";
    }

    OUT MIR-OS-DISB-MAT-DT
    {
        Length = "10";
        DBTableName = "TPOL";
        SType = "Date";
        Label = "Outstanding Disbursements Maturity Date";
    }

    OUT MIR-OS-DISB-DTH-AMT
    {
        Signed;
        Length = "17";
        DBTableName = "TPOL";
        SType = "Currency";
        Label = "Outstanding Disbursements - Death";
    }

    OUT MIR-OS-DISB-DTH-DT
    {
        Length = "10";
        DBTableName = "TPOL";
        SType = "Date";
        Label = "Outstanding Disbursements Death Date";
    }

    OUT MIR-OS-DISB-CLM-AMT
    {
        Signed;
        Length = "17";
        DBTableName = "TPOL";
        SType = "Currency";
        Label = "Outstanding Disbursements - Claims";
    }

    OUT MIR-OS-DISB-CLM-DT
    {
        Length = "10";
        DBTableName = "TPOL";
        SType = "Date";
        Label = "Outstanding Disbursements Claims Date";
    }

    OUT MIR-OS-DISB-AD-AMT
    {
        Signed;
        Length = "17";
        DBTableName = "TPOL";
        SType = "Currency";
        Label = "Outstanding Disbursements - Accidental Death";
    }

    OUT MIR-OS-DISB-AD-DT
    {
        Length = "10";
        DBTableName = "TPOL";
        SType = "Date";
        Label = "Outstanding Disbursements Accidental Death Date";
    }
#NWLLTC CHANGES STARTS HERE
    OUT MIR-OS-DISB-LOAN-AMT
    {
        Signed;
        Length = "15";
        DBTableName = "TPOL";
        SType = "Currency";
        Label = "Outstanding Disbursements - Loan";
    }
#M271A7 CHANGES START HERE  
    
    OUT MIR-OS-DISB-RFND-AMT
    {
        Signed;
    	Length = "15";
    	DBTableName = "TPOL";
    	SType = "Currency";
        Label = "OS Disb - JPY Premium";
    }

    OUT MIR-OS-DISB-RFND-DT
    {
    	Length = "10";
    	DBTableName = "TPOL";
    	SType = "Date";
        Label = "OS Disb - JPY Premium Last Updated";
    }

#M271A7 CHANGES END HERE
    OUT MIR-OS-DISB-LOAN-DT
    {
        Length = "10";
        DBTableName = "TPOL";
        SType = "Date";
        Label = "Outstanding Disbursements Loan Date";
    }
#NWLLTC CHANGES ENDS HERE
    OUT MIR-POL-BT-SUSP-AMT
    {
        Signed;
        Length = "13";
        DBTableName = "TPOL";
        SType = "Currency";
        Label = "Bank Transfer Suspense";
    }

    OUT MIR-POL-BT-SUSP-DT
    {
        Length = "10";
        DBTableName = "TPOL";
        SType = "Date";
        Label = "Bank Transfer Suspense Account Last Updated";
    }

    OUT MIR-POL-PD-SUSP-AMT
    {
        Signed;
        Length = "13";
        DBTableName = "TPOL";
        SType = "Currency";
        Label = "Payroll Deduction Suspense";
    }

    OUT MIR-POL-PD-SUSP-DT
    {
        Length = "10";
        DBTableName = "TPOL";
        SType = "Date";
        Label = "Payroll Deduction Suspense Account Last Updated";
    }

    OUT MIR-POL-CC-SUSP-AMT
    {
        Signed;
        Length = "13";
        DBTableName = "TPOL";
        SType = "Currency";
        Label = "Cash Collection Suspense";
    }

    OUT MIR-POL-CC-SUSP-DT
    {
        Length = "10";
        DBTableName = "TPOL";
        SType = "Date";
        Label = "Cash Collection Suspense Account Last Updated";
    }

    OUT MIR-POL-OYT-AMT
    {
        Length = "13";
        Decimals = "0";
        DBTableName = "TPOL";
        SType = "Currency";
        Label = "One Year Term Purchased with Dividend";
    }

    OUT MIR-POL-PAC-DRW-DT
    {
        Length = "10";
        DBTableName = "TPOL";
        SType = "Date";
        Label = "Deposit Date";
    }

    OUT MIR-POL-PAR-CVG-NUM
    {
        Length = "2";
        DBTableName = "TPOL";
        SType = "Text";
        Label = "First Par Coverage Number";
    }

    OUT MIR-POL-PDF-AMT
    {
        Signed;
        Length = "13";
        DBTableName = "TPOL";
        SType = "Currency";
        Label = "Premium Deposit Funds";
    }

    OUT MIR-POL-PDF-AVB-AMT
    {
        Signed;
        Length = "13";
        DBTableName = "TPOL";
        SType = "Currency";
        Label = "Premium Deposit Funds Average Balance";
    }

    OUT MIR-POL-PDF-INT-AMT
    {
        Signed;
        Length = "11";
        DBTableName = "TPOL";
        SType = "Currency";
        Label = "Interest Accrued on Premium Deposit Funds";
    }

    OUT MIR-POL-PDF-INT-RT
    {
        Signed;
        Length = "5";
        Decimals = "5";
        DBTableName = "TPOL";
        SType = "Percent";
        Label = "Premium Deposit Funds Interest Rate";
    }

    OUT MIR-POL-PD-TO-DT-NUM
    {
        Length = "10";
        DBTableName = "TPOL";
        SType = "Text";
        Label = "Paid to Date";
    }

    OUT MIR-POL-PREM-SUSP-AMT
    {
        Signed;
        Length = "17";
        DBTableName = "TPOL";
        SType = "Currency";
        Label = "Premium Suspense";
    }

    OUT MIR-POL-PREM-SUSP-DT
    {
        Length = "10";
        DBTableName = "TPOL";
        SType = "Date";
        Label = "Premium Suspense Account Last Updated";
    }

    OUT MIR-POL-PREV-ANNV-DUR
    {
        Length = "3";
        DBTableName = "TPOL";
        SType = "Text";
        Label = "Last Anniversary Duration";
    }

    OUT MIR-POL-PREV-DIV-DUR
    {
        Length = "3";
        DBTableName = "TPOL";
        SType = "Text";
        Label = "Dividend Duration";
    }

    OUT MIR-POL-PREV-FACE-AMT
    {
        Signed;
        Length = "15";
        DBTableName = "TPOL";
        SType = "Currency";
        Label = "Original Face Amount";
    }

    OUT MIR-POL-PREV-MODE-CD
    {
        Length = "2";
        CodeSource = "DataModel";
        CodeType = "POL-PREV-MODE-CD";
        DBTableName = "TPOL";
        SType = "Text";
        Label = "Last Premium Mode";
    }

    OUT MIR-POL-PREV-MODE-FCT
    {
        Signed;
        Length = "9";
        Decimals = "7";
        DBTableName = "TPOL";
        SType = "Number";
        Label = "Last Mode Factor";
    }

    OUT MIR-POL-PREV-PFEE-FCT
    {
        Signed;
        Length = "9";
        Decimals = "7";
        DBTableName = "TPOL";
        SType = "Number";
        Label = "Last Policy Fee Factor";
    }

    OUT MIR-POL-PREV-PSUR-AMT
    {
        Signed;
        Length = "15";
        DBTableName = "TPOL";
        SType = "Currency";
        Label = "Total Surrenders for All Coverages - Previous Period";
    }

    OUT MIR-POL-PREV-RESET-YR
    {
        Length = "4";
        DBTableName = "TPOL";
        SType = "Year";
        Label = "Year";
    }

    OUT MIR-POL-REG-TOT-AMT
    {
        Signed;
        Length = "13";
        DBTableName = "TPOL";
        SType = "Currency";
        Label = "Total Registered Savings Amount";
    }

    OUT MIR-POL-RRIF-MNPMT-AMT
    {
        Signed;
        Length = "13";
        DBTableName = "TPOL";
        SType = "Currency";
        Label = "Minimum Payment";
    }

    OUT MIR-POL-SURR-LOAN-AMT
    {
        Signed;
        Length = "15";
        DBTableName = "TPOL";
        SType = "Currency";
        Label = "Surrendered Loan Amount";
    }

    OUT MIR-POL-TOT-AFR-AMT
    {
        Signed;
        Length = "15";
        DBTableName = "TPOL";
        SType = "Currency";
        Label = "Previous Face Amount Decreases";
    }

    OUT MIR-POL-TOT-BILL-AMT
    {
        Signed;
        Length = "15";
        DBTableName = "TPOL";
        SType = "Currency";
        Label = "Amount Billed";
    }

    OUT MIR-POL-TRMN-PUA-AMT
    {
        Signed;
        Length = "15";
        DBTableName = "TPOL";
        SType = "Currency";
        Label = "Surrendered Paid-up Additions";
    }

    OUT MIR-PREV-BILL-TYP-CD
    {
        Length = "1";
        CodeSource = "DataModel";
        CodeType = "POL-BILL-TYP-CD";
        DBTableName = "TPOL";
        SType = "Text";
        Label = "Last Billing Type";
    }

    OUT MIR-PREV-PD-TO-DT-NUM
    {
        Length = "10";
        DBTableName = "TPOL";
        SType = "Text";
        Label = "Last Paid to Date";
    }

    OUT MIR-PUA-LTD-FACE-AMT
    {
        Signed;
        Length = "15";
        DBTableName = "TPOL";
        SType = "Currency";
        Label = "Total Paid-up Additions";
    }

    OUT MIR-PUA-YTD-FACE-AMT
    {
        Signed;
        Length = "15";
        DBTableName = "TPOL";
        SType = "Currency";
        Label = "Current Paid-up Additions";
    }

    OUT MIR-REG-CNTRB-1-AMT-T[2]
    {
        Signed;
        Length = "13";
        FieldGroup = "Table2";
        DBTableName = "TREGC";
        SType = "Currency";
        Label = "Contributions: March - December";
        Index = "1";
    }

    OUT MIR-REG-CNTRB-2-AMT-T[2]
    {
        Signed;
        Length = "13";
        FieldGroup = "Table2";
        DBTableName = "TREGC";
        SType = "Currency";
        Label = "Contributions: January - February";
        Index = "1";
    }

    OUT MIR-REG-CNTRB-RECPT-DT
    {
        Length = "10";
        DBTableName = "TREGC";
        SType = "Date";
        Label = "Last Receipt Requested Date";
    }

    OUT MIR-REG-CNTRB-SPCL-AMT-T[2]
    {
        Signed;
        Length = "13";
        FieldGroup = "Table2";
        DBTableName = "TREGC";
        SType = "Currency";
        Label = "Special Receipt Amount";
        Index = "1";
    }

    OUT MIR-REG-CNTRB-XFER-DT
    {
        Length = "10";
        DBTableName = "TREGC";
        SType = "Date";
        Label = "Contribution / Transfer Date";
    }

    OUT MIR-REG-RECPT-1-AMT-T[2]
    {
        Signed;
        Length = "13";
        FieldGroup = "Table2";
        DBTableName = "TREGC";
        SType = "Currency";
        Label = "Amount Receipted: March - December";
        Index = "1";
    }

    OUT MIR-REG-RECPT-2-AMT-T[2]
    {
        Signed;
        Length = "13";
        FieldGroup = "Table2";
        DBTableName = "TREGC";
        SType = "Currency";
        Label = "Amount Receipted: January - February";
        Index = "1";
    }

    OUT MIR-RRIF-MNPMT-PYR-AMT
    {
        Signed;
        Length = "13";
        DBTableName = "TPOL";
        SType = "Currency";
        Label = "Previous Year";
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

    OUT MIR-SFB-NEG-SUSP-IND
    {
        Length = "1";
        DBTableName = "TSFBL";
        SType = "Indicator";
        Label = "Negative premium suspense is allowed";
    }

    OUT MIR-SFB-NEG-SUSP-QTY
    {
        Length = "2";
        DBTableName = "TSFBL";
        SType = "Text";
        Label = "Negative Premium Limit";
    }

    OUT MIR-SFB-NXT-BILL-AMT
    {
        Signed;
        Length = "15";
        DBTableName = "TSFBL";
        SType = "Currency";
        Label = "Current Billing Amount";
    }

    OUT MIR-SURR-DIV-ACUM-AMT
    {
        Signed;
        Length = "15";
        DBTableName = "TPOL";
        SType = "Currency";
        Label = "Surrendered Accumulated Dividends on Deposit";
    }

    OUT MIR-TRMN-PUA-REASN-CD
    {
        Length = "1";
        DBTableName = "TPOL";
        SType = "Text";
        Label = "Paid-up Additions Termination Reason";
    }

    OUT MIR-UL-LAPS-NOTI-AMT
    {
        Signed;
        Length = "13";
        DBTableName = "TPOL";
        SType = "Currency";
        Label = "Reactivate Policy Amount";
    }

    OUT MIR-XHBT-CRNT-LOC-CD
    {
        Length = "2";
        CodeSource = "CTLC";
        CodeType = "CLOC";
        DBTableName = "TPOL";
        SType = "Text";
        Label = "Exhibit Current Location";
    }

    OUT MIR-XHBT-ISS-LOC-CD
    {
        Length = "2";
        CodeSource = "CTLC";
        CodeType = "ILOC";
        DBTableName = "TPOL";
        SType = "Text";
        Label = "Exhibit Issue Location";
    }

    OUT MIR-NXT-FND-SRVBEN-DT
    {
        Length = "10";
        DBTableName = "TPOL";
        SType = "Date";
        Label = "Next Fund Survivorship Benefit Date";
    }
    
    # 118598 changes begin
            
    OUT MIR-PREM-PMT-CMPLT-IND
    {
        Length = "1";
        DBTableName = "TPOL";
        SType = "Indicator";
        Label = "Premium Payment Completion";
     }
        
   # 118598 changes end 

    OUT MIR-PREV-BILL-NOTI-DT
    {
        Length = "10";
        DBTableName = "TPOL";
        SType = "Date";
        Label = "Last Billing Notice Date";
    }

    OUT MIR-CBB-LST-PD-YR
    {
        Length = "4";
        DBTableName = "TPOL";
        SType = "Text";
        Label = "Cash Back Bonus Year Last Paid";
    }

    OUT MIR-CBB-RBB-LST-PD-AMT
    {
        Signed;
        Length = "15";
        DBTableName = "TPOL";
        SType = "Currency";
        Label = "Cash Back Bonus Rate Banding Amount Last Paid";
    }

    OUT MIR-CBB-RBB-LTD-PD-AMT
    {
        Signed;
        Length = "17";
        DBTableName = "TPOL";
        SType = "Currency";
        Label = "Cash Back Bonus Rate Banding Total Paid";
    }

    OUT MIR-CBB-CMB-LST-PD-AMT
    {
        Signed;
        Length = "15";
        DBTableName = "TPOL";
        SType = "Currency";
        Label = "Cash Back Bonus Collection Method Amount Last Paid";
    }

    OUT MIR-CBB-CMB-LTD-PD-AMT
    {
        Signed;
        Length = "17";
        DBTableName = "TPOL";
        SType = "Currency";
        Label = "Cash Back Bonus Collection Method Total Paid";
    }

    OUT MIR-CBB-MRB-LST-PD-AMT
    {
        Signed;
        Length = "15";
        DBTableName = "TPOL";
        SType = "Currency";
        Label = "Cash Back Bonus Medical Rider Amount Last Paid";
    }

    OUT MIR-CBB-MRB-LTD-PD-AMT
    {
        Signed;
        Length = "17";
        DBTableName = "TPOL";
        SType = "Currency";
        Label = "Cash Back Bonus Medical Rider Total Paid";
    }

    OUT MIR-POL-CWA-SUSP-AMT
    {
        Signed;
        Length = "13";
        DBTableName = "TPOL";
        SType = "Currency";
        Label = "Cash with App Suspense";
    }

    OUT MIR-POL-CWA-SUSP-DT
    {
        Length = "10";
        DBTableName = "TPOL";
        SType = "Date";
        Label = "Cash with App Suspense Account Last Updated";
    }

    OUT MIR-CSH-RFND-SUSP-AMT
    {
        Signed;
        Length = "13";
        DBTableName = "TPOL";
        SType = "Currency";
        Label = "Cash Refund Suspense";
    }

    OUT MIR-CSH-RFND-SUSP-DT
    {
        Length = "10";
        DBTableName = "TPOL";
        SType = "Date";
        Label = "Cash Refund Suspense Account Last Updated";
    }
    
# Changes for NWLBCA starts here
    OUT MIR-OVR-SHRT-PREM-AMT
    {
        Signed;
        Length = "15";
        DBTableName = "TPOL";
        SType = "Currency";
        Label = "Over / Short Premium";
    }
    
    OUT MIR-OVR-SHRT-PREM-DT
    {
        Length = "10";
        DBTableName = "TPOL";
        SType = "Date";
        Label = "Over / Short Premium Last Updated";
    }
# Changes for NWLBCA ends here
# Changes for NWLLRP starts here
    OUT MIR-LOAN-XCES-SHRT-AMT
    {
        Signed;
        Length = "13";
        DBTableName = "TPOL";
        SType = "Currency";
        Label = "Excess  / Short  Loan Interest";
    }

    OUT MIR-LOAN-XCES-SHRT-DT
    {
        Length = "10";
        DBTableName = "TPOL";
        SType = "Date";
        Label = "Excess  / Short Loan Interest Account Last Updated";
    }
# Changes for NWLLRP ends here
# M161CA CHANGES STARTS HERE    
    
    OUT MIR-CRC-RECV-AMT
    {
        DisplayOnly;
        Length = "17";
        DBTableName = "TPOL";
        SType = "Currency";
        Label = "Receivable Amount";
    }
    OUT MIR-CRC-RECV-UPDT-DT
    {
        DisplayOnly;
        Length = "10";
        DBTableName = "TPOL";
        SType = "Date";
        Label = "Receivable Account Last Updated";
    }
    
# M161CA CHANGES END HERE
# C15454 changes begin

    OUT MIR-DSASTR-LAPS-DT
    {
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
#M245B2 CHANGES ENDS HERE 
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
#Q50535 CHANGES START HERE 
    INOUT MIR-PMT-CRCY-CD
    {
        
        Length = "2";
        SType = "Hidden";
        Label = "Currency";
     }
     
#Q50535 CHANGES ENDS HERE
#MP245R CHANGES START HERE 
    INOUT MIR-OS-DISB-CRCY-CD
    {
       
       Length = "2";
       SType = "Hidden";
       Label = "Currency";
    }    
#MP245R CHANGES ENDT HERE 
#R10428 CHANGES STARTS HERE
    OUT MIR-OS-DISB-SRVBEN-AMT
    {
        Signed;
        Length = "17";
        DBTableName = "TPOL";
        SType = "Currency";
        Label = "Outstanding Disbursements ÅEUL Survivor Benefit";
    }

    OUT MIR-OS-DISB-SRVBEN-DT
    {
        Length = "10";
        DBTableName = "TPOL";
        SType = "Date";
        Label = "Outstanding Disbursements UL Survivor Benefit Account Last Updated";
    }

    OUT MIR-POL-PDF-SUSP-AMT
    {
        Signed;
        Length = "13";
        DBTableName = "TPOL";
        SType = "Currency";
        Label = "Premium Deposit Fund Suspense";
    }

    OUT MIR-POL-PDF-SUSP-DT
    {
        Length = "10";
        DBTableName = "TPOL";
        SType = "Date";
        Label = "Premium Deposit Fund Suspense Account Last Updated";
    }


    OUT MIR-POST-LAPS-SURR-AMT
    {
        Signed;
        Length = "15";
        DBTableName = "TPOL";
        SType = "Currency";
        Label = "Post Lapse Surrender Amount";
    }

    OUT MIR-DHY-SPREM-SUSP-AMT
    {
        Signed;
        Length = "17";
        DBTableName = "TPOL";
        SType = "Currency";
        Label = " Conversion Single Premium Suspense";
    }

    OUT MIR-DHY-SPREM-SUSP-DT
    {
        Length = "10";
        DBTableName = "TPOL";
        SType = "Date";
        Label = " Conversion Single Premium Suspense Account Last Updated";
    }

    OUT MIR-DHY-RSRV-SUSP-AMT
    {
        Signed;
        Length = "17";
        DBTableName = "TPOL";
        SType = "Currency";
        Label = " Conversion Reserve Suspense";
    }

    OUT MIR-DHY-RSRV-SUSP-DT
    {
        Length = "10";
        DBTableName = "TPOL";
        SType = "Date";
        Label = "Conversion Reserve Suspense Account Last Updated";
    }

    OUT MIR-DHY-OS-DISB-AMT
    {
        Signed;
        Length = "17";
        DBTableName = "TPOL";
        SType = "Currency";
        Label = " Conversion Outstanding Disbursements";
    }

    OUT MIR-DHY-OS-DISB-DT
    {
        Length = "10";
        DBTableName = "TPOL";
        SType = "Date";
        Label = "Conversion Outstanding Disbursements Account Last Updated";
    }

    OUT MIR-INIT-PREM-SUSP-AMT
    {
        Signed;
        Length = "17";
        DBTableName = "TPOL";
        SType = "Currency";
        Label = "Accrual Initial Premium Suspense";
    }

    OUT MIR-INIT-PREM-SUSP-DT
    {
        Length = "10";
        DBTableName = "TPOL";
        SType = "Date";
        Label = "Accrual Initial Premium Suspense Account Last Updated";
    }
#R10428 CHANGES ENDS HERE
#M271O1 CHANGES START HERE   
       INOUT MIR-PREM-CRCY-CD
       {
                      
           Length = "2";
           SType = "Hidden";
           Label = "Currency";
       }
#M271O1 CHANGES END HERE 
#UYS025 CHANGES START HERE

    OUT MIR-ADV-PMT-RSRV-AMT
    {    
    	Signed;
    	Length = "15";
        DBTableName = "TPOL";
    	SType = "Currency";
        Label = "Advance Payment Reserve Amount";
    } 
#UYS025 CHANGES ENDS HERE
# R14127 changes begin

    OUT MIR-DSASTR-CD
    {
        DBTableName = "TPOL";
        CodeSource = "EDIT";
        CodeType = "DSAST";
        Length = "1";
        SType = "Text";
        Label = "Disaster Code";
    } 

    OUT MIR-DSASTR-SUB-CD
    {
        DBTableName = "TPOL";
        CodeSource = "EDIT";
        CodeType = "DSTSB";
        Length = "2";
        SType = "Text";
        Label = "Disaster Sub Code";
    }    
# R14127 changes end
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


#S45969 CHANGES STARTS

    OUT MIR-STR3-ERR-CD
    {
        Length = "1";
        CodeSource = "DataModel";
        CodeType = "STR3-ERR-CD";
        DBTableName = "TPOL";
        SType = "Text";
        Label = "Stream 3 Error";
    }
#S45969 CHANGES END
 }