# Converted from PathFinder 2.2 to 3.0 Jun 18, 2004 3:13:53 PM EDT

#*******************************************************************************
#*  Component:   BF6981-P.p                                                    *
#*  Description:                                                               *
#*                                                                             *
#*******************************************************************************
#*  Chg#    Release  Description                                               *
#*                                                                             *
#*  014590  6.0      New for release 6.0                                       *
#*  016053  6.02J    Money Flow                                                *
#*  017150  612J     Remove Currency Decimals = "2"                            *
#*  02GL03  MAW      ADD POL-BT-SUSP-AMT, POL-PD-SUSP-AMT, POL-CC-SUSP-AMT     *
#*  02GL57  DPK      CWA Suspense Account and Refund                           *
#*  M00011  ROC      OUTSTANDING DISBURSEMENTS, ADD FIELDS:                    *
#*                      OS-DISB-SURR-AMT, OS-DISB-MAT-AMT, OS-DISB-DTH-AMT     *
#*                      OS-DISB-CLM-AMT, OS-DISB-AD-AMT                        *
#*                                                                             *
#*  M245B2  CTS      Foreign Currency Formatting                               *
#*  Q50535  CTS      ADDED PAYMENT CURRENCY CODE FOR CURRENCY DISPLAY          *
#*  MP245R  CTS      CHANGES FOR BILLING FIELDS - SPWL POLICIES                *
#*  M271O1  CTS      FRA Foreign Currency Formatting 			       *
#*  TDMG24  CTS      INQUIRY SCREEN CHANGES                                    * 
#*  FFF10R  CTS      CHANGES DONE FOR CC SUSPENSE HANDLING                     *
#*  UYSD11  CTS      ADDIITION OF UNISYS MIGRATION TYPE CODE                   *
#*******************************************************************************

