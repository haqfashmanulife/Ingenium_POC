# Converted from PathFinder 2.2 to 3.0 Jun 18, 2004 3:13:01 PM EDT

#*******************************************************************************
#*  Component:   BF6983-O.s                                                    *
#*  Description:                                                               *
#*                                                                             *
#*******************************************************************************
#*  Chg#    Release  Description                                               *
#*                                                                             *
#*  014590  6.0      New for release 6.0                                       *
#*  017150  612J     Remove Currency Decimals = "2"                            *
#*  010426  KRW      'POST LAPSE SURR AMOUNT' ADDED TO DISPLAY                 *
#*  02GL03  MAW      ADD POL-BT-SUSP-AMT, POL-PD-SUSP-AMT, POL-CC-SUSP-AMT     *
#*  02GL57  DPK      CWA Suspense Account and Refund                           *
#*  02PR17  WBP      ADD CASH BACK BONUS FIELDS                                *
#*  1CGL01  CLB      ADD DHY CONVERSION SUSP, OS DISB ACCTG FIELDS FROM TPOL   *
#*  PR006E  CSS      ADD CASH BACK BONUS FIELDS (MIR-CBB-MRB-LST-PD-AMT  and   *
#*  PR006E           MIR-CBB-MRB-LTD-PD-AMT)                                   *
#*  M00011  ROC      OUTSTANDING DISBURSEMENTS, ADD FIELDS:                    *
#*                      OS-DISB-SURR-AMT, OS-DISB-MAT-AMT, OS-DISB-DTH-AMT     *
#*                      OS-DISB-CLM-AMT, OS-DISB-AD-AMT                        *
#*                      OS-DISB-SURR-DT, OS-DISB-MAT-DT, OS-DISB-DTH-DT        *
#*                      OS-DISB-CLM-DT, OS-DISB-AD-DT                          *
#*  P01931  H.L      ADD FOLLOWING FIELDS:                                     *
#*                      MIR-TOT-PREM-COLCT-AMT-CURR/PREV/ACCUM                 *
#*                      MIR-TOT-PARTL-SURR-AMT-CURR/PREV/ACCRM                 *
#*                      MIR-TOT-COI-DED-AMT-CURR/PREV/ACCRM                    *
#*                      MIR-TOT-PREM-COLCT-NUM-CURR/PREV/ACCUM                 *
#*                      MIR-TOT-PARTL-SURR-NUM-CURR/PREV/ACCRM                 *
#*                      MIR-TOT-COI-DED-NUM-CURR/PREV/ACCRM                    *
#*                      MIR-DHY-CONV-RSRV-AMT                                  *
#*                      MIR-DHY-CONV-PREM-AMT                                  *
#*  FEID09  CTS      ADDED FOLLOWING FEILDS:                                   *
#*                     MIR-INIT-PREM-SUSP-AMT                                  *
#*                     MIR-INIT-PREM-SUSP-DT                                   *
#*  NWLBCA  CTS      ADDED FOLLOWING FIELDS FOR TRAD POLICIES PROCESSING:      *
#*                     MIR-OVR-SHRT-PREM-AMT                                   *
#*                     MIR-OVR-SHRT-PREM-DT                                    *
#*  NWLCAR  CTS      ADDED FOLLOWING FIELDS                                    *
#*                     MIR-TOT-PREM-COLCT-CRNT-YR                              *
#*                     MIR-TOT-PREM-COLCT-PREV-YR                              *
#*                     MIR-TOT-PREM-ACCUM-TPID                                 *
#*                                                                             *
#*  ATU446  CTS      CHANGED LABELS FOR FIELDS INTRODUCED AS PART OF NWLCAR    *
#*  NWLPP5  CTS      CHANGES TO ADD A NEW FIELD UNEARNED PREMIUM FOR ADV PMT   *
#*  NWLLRP  CTS      LOAN REPAYMENT                                            *
#*                     MIR-LOAN-XCES-SHRT-AMT                                    *
#*                     MIR-LOAN-XCES-SHRT-DT                                     *
#*  NWLLTC  CTS      CHANGES TO ADD NEW FIELDS FOR LOAN PROCESING              *
#*  NWLLCC  CTS      CHANGES DONE FOR CALL CENTER INQUIRY SCREEN               *
#*  MP1544  CTS      CHANGES DONE FOR CALL CENTER INQUIRY SCREEN               *
#*  M142F2  CTS      CHANGES TO ADD NEW FIELDS FOR SURVIVOR BENIFIT            *
#*  Q10123  CTS      M161CA - CHANGES DONE FOR CREDIT CARD                     *
#*  MP185H CTS       ADDED TWO NEW FIELDS AS A PART OF LIMITED                 *
#*  MP185H           PAY UL WL RIDERS                                          *
#*  M245B2  CTS      Foreign Currency Formatting                               *
#*  MP245R  CTS      CHANGES FOR BILLING & OS AMOUNT FIELDS - SPWL POLICIES    *
#*  Q50736  CTS      CHANGES FOR Q50736                                        *
#*  M271O1  CTS      FRA Foreign Currency Formatting 			       *
#*  M271A7  CTS      Online Screen Changes done as part of FRA                 *
#*  M319O1  CTS      FXWL Currency Code Changes                                * 
#*  TDMG07  CTS      Screen Changes For NWL                                    *
#*  118579  CTS      CHANGES DONE TO CORRECT THE FIELD PREMIUM PAYMENT         *
#*  118579           DESCRIPTION                                               *
#*  FFF10R  CTS      CHANGES DONE FOR CC SUSPENSE HANDLING                     *
#*  TL0763  CTS      CHANGES TO INCLUDE NEW FIELD                              *
#*  UYS025  CTS      ADVANCE PAYMENT RESERVE AMOUNT FIELD ADDED                *
#*  UYS104  CTS      ADD OF FIELD PROPORTIONAL DISTRIBUTION PAID               *
#*                   PREMIUM CALC FLAG                                         *
#*  UYSD11  CTS      ADDIITION OF UNISYS MIGRATION TYPE CODE                   *
#*  UY3060  CTS      SYSTEM SPEC B INGENIUM-DIVIDEND PROCESSING                **
#*  UY3094  CTS      TERM INSURANCE FINAL ADJUSTMENT PAYMENT                   *
#*  UY3121  CTS      CR121 CHANGES                                             *
#*  UY304A  CTS      CALL CENTER SCREEN ENHANCEMENT                            *
#*  UY3153  CTS      CR 148 AND 149 CHANGES                                    *
#*******************************************************************************


