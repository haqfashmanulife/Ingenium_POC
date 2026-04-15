# Converted from PathFinder 2.2 to 3.0 Jun 18, 2004 3:13:53 PM EDT

#*******************************************************************************
#*  Component:   BF6983-P.p                                                    *
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
#*  FEID09  CTS     ADDED NEW FIELDS:                                          *
#*                      MIR-INIT-PREM-SUSP-AMT                                 *
#*                      MIR-INIT-PREM-SUSP-DT                                  *
#*  NWLBCA  CTS      ADDED FOLLOWING FIELDS FOR TRAD POLICIES PROCESSING:      *
#*                      MIR-OVR-SHRT-PREM-AMT                                  *
#*                      MIR-OVR-SHRT-PREM-DT                                   *
#*  NWLCAR  CTS      ADDED FOLLOWING FIELDS                                    *
#*                      MIR-TOT-PREM-COLCT-CRNT-YR                             *
#*                      MIR-TOT-PREM-COLCT-PREV-YR                             *
#*                      MIR-TOT-PREM-ACCUM-TPID                                *
#*                                                                             *
#*  ATU446  CTS      CHANGED LABELS FOR FIELDS INTRODUCED AS PART OF NWLCAR    *
#*  NWLPP5  CTS      CHANGES TO ADD A NEW FIELD UNEARNED PREMIUM FOR ADV PMT   *
#*  NWLLRP  CTS      LOAN REPAYMENT                                            *
#*                     MIR-LOAN-XCES-SHRT-AMT                                  *
#*                     MIR-LOAN-XCES-SHRT-DT                                   *
#*  NWLLTC  CTS      CHANGES TO ADD NEW FIELDS FOR LOAN PROCESING              *
#*  NWLLCC  CTS      CHANGES DONE FOR CALL CENTER INQUIRY SCREEN               *
#*  MP1544  CTS      CHANGES DONE FOR CALL CENTER INQUIRY SCREEN               *
#*  M142F2  CTS      CHANGES TO ADD NEW FIELDS FOR SURVIVOR BENIFIT            *
#*  Q10123  CTS      M161CA - CHANGES DONE FOR CREDIT CARD                     *
#*  MP185H CTS       ADDED TWO NEW FIELDS AS A PART OF LIMITED                 *
#*  MP185H           PAY UL WL RIDERS                                          *
#*  M245B2  CTS      Foreign Currency Formatting                               *
#*  MP245R  CTS      CHANGES FOR BILLING & CURRENCY FIELDS - SPWL POLICIES     *
#*  M271O1  CTS      FRA Foreign Currency Formatting 			       *
#*  M271A7  CTS      Online Screen Changes done as part of FRA                 *
#*  TDMG07  CTS      SCREEN CHANGES FOR NWL                                    *
#*  118579  CTS      CHANGES DONE TO CORRECT THE FIELD PREMIUM PAYMENT         *
#*  118579           DESCRIPTION                                               *
#*  FFF10R  CTS      CHANGES DONE FOR CC SUSPENSE HANDLING                     *
#*  UYS050  CTS     ADDITION OF Elapsed Duration of CSV FILED                  *
#*  TL0763  CTS     ADDITION OF Elapsed Duration of CSV FILED                  *
#*  UYS025  CTS      ADVANCE PAYMENT RESERVE AMOUNT FIELD ADDED                *
#*  UYS104  CTS      ADD OF FIELD PROPORTIONAL DISTRIBUTION PAID               *
#*                   PREMIUM CALC FLAG                                         *
#*  UYSD11  CTS      ADDIITION OF UNISYS MIGRATION TYPE CODE                   *
#*  UY3060  CTS     SYSTEM SPEC B INGENIUM-DIVIDEND PROCESSING                 *
#*  UY3094  CTS      TERM INSURANCE FINAL ADJUSTMENT PAYMENT                   *
#*  UY3121  CTS      CR121 CHANGES                                             *
#*  UY304A  CTS      CALL CENTER SCREEN ENHANCEMENT                            *
#*  UY3153  CTS      CR148 AND 149 CHANGES                                     *
#*  NVCA05  CTS      CHANGES DONE FOR AUTOMATIC PREMIUM SUSPENSION    	       *
#*******************************************************************************


