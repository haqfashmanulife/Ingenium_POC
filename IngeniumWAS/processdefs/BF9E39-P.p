# Converted from PathFinder 2.2 to 3.0 Jun 18, 2004 3:13:38 PM EDT

#*******************************************************************************
#*  Component:   BF9E39-P.p                                                    *
#*  Description: Maturity Quote Screen                                         *
#*                                                                             *
#*******************************************************************************
#*  Chg#    Release  Description                                               *
#*                                                                             *
#*  23802D  13APR22  Intial Version                                            *
#*  UY3048  06MAY23  CTS    ENHANCMENT FOR MATURITY DEFERMENT                  *
#*  UY3136  28MAR24  CTS    EDUCATIONAL CONGRATULATORY BENEFIT                 *
#*******************************************************************************

P-STEP BF9E39-P
{
    ATTRIBUTES
    {
        BusinessFunctionId = "9E39";
        BusinessFunctionName = "Maturity Quote";
        BusinessFunctionType = "Quotemat";
        MirName = "SCWM9E39";
    }

    OUT LSIR-RETURN-CD;

    OUT MIR-RETRN-CD;

    IN MIR-DV-PRCES-STATE-CD
    {
        Length = "1";
        SType = "Hidden";
        DBTableName = "Derived";
        Label = "Process State";
    }

    INOUT MIR-DV-UNDO-VALID-CD
    {
        Length = "1";
        SType="Hidden";
    }

    OUT MIR-DV-OWN-CLI-NM
    {
        Length = "75";
        SType = "Text";
        Label = "Policyholder Name";
    }

    INOUT MIR-POL-ID-BASE
    {
        Key;
        Mandatory;
        Length = "9";
        DBTableName = "TPOL";
        SType = "Text";
        Label = "Policy Id";
    }

    INOUT MIR-POL-ID-SFX
    {
        Key;
        Length = "1";
        SType = "Text";
        Label = "Suffix";
    }

    INOUT MIR-PRCES-DT
    {
      
        Length = "10";
        DBTableName = "TMAST";
        SType = "Date";
        Label = "Process Date";
    }

    INOUT MIR-EVNT-ACTV-CD
    {
        Length = "1";
        CodeSource = "DataModel";
        CodeType = "EVNT-ACTV-TYP-CD";
        SType = "Selection";
        Label = "Activity Type";
    }

    INOUT MIR-POL-PERI-CD
    {
        Length = "2";
        CodeSource = "DataModel";
        CodeType = "POL-PERI-CD";
        SType = "Text";
        Label = "Policy Period";
    }

    OUT MIR-POL-BILL-MODE-CD
    {
        Length = "2";
        CodeSource = "DataModel";
        CodeType = "PLAN-BILL-MODE-CD";
        SType = "Text";
        Label = "Billing Mode";
    } 

    OUT MIR-DV-POL-PAYO-TYP-CD
    {
        Length = "1";
        CodeSource = "DataModel";
        CodeType = "DV-POL-PAYO-TYP-CD";
        SType = "Text";
        Label = "Allocation Type";
    }

    OUT MIR-POL-MAT-DT 
    {
        Length = "10";
        SType = "Date";
        DBTableName = "TCVG";
        Label = "Maturity Date";
    }

    OUT MIR-MATURITY-AMT
    {
        Length = "15";
        SType = "Currency";
        Label = "Maturity amount";
    }  

    OUT MIR-SEG-FND-AMT
    {
        Length = "15";
        SType = "Currency";
        Label = "Fund Amount";
    }  

    OUT MIR-POL-CHNG-DT
    {
        Length = "10";
        DBTableName = "TCVG";
        SType = "Date";
        Label = "Change Date";
    } 

    OUT MIR-SNGL-PREM-PLAN-ID
    {
       
        Length = "6";
        CodeSource = "EDIT";
        CodeType = "PLAN";
        SType = "Text";
        Label = "Plan ID after change";
    }   

    OUT MIR-POL-PERI-DUR
    {
        Length = "2";
        CodeSource = "DataModel";
        CodeType = "POL-PERI-CD";
        SType = "Text";
        Label = "Policy Period";
    }

    OUT MIR-SNGL-PREM-FACE-AMT
    {
        Length = "16";
        SType = "Currency";
        Label = "Face Amount after Change";
    }
 

    OUT MIR-ORIG-FACE-AMT
    {
        Length = "16";
        SType = "Currency";
        Label = "(Reference)Face Amount Before Change";
    }

    INOUT MIR-CVG-NUM-T[99]
    {
        Length = "2";
        FieldGroup = "Table99";
        SType = "Text";
        Label = "Coverage Number";
        Index = "1";
    }

    OUT MIR-PLAN-ID-T[99]
    {
        Length = "6";
        FieldGroup = "Table99";
        CodeSource = "EDIT";
        CodeType = "PLAN";
        SType = "Text";
        Label = "Plan";
        Index = "1";
    }

    OUT MIR-CVG-CSTAT-CD-T[99]
    {
        Length = "40";
        FieldGroup = "Table99";
        CodeSource = "DataModel";
        CodeType = "CVG-CSTAT-CD";
        DBTableName = "TCVG";
        SType = "Text";
        Label = "Coverage Status";
        Index = "1";
    }

    INOUT MIR-CDI-CVG-ALLOC-AMT-T[99]
    {
        Length = "15";
        FieldGroup = "Table99";
        SType = "Currency";
        Label = "Allocation Amount to Coverage";
        Index = "1";
    }

    OUT MIR-DV-FND-DESC-TXT-T[99]
    {
        Length = "40";
        FieldGroup = "Table99";
        KeyColumn;
        CodeSource = "EDIT";
        CodeType = "SEGFD";
        DBTableName = "TFS";
        SType = "Text";
        Label = "Fund Name";
        Index = "1";
    }

    INOUT MIR-CDI-ALLOC-PCT-T[99]
    {
        Length = "7";
        Decimals = "0";
        FieldGroup = "Table99";
        SType = "Percent";
        Label = "Allocation Percentage to Fund";
        Index = "1";
    }

    INOUT MIR-CDI-ALLOC-AMT-T[99]
    {
        Length = "15";
        FieldGroup = "Table99";
        SType = "Currency";
        Label = "Amount Allocation to Fund";
        Index = "1";
    }

    OUT MIR-DV-JS-LOAD-CD-T[99]
    {
        Length = "1";
        FieldGroup = "Table99";
        SType = "Text";
        Label = "Java Script Load Code";
        Index = "1";
    }

    OUT MIR-CFN-STAT-CD-T[99]
    {
        Length = "40";
        FieldGroup = "Table99";
        CodeSource = "DataModel";
        CodeType = "CFN-STAT-CD";
        DBTableName = "TFS";
        SType = "Text";
        Label = "Status";
        Index = "1";
    }

    OUT MIR-SNGL-PREM-AMT
    {
        Length = "15";
        SType = "Currency";
        Label = "Single Premium";
    }   

    OUT MIR-PAYMT-MAT-AMT
    {
        Length = "15";
        SType = "Currency";
        Label = "Maturity amount";
    } 

    OUT MIR-SHRT-PREM-AMT
    {
        Length = "17";
        DBTableName = "Derived";
        SType = "Currency";
        Label = "Shortage Premium";
    }
    
    OUT MIR-DV-INC-TAXWH-AMT
    { 
        Length = "15";
        SType = "Currency";
        Label = "Separate Withholding Tax (Income Tax)";
    }
    
    OUT MIR-DV-LOC-TAXWH-AMT
    { 
        Length = "15";
        SType = "Currency";
        Label = "Separate Withholding Tax (Local Tax)";
    }

    OUT MIR-PRE-PAY-INT-AMT
    {
        Length = "15";
        SType = "Currency";
        Label = "Prepayment Interest";
     }

    OUT MIR-OVR-PAID-PREM-AMT
    {
        Length = "15";
        SType = "Currency";
        Label = "Overpaid Premium";
    }

    OUT MIR-POL-BT-SUSP-AMT
    {   
        Length = "15"; 
        SType = "Currency"; 
        Label = "Bank Transfer Suspense"; 
    }
    
    OUT MIR-POL-PD-SUSP-AMT
    {   
        Length = "15"; 
        SType = "Currency"; 
        Label = "Payroll Deduction Suspense"; 
    }
    
    OUT MIR-POL-CC-SUSP-AMT
    {   
        Length = "15"; 
        SType = "Currency"; 
        Label = "Cash Collection Suspense"; 
    }
#UY3048 changes starts
     OUT MIR-UNPAID-PREM-AMT
     {
        Length = "15";
        SType = "Currency";
        Label = "Unpaid Premium";
     }    
    OUT MIR-LOAN-REPAY-AMT
    {
        Length = "15"; 
        SType = "Currency";
        Label = "Policy Loan Balance";
    }
    OUT MIR-APL-RPAY-AMT
    {   
        Length = "15";
        SType = "Currency"; 
        Label = "APL Balance"; 
    }
    OUT MIR-LOAN-INT-AMT
    {   
        Length = "15";
        SType = "Currency"; 
        Label = "Policy loan interest"; 
    }
    OUT MIR-LOAN-OVR-SHRT-AMT
    {   
        Length = "15";
        SType = "Currency"; 
        Label = "Excess/Short Interest"; 
    }
    OUT MIR-APL-INT-AMT
    {   
        Length = "15";
        SType = "Currency"; 
        Label = "APL Interest"; 
    }
    OUT MIR-DELAY-INT-AMT
    {   
        Length = "15";
        SType = "Currency"; 
        Label = "Delinquent Interest"; 
    }
    OUT MIR-POL-LOAN-INT-AMT
    {   
        Length = "15";
        SType = "Currency"; 
        Label = "Policy loan interest(total)"; 
    }
    OUT MIR-UNEARN-LOAN-INT-AMT
    {   
        Length = "15";
        SType = "Currency"; 
        Label = "Loan Interest (Unearned)"; 
    }
    OUT MIR-LOAN-XCES-SHRT-AMT
    {   
        Length = "15";
        SType = "Currency"; 
        Label = "Excess Interest of Policy Loan Repayments"; 
    }
    OUT MIR-TOT-SCHLR-AMT
    {   
        Length = "15";
        SType = "Currency"; 
        Label = "Scholarship"; 
    }
    OUT MIR-TOT-EMP-DIV-AMT
    {   
        Length = "15";
        SType = "Currency"; 
        Label = "Employee dividends (total)"; 
    }
    OUT MIR-EMP-DIV-AMT
    {   
        Length = "15";
        SType = "Currency"; 
        Label = "Employee dividend"; 
    }
    OUT MIR-MAT-DIV-AMT
    {   
        Length = "15";
        SType = "Currency"; 
        Label = "Maturity Dividend"; 
    }
    OUT MIR-ACCUM-DIV-AMT
    {   
        Length = "15";
        SType = "Currency"; 
        Label = "Accumulated dividend"; 
    }
    OUT MIR-ADM-CNGRT-AMT
    {   
        Length = "15";
        SType = "Currency"; 
#UY3136 changes starts        
       #Label = "Admission congratulatory fee"; 
        Label = "Educational Congratulatory Benefit";
#UY3136 changes Ends 
    }
    OUT MIR-SRV-BNFT-AMT
    {   
        Length = "15";
        SType = "Currency"; 
        Label = "Survival benefit total"; 
    }
    OUT MIR-VEST-AMT
    {   
        Length = "15";
        SType = "Currency"; 
        Label = "Vesting amount"; 
    }
#UY3048 changes ENDS

    OUT MIR-REMIT-AMT
    {
        Length = "15";
        SType = "Currency";
        Label = "Total Remittance Amount";
    }

}