S-STEP BF6983-O
{
    ATTRIBUTES
    {
        BusinessFunctionType = "Valueotr";
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
        Key;
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

    IN MIR-CVG-CLM-LTD-AMT
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
        Label = "Total Claims Paid";
    }

    IN MIR-CVG-CLM-YTD-AMT
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
        Label = "Claims Paid Year to Date";
    }

    IN MIR-CVG-WP-LTD-AMT
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
        Label = "Total Premiums Waived";
    }

    IN MIR-CVG-WP-YTD-AMT
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
        Label = "Waiver of Premium Amounts Paid Year to Date";
    }

    IN MIR-DIV-DCLR-LTD-AMT
    {
#M245B2 CHANGES START HERE    
        CurrencyCode = "MIR-POL-CRCY-CD";
#M245B2 CHANGES END HERE  
        DisplayOnly;
        Signed;
        Length = "17";
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
        Length = "15";
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
        Length = "13";
        SType = "Currency";
        Label = "Dividends on Deposit Interest";
    }
# UYSD11 CHANGES BEGINS HERE
    IN MIR-USYS-MIGR-POL-IND
    {    
        DisplayOnly;
        Length = "1";
        SType = "Indicator";
        Label = "Migrated Policy";
    }
# UYSD11 CHANGES ENDS HERE

    IN MIR-DV-ANNV-PYR-QTY
    {
        DisplayOnly;
        Length = "4";
        SType = "Text";
        Label = "Anniversary Processing Year";
    }

    IN MIR-DV-OWN-CLI-NM
    {
        DisplayOnly;
        Length = "75";
        SType = "Text";
        Label = "Owner Name";
    }

    IN MIR-DV-PREV-DIV-YR-QTY
    {
        DisplayOnly;
        Length = "4";
        SType = "Text";
        Label = "Year Last Declared";
    }

    IN MIR-LATST-ACTV-DT
    {
        DisplayOnly;
        Length = "10";
        SType = "Date";
        Label = "Last Accounting Date";
    }

    IN MIR-POL-BILL-TO-DT-NUM
    {
        DisplayOnly;
        Length = "10";
        SType = "Date";
        Label = "Billed to Date";
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

    IN MIR-POL-CVG-REC-CTR
    {
        DisplayOnly;
        Length = "40";
        SType = "Text";
        Label = "Number of Coverages";
    }

    IN MIR-POL-DIV-DT
    {
        DisplayOnly;
        Length = "10";
        SType = "Date";
        Label = "Dividend Last Paid Date";
    }
    
    # TDMG07 changes begin
    
         IN MIR-PREM-PMT-CMPLT-IND
         {
                DisplayOnly;
                Length = "1";
                SType = "Indicator";
# 118579 changes begin      
#               Label = "Premium Payment Completion";
		Label = "Base Policy Premium Payment Completion";
# 118579 changes end 
         }
    		    
    # TDMG07 changes end 


    IN MIR-POL-DIV-OPT-CD
    {
        DisplayOnly;
        Length = "40";
        CodeSource = "DataModel";
        CodeType = "POL-DIV-OPT-CD";
        SType = "Text";
        Label = "Policy Dividend Option";
    }

    IN MIR-POL-DIV-SUSP-AMT
    {
#M245B2 CHANGES START HERE    
        CurrencyCode = "MIR-POL-CRCY-CD";
#M245B2 CHANGES END HERE 
        DisplayOnly;
        Signed;
        Length = "15";
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
        Length = "17";
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
        Length = "17";
        SType = "Currency";
        Label = "Dividend Average Balance";
    }

    IN MIR-POL-DOD-INT-RT
    {
        DisplayOnly;
        Signed;
        Length = "7";
        Decimals = "5";
        SType = "Percent";
        Label = "Current Dividend Interest Rate";
    }

    IN MIR-POL-MISC-SUSP-AMT
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
        Length = "19";
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

    IN MIR-POL-MPREM-AMT
    {
#M271O1 CHANGES START HERE    
#M245B2 CHANGES START HERE    
#        CurrencyCode = "MIR-POL-CRCY-CD";
        CurrencyCode = "MIR-PREM-CRCY-CD";
#M245B2 CHANGES END HERE 
#M271O1 CHANGES END HERE 
        DisplayOnly;
        Signed;
        Length = "17";
        SType = "Currency";
        Label = "Mode Premium Amount";
    }

    IN MIR-POL-OS-DISB-AMT
    {
#MP245R CHANGES START HERE    
        CurrencyCode = "MIR-OS-DISB-CRCY-CD";
#MP245R CHANGES END HERE 
        DisplayOnly;
        Signed;
        Length = "19";
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
        Length = "19";
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
        Length = "19";
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
        Length = "19";
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
        Length = "19";
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
        Length = "19";
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

    IN MIR-OS-DISB-LOAN-DT
    {
        DisplayOnly;
        Length = "10";
        SType = "Date";
        Label = "Outstanding Disbursements Loan Date";
    }
#NWLLTC CHANGES ENDS HERE
#M142F2 CHANGES STARTS HERE
    IN MIR-OS-DISB-SRVBEN-AMT
    {
#MP245R CHANGES START HERE    
        CurrencyCode = "MIR-OS-DISB-CRCY-CD";
#MP245R CHANGES END HERE 
        DisplayOnly;
        Signed;
        Length = "15";
        SType = "Currency";
        Label = "Outstanding Disbursements - Survival Benifit";
    }

    IN MIR-OS-DISB-SRVBEN-DT
    {
        DisplayOnly;
        Length = "10";
        SType = "Date";
        Label = "Outstanding Disbursements Survival Benifit Date";
    }
#M142F2 CHANGES ENDS HERE
    IN MIR-POL-OYT-AMT
    {
#M245B2 CHANGES START HERE    
        CurrencyCode = "MIR-POL-CRCY-CD";
#M245B2 CHANGES END HERE 
        DisplayOnly;
        Length = "14";
#M245B2 CHANGES START HERE         
#        Decimals = "0";
#M245B2 CHANGES END HERE 
        SType = "Currency";
        Label = "One Year Term Purchased with Dividend";
    }
#UY3060 CHANGES START HERE
    
    IN MIR-SPCL-DIV-OPT-CD
    {
        DisplayOnly;
        Length = "40";
        CodeSource = "DataModel";
        CodeType = "SPCL-DIV-OPT-CD";
        SType = "Text";
	Label = "Special Dividend Option";
    }
#UY3060 CHANGES END HERE

#UY3094 CHANGES START HERE

    IN MIR-TERM-INS-FINL-ADJ-TOT-PAY
    {
        DisplayOnly;
        Signed;
        Length = "15";
        SType = "Currency";
        Label = "Term Insurance Final Adjustment Total Payment";
    }

    IN MIR-NON-ACC-BNFT-PAY-AMT
    {
        DisplayOnly;
        Signed;
        Length = "15";
        SType = "Currency";
        Label = "Non Accidental Benefit Payment Amount";
    }

    IN MIR-DIV-AMT
    {
        DisplayOnly;
        Signed;
        Length = "15";
        SType = "Currency";
        Label = "Dividend Amount";
    }

    IN MIR-HLTH-BNFT-BNUS
    {
        DisplayOnly;
        Signed;
        Length = "15";
        SType = "Currency";
        Label = "Health Benefit(Bonus)";
    }

    IN MIR-TOT-UNPD-NON-ACC-BNFT
    {
        DisplayOnly;
        Signed;
        Length = "15";
        SType = "Currency";
        Label = "Total unpaid non accidental benefit";
    }
    IN MIR-DEFR-PAY
    {
        DisplayOnly;
        Signed;
        Length = "15";
        SType = "Currency";
        Label = "deferred payment";
    }

    IN MIR-UNERND-LOAN-INT
    {
        DisplayOnly;
        Signed;
        Length = "15";
        SType = "Currency";
        Label = "Loan Interest(Unearned)";
    }

    IN MIR-EXCES-INT-POL-LOAN-REPAY
    {
        DisplayOnly;
        Signed;
        Length = "15";
        SType = "Currency";
        Label = "Excess interest of policy loan repayment";
    }

    IN MIR-SRV-BNFT-AMT
    {
        DisplayOnly;
        Signed;
        Length = "15";
        SType = "Currency";
        Label = "Survival Benefit";
    }

    IN MIR-INC-SURV-BNFT
    {
        DisplayOnly;
        Signed;
        Length = "15";
        SType = "Currency";
        Label = "Increased Survival Benefit";
    }
#UY3094 CHANGES ENDS HERE
    IN MIR-POL-PDF-AMT
    {
#M271O1 CHANGES START HERE    
#M245B2 CHANGES START HERE    
#        CurrencyCode = "MIR-POL-CRCY-CD";
        CurrencyCode = "MIR-PREM-CRCY-CD";
#M245B2 CHANGES END HERE 
#M271O1 CHANGES END HERE 
        DisplayOnly;
        Signed;
        Length = "15";
        SType = "Currency";
        Label = "Premium Deposit Funds";
    }

    IN MIR-POL-PDF-AVB-AMT
    {
#M271O1 CHANGES START HERE    
#M245B2 CHANGES START HERE    
#        CurrencyCode = "MIR-POL-CRCY-CD";
        CurrencyCode = "MIR-PREM-CRCY-CD";
#M245B2 CHANGES END HERE 
#M271O1 CHANGES END HERE 
        DisplayOnly;
        Signed;
        Length = "15";
        SType = "Currency";
        Label = "Premium Deposit Funds Average Balance";
    }

    IN MIR-POL-PDF-INT-AMT
    {
#M271O1 CHANGES START HERE    
#M245B2 CHANGES START HERE    
#        CurrencyCode = "MIR-POL-CRCY-CD";
        CurrencyCode = "MIR-PREM-CRCY-CD";
#M245B2 CHANGES END HERE 
#M271O1 CHANGES END HERE  
        DisplayOnly;
        Signed;
        Length = "13";
        SType = "Currency";
        Label = "Interest Accrued on Premium Deposit Funds";
    }

    IN MIR-POL-PDF-INT-RT
    {
        DisplayOnly;
        Signed;
        Length = "7";
        Decimals = "5";
        SType = "Percent";
        Label = "Premium Deposit Funds Interest Rate";
    }

    IN MIR-POL-PDF-SUSP-AMT
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
        Label = "Premium Deposit Fund Suspense";
    }

    IN MIR-POL-PDF-SUSP-DT
    {
        DisplayOnly;
        Length = "10";
        SType = "Date";
        Label = "Premium Deposit Fund Suspense Account Last Updated";
    }

    IN MIR-POL-PD-TO-DT-NUM
    {
        DisplayOnly;
        Length = "10";
        SType = "Date";
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
        Length = "19";
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

    IN MIR-PREV-FILE-MAINT-DT
    {
        DisplayOnly;
        Length = "10";
        SType = "Date";
        Label = "Last Change Date";
    }

    IN MIR-PUA-CLR-FACE-AMT
    {
#M245B2 CHANGES START HERE    
        CurrencyCode = "MIR-POL-CRCY-CD";
#M245B2 CHANGES END HERE 
        DisplayOnly;
        Signed;
        Length = "17";
        SType = "Currency";
        Label = "Amount of Paid-up Additions Surrendered";
    }
#UY3060 CHANGES START HERE
    IN MIR-PUA-VEST-FACE-AMT
    {
        DisplayOnly;
        Signed;
        Length = "15";
        SType = "Currency";
        Label = "Total Vesting Paid-up Additions";
    }
    IN MIR-DEFR-DIV-AMT
    {
        DisplayOnly;
        Signed;
        Length = "15";
        SType = "Currency";
        Label = "Deferred Dividend Amount";
    }
    IN MIR-DEFR-DIV-INT-AMT
    {
        DisplayOnly;
        Signed;
        Length = "15";
        SType = "Currency";
        Label = "Deferred Dividend Interest Amount";
    }
    IN MIR-DEFR-DIV-DT
    {
        DisplayOnly;
        Signed;
        Length = "10";
        SType = "Date";
        Label = "Deferred Dividend Date";
    }
    IN MIR-DEFR-DIV-INT-CAP-DT
    {
        DisplayOnly;
        Signed;
        Length = "10";
        SType = "Date";
        Label = "Deferred Interest Capitalization Date";
    }
    IN MIR-DIV-CUSTOD-ACUM-AMT
        {
        DisplayOnly;
        Signed;
        Length = "15";
        SType = "Currency";
        Label = "Accumulated Dividend on Custody";
    }
    IN MIR-DIV-CUSTOD-INT-AMT
        {
        DisplayOnly;
        Signed;
        Length = "15";
        SType = "Currency";
        Label = "Accumulated Interest on Custody";
    }   
    IN MIR-CNVR-ADJ-TOT-DIV-AMT
    {
        DisplayOnly;
        Signed;
        Length = "15";
        SType = "Currency";
        Label = "Total Conversion Adjusted Dividend Amount";
    }
    IN MIR-SURV-DEFR-DIV-AMT
    {
        DisplayOnly;
        Signed;
        Length = "15";
        SType = "Currency";
        Label = "Survival Insurance Deferred Amount";
    }  
    IN MIR-SURV-DEFR-INT-AMT
    {
        DisplayOnly;
        Signed;
        Length = "15";
        SType = "Currency";
        Label = "Survival Insurance Deferred Interest Amount";
    }        
    IN MIR-SURV-DEFR-DIV-DT
    {
        DisplayOnly;
        Signed;
        Length = "10";
        SType = "Date";
        Label = "Survival Insurance Deferred Date";
    }            
    IN MIR-SURV-DEFR-INT-DT
    {
        DisplayOnly;
        Signed;
        Length = "10";
        SType = "Date";
        Label = "Survival Insurance Deferred Interest Capitalization Date";
    }            
#UY3060 CHANGES END HERE
    IN MIR-PUA-LTD-FACE-AMT
    {
#M245B2 CHANGES START HERE    
        CurrencyCode = "MIR-POL-CRCY-CD";
#M245B2 CHANGES END HERE 
        DisplayOnly;
        Signed;
        Length = "17";
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
        Length = "17";
        SType = "Currency";
        Label = "Current Paid-up Additions";
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

    IN MIR-SURR-DIV-ACUM-AMT
    {
#M245B2 CHANGES START HERE    
        CurrencyCode = "MIR-POL-CRCY-CD";
#M245B2 CHANGES END HERE 
        DisplayOnly;
        Signed;
        Length = "17";
        SType = "Currency";
        Label = "Dividends Surrendered";
    }

    IN MIR-POST-LAPS-SURR-AMT
    {
#M245B2 CHANGES START HERE    
        CurrencyCode = "MIR-POL-CRCY-CD";
#M245B2 CHANGES END HERE 
        DisplayOnly;
        Signed;
        Length = "17";
        SType = "Currency";
        Label = "Post Lapse Surrender Amount";
    }

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
#FFF10R CHANGES STARTS HERE
      # CurrencyCode = "MIR-PMT-CRCY-CD";
        CurrencyCode = "MIR-CC-SUSP-CRCY-CD";
#FFF10R CHANGES ENDS HERE
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

#M142F2 CHANGES STARTS HERE    
    IN MIR-SRVBEN-LST-PD-YR
    {
        DisplayOnly;
        Length = "4";
        SType = "Text";
        Label = "Survivorship Benefit Year Last Paid";
    }
    
    IN MIR-DV-ELIG-SRVBEN-AMT
    {
#M245B2 CHANGES START HERE    
        CurrencyCode = "MIR-POL-CRCY-CD";
#M245B2 CHANGES END HERE 
        DisplayOnly;
        Signed;
        Length = "15";
        SType = "Currency";
        Label = "Total Eligible Survivorship Benefit Last Time";
    }

    IN MIR-SRVBEN-LST-PD-AMT
    {
#M245B2 CHANGES START HERE    
        CurrencyCode = "MIR-POL-CRCY-CD";
#M245B2 CHANGES END HERE 
        DisplayOnly;
        Signed;
        Length = "15";
        SType = "Currency";
        Label = "Survivorship Benefit Amount Last Paid to Client";
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
        DisplayOnly;
	Signed;
	Length = "10";
	SType = "Date";
        Label = "OS Disb - JPY Premium Account Last Updated";
    } 
    
 #M271A7 CHANGES END HERE    
    
    IN MIR-DV-ELIG-SRVBEN-LTD-AMT
    {
#M245B2 CHANGES START HERE    
        CurrencyCode = "MIR-POL-CRCY-CD";
#M245B2 CHANGES END HERE 
        DisplayOnly;
        Signed;
        Length = "17";
        SType = "Currency";
        Label = "Total Eligible Survivorship Benefit Amount Life-to-Date";
    }
   
    IN MIR-SRVBEN-LTD-PD-AMT
    {
 #M245B2 CHANGES START HERE    
         CurrencyCode = "MIR-POL-CRCY-CD";
#M245B2 CHANGES END HERE 
         DisplayOnly;
         Signed;
         Length = "17";
         SType = "Currency";
         Label = "Survivorship Benefit Amount Paid to Client Life-to-Date";
    }
#M142F2 CHANGES ENDS HERE    

    IN MIR-DHY-SPREM-SUSP-AMT
    {
#M245B2 CHANGES START HERE   
#M271O1 CHANGES START HERE CHANGING CURRENCY CODE  
      # CurrencyCode = "MIR-POL-CRCY-CD";
        CurrencyCode = "MIR-PREM-CRCY-CD";
#M271O1 CHANGES END HERE 
#M245B2 CHANGES END HERE 
        DisplayOnly;
        Signed;
        Length = "19";
        SType = "Currency";
        Label = "Conversion Single Premium Suspense";
    }

    IN MIR-DHY-SPREM-SUSP-DT
    {
        DisplayOnly;
        Length = "10";
        SType = "Date";
        Label = "Cash with App Suspense Account Last Updated";
    }

   IN MIR-DHY-RSRV-SUSP-AMT
    {
#M245B2 CHANGES START HERE   
#M271O1 CHANGES START HERE CHANGING CURRENCY CODE  
      # CurrencyCode = "MIR-POL-CRCY-CD";
        CurrencyCode = "MIR-PREM-CRCY-CD";
#M271O1 CHANGES END HERE 
#M245B2 CHANGES END HERE 
        DisplayOnly;
        Signed;
        Length = "19";
        SType = "Currency";
        Label = "Conversion Reserve Suspense";
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
#M245B2 CHANGES START HERE   
#M271O1 CHANGES START HERE CHANGING CURRENCY CODE  
      # CurrencyCode = "MIR-POL-CRCY-CD";
        CurrencyCode = "MIR-PREM-CRCY-CD";
#M271O1 CHANGES END HERE 
#M245B2 CHANGES END HERE 
        DisplayOnly;
        Signed;
        Length = "19";
        SType = "Currency";
        Label = "Conversion Outstanding Disbursement Suspense";
    }

    IN MIR-DHY-OS-DISB-DT
    {
        DisplayOnly;
        Length = "10";
        SType = "Date";
        Label = "Conversion Outstanding Disbursement Suspense Last Updated";
    }

#*****FEID09**********
    IN MIR-INIT-PREM-SUSP-AMT
    {
#M245B2 CHANGES START HERE   
#M271O1 CHANGES START HERE CHANGING CURRENCY CODE  
      # CurrencyCode = "MIR-POL-CRCY-CD";
        CurrencyCode = "MIR-PREM-CRCY-CD";
#M271O1 CHANGES END HERE 
#M245B2 CHANGES END HERE 
        DisplayOnly;
        Signed;
        Length = "19";
        SType = "Currency";
        Label = "Accrual Initial Premium Suspense";
    }

    IN MIR-INIT-PREM-SUSP-DT
    {
        DisplayOnly;
        Length = "10";
        SType = "Date";
        Label = "Accrual Initial Premium Suspense Last Updated";
    }

#UYS025 CHANGES START HERE

    IN MIR-ADV-PMT-RSRV-AMT
    {  
        DisplayOnly;
        Signed;
        Length = "15";
        SType = "Currency";
        Label = "Advance Payment Reserve Amount";
    } 
#UYS025 CHANGES ENDS HERE 


#*****H.L P01931**********
   IN MIR-TOT-PREM-COLCT-AMT-CURR
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
        Length = "19";
        SType = "Currency";
        Label = "Total Premium Collected Amount - Current Year";
    }

   IN MIR-TOT-PREM-COLCT-AMT-PREV
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
        Length = "19";
        SType = "Currency";
        Label = "Total Premium Collected Amount - Previous Year";
    }

   IN MIR-TOT-PREM-COLCT-AMT-ACCUM
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
        Length = "19";
        SType = "Currency";
        Label = "Total Premium Collected Amount - Accumulation";
    }

   IN MIR-TOT-PARTL-SURR-AMT-CURR
    {
#M245B2 CHANGES START HERE    
        CurrencyCode = "MIR-POL-CRCY-CD";
#M245B2 CHANGES END HERE 
        DisplayOnly;
        Signed;
        Length = "19";
        SType = "Currency";
        Label = "Total Partial Surrender Amount - Current Year";
    }

   IN MIR-TOT-PARTL-SURR-AMT-PREV
    {
#M245B2 CHANGES START HERE    
        CurrencyCode = "MIR-POL-CRCY-CD";
#M245B2 CHANGES END HERE 
        DisplayOnly;
        Signed;
        Length = "19";
        SType = "Currency";
        Label = "Total Partial Surrender Amount - Previous Year";
    }

   IN MIR-TOT-PARTL-SURR-AMT-ACCUM
    {
#M245B2 CHANGES START HERE    
        CurrencyCode = "MIR-POL-CRCY-CD";
#M245B2 CHANGES END HERE 
        DisplayOnly;
        Signed;
        Length = "19";
        SType = "Currency";
        Label = "Total Partial Surrender Amount - Accumulation";
    }

   IN MIR-TOT-COI-DED-AMT-CURR
    {
#M271O1 CHANGES STARTS HERE    
#M245B2 CHANGES START HERE    
#        CurrencyCode = "MIR-POL-CRCY-CD";
        CurrencyCode = "MIR-PREM-CRCY-CD";
#M245B2 CHANGES END HERE 
#M271O1 CHANGES ENDS HERE
        DisplayOnly;
        Signed;
        Length = "19";
        SType = "Currency";
        Label = "Total COI Deducted Amount - Current Year";
    }

   IN MIR-TOT-COI-DED-AMT-PREV
    {
#M271O1 CHANGES STARTS HERE    
#M245B2 CHANGES START HERE    
#        CurrencyCode = "MIR-POL-CRCY-CD";
        CurrencyCode = "MIR-PREM-CRCY-CD";
#M245B2 CHANGES END HERE 
#M271O1 CHANGES ENDS HERE
        DisplayOnly;
        Signed;
        Length = "19";
        SType = "Currency";
        Label = "Total COI Deducted Amount - Previous Year";
    }

   IN MIR-TOT-COI-DED-AMT-ACCUM
    {
#M271O1 CHANGES STARTS HERE    
#M245B2 CHANGES START HERE    
#        CurrencyCode = "MIR-POL-CRCY-CD";
        CurrencyCode = "MIR-PREM-CRCY-CD";
#M245B2 CHANGES END HERE 
#M271O1 CHANGES ENDS HERE
        DisplayOnly;
        Signed;
        Length = "19";
        SType = "Currency";
        Label = "Total COI Deducted Amount - Accumulation";
    }

   IN MIR-DHY-CONV-RSRV-AMT
    {
#M245B2 CHANGES START HERE    
        CurrencyCode = "MIR-POL-CRCY-CD";
#M245B2 CHANGES END HERE 
        DisplayOnly;
        Signed;
        Length = "19";
        SType = "Currency";
        Label = "DHY Conversion Reserve Amount";
    }

   IN MIR-DHY-CONV-PREM-AMT
    {
#M245B2 CHANGES START HERE    
        CurrencyCode = "MIR-POL-CRCY-CD";
#M245B2 CHANGES END HERE 
        DisplayOnly;
        Signed;
        Length = "19";
        SType = "Currency";
        Label = "DHY Conversion Single Premium Amount";
    }

   IN MIR-TOT-PREM-COLCT-NUM-CURR
    {
        DisplayOnly;
        Length = "4";
        SType = "Text";
        Label = "Total Premium Collected Amount - Current Year";
    }

   IN MIR-TOT-PREM-COLCT-NUM-PREV
    {
        DisplayOnly;
        Length = "4";
        SType = "Text";
        Label = "Total Premium Collected Amount - Previous Year";
    }

   IN MIR-TOT-PREM-COLCT-NUM-ACCUM
    {
        DisplayOnly;
        Length = "4";
        SType = "Text";
        Label = "Total Premium Collected Amount - Accumulation";
    }

   IN MIR-TOT-PARTL-SURR-NUM-CURR
    {
        DisplayOnly;
        Length = "4";
        SType = "Text";
        Label = "Total Partial Surrender Amount - Current Year";
    }

   IN MIR-TOT-PARTL-SURR-NUM-PREV
    {
        DisplayOnly;
        Length = "4";
        SType = "Text";
        Label = "Total Partial Surrender Amount - Previous Year";
    }

   IN MIR-TOT-PARTL-SURR-NUM-ACCUM
    {
        DisplayOnly;
        Length = "4";
        SType = "Text";
        Label = "Total Partial Surrender Amount - Accumulation";
    }

   IN MIR-TOT-COI-DED-NUM-CURR
    {
        DisplayOnly;
        Length = "4";
        SType = "Text";
        Label = "Total COI Deducted Amount - Current Year";
    }

   IN MIR-TOT-COI-DED-NUM-PREV
    {
        DisplayOnly;
        Length = "4";
        SType = "Text";
        Label = "Total COI Deducted Amount - Previous Year";
    }

   IN MIR-TOT-COI-DED-NUM-ACCUM
    {
        DisplayOnly;
        Length = "4";
        SType = "Text";
        Label = "Total COI Deducted Amount - Accumulation";
    }

