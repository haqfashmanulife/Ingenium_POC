# Converted from PathFinder 2.2 to 3.0 Jun 18, 2004 3:13:01 PM EDT

#*******************************************************************************
#*  Component:   BF6981-O.s                                                    *
#*  Description:                                                               *
#*                                                                             *
#*******************************************************************************
#*  Chg#    Release  Description                                               *
#*                                                                             *
#*  014590  6.0      New for release 6.0                                       *
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
#*  M319O1  CTS      FXWL Currency Code Changes                                *
#*  TDMG24  CTS      INQUIRY SCREEN CHANGES                                    * 
#*  FFF10R  CTS      CHANGES DONE FOR CC SUSPENSE HANDLING                     *
#*  UYSD11  CTS      ADDIITION OF UNISYS MIGRATION TYPE CODE                   *
#*******************************************************************************

S-STEP BF6981-O
{
    ATTRIBUTES
    {
        BusinessFunctionType = "Valuepol";
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

    IN MIR-CF-MKTVAL-ADJ-AMT
    {
#M245B2 CHANGES START HERE    
        CurrencyCode = "MIR-POL-CRCY-CD";
#M245B2 CHANGES END HERE 
        DisplayOnly;
        Signed;
        Length = "17";
        SType = "Currency";
        Label = "Market Value Adjustment";
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

    IN MIR-DV-APL-AMT
    {
#M245B2 CHANGES START HERE    
        CurrencyCode = "MIR-POL-CRCY-CD";
#M245B2 CHANGES END HERE 
        DisplayOnly;
        Signed;
        Length = "17";
        SType = "Currency";
        Label = "APL Amount";
    }

    IN MIR-DV-APL-INT-YTD-AMT
    {
#M245B2 CHANGES START HERE    
        CurrencyCode = "MIR-POL-CRCY-CD";
#M245B2 CHANGES END HERE 
        DisplayOnly;
        Signed;
        Length = "15";
        SType = "Currency";
        Label = "APL Interest Paid / Capitalized Year to Date";
    }

    IN MIR-DV-LOAN-AMT
    {
#M245B2 CHANGES START HERE    
        CurrencyCode = "MIR-POL-CRCY-CD";
#M245B2 CHANGES END HERE 
        DisplayOnly;
        Signed;
        Length = "17";
        SType = "Currency";
        Label = "Loan Amount";
    }

    IN MIR-DV-LOAN-INT-YTD-AMT
    {
#M245B2 CHANGES START HERE    
        CurrencyCode = "MIR-POL-CRCY-CD";
#M245B2 CHANGES END HERE 
        DisplayOnly;
        Signed;
        Length = "15";
        SType = "Currency";
        Label = "Loan Interest Paid / Capitalized Year to Date";
    }

    IN MIR-DV-MAX-LOAN-AMT
    {
#M245B2 CHANGES START HERE    
        CurrencyCode = "MIR-POL-CRCY-CD";
#M245B2 CHANGES END HERE 
        DisplayOnly;
        Signed;
        Length = "17";
        SType = "Currency";
        Label = "Maximum Loan Amount Available";
    }

    IN MIR-DV-MCV-ACUM-AMT
    {
#M245B2 CHANGES START HERE    
        CurrencyCode = "MIR-POL-CRCY-CD";
#M245B2 CHANGES END HERE  
        DisplayOnly;
        Signed;
        Length = "17";
        SType = "Currency";
        Label = "Minimum Contract Value Accumulated Amount";
    }

    IN MIR-DV-MCV-CSV-AMT
    {
#M245B2 CHANGES START HERE    
        CurrencyCode = "MIR-POL-CRCY-CD";
#M245B2 CHANGES END HERE 
        DisplayOnly;
        Signed;
        Length = "17";
        SType = "Currency";
        Label = "MCV/Net Base Cash Value";
    }

    IN MIR-DV-MTHV-ADJ-AMT
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
        Label = "Monthiversary Charge";
    }

    IN MIR-DV-NET-CSV-AMT
    {
#M245B2 CHANGES START HERE    
        CurrencyCode = "MIR-POL-CRCY-CD";
#M245B2 CHANGES END HERE 
        DisplayOnly;
        Signed;
        Length = "17";
        SType = "Currency";
        Label = "Net Base Cash Value";
    }

    IN MIR-DV-OWN-CLI-NM
    {
        DisplayOnly;
        Length = "75";
        SType = "Text";
        Label = "Owner Name";
    }

    IN MIR-DV-POL-BASE-CV-AMT
    {
#M245B2 CHANGES START HERE    
        CurrencyCode = "MIR-POL-CRCY-CD";
#M245B2 CHANGES END HERE 
        DisplayOnly;
        Signed;
        Length = "19";
        SType = "Currency";
        Label = "Base Cash Value";
    }

    IN MIR-DV-POL-BON-CSH-AMT
    {
#M245B2 CHANGES START HERE    
        CurrencyCode = "MIR-POL-CRCY-CD";
#M245B2 CHANGES END HERE 
        DisplayOnly;
        Signed;
        Length = "17";
        SType = "Currency";
        Label = "Total Bonus";
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

    IN MIR-DV-PREM-RFND-AMT
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
        Label = "Unearned Premium";
    }

    IN MIR-DV-SURR-CHRG-AMT
    {
#M245B2 CHANGES START HERE    
        CurrencyCode = "MIR-POL-CRCY-CD";
#M245B2 CHANGES END HERE 
        DisplayOnly;
        Signed;
        Length = "17";
        SType = "Currency";
        Label = "Surrender Charge";
    }

    IN MIR-DV-TRMNL-DTH-AMT
    {
#M245B2 CHANGES START HERE    
        CurrencyCode = "MIR-POL-CRCY-CD";
#M245B2 CHANGES END HERE 
        DisplayOnly;
        Signed;
        Length = "17";
        SType = "Currency";
        Label = "Terminal Bonus for Death";
    }

    IN MIR-DV-TRMNL-SURR-AMT
    {
#M245B2 CHANGES START HERE    
        CurrencyCode = "MIR-POL-CRCY-CD";
#M245B2 CHANGES END HERE 
        DisplayOnly;
        Signed;
        Length = "17";
        SType = "Currency";
        Label = "Terminal Bonus for Surrender";
    }

    IN MIR-DV-VALU-PUA-AMT
    {
#M245B2 CHANGES START HERE    
        CurrencyCode = "MIR-POL-CRCY-CD";
#M245B2 CHANGES END HERE  
        DisplayOnly;
        Signed;
        Length = "17";
        SType = "Currency";
        Label = "Paid-up Additions Cash Value";
    }

    IN MIR-PLAN-CSV-DT-TYP-CD
    {
        DisplayOnly;
        Length = "40";
        CodeSource = "DataModel";
        CodeType = "PLAN-CSV-DT-TYP-CD";
        SType = "Text";
        Label = "Cash Value Calculated Type";
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


    IN MIR-POL-CVG-REC-CTR
    {
        DisplayOnly;
        Length = "40";
        SType = "Text";
        Label = "Number of Coverages";
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

# UYSD11 CHANGES BEGINS HERE
    IN MIR-USYS-MIGR-POL-IND
    {    
        DisplayOnly;
        Length = "1";
        SType = "Indicator";
        Label = "Migrated Policy";
    }
# UYSD11 CHANGES ENDS HERE

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
        Length = "15";
        SType = "Currency";
        Label = "Premium Deposit Funds";
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
        Length = "13";
        SType = "Currency";
        Label = "Interest Accrued on Premium Deposit Funds";
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

    IN MIR-SBSDRY-CO-ID
    {
        DisplayOnly;
        Length = "40";
        CodeSource = "EDIT";
        CodeType = "SUBCO";
        SType = "Text";
        Label = "Sub Company";
    }

    IN MIR-TRM-PREM-RFND-RT
    {
        DisplayOnly;
        Signed;
        Length = "11";
        Decimals = "4";
        SType = "Percent";
        Label = "Percentage of Premium to Refund";
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
#MP245R CHANGES STARTS HERE     
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
#FFF10R CHANGES START HERE 
     INOUT MIR-CC-SUSP-CRCY-CD
     {
       Length = "2";       
       SType = "Hidden";
       Label = "Currency";
     }
#FFF10R CHANGES ENDS HERE 
}

