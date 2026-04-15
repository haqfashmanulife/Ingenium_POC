# Converted from PathFinder 2.2 to 3.0 Jun 18, 2004 3:12:39 PM EDT

#*******************************************************************************
#*  Component:   BF9E39-O.s                                                    *
#*  Description: Maturity Quote - Result                                       *
#*                                                                             *
#*******************************************************************************
#*  Chg#    Release  Description                                               *
#*                                                                             *
#*  23802D  13APR22  Intial Version                                            *
#*  UY3048  06MAY23  CTS    ENHANCMENT FOR MATURITY DEFERMENT                  *
#*  UY3136  28MAR24  CTS    EDUCATIONAL CONGRATULATORY BENEFIT                 *
#*******************************************************************************

S-STEP BF9E39-O
{
    ATTRIBUTES
    {
        BusinessFunctionType = "Quotemat";
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

    IN MIR-POL-ID-BASE
    {
        Key;
        DisplayOnly;
        Length = "9";
        SType = "Text";
        Label = "Policy Id";
    }

    IN MIR-POL-ID-SFX
    {
        Key;
        DisplayOnly;
        Length = "1";
        SType = "Text";
        Label = "Suffix";
    }

    IN MIR-PRCES-DT
    {
        DisplayOnly;
        Length = "10";
        SType = "Date";
        Label = "Process Date";
    }

    IN MIR-EVNT-ACTV-CD
    {
        DisplayOnly;
        Length = "5";
        CodeSource = "DataModel";
        CodeType = "EVNT-ACTV-TYP-CD";
        SType = "Text";
        Label = "Activity Type";
    }

    IN MIR-POL-PERI-CD
    {
        DisplayOnly;
        Length = "2";
        CodeSource = "DataModel";
        CodeType = "POL-PERI-CD";
        SType = "Text";
        Label = "Policy Period";
    }

    IN MIR-DV-OWN-CLI-NM
    {
        DisplayOnly;
        Length = "75";
        SType = "Text";
        Label = "Policyholder Name";
    }

    IN MIR-POL-BILL-MODE-CD
    {       
        DisplayOnly;
        Length = "2";
        CodeSource = "DataModel";
        CodeType = "PLAN-BILL-MODE-CD";
        SType = "Text";
        Label = "Billing Mode";
    } 

    IN MIR-POL-MAT-DT 
    {
        DisplayOnly;
        Length = "10";
        SType = "Date";
        Label = "Maturity Date";
    }

    IN MIR-MATURITY-AMT
    {
        DisplayOnly;
        Length = "15";
        SType = "Currency";
        Label = "Maturity amount";
    }  

    IN MIR-SEG-FND-AMT
    {
        DisplayOnly;
        Length = "15";
        SType = "Currency";
        Label = "Fund Amount";
    }

    IN MIR-SNGL-PREM-AMT
    {
        DisplayOnly;
        Length = "16";
        SType = "Currency";
        Label = "Single Premium";
    }

    IN MIR-PAYMT-MAT-AMT
    {
        DisplayOnly;
        Length = "15";
        SType = "Currency";
        Label = "Maturity amount";
    }  

    IN MIR-SHRT-PREM-AMT
    {
        DisplayOnly;
        Length = "17";
        SType = "Currency";
        Label = "Shortage Premium";
    }
    
    IN MIR-DV-INC-TAXWH-AMT
    { 
        DisplayOnly;
        Length = "20";
        SType = "Currency";
        Label = "Separate Withholding Tax (Income Tax)";
    }
    
    IN MIR-DV-LOC-TAXWH-AMT
    { 
        DisplayOnly;
        Length = "20";
        SType = "Currency";
        Label = "Separate Withholding Tax (Local Tax)";
    }

    IN MIR-PRE-PAY-INT-AMT
    {
        DisplayOnly;
        Length = "15";
        SType = "Currency";
        Label = "Prepayment Interest";
    }

    IN MIR-OVR-PAID-PREM-AMT
    {
    
        DisplayOnly;
        Length = "17";
        SType = "Currency";
        Label = "Overpaid Premium";
    }

    IN MIR-POL-BT-SUSP-AMT
    {   
        DisplayOnly;
        Length = "15"; 
        SType = "Currency"; 
        Label = "Bank Transfer Suspense"; 
    }
    
    IN MIR-POL-PD-SUSP-AMT
    {   
        DisplayOnly;
        Length = "15"; 
        SType = "Currency"; 
        Label = "Payroll Deduction Suspense"; 
    }
    
    IN MIR-POL-CC-SUSP-AMT
    {   
        DisplayOnly;
        Length = "15"; 
        SType = "Currency"; 
        Label = "Cash Collection Suspense"; 
    }
#UY3048 changes starts
     IN MIR-UNPAID-PREM-AMT
     {
        DisplayOnly;
        Length = "15";
        SType = "Currency";
        Label = "Unpaid Premium";
     }    
    IN MIR-LOAN-REPAY-AMT
    {
        DisplayOnly;
        Length = "15"; 
        SType = "Currency";
        Label = "Policy Loan Balance";
    }
    IN MIR-APL-RPAY-AMT
    {   
        DisplayOnly;
        Length = "15";
        SType = "Currency"; 
        Label = "APL Balance"; 
    }
    IN MIR-APL-INT-AMT
    {   
        DisplayOnly;
        Length = "15"; 
        SType = "Currency"; 
        Label = "APL Interest"; 
    }
    IN MIR-DELAY-INT-AMT
    {   
        DisplayOnly;
        Length = "15"; 
        SType = "Currency"; 
        Label = "Delinquent Interest"; 
    }
    IN MIR-POL-LOAN-INT-AMT
    {   
        DisplayOnly;
        Length = "15";
        SType = "Currency"; 
        Label = "Policy loan interest(total)"; 
    }
    IN MIR-UNEARN-LOAN-INT-AMT
    {   
        DisplayOnly;
        Length = "15";
        SType = "Currency"; 
        Label = "Loan Interest (Unearned)"; 
    }
    IN MIR-LOAN-XCES-SHRT-AMT
    {   
        DisplayOnly;
        Length = "15";
        SType = "Currency"; 
        Label = "Excess Interest of Policy Loan Repayments"; 
    }
    IN MIR-TOT-SCHLR-AMT
    {   
        DisplayOnly;
        Length = "15";
        SType = "Currency"; 
        Label = "Scholarship"; 
    }
    IN MIR-LOAN-INT-AMT
    {   
        DisplayOnly;
        Length = "15";
        SType = "Currency"; 
        Label = "Policy loan interest"; 
    }
    IN MIR-LOAN-OVR-SHRT-AMT
    {   
        DisplayOnly;
        Length = "15";
        SType = "Currency"; 
        Label = "Excess/Short Interest"; 
    }
    IN MIR-TOT-EMP-DIV-AMT
    {   
        DisplayOnly;
        Length = "15";
        SType = "Currency"; 
        Label = "Employee dividends (total)"; 
    }
    IN MIR-EMP-DIV-AMT
    {   
        DisplayOnly;
        Length = "15";
        SType = "Currency"; 
        Label = "Employee dividend"; 
    }
    IN MIR-MAT-DIV-AMT
    {   
        DisplayOnly;
        Length = "15";
        SType = "Currency"; 
        Label = "Maturity Dividend"; 
    }
    IN MIR-ACCUM-DIV-AMT
    {   
        DisplayOnly;
        Length = "15";
        SType = "Currency"; 
        Label = "Accumulated dividend"; 
    }
    IN MIR-ADM-CNGRT-AMT
    {   
        DisplayOnly;
        Length = "15";
        SType = "Currency"; 
#UY3136 changes starts        
       #Label = "Admission congratulatory fee"; 
        Label = "Educational Congratulatory Benefit";
#UY3136 changes Ends        
    }
    IN MIR-SRV-BNFT-AMT
    {   
        DisplayOnly;
        Length = "15";
        SType = "Currency"; 
        Label = "Survival benefit total"; 
    }
    IN MIR-VEST-AMT
    {   
        DisplayOnly;
        Length = "15";
        SType = "Currency"; 
        Label = "Vesting Amount"; 
    }
#UY3048 changes ENDS
  IN MIR-REMIT-AMT
    {
        DisplayOnly;
        Length = "15";
        SType = "Currency";
        Label = "Total Remittance Amount";
    }

}