# Changes for NWLBCA starts here

    IN MIR-OVR-SHRT-PREM-AMT
    {
#M271O1 CHANGES STARTS HERE    
#M245B2 CHANGES START HERE    
#        CurrencyCode = "MIR-POL-CRCY-CD";
#M319O1 CHANGES START HERE
      # CurrencyCode = "MIR-PREM-CRCY-CD";
#FFF10R CHANGES STARTS HERE      
      # CurrencyCode = "MIR-PMT-CRCY-CD"; 
        CurrencyCode = "MIR-OVR-SHRT-PREM-CRCY-CD";
#FFF10R CHANGES ENDS HERE            
#M319O1 CHANGES END HERE
#M245B2 CHANGES END HERE 
#M271O1 CHANGES ENDS HERE
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
        Label = "Over Short Premium Account Last Updated";
    }
# Changes for NWLBCA ends here
# Changes for NWLCAR starts here
   IN MIR-TOT-PREM-ACCUM-TPID
    {
#M245B2 CHANGES START HERE    
        CurrencyCode = "MIR-PMT-CRCY-CD";
#M245B2 CHANGES END HERE 
        Signed;
        Length = "17";
        DBTableName = "Derived";
        SType = "Currency";
        Label = "Trad Total Premium Collected Amount - Accumulation";
     }
   IN MIR-TOT-PREM-COLCT-CRNT-YR
    {
#M245B2 CHANGES START HERE  
#Q50736 CHANGES START HERE
#        CurrencyCode = "MIR-POL-CRCY-CD";
        CurrencyCode = "MIR-PMT-CRCY-CD";
#Q50736 CHANGES END HERE        
#M245B2 CHANGES END HERE 
        Signed;
        Length = "17";
        DBTableName = "Derived";
        SType = "Currency";
        Label = "Trad Total Premium Collected - Current Year";
     }

   IN MIR-TOT-PREM-COLCT-PREV-YR
    {
#M271O1 CHANGES STARTS HERE    
#M245B2 CHANGES START HERE    
#        CurrencyCode = "MIR-POL-CRCY-CD";
#M319O1 CHANGES START HERE
      # CurrencyCode = "MIR-PREM-CRCY-CD";
        CurrencyCode = "MIR-PMT-CRCY-CD";
#M319O1 CHANGES END HERE
#M245B2 CHANGES END HERE 
#M271O1 CHANGES ENDS HERE
        Signed;
        Length = "17";
        DBTableName = "Derived";
        SType = "Currency";
        Label = "Trad Total Premium Collected - Previous Year";
     }
