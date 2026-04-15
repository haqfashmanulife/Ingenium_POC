# Converted from PathFinder 2.2 to 3.0 Jun 18, 2004 3:13:52 PM EDT

#*******************************************************************************
#*  Component:   BF9F91-P.p                                                    *
#*  Description: Survival Benefit Payout Process-Confirm Transaction           *
#*                                                                             *
#*******************************************************************************
#*  UY3037  CTS      INGENIUM SURVIVAL BENEFIT                                 *
#*******************************************************************************

P-STEP BF9F91-P
{
    ATTRIBUTES
    {
        BusinessFunctionId = "9F91";
        BusinessFunctionName = "Survival Benefit Quote";
        BusinessFunctionType = "Retrieve";
        MirName = "CCWM9F91";
    }

    OUT LSIR-RETURN-CD;

    OUT MIR-RETRN-CD;

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

    OUT MIR-DV-OWN-CLI-NM
    {
        Length = "75";
        DBTableName = "Derived";
        SType = "Text";
        Label = "Owner name"; 

    }
    INOUT MIR-APPL-CTL-PRCES-DT    
    {    
        Length = "10";    
        DBTableName = "TMAST";      
        SType = "Date";    
        Label = "Process Date";    
    }    

    INOUT MIR-CO-RECV-DT
    {
        Length = "10";
        SType = "Date";
        Label = "Company Received Date";
    }

    INOUT MIR-DV-TRNXT-PAYO-MTHD-CD
    {
        Length = "1";
        CodeSource = "DataModel";
        CodeType = "DV-TRNXT-PAYO-MTHD-CD";
        SType = "Selection";
        DBTableName = "Derived";
        Label = "Pay Out Method";
    }

    INOUT MIR-JRNL-DT
    {
        Length = "10";
        SType = "Date";
        Label = "Journal Date";
    }

    INOUT MIR-DV-PRCES-STATE-CD
    {
        Length = "1";
        DBTableName = "Derived";
        SType = "Hidden";
        Label = "Process State";
    }
    
    OUT MIR-SRVBEN-EFF-DT
    {
        Length = "10";
        SType = "Date";
        DBTableName = "TPOL";
        Label = "Survival Benefit Payout Effective Date";
    }
    
   OUT MIR-SRVBEN-PAYO-AMT
   {
        Length = "20";
        SType = "Currency";
        Label = "Survival Benefit Payout Amount";
   }
   
   OUT MIR-CLM-DED-AMT
   {
        Length = "20";
        SType = "Currency";
        Label = "Deduction amount";
   }
    
   OUT MIR-DEFR-SRVBEN-PAYO-AMT
   {
        Length = "20";
        SType = "Currency";
        Label = "Deferral Survival Benefit Payout Amount";
    }
    
    OUT MIR-DEFR-INT-AMT
    {
        Length = "20";
        SType = "Currency";
        Label = "Deferral Interest Amount";
    }
    
    OUT MIR-NET-PAYO-AMT
    {
        Length = "20";            
        SType = "Currency";
        Label = "Net Payout Amount";
    }

    OUT MIR-CLM-POL-ID-T[99]
    {
        Length = "10";
        FieldGroup = "Table99";
        SType = "Text";
        Label = "Policy No";
        Index = "1";
    }
    
    OUT MIR-CLM-ID-T[99]
    {
        Length = "8";
        FieldGroup = "Table99";
        SType = "Text";
        Label = "Claim Id";
        Index = "1";
    }

    OUT MIR-CLM-CVG-NUM-T[99]
    {
        Length = "2";
        FieldGroup = "Table99";
        DBTableName = "TCVG";
        SType = "Text";
        Label = "Coverage No";
        Index = "1";
    }

    OUT MIR-BNFT-NM-T[99]
    {
        Length = "5";
        FieldGroup = "Table99";
        SType = "Text";
        Label = "Benefit Name";
        Index = "1";
        CodeSource = "EDIT";
	CodeType = "BENNM";
    }

    OUT MIR-STRT-DT-T[99]
    {
        Length = "10";
        FieldGroup = "Table99";
        SType = "Date";
        Label = "Start date";
        Index = "1";
    }

    OUT MIR-END-DT-T[99]
    {
        Length = "10";
        FieldGroup = "Table99";
        SType = "Date";
        Label = "End date";
        Index = "1";
    }
    
    OUT MIR-EVNT-UNIT-QTY-T[99]
    {
        Length = "6";
        FieldGroup = "Table99";      
        SType = "Text";
        Label = "Units";
        Index = "1";
    }
    
     OUT MIR-MULT-AMT-T[99]
    {
        Length = "7";
        FieldGroup = "Table99";      
        SType = "Text";
        Label = "Multiplier";
        Index = "1";
    }

    OUT MIR-ELIG-DAYS-T[99]
    {
        Length = "2";
        FieldGroup = "Table99";
        SType = "Text";
        Label = "Elligible days";
        Index = "1";
    }

    OUT MIR-CVG-FACE-AMT-T[99]
    {
        Length = "16";
        FieldGroup = "Table99";
        SType = "Currency";
        Label = "Face Amount at the end of 5 years";
        Index = "1";
    }

    OUT MIR-BNFT-MED-AMT-T[99]
    {
        Length = "16";
        FieldGroup = "Table99";
        SType = "Currency";
        Label = "Medical Benefit Amount";
        Index = "1";
    }

    
    OUT MIR-LOAN-RPAY-EFF-DT
    {
        Length = "10";
        SType = "Date";
        Label = "Loan Repayment effective date";
    }
    
    OUT MIR-LOAN-INT-STRT-DT
    {
        Length = "10";
        SType = "Date";
        Label = "Loan interest start date";
    }
    
    OUT MIR-LOAN-POL-CHNG-CAT
    {
        Length = "25";
        SType = "Text";
        Label = "Loan Transaction category";
    }
    
    OUT MIR-LOAN-RPAY-PRCES-DT
    {
        Length = "10";
        SType = "Date";
        Label = "Process Date";
    }
      
    OUT MIR-CSH-LOAN-BAL-AMT
    {
        Length = "16";
        SType = "Currency";
        Label = "Policy Loan Balance";
    }
    
    OUT MIR-XCES-SHRT-INT-AMT
    {
        Length = "40";
        SType = "Text";
        Label = "Excess or Shortage of Interest";
    }
    
    OUT MIR-UNEARNED-INT-AMT
    {
        Length = "16";
        SType = "Currency";
        Label = "Unearned Interest";
    }
    
    OUT MIR-OUTSTAND-INT-AMT
    {
        Length = "16";
        SType = "Currency";
        Label = "outstanding Interest";
    }
    
    OUT MIR-TOT-LOAN-RPAY-AMT
    {
        Length = "16";
        SType = "Currency";
        Label = "Repayment of Loan amount";
    }
    
    OUT MIR-APL-TRNSF-EFF-DT
    {
        Length = "10";
        SType = "Date";
        Label = "APL effective date";
    }
    
    OUT MIR-APL-SELF-SWNG-CAP-DT
    {
        Length = "10";
        SType = "Date";
        Label = "APL next interest capitalization date";
    }
    
    OUT MIR-APL-SELF-POL-CHNG-CAT
    {
        Length = "25";
        SType = "Text";
        Label = "APL Transaction category";
    }
    
    OUT MIR-APL-PRCES-DT
    {
        Length = "10";
        SType = "Date";
        Label = "Process Date";
    } 
  
    OUT MIR-APL-PRNCPL-INT-AMT
    {
        Length = "16";
        SType = "Currency";
        Label = "APL balance";
    }
    
    OUT MIR-APL-INT-AMT
    {
        Length = "16";
        SType = "Currency";
        Label = "APL Interest";
    }
    
    OUT MIR-APL-PAY-AMT
    {
        Length = "16";
        SType = "Currency";
        Label = "APL payment amount";
    } 
    
    OUT MIR-TOT-APL-CSH-LOAN-AMT
    {
        Length = "16";
        SType = "Currency";
        Label = "Total amount APL/Loan Repayment";
    }

}