P-STEP BF6981-P
{
    ATTRIBUTES
    {
        BusinessFunctionId = "6981";
        BusinessFunctionName = "Policy Inquiry - Policy Values";
        BusinessFunctionType = "Valuepol";
        MirName = "CCWM6981";
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

    OUT MIR-CF-MKTVAL-ADJ-AMT
    {
        Signed;
        Length = "17";
        DBTableName = "TCFLW";
        SType = "Currency";
        Label = "Market Value Adjustment";
    }

    OUT MIR-DOD-CRNT-INT-AMT
    {
        Signed;
        Length = "13";
        DBTableName = "TPOL";
        SType = "Currency";
        Label = "Dividends on Deposit Interest";
    }

    OUT MIR-DV-APL-AMT
    {
        Signed;
        Length = "17";
        DBTableName = "Derived";
        SType = "Currency";
        Label = "APL Amount";
    }

    OUT MIR-DV-APL-INT-YTD-AMT
    {
        Signed;
        Length = "15";
        DBTableName = "Derived";
        SType = "Currency";
        Label = "APL Interest Paid / Capitalized Year to Date";
    }

    OUT MIR-DV-LOAN-AMT
    {
        Signed;
        Length = "17";
        DBTableName = "Derived";
        SType = "Currency";
        Label = "Loan Amount";
    }

    OUT MIR-DV-LOAN-INT-YTD-AMT
    {
        Signed;
        Length = "15";
        DBTableName = "Derived";
        SType = "Currency";
        Label = "Loan Interest Paid / Capitalized Year to Date";
    }

    OUT MIR-DV-MAX-LOAN-AMT
    {
        Signed;
        Length = "17";
        DBTableName = "Derived";
        SType = "Currency";
        Label = "Maximum Loan Amount Available";
    }

    OUT MIR-DV-MCV-ACUM-AMT
    {
        Signed;
        Length = "17";
        DBTableName = "Derived";
        SType = "Currency";
        Label = "Minimum Contract Value Accumulated Amount";
    }

    OUT MIR-DV-MCV-CSV-AMT
    {
        Signed;
        Length = "17";
        DBTableName = "Derived";
        SType = "Currency";
        Label = "MCV/Net Base Cash Value";
    }

    OUT MIR-DV-MTHV-ADJ-AMT
    {
        Signed;
        Length = "17";
        DBTableName = "Derived";
        SType = "Currency";
        Label = "Monthiversary Charge";
    }

    OUT MIR-DV-NET-CSV-AMT
    {
        Signed;
        Length = "17";
        DBTableName = "Derived";
        SType = "Currency";
        Label = "Net Base Cash Value";
    }

    OUT MIR-DV-OWN-CLI-NM
    {
        Length = "75";
        DBTableName = "Derived";
        SType = "Text";
        Label = "Owner Name";
    }

    OUT MIR-DV-POL-BASE-CV-AMT
    {
        Signed;
        Length = "19";
        DBTableName = "Derived";
        SType = "Currency";
        Label = "Base Cash Value";
    }

    OUT MIR-DV-POL-BON-CSH-AMT
    {
        Signed;
        Length = "17";
        DBTableName = "Derived";
        SType = "Currency";
        Label = "Total Bonus";
    }

    OUT MIR-DV-POL-CSV-AMT
    {
        Signed;
        Length = "19";
        DBTableName = "Derived";
        SType = "Currency";
        Label = "Cash Surrender Value";
    }

    OUT MIR-DV-PREM-RFND-AMT
    {
        Signed;
        Length = "17";
        DBTableName = "Derived";
        SType = "Currency";
        Label = "Unearned Premium";
    }

    OUT MIR-DV-OS-MPREM-AMT
    {
        Signed;
        Length = "17";
        DBTableName = "Derived";
        SType = "Currency";
        Label = "Outstanding Premium (Loan)";
    }

    OUT MIR-DV-SURR-CHRG-AMT
    {
        Signed;
        Length = "17";
        DBTableName = "Derived";
        SType = "Currency";
        Label = "Surrender Charge";
    }

    OUT MIR-DV-TRMNL-DTH-AMT
    {
        Signed;
        Length = "17";
        DBTableName = "Derived";
        SType = "Currency";
        Label = "Terminal Bonus for Death";
    }

    OUT MIR-DV-TRMNL-SURR-AMT
    {
        Signed;
        Length = "17";
        DBTableName = "Derived";
        SType = "Currency";
        Label = "Terminal Bonus for Surrender";
    }

    OUT MIR-DV-VALU-PUA-AMT
    {
        Signed;
        Length = "17";
        DBTableName = "Derived";
        SType = "Currency";
        Label = "Paid-up Additions Cash Value";
    }

    OUT MIR-PLAN-CSV-DT-TYP-CD
    {
        Length = "40";
        CodeSource = "DataModel";
        CodeType = "PLAN-CSV-DT-TYP-CD";
        DBTableName = "TPH";
        SType = "Text";
        Label = "Cash Value Calculated Type";
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

    OUT MIR-POL-CVG-REC-CTR
    {
        Length = "40";
        DBTableName = "TPOL";
        SType = "Text";
        Label = "Number of Coverages";
    }

    OUT MIR-POL-DOD-ACUM-AMT
    {
        Signed;
        Length = "17";
        DBTableName = "TPOL";
        SType = "Currency";
        Label = "Dividends on Deposit";
    }

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

    OUT MIR-OS-DISB-SURR-AMT
    {
        Signed;
        Length = "19";
        DBTableName = "TPOL";
        SType = "Currency";
        Label = "Outstanding Disbursements - Surrender";
    }

    OUT MIR-OS-DISB-MAT-AMT
    {
        Signed;
        Length = "19";
        DBTableName = "TPOL";
        SType = "Currency";
        Label = "Outstanding Disbursements - Maturity";
    }

    OUT MIR-OS-DISB-DTH-AMT
    {
        Signed;
        Length = "19";
        DBTableName = "TPOL";
        SType = "Currency";
        Label = "Outstanding Disbursements - Death";
    }

    OUT MIR-OS-DISB-CLM-AMT
    {
        Signed;
        Length = "19";
        DBTableName = "TPOL";
        SType = "Currency";
        Label = "Outstanding Disbursements - Claims";
    }

    OUT MIR-OS-DISB-AD-AMT
    {
        Signed;
        Length = "19";
        DBTableName = "TPOL";
        SType = "Currency";
        Label = "Outstanding Disbursements - Accidental Death";
    }
     
    OUT MIR-POL-BT-SUSP-AMT
    {
        Signed;
        Length = "13";
        DBTableName = "TPOL";
        SType = "Currency";
        Label = "Bank Transfer Suspense";
    }

    OUT MIR-POL-PD-SUSP-AMT
    {
        Signed;
        Length = "13";
        DBTableName = "TPOL";
        SType = "Currency";
        Label = "Payroll Deduction Suspense";
    }

    OUT MIR-POL-CC-SUSP-AMT
    {
        Signed;
        Length = "13";
        DBTableName = "TPOL";
        SType = "Currency";
        Label = "Cash Collection Suspense";
    }

    OUT MIR-POL-PDF-AMT
    {
        Signed;
        Length = "15";
        DBTableName = "TPOL";
        SType = "Currency";
        Label = "Premium Deposit Funds";
    }

    OUT MIR-POL-PDF-INT-AMT
    {
        Signed;
        Length = "13";
        DBTableName = "TPOL";
        SType = "Currency";
        Label = "Interest Accrued on Premium Deposit Funds";
    }

    OUT MIR-POL-PREM-SUSP-AMT
    {
        Signed;
        Length = "19";
        DBTableName = "TPOL";
        SType = "Currency";
        Label = "Premium Suspense";
    }
     
    OUT MIR-POL-CWA-SUSP-AMT
    {
        Signed;
        Length = "13";
        DBTableName = "TPOL";
        SType = "Currency";
        Label = "Cash with App Suspense";
    }
     
    OUT MIR-CSH-RFND-SUSP-AMT
    {
        Signed;
        Length = "13";
        DBTableName = "TPOL";
        SType = "Currency";
        Label = "Cash Refund Suspense";
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

    OUT MIR-TRM-PREM-RFND-RT
    {
        Signed;
        Length = "11";
        Decimals = "4";
        DBTableName = "TPH";
        SType = "Percent";
        Label = "Percentage of Premium to Refund";
    }

    OUT MIR-POL-PDF-SUSP-AMT
    {
        Signed;
        Length = "15";
        DBTableName = "TPOL";
        SType = "Currency";
        Label = "Premium Deposit Fund Suspense";
    }

    OUT MIR-POL-DIV-SUSP-AMT
    {
        Signed;
        Length = "15";
        DBTableName = "TPOL";
        SType = "Currency";
        Label = "Dividend Suspense";
    }

    OUT MIR-DV-LOAN-MAX-DSCNT-PCT
    {
        Signed;
        Length = "8";
        Decimals = "5";
        DBTableName = "Derived";
        SType = "Number";
        Label = "Loan Maximum/Discount Percentage";
    }

    OUT MIR-DV-POL-SURR-AMT
    {
        Signed;
        Length = "17";
        DBTableName = "Derived";
        SType = "Currency";
        Label = "Full Policy Surrender Value";
    }

    OUT MIR-DV-POL-ACUM-AMT
    {
        Signed;
        Length = "17";
        DBTableName = "Derived";
        SType = "Currency";
        Label = "Total Policy Accumulation Value";
    }

    OUT MIR-DV-SE-XSLD-RFND-AMT
    {
        Signed;
        Length = "17";
        DBTableName = "Derived";
        SType = "Currency";
        Label = "SEC Excess Sales Loads";
    }

    OUT MIR-POL-UL-SHRT-AMT
    {
        Signed;
        Length = "17";
        DBTableName = "TPOL";
        SType = "Currency";
        Label = "UL Policy Shortage Amount";
    }
#M245B2 CHANGES START HERE      
    INOUT MIR-POL-CRCY-CD
            {
               
                Length = "2";
                SType = "Hidden";
                Label = "Currency";
      }
#Q50535 CHANGES STARTS HERE
    INOUT MIR-PMT-CRCY-CD
            {
               
                Length = "2";
                SType = "Hidden";
                Label = "Currency";
      }
#Q50535 CHANGES ENDS HERE
#M245B2 CHANGES END HERE  
#FFF10R CHANGES START HERE 
     INOUT MIR-CC-SUSP-CRCY-CD
      {
          Length = "2";       
          SType = "Hidden";
          Label = "Currency";
       }   
#FFF10R CHANGES ENDS HERE 

#UYSD11 CHANGES START HERE

    OUT MIR-USYS-MIGR-POL-IND
    {    
        Length = "1";
        DBTableName = "TPOL";
        SType = "Indicator";
        Label = "Migrated Policy";
    }

# UYSD11 CHANGES END HERE

#MP245R CHANGES START HERE 
   INOUT MIR-OS-DISB-CRCY-CD
    {
       
       Length = "2";
       SType = "Hidden";
       Label = "Currency";
    }    
#MP245R CHANGES ENDT HERE 
#M271O1 CHANGES START HERE  
         
    INOUT MIR-PREM-CRCY-CD
    {
        Length = "2";
        SType = "Hidden";
        Label = "Currency";
    }  
#M271O1 CHANGES END HERE 

}