# Changes for NWLCAR ends here
# Changes for NWLPP5 begin here
   IN MIR-DV-UNEARN-PREM
    {
#M271O1 CHANGES STARTS HERE    
#M245B2 CHANGES START HERE    
#        CurrencyCode = "MIR-POL-CRCY-CD";
        CurrencyCode = "MIR-PREM-CRCY-CD";
#M245B2 CHANGES END HERE 
#M271O1 CHANGES ENDS HERE
        Signed;
        Length = "17";
        DBTableName = "Derived";
        SType = "Currency";
        Label = "Unearned Premium";
     }
# Changes for NWLPP5 end here
#UYS104 CHANGES START HERE
    IN MIR-PROPORTN-PREM-IND
	{
	     DisplayOnly;
	     Length = "1";
         SType = "Indicator";
         Label = "Proportional distribution type paid premium calculation flag";
	}
#UYS104 CHANGES END HERE
# Changes for NWLLRP starts here

    IN MIR-LOAN-XCES-SHRT-AMT
      {
 #M245B2 CHANGES START HERE    
         CurrencyCode = "MIR-POL-CRCY-CD";
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
          Label = "Excesss /  Short Loan Interest Account Last Updated";
      }
# Changes for NWLLRP ends here
# NWLLCC CHANGES STARTS HERE
    IN MIR-LOAN-BAL-AMT
    {
 #M245B2 CHANGES START HERE    
         CurrencyCode = "MIR-POL-CRCY-CD";
#M245B2 CHANGES END HERE 
        DisplayOnly;
        Signed;
        Length = "15";
        SType = "Currency";
        Label = "Balance(Excluding Interest)";
    }
    IN MIR-LOAN-INT-STRT-DT
    {
        DisplayOnly;
        Length = "10";
        SType = "Date";
        Label = "Interest Start Date";
    }