P-STEP BF6983-P
{
    ATTRIBUTES
    {
        BusinessFunctionId = "6983";
        BusinessFunctionName = "Policy Inquiry - Other Values";
        BusinessFunctionType = "Valueotr";
        MirName = "CCWM6983";
    }

    OUT LSIR-RETURN-CD;

    OUT MIR-RETRN-CD;

    INOUT MIR-APPL-CTL-PRCES-DT
    {
        Key;
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

    OUT MIR-CVG-CLM-LTD-AMT
    {
        Signed;
        Length = "17";
        DBTableName = "TCVG";
        SType = "Currency";
        Label = "Total Claims Paid";
    }

    OUT MIR-CVG-CLM-YTD-AMT
    {
        Signed;
        Length = "17";
        DBTableName = "TCVG";
        SType = "Currency";
        Label = "Claims Paid Year to Date";
    }

    OUT MIR-CVG-WP-LTD-AMT
    {
        Signed;
        Length = "15";
        DBTableName = "TCVG";
        SType = "Currency";
        Label = "Total Premiums Waived";
    }

    OUT MIR-CVG-WP-YTD-AMT
    {
        Signed;
        Length = "15";
        DBTableName = "TCVG";
        SType = "Currency";
        Label = "Waiver of Premium Amounts Paid Year to Date";
    }

    OUT MIR-DIV-DCLR-LTD-AMT
    {
        Signed;
        Length = "17";
        DBTableName = "TPOL";
        SType = "Currency";
        Label = "Total Dividends Declared";
    }

    OUT MIR-DIV-DCLR-YTD-AMT
    {
        Signed;
        Length = "15";
        DBTableName = "TPOL";
        SType = "Currency";
        Label = "Dividends Declared Year to Date";
    }

    OUT MIR-DOD-CRNT-INT-AMT
    {
        Signed;
        Length = "13";
        DBTableName = "TPOL";
        SType = "Currency";
        Label = "Dividends on Deposit Interest";
    }

    OUT MIR-DV-ANNV-PYR-QTY
    {
        Length = "4";
        DBTableName = "Derived";
        SType = "Text";
        Label = "Anniversary Processing Year";
    }

    OUT MIR-DV-OWN-CLI-NM
    {
        Length = "75";
        DBTableName = "Derived";
        SType = "Text";
        Label = "Owner Name";
    }

    OUT MIR-DV-PREV-DIV-YR-QTY
    {
        Length = "4";
        DBTableName = "Derived";
        SType = "Text";
        Label = "Year Last Declared";
    }

    OUT MIR-LATST-ACTV-DT
    {
        Length = "10";
        DBTableName = "TPOL";
        SType = "Date";
        Label = "Last Accounting Date";
    }

    OUT MIR-POL-BILL-TO-DT-NUM
    {
        Length = "10";
        DBTableName = "TPOL";
        SType = "Date";
        Label = "Billed to Date";
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
    
    # TDMG07 changes begin
    	    
    OUT MIR-PREM-PMT-CMPLT-IND
    {
    	DisplayOnly;
    	Length = "1";
    	SType = "Indicator";
# 118579 changes begin      
#       Label = "Premium Payment Completion";
	Label = "Base Policy Premium Payment Completion";
# 118579 changes end 
    }
    	    		    
   # TDMG07 changes end 

    OUT MIR-POL-CVG-REC-CTR
    {
        Length = "40";
        DBTableName = "TPOL";
        SType = "Text";
        Label = "Number of Coverages";
    }

    OUT MIR-POL-DIV-DT
    {
        Length = "10";
        DBTableName = "TPOL";
        SType = "Date";
        Label = "Dividend Last Paid Date";
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

    OUT MIR-POL-DIV-SUSP-AMT
    {
        Signed;
        Length = "15";
        DBTableName = "TPOL";
        SType = "Currency";
        Label = "Dividend Suspense";
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
        Label = "OS Disb - JPY Premium Account Last Updated";
    }  
#UYSD11 CHANGES START HERE

    OUT MIR-USYS-MIGR-POL-IND
    {    
        Length = "1";
        DBTableName = "TPOL";
        SType = "Indicator";
        Label = "Migrated Policy";
    }

# UYSD11 CHANGES END HERE
    
#M271A7 CHANGES END HERE   

    OUT MIR-POL-DOD-ACUM-AMT
    {
        Signed;
        Length = "17";
        DBTableName = "TPOL";
        SType = "Currency";
        Label = "Dividends on Deposit";
    }

    OUT MIR-POL-DOD-AVB-AMT
    {
        Signed;
        Length = "17";
        DBTableName = "TPOL";
        SType = "Currency";
        Label = "Dividend Average Balance";
    }

    OUT MIR-POL-DOD-INT-RT
    {
        Signed;
        Length = "7";
        Decimals = "5";
        DBTableName = "TPOL";
        SType = "Percent";
        Label = "Current Dividend Interest Rate";
    }

    OUT MIR-POL-MISC-SUSP-AMT
    {
        Signed;
        Length = "19";
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

    OUT MIR-POL-MPREM-AMT
    {
        Signed;
        Length = "17";
        DBTableName = "TPOL";
        SType = "Currency";
        Label = "Mode Premium Amount";
    }

    OUT MIR-POL-OS-DISB-AMT
    {
        Signed;
        Length = "19";
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
        Length = "19";
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
        Length = "19";
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
        Length = "19";
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
        Length = "19";
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
        Length = "19";
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

    OUT MIR-OS-DISB-LOAN-DT
    {
        Length = "10";
        DBTableName = "TPOL";
        SType = "Date";
        Label = "Outstanding Disbursements Loan Date";
    }
#NWLLTC CHANGES ENDS HERE
#M142F2 CHANGES STARTS HERE
    OUT MIR-OS-DISB-SRVBEN-AMT
    {
        Signed;
        Length = "15";
        DBTableName = "TPOL";
        SType = "Currency";
        Label = "Outstanding Disbursements -Survival Benifit";
    }

    OUT MIR-OS-DISB-SRVBEN-DT
    {
        Length = "10";
        DBTableName = "TPOL";
        SType = "Date";
        Label = "Outstanding Disbursements Survival Benifit Date";
    }
#M142F2 CHANGES ENDS HERE
    OUT MIR-POL-OYT-AMT
    {
        Length = "14";
#M245B2 CHANGES START HERE         
#       Decimals = "0";
#M245B2 CHANGES END HERE 
        DBTableName = "TPOL";
        SType = "Currency";
        Label = "One Year Term Purchased with Dividend";
    }
#UY3060 CHANGES START HERE
     
    OUT MIR-SPCL-DIV-OPT-CD
    {
        Length = "40";
        CodeSource = "DataModel";
        CodeType = "SPCL-DIV-OPT-CD";
        DBTableName = "TPOL";
        SType = "Text";
        Label = "Special Dividend Option";
    }

#UY3060 CHANGES END HERE

#UY3094 CHANGES START HERE

    OUT MIR-TERM-INS-FINL-ADJ-TOT-PAY
    {
        DisplayOnly;
        Signed;
        Length = "15";
        SType = "Currency";
        Label = "Term Insurance Final Adjustment Total Payment";
    }

    OUT MIR-NON-ACC-BNFT-PAY-AMT
    {
        DisplayOnly;
        Signed;
        Length = "15";
        SType = "Currency";
        Label = "Non Accidental Benefit Payment Amount";
    }

    OUT MIR-DIV-AMT
    {
        DisplayOnly;
        Signed;
        Length = "15";
        SType = "Currency";
        Label = "Dividend Amount";
    }

    OUT MIR-HLTH-BNFT-BNUS
    {
        DisplayOnly;
        Signed;
        Length = "15";
        SType = "Currency";
        Label = "Health Benefit(Bonus)";
    }

    OUT MIR-TOT-UNPD-NON-ACC-BNFT
    {
        DisplayOnly;
        Signed;
        Length = "15";
        SType = "Currency";
        Label = "Total unpaid non accidental benefit";
    }
    OUT MIR-DEFR-PAY
    {
        DisplayOnly;
        Signed;
        Length = "15";
        SType = "Currency";
        Label = "deferred payment";
    }

    OUT MIR-UNERND-LOAN-INT
    {
        DisplayOnly;
        Signed;
        Length = "15";
        SType = "Currency";
        Label = "Loan Interest(Unearned)";
    }

    OUT MIR-EXCES-INT-POL-LOAN-REPAY
    {
        DisplayOnly;
        Signed;
        Length = "15";
        SType = "Currency";
        Label = "Excess interest of policy loan repayment";
    }

    OUT MIR-SRV-BNFT-AMT
    {
        DisplayOnly;
        Signed;
        Length = "15";
        SType = "Currency";
        Label = "Survival Benefit";
    }


    OUT MIR-INC-SURV-BNFT
    {
        DisplayOnly;
        Signed;
        Length = "15";
        SType = "Currency";
        Label = "Increased Survival Benefit";
    }
#UY3094 CHANGES ENDS HERE
    OUT MIR-POL-PDF-AMT
    {
        Signed;
        Length = "15";
        DBTableName = "TPOL";
        SType = "Currency";
        Label = "Premium Deposit Funds";
    }

    OUT MIR-POL-PDF-AVB-AMT
    {
        Signed;
        Length = "15";
        DBTableName = "TPOL";
        SType = "Currency";
        Label = "Premium Deposit Funds Average Balance";
    }

    OUT MIR-POL-PDF-INT-AMT
    {
        Signed;
        Length = "13";
        DBTableName = "TPOL";
        SType = "Currency";
        Label = "Interest Accrued on Premium Deposit Funds";
    }

    OUT MIR-POL-PDF-INT-RT
    {
        Signed;
        Length = "7";
        Decimals = "5";
        DBTableName = "TPOL";
        SType = "Percent";
        Label = "Premium Deposit Funds Interest Rate";
    }

    OUT MIR-POL-PDF-SUSP-AMT
    {
        Signed;
        Length = "15";
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

    OUT MIR-POL-PD-TO-DT-NUM
    {
        Length = "10";
        DBTableName = "TPOL";
        SType = "Date";
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

    OUT MIR-POL-PREM-SUSP-AMT
    {
        Signed;
        Length = "19";
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

    OUT MIR-PREV-FILE-MAINT-DT
    {
        Length = "10";
        DBTableName = "TPOL";
        SType = "Date";
        Label = "Last Change Date";
    }

    OUT MIR-PUA-CLR-FACE-AMT
    {
        Signed;
        Length = "17";
        DBTableName = "TPOL";
        SType = "Currency";
        Label = "Amount of Paid-up Additions Surrendered";
    }
#UY3060 CHANGES START HERE 
    OUT MIR-PUA-VEST-FACE-AMT
    {
        Signed;
        Length = "15";
        DBTableName = "TPOL";
        SType = "Currency";
        Label = "Total Vesting Paid-up Additions";
    }
    OUT MIR-DEFR-DIV-AMT
    {
        Signed;
        Length = "15";
        DBTableName = "TPOL";
        SType = "Currency";
        Label = "Deferred Dividend Amount";
    }
    OUT MIR-DEFR-DIV-INT-AMT
    {
        Signed;
        Length = "15";
        DBTableName = "TPOL";
        SType = "Currency";
        Label = "Deferred Dividend Interest Amount";
    }
    OUT MIR-DEFR-DIV-DT
    {
        Signed;
        Length = "10";
        DBTableName = "TPOL";
        SType = "Date";
        Label = "Deferred Dividend Date";
    }
    OUT MIR-DEFR-DIV-INT-CAP-DT
    {
        Signed;
        Length = "10";
        DBTableName = "TPOL";
        SType = "Date";
        Label = "Deferred Interest Capitalization Date";
    }
    OUT MIR-DIV-CUSTOD-ACUM-AMT
        {
        Signed;
        Length = "15";
        DBTableName = "TPOL";
        SType = "Currency";
        Label = "Accumulated Dividend on Custody";
    }
    OUT MIR-DIV-CUSTOD-INT-AMT
        {
        Signed;
        Length = "15";
        DBTableName = "TPOL";
        SType = "Currency";
        Label = "Accumulated Interest on Custody";
    }
    OUT MIR-CNVR-ADJ-TOT-DIV-AMT
    {
        Signed;
        Length = "15";
        DBTableName = "TPOL";
        SType = "Currency";
        Label = "Total Conversion Adjusted Dividend Amount";
    }
    OUT MIR-SURV-DEFR-DIV-AMT
    {
        Signed;
        Length = "15";
        DBTableName = "TPOL";
        SType = "Currency";
        Label = "Survival Insurance Deferred Amount";
    }
    OUT MIR-SURV-DEFR-INT-AMT
    {
        Signed;
        Length = "15";
        DBTableName = "TPOL";
        SType = "Currency";
        Label = "Survival Insurance Deferred Interest  Amount";
    }        
    OUT MIR-SURV-DEFR-DIV-DT
    {
        Signed;
        Length = "10";
        DBTableName = "TPOL";
        SType = "Date";
        Label = "Survival Insurance Deferred Date";
    }   
    OUT MIR-SURV-DEFR-INT-DT
    {
        Signed;
        Length = "10";
        DBTableName = "TPOL";
        SType = "Date";
        Label = "Survival Insurance Deferred Interest Capitalization Date";
    }
#UY3060 CHANGES END HERE
    OUT MIR-PUA-LTD-FACE-AMT
    {
        Signed;
        Length = "17";
        DBTableName = "TPOL";
        SType = "Currency";
        Label = "Total Paid-up Additions";
    }

    OUT MIR-PUA-YTD-FACE-AMT
    {
        Signed;
        Length = "17";
        DBTableName = "TPOL";
        SType = "Currency";
        Label = "Current Paid-up Additions";
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

    OUT MIR-SURR-DIV-ACUM-AMT
    {
        Signed;
        Length = "17";
        DBTableName = "TPOL";
        SType = "Currency";
        Label = "Dividends Surrendered";
    }

    OUT MIR-POST-LAPS-SURR-AMT
    {
        Signed;
        Length = "17";
        DBTableName = "TPOL";
        SType = "Currency";
        Label = "Post Lapse Surrender Amount";
    }

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
    
#M142F2 CHANGES STARTS HERE    
    OUT MIR-SRVBEN-LST-PD-YR
    {
        Length = "4";
        DBTableName = "TPOL";
        SType = "Text";
        Label = "Survivorship Benefit Year Last Paid";
    }
       
    OUT MIR-DV-ELIG-SRVBEN-AMT
    {
        Signed;
        Length = "15";
        DBTableName = "TPOL";
        SType = "Currency";
        Label = "Total Eligible Survivorship Benefit Last Time";
    }
    
    OUT MIR-SRVBEN-LST-PD-AMT
    {
        Signed;
        Length = "15";
        DBTableName = "TPOL";
        SType = "Currency";
        Label = "Survivorship Benefit Amount Last Paid to Client";
    }
     
    OUT MIR-DV-ELIG-SRVBEN-LTD-AMT
    {
        Signed;
        Length = "17";
        DBTableName = "TPOL";
        SType = "Currency";
        Label = "Total Eligible Survivorship Benefit Amount Life-to-Date";
    }
       
    OUT MIR-SRVBEN-LTD-PD-AMT
    {
        Signed;
        Length = "17";
        DBTableName = "TPOL";
        SType = "Currency";
        Label = "Survivorship Benefit Amount Paid to Client Life-to-Date";
    }
#M142F2 CHANGES STARTS HERE

    OUT MIR-DHY-SPREM-SUSP-AMT
    {
        Signed;
        Length = "19";
        DBTableName = "TPOL";
        SType = "Currency";
        Label = "Conversion Single Premium Suspense";
    }

    OUT MIR-DHY-SPREM-SUSP-DT
    {
        Length = "10";
        DBTableName = "TPOL";
        SType = "Date";
        Label = "Conversion Single Premium Suspense Account Last Updated";
    }

   OUT MIR-DHY-RSRV-SUSP-AMT
    {
        Signed;
        Length = "19";
        DBTableName = "TPOL";
        SType = "Currency";
        Label = "Conversion Reserve Suspense";
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
        Length = "19";
        DBTableName = "TPOL";
        SType = "Currency";
        Label = "Conversion Outstanding Disbursement";
    }

    OUT MIR-DHY-OS-DISB-DT
    {
        Length = "10";
        DBTableName = "TPOL";
        SType = "Date";
        Label = "Conversion Outstanding Disbursement Last Updated";
    }
#*****FEID09**********
 OUT MIR-INIT-PREM-SUSP-AMT
    {
        Signed;
        Length = "19";
        DBTableName = "TPOL";
        SType = "Currency";
        Label = "Accrual Initial Premium Suspense";
    }

    OUT MIR-INIT-PREM-SUSP-DT
    {
        Length = "10";
        DBTableName = "TPOL";
        SType = "Date";
        Label = "Accrual Initial Premium Suspense Last Updated";
    }

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

	#*****H.L P01931**********
	   OUT MIR-TOT-PREM-COLCT-AMT-CURR
    {
        Signed;
        Length = "19";
        DBTableName = "Derived";
        SType = "Currency";
        Label = "Total Premium Collected Amount - Current Year";
    }

   OUT MIR-TOT-PREM-COLCT-AMT-PREV
    {
        Signed;
        Length = "19";
        DBTableName = "Derived";
        SType = "Currency";
        Label = "Total Premium Collected Amount - Previous Year";
    }

   OUT MIR-TOT-PREM-COLCT-AMT-ACCUM
    {
        Signed;
        Length = "19";
        DBTableName = "Derived";
        SType = "Currency";
        Label = "Total Premium Collected Amount - Accumulation";
    }

   OUT MIR-TOT-PARTL-SURR-AMT-CURR
    {
        Signed;
        Length = "19";
        DBTableName = "Derived";
        SType = "Currency";
        Label = "Total Partial Surrender Amount - Current Year";
    }

   OUT MIR-TOT-PARTL-SURR-AMT-PREV
    {
        Signed;
        Length = "19";
        DBTableName = "Derived";
        SType = "Currency";
        Label = "Total Partial Surrender Amount - Previous Year";
    }

   OUT MIR-TOT-PARTL-SURR-AMT-ACCUM
    {
        Signed;
        Length = "19";
        DBTableName = "Derived";
        SType = "Currency";
        Label = "Total Partial Surrender Amount - Accumulation";
    }

   OUT MIR-TOT-COI-DED-AMT-CURR
    {
        Signed;
        Length = "19";
        DBTableName = "Derived";
        SType = "Currency";
        Label = "Total COI Deducted Amount - Current Year";
    }

   OUT MIR-TOT-COI-DED-AMT-PREV
    {
        Signed;
        Length = "19";
        DBTableName = "Derived";
        SType = "Currency";
        Label = "Total COI Deducted Amount - Previous Year";
    }

   OUT MIR-TOT-COI-DED-AMT-ACCUM
    {
        Signed;
        Length = "19";
        DBTableName = "Derived";
        SType = "Currency";
        Label = "Total COI Deducted Amount - Accumulation";
    }

   OUT MIR-DHY-CONV-RSRV-AMT
    {
        Signed;
        Length = "19";
        DBTableName = "Derived";
        SType = "Currency";
        Label = "DHY Conversion Reserve Amount";
    }

   OUT MIR-DHY-CONV-PREM-AMT
    {
        Signed;
        Length = "19";
        DBTableName = "Derived";
        SType = "Currency";
        Label = "DHY Conversion Single Premium Amount";
    }

   OUT MIR-TOT-PREM-COLCT-NUM-CURR
    {
        Length = "4";
        DBTableName = "Derived";
        SType = "Text";
        Label = "Total Premium Collected Amount - Current Year";
    }

   OUT MIR-TOT-PREM-COLCT-NUM-PREV
    {
        Length = "4";
        DBTableName = "Derived";
        SType = "Text";
        Label = "Total Premium Collected Amount - Previous Year";
    }

   OUT MIR-TOT-PREM-COLCT-NUM-ACCUM
    {
        Length = "4";
        DBTableName = "Derived";
        SType = "Text";
        Label = "Total Premium Collected Amount - Accumulation";
    }

   OUT MIR-TOT-PARTL-SURR-NUM-CURR
    {
        Length = "4";
        DBTableName = "Derived";
        SType = "Text";
        Label = "Total Partial Surrender Amount - Current Year";
    }

   OUT MIR-TOT-PARTL-SURR-NUM-PREV
    {
        Length = "4";
        DBTableName = "Derived";
        SType = "Text";
        Label = "Total Partial Surrender Amount - Previous Year";
    }

   OUT MIR-TOT-PARTL-SURR-NUM-ACCUM
    {
        Length = "4";
        DBTableName = "Derived";
        SType = "Text";
        Label = "Total Partial Surrender Amount - Accumulation";
    }

   OUT MIR-TOT-COI-DED-NUM-CURR
    {
        Length = "4";
        DBTableName = "Derived";
        SType = "Text";
        Label = "Total COI Deducted Amount - Current Year";
    }

   OUT MIR-TOT-COI-DED-NUM-PREV
    {
        Length = "4";
        DBTableName = "Derived";
        SType = "Text";
        Label = "Total COI Deducted Amount - Previous Year";
    }

   OUT MIR-TOT-COI-DED-NUM-ACCUM
    {
        Length = "4";
        DBTableName = "Derived";
        SType = "Text";
        Label = "Total COI Deducted Amount - Accumulation";
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
        Label = "Over Short Premium Account Last Updated";
    }
# Changes for NWLBCA ends here

# Changes for NWLCAR starts here

   OUT MIR-TOT-PREM-ACCUM-TPID
    {
        Signed;
        Length = "17";
        DBTableName = "Derived";
        SType = "Currency";
        Label = "Trad Total Premium Collected Amount - Accumulation";
     }

   OUT MIR-TOT-PREM-COLCT-CRNT-YR
    {
        Signed;
        Length = "17";
        DBTableName = "Derived";
        SType = "Currency";
        Label = "Trad Total Premium Collected - Current Year";
     }

   OUT MIR-TOT-PREM-COLCT-PREV-YR
    {
        Signed;
        Length = "17";
        DBTableName = "Derived";
        SType = "Currency";
        Label = "Trad Total Premium Collected - Previous Year";
     }
# Changes for NWLCAR ends here

# Changes for NWLPP5 begin here

   OUT MIR-DV-UNEARN-PREM
    {
        Signed;
        Length = "17";
        DBTableName = "Derived";
        SType = "Currency";
        Label = "Unearned Premium";
     }

# Changes for NWLPP5 end here
#UYS104 CHANGES START HERE

    OUT MIR-PROPORTN-PREM-IND
    {
        DisplayOnly;
    	Length = "1";
    	SType = "Indicator";
	    Label = "Proportional distribution type paid premium calculation flag";
	}

#UYS104 CHANGES END HERE
# Changes for NWLLRP starts here

    OUT MIR-LOAN-XCES-SHRT-AMT
    {
        Signed;
        Length = "13";
        DBTableName = "TPOL";
        SType = "Currency";
        Label = "Excess / Short Loan Interest";
    }

    OUT MIR-LOAN-XCES-SHRT-DT
    {
        Length = "10";
        DBTableName = "TPOL";
        SType = "Date";
        Label = "Excess / Short Loan Interest  Account Last Updated";
    }

# Changes for NWLLRP ends here
# NWLLCC CHANGES STARTS HERE
    OUT MIR-LOAN-BAL-AMT
    {
        Signed;
        Length = "15";
        DBTableName = "TLHST";
        SType = "Currency";
        Label = "Balance(Excluding Interest)";
    }
    OUT MIR-LOAN-INT-STRT-DT
    {
        Length = "10";
        DBTableName = "TLHST";
        SType = "Date";
        Label = "Interest Start Date";
    }
# NWLLCC CHANGES ENDS HERE    
# NV3A06 CHANGES STARTS HERE
    OUT MIR-SUSP-PREM-TOT-AMT
    {
        Signed;
        Length = "15";
        DBTableName = "";
        SType = "Currency";
        Label = "Suspension Premium Total";
    }
    OUT MIR-MKT-VAL-AMT
    {
        Signed;
        Length = "15";
        DBTableName = "TCFLW";
        SType = "Currency";
        Label = "Market Value (Automatic/By-request premium suspension)";
    }
# NV3A06 CHANGES ENDS HERE 
# MP1544 CHANGES STARTS HERE
    OUT MIR-APL-BAL-AMT
    {
        Signed;
        Length = "15";
        DBTableName = "TLHST";
        SType = "Currency";
        Label = "Balance";
    }
    OUT MIR-APL-EFF-DT
    {
        Length = "10";
        DBTableName = "TLHST";
        SType = "Date";
        Label = "APL Date";
    }
# MP1544 CHANGES ENDS HERE 

# M161CA CHANGES STARTS HERE    
    
    OUT MIR-CRC-RECV-AMT
    {
        DisplayOnly;
        Length = "17";
        SType = "text";
        Label = "Receivable Amount";
    }
    OUT MIR-CRC-RECV-UPDT-DT
    {
        DisplayOnly;
        Length = "10";
        SType = "text";
        Label = "Receivable Account Last Updated";
    }
    
# M161CA CHANGES END HERE  
#* MP185H Changes Begin

   OUT MIR-DV-MAX-PREM-AMT
    {
        DisplayOnly;
        Length = "17";
        SType = "Currency";
        Label = "Maximum Premium(except variable accumulation amount)";   
    }
    
   OUT MIR-DV-XPRY-DT
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
#MP245R CHANGES START HERE 
   INOUT MIR-OS-DISB-CRCY-CD
    {
       
             Length = "2";
             SType = "Hidden";
             Label = "Currency";
    }    
#MP245R CHANGES ENDS HERE 
#M271O1 CHANGES START HERE  
         
    INOUT MIR-PREM-CRCY-CD
    {
        Length = "2";
        SType = "Hidden";
        Label = "Currency";
    }  
#M271O1 CHANGES END HERE 
#TL0763 CHANGES START HERE
    OUT MIR-CSV-ELPSD-DUR
    {
        Length = "7";
        DBTableName = "Derived";
        SType = "Text";
        Label = "Elapsed Duration of CSV";
    }
#TL0763 CHANGES END HERE
#UY3049 CHANGES BEGIN
    OUT MIR-RCVBL-PREM-AMT
    {
        Signed;
        Length = "17";
        DBTableName = "TPOL";
        SType = "Currency";
        Label = "Receivable Premium Amount";
    }

    OUT MIR-RCVBL-ACCT-DT
    {
        Length = "10";
        DBTableName = "TPOL";
        SType = "Date";
        Label = "Receivable Premium Account Last Updated";
    }
#UY3049 CHANGES ENDS
#UY3121 CHANGES STARTS
    OUT MIR-DIV-CRNT-PMT-CTRL
    {
        DisplayOnly;
        Length = "10";
        SType = "Text";
        Label = "Payment Control";
    }
    OUT MIR-DV-CRNT-DIV-AMT
    {
        Signed;
        Length = "15";
        DBTableName = "TPOL";
        SType = "Currency";
        Label = "DDividend Amount";
    }
    OUT MIR-DV-CRNT-DIV-YR
    {
        Length = "4";
        DBTableName = "Derived";
        SType = "Text";
        Label = "Dividend Year";
    }
    OUT MIR-DIV-PREV-PMT-CTRL
    {
        DisplayOnly;
        Length = "10";
        SType = "Text";
        Label = "Payment Control";
    }
    OUT MIR-DV-PREV-DIV-AMT
    {
        Signed;
        Length = "15";
        DBTableName = "TPOL";
        SType = "Currency";
        Label = "Dividend Amount";
    }
    OUT MIR-DV-PREV-DIV-YR
    {
        Length = "4";
        DBTableName = "Derived";
        SType = "Text";
        Label = "Dividend Year";
    }
    OUT MIR-VEST-DEFR-DIV-AMT
    {
        Signed;
        Length = "15";
        DBTableName = "TPOL";
        SType = "Currency";
        Label = "Deferral Amount";
    }
    OUT MIR-VEST-DIV-INT-AMT
    {
        Signed;
        Length = "15";
        DBTableName = "TPOL";
        SType = "Currency";
        Label = "Accumulated Interest";
    }
    OUT MIR-DV-DT-OF-PMT
    {
        Length = "10";
        DBTableName = "Derived";
        SType = "Text";
        Label = "Date of Payment";
    }
    OUT MIR-DV-VEST-AMT-PD
    {
        Signed;
        Length = "15";
        DBTableName = "TPOL";
        SType = "Currency";
        Label = "Vesting Amount Paid (including interest)";
    }
    OUT MIR-SPL-DEFR-DIV-AMT
    {
        Signed;
        Length = "15";
        DBTableName = "TPOL";
        SType = "Currency";
        Label = "Deposit";
    }
    OUT MIR-SPL-DIV-INT-AMT
    {
        Signed;
        Length = "15";
        DBTableName = "TPOL";
        SType = "Currency";
        Label = "Accumulated Dividend)";
    }
    OUT MIR-SPL-DEFR-DIV-DT
    {
        Length = "10";
        DBTableName = "Derived";
        SType = "Text";
        Label = "Date of last deferred processing";
    }
    OUT MIR-SPL-DIV-INT-CAP-DT
    {
        Length = "10";
        DBTableName = "Derived";
        SType = "Text";
        Label = "Capitilization Date";
    }
    OUT MIR-DV-DT-OF-PRCHS
    {
        Length = "10";
        DBTableName = "Derived";
        SType = "Text";
        Label = "Date of Purchase";
    }
    OUT MIR-DV-FNL-DEFR-PMT
    {
        Signed;
        Length = "15";
        DBTableName = "TPOL";
        SType = "Currency";
        Label = "Final Deferral Payment";
    }
    OUT MIR-DV-FNL-INT-PMT
    {
        Signed;
        Length = "15";
        DBTableName = "TPOL";
        SType = "Currency";
        Label = "Final Interest Payment";
    }
    OUT MIR-WL-DT-OF-PRCHS
    {
        Length = "10";
        DBTableName = "Derived";
        SType = "Text";
        Label = "Date of Purchase";
    }
    OUT MIR-CUSTOD-DECL-DT
    {
        Length = "10";
        DBTableName = "Derived";
        SType = "Text";
        Label = "Declared Date";
    }
    OUT MIR-ACUM-DIV-PD
    {
        Signed;
        Length = "15";
        DBTableName = "TPOL";
        SType = "Currency";
        Label = "Accumulative Purchase benefit ";
    }
    OUT MIR-INCR-SURV-FACE-AMT
    {
        Signed;
        Length = "15";
        DBTableName = "TPOL";
        SType = "Currency";
        Label = "Accumulated dividends paid";
    }
    OUT MIR-CNVR-DECL-DT
    {
        Length = "10";
        DBTableName = "Derived";
        SType = "Text";
        Label = "Declared Date";
    }
#UY3121 CHANGES ENDS HERE
#UY304A CHANGES STARTS HERE
    OUT MIR-OS-DISB-TRM-DT
    {
        DisplayOnly;
        Length = "10";
        SType = "Date";
        Label = "OS Disb Term - Date";
    }
    OUT MIR-NO-ACCDNT-BNFT-AMT
    {
         CurrencyCode = "MIR-PREM-CRCY-CD";
         DisplayOnly;
         Length = "15";
         SType = "Currency";
         Label = "No Accident Benefit Amount";
    }
    OUT MIR-NO-ACCDNT-PMT-DT
    {
        Length = "10";
        DBTableName = "TPOL";
        SType = "Text";
        Label = "No Accident Payment (Charge Back) Date";
    }
    OUT MIR-ACCUM-OS-AMT
    {
         CurrencyCode = "MIR-PREM-CRCY-CD";
         DisplayOnly;
         Length = "15";
         SType = "Currency";
         Label = "Accumulated Outstanding Amount";
    }
    OUT MIR-ANTY-DEFR-AMT
    {
         CurrencyCode = "MIR-PREM-CRCY-CD";
         DisplayOnly;
         Length = "15";
         SType = "Currency";
         Label = "Tax Qualified Annuity Deferred amount";
    }
    OUT MIR-ANTY-DEFR-INT-AMT
    {
         CurrencyCode = "MIR-PREM-CRCY-CD";
         DisplayOnly;
         Length = "15";
         SType = "Currency";
         Label = "Tax Qualified Annuity Deferred Interest Amount";
    }
    OUT MIR-ANTY-DEFR-DT
    {
        Length = "10";
        DBTableName = "TPOL";
        SType = "Text";
        Label = " Tax Qualified Annuity Deferred deposit date";
    }
    OUT MIR-ANTY-DEFR-INT-DT
    {
        Length = "10";
        DBTableName = "TPOL";
        SType = "Text";
        Label = "Tax Qualified Annuity Deferred interest date";
    }
	#UY304A CHANGES ENDS HERE
#UY3153 CHANGES STARTS HERE   
    OUT MIR-ANTY-ACUM-DIV-AMT
    {
        Signed;
        Length = "17";
        DBTableName = "TPOL";
        SType = "Currency";
        Label = "Annuity Accumulated Dividend Amount";
    }
#UY3153 CHANGES STARTS HERE
#NVCA05 CHANGES STARTS
    OUT MIR-POL-MPREM6-AMT
    {
        CurrencyCode = "MIR-PREM-CRCY-CD"; 
        DisplayOnly;
        Signed;
        Length = "15";
        DBTableName = "Derived";
        SType = "Currency";
        Label = "TRAD Monthly Premium*6";
    }

    OUT MIR-POL-MPREM8-AMT    
    {
        CurrencyCode = "MIR-PREM-CRCY-CD"; 
        DisplayOnly;
        Signed;
        Length = "15";
        DBTableName = "Derived";
        SType = "Currency";
        Label = "TRAD Monthly Premium*8";
    }
    
    OUT MIR-POL-MPREM2-AMT    
    {
        CurrencyCode = "MIR-PREM-CRCY-CD"; 
        DisplayOnly;
        Signed;
        Length = "15";
        DBTableName = "Derived";
        SType = "Currency";
        Label = "TRAD Semi-Annual/Annual Premium*2";
    }
#NVCA05 CHANGES END HERE
}