# NWLLCC CHANGES ENDS HERE

# MP1544 CHANGES STARTS HERE
    IN MIR-APL-BAL-AMT
    {
#M245B2 CHANGES START HERE    
        CurrencyCode = "MIR-POL-CRCY-CD";
#M245B2 CHANGES END HERE 
        DisplayOnly;
        Signed;
        Length = "15";
        SType = "Currency";
        Label = "Balance";
    }
    IN MIR-APL-EFF-DT
    {
        DisplayOnly;
        Length = "10";
        SType = "Date";
        Label = "APL Date";
    }

# MP1544 CHANGES ENDS HERE

# M161CA CHANGES STARTS HERE    
    
    IN MIR-CRC-RECV-AMT
    {
        DisplayOnly;
        Length = "17";
#M271O1 CHANGES START HERE CHANGING CURRENCY CODE 
#M245B2 CHANGES STARTS HERE        
#        SType = "text";
         SType = "Currency";

      # CurrencyCode = "MIR-POL-CRCY-CD";
#M319O1 CHANGES START HERE
      # CurrencyCode = "MIR-PREM-CRCY-CD";      
        CurrencyCode = "MIR-PMT-CRCY-CD";        
#M319O1 CHANGES END HERE

#M245B2 CHANGES ENDS HERE         
#M271O1 CHANGES END HERE         
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
#* MP185H Changes Begin

   IN MIR-DV-MAX-PREM-AMT
    {
#M245B2 CHANGES START HERE    
        CurrencyCode = "MIR-POL-CRCY-CD";
#M245B2 CHANGES END HERE 
        DisplayOnly;
        Length = "17";
        SType = "Currency";
        Label = "Maximum Premium(except variable accumulation amount)";
    }
    
   IN MIR-DV-XPRY-DT
    {
        DisplayOnly;
        Length = "10";
        SType = "Date";
        Label = "Expiry Date";
    }
    
#* MP185H Changes End 
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
#MP245R CHANGES STARTS HERE
   INOUT MIR-OS-DISB-CRCY-CD
   {
   
       Length = "2";
       SType = "Hidden";
       Label = "Currency";
   }
#MP245R CHANGES END HERE
#M271O1 CHANGES START HERE  
         
    INOUT MIR-PREM-CRCY-CD
    {
        Length = "2";
        SType = "Hidden";
        Label = "Currency";
    }  
#M271O1 CHANGES END HERE 
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
#TL0763 CHANGES START HERE
    IN MIR-CSV-ELPSD-DUR
    {
        Length = "7";
        DBTableName = "Derived";
        SType = "Text";
        Label = "Elapsed Duration of CSV";
    }
#TL0763 CHANGES END HERE 
#UY3049 CHANGES STARTS HERE 
    IN MIR-RCVBL-PREM-AMT
    {
        CurrencyCode = "MIR-PREM-CRCY-CD";
        DisplayOnly;
        Signed;
        Length = "19";
        SType = "Currency";
        Label = "Receivable Premium Amount";
    }

    IN MIR-RCVBL-ACCT-DT
    {
        DisplayOnly;
        Length = "10";
        SType = "Date";
        Label = "Receivable Premium Account Last Updated";
    }
#UY3049 CHANGES ENDS HERE 
#UY3121 CHANGES STARTS
    IN MIR-DIV-CRNT-PMT-CTRL
    {
        DisplayOnly;
        Length = "10";
        SType = "Text";
        Label = "Payment Control";
    }
    IN MIR-DV-CRNT-DIV-AMT
    {
        Signed;
        Length = "15";
        DBTableName = "TPOL";
        SType = "Currency";
        Label = "DDividend Amount";
    }
    IN MIR-DV-CRNT-DIV-YR
    {
        Length = "4";
        DBTableName = "Derived";
        SType = "Text";
        Label = "Dividend Year";
    }
    IN MIR-DIV-PREV-PMT-CTRL
    {
        DisplayOnly;
        Length = "10";
        SType = "Text";
        Label = "Payment Control";
    }
    IN MIR-DV-PREV-DIV-AMT
    {
        Signed;
        Length = "15";
        DBTableName = "TPOL";
        SType = "Currency";
        Label = "Dividend Amount";
    }
    IN MIR-DV-PREV-DIV-YR
    {
        Length = "4";
        DBTableName = "Derived";
        SType = "Text";
        Label = "Dividend Year";
    }
    IN MIR-VEST-DEFR-DIV-AMT
    {
        Signed;
        Length = "15";
        DBTableName = "TPOL";
        SType = "Currency";
        Label = "Deferral Amount";
    }
    IN MIR-VEST-DIV-INT-AMT
    {
        Signed;
        Length = "15";
        DBTableName = "TPOL";
        SType = "Currency";
        Label = "Accumulated Interest";
    }
    IN MIR-DV-DT-OF-PMT
    {
        Length = "10";
        DBTableName = "Derived";
        SType = "Text";
        Label = "Date of Payment";
    }
    IN MIR-DV-VEST-AMT-PD
    {
        Signed;
        Length = "15";
        DBTableName = "TPOL";
        SType = "Currency";
        Label = "Vesting Amount Paid (including interest)";
    }
    IN MIR-SPL-DEFR-DIV-AMT
    {
        Signed;
        Length = "15";
        DBTableName = "TPOL";
        SType = "Currency";
        Label = "Deposit";
    }
    IN MIR-SPL-DIV-INT-AMT
    {
        Signed;
        Length = "15";
        DBTableName = "TPOL";
        SType = "Currency";
        Label = "Accumulated Dividend)";
    }
    IN MIR-SPL-DEFR-DIV-DT
    {
        Length = "10";
        DBTableName = "Derived";
        SType = "Text";
        Label = "Date of last deferred processing";
    }
    IN MIR-SPL-DIV-INT-CAP-DT
    {
        Length = "10";
        DBTableName = "Derived";
        SType = "Text";
        Label = "Capitilization Date";
    }
    IN MIR-DV-DT-OF-PRCHS
    {
        Length = "10";
        DBTableName = "Derived";
        SType = "Text";
        Label = "Date of Purchase";
    }
    IN MIR-DV-FNL-DEFR-PMT
    {
        Signed;
        Length = "15";
        DBTableName = "TPOL";
        SType = "Currency";
        Label = "Final Deferral Payment";
    }
    IN MIR-DV-FNL-INT-PMT
    {
        Signed;
        Length = "15";
        DBTableName = "TPOL";
        SType = "Currency";
        Label = "Final Interest Payment";
    }
    IN MIR-WL-DT-OF-PRCHS
    {
        Length = "10";
        DBTableName = "Derived";
        SType = "Text";
        Label = "Date of Purchase";
    }
    IN MIR-CUSTOD-DECL-DT
    {
        Length = "10";
        DBTableName = "Derived";
        SType = "Text";
        Label = "Declared Date";
    }
    IN MIR-ACUM-DIV-PD
    {
        Signed;
        Length = "15";
        DBTableName = "TPOL";
        SType = "Currency";
        Label = "Accumulated dividends paid";
    }
    IN MIR-CNVR-DECL-DT
    {
        Length = "10";
        DBTableName = "Derived";
        SType = "Text";
        Label = "Declared Date";
    }
    IN MIR-INCR-SURV-FACE-AMT
    {
        Signed;
        Length = "15";
        DBTableName = "TPOL";
        SType = "Currency";
        Label = "Accumulated dividends paid";
    }
#UY3121 CHANGES ENDS HERE
#UY304A CHANGES STARTS HERE
    IN MIR-OS-DISB-TRM-DT
    {
        DisplayOnly;
        Length = "10";
        SType = "Date";
        Label = "OS Disb Term - Date";
    }
    IN MIR-NO-ACCDNT-BNFT-AMT
    {
         CurrencyCode = "MIR-PREM-CRCY-CD";
         DisplayOnly;
         Length = "15";
         SType = "Currency";
         Label = "No Accident Benefit Amount";
    }
    IN MIR-NO-ACCDNT-PMT-DT
    {
        Length = "10";
        DBTableName = "TPOL";
        SType = "Text";
        Label = "No Accident Payment (Charge Back) Date";
    }
    IN MIR-ACCUM-OS-AMT
    {
         CurrencyCode = "MIR-PREM-CRCY-CD";
         DisplayOnly;
         Length = "15";
         SType = "Currency";
         Label = "Accumulated Outstanding Amount";
    }
    IN MIR-ANTY-DEFR-AMT
    {
         CurrencyCode = "MIR-PREM-CRCY-CD";
         DisplayOnly;
         Length = "15";
         SType = "Currency";
         Label = "Tax Qualified Annuity Deferred amount";
    }
    IN MIR-ANTY-DEFR-INT-AMT
    {
         CurrencyCode = "MIR-PREM-CRCY-CD";
         DisplayOnly;
         Length = "15";
         SType = "Currency";
         Label = "Tax Qualified Annuity Deferred Interest Amount";
    }
    IN MIR-ANTY-DEFR-DT
    {
        Length = "10";
        DBTableName = "TPOL";
        SType = "Text";
        Label = " Tax Qualified Annuity Deferred deposit date";
    }
    IN MIR-ANTY-DEFR-INT-DT
    {
        Length = "10";
        DBTableName = "TPOL";
        SType = "Text";
        Label = "Tax Qualified Annuity Deferred interest date";
    }
#UY3153 CHANGES START HERE
    IN MIR-ANTY-ACUM-DIV-AMT
    {    
        CurrencyCode = "MIR-POL-CRCY-CD";
        DisplayOnly;
        Signed;
        Length = "17";
        SType = "Currency";
        Label = "Annuity Accumulated Dividend Amount";
    }
#UY3153 CHANGES END HERE 
#UY304A CHANGES ENDS HERE
}

