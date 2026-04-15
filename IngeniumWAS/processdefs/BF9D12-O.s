#*******************************************************************************
#*  Component:   BF9D12-O.s                                                    *
#*  Description: Survival Benefit Payout Process                               *
#*                                                                             *
#*******************************************************************************
#*                                                                             *
#*  MP302A  CTS      INITIAL VERSION                                           *
#*  UY3037  CTS      INGENIUM SURVIVAL BENEFIT                                 *
#*  27549A  CTS      CHANGES DONE AS PART OF CDAP PROJECT                      *
#*******************************************************************************

S-STEP BF9D12-O
{
    ATTRIBUTES
    {
        BusinessFunctionType = "TDSrvb";
        DelEmptyRows;
        FocusField = "confirmButton";
        FocusFrame = "ButtonFrame";
        Type = "Output";
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
	SType="Hidden";
    }

    IN MIR-POL-ID-BASE 
    {
        DisplayOnly;
        Key;
        Label = "Policy Id";
        Length = "9";
        SType = "Text";
    }
    
   IN MIR-POL-ID-SFX
    {
        Key;
        DisplayOnly;
        Length = "1";
        SType = "Text";
        Label = "Suffix";
    }

    IN MIR-DV-OWN-CLI-NM
    {
	Length = "50";
	DisplayOnly;
	SType = "Text";
	Label = "Owner name"; 
    }
    
    IN MIR-APPL-CTL-PRCES-DT
    {
        Label = "Process Date";
        Length = "10";
        SType = "Date";
    }

    IN MIR-CO-RECV-DT
    {
        DisplayOnly;
        Label = "Company Received Date";
        Length = "10";
        SType = "Date";
    }

    IN MIR-DV-TRNXT-PAYO-MTHD-CD
    {
        CodeSource = "DataModel";
        CodeType = "DV-TRNXT-PAYO-MTHD-CD";
        Label = "Pay Out Method";
        Length = "1";
        SType = "Text";
        DisplayOnly;
    }

    IN MIR-JRNL-DT
    {
        DisplayOnly;
        Label = "Journal Date";
        Length = "10";
        SType = "Date";
    }
    
    IN MIR-SRVBEN-EFF-DT
    {
	Length = "10";
	SType = "Date";
	DBTableName = "TPOL";
	DisplayOnly;
	Label = "Survival Benefit Payout Effective Date";
     }
        
    IN MIR-SRVBEN-PAYO-AMT
    {
        Length = "20";
        SType = "Currency";
        DisplayOnly;
        Label = "Survival Benefit Payout Amount";
     }
       
    IN MIR-CLM-DED-AMT
    {
        Length = "20";
        SType = "Currency";
        DisplayOnly;
        Label = "Deduction Amount";
    }
        
    IN MIR-DEFR-SRVBEN-PAYO-AMT
    {
	Length = "20";
	SType = "Currency";               
	DisplayOnly;
	Label = "Deferral Survival Benefit Payout Amount";
    }
        
    IN MIR-DEFR-INT-AMT
    {
	Length = "20";                
	SType = "Currency";               
	DisplayOnly;
	Label = "Deferral Interest Amount";
    }
        
    IN MIR-NET-PAYO-AMT
    {
	Length = "20";              
	SType = "Currency";               
	DisplayOnly;
	Label = "Net Payout Amount";
    }
        
    IN MIR-CLM-POL-ID-T[99] 
    {
        DisplayOnly;
        FieldGroup = "Table99";
        KeyColumn;
        Label = "Policy No";
        Length = "10";
        SType = "Text";
        Index = "1";
    }

    IN MIR-CLM-ID-T[99] 
    {
        DisplayOnly;
        FieldGroup = "Table99";
        Index = "1";
        Label = "Claim Id";
        Length = "8";
        SType = "Text";
    }
    
    IN MIR-CLM-CVG-NUM-T[99] 
    {
        DisplayOnly;
        FieldGroup = "Table99";
        DBTableName = "TCVG";
        Index = "1";
        Label = "Coverage No";
        Length = "2";
        SType = "Text";
    }
    
    IN MIR-BNFT-NM-T[99]
    {
        DisplayOnly;
        Length = "5";
        FieldGroup = "Table99";
        SType = "Text";
        Label = "Benefit Name";
        Index = "1";
       CodeSource = "EDIT";
	CodeType = "BENNM";
    }
    
    IN MIR-STRT-DT-T[99]
    {
        Length = "10";
        FieldGroup = "Table99";           
        DisplayOnly;
        SType = "Date";
        Label = "Start date";
        Index = "1";
     }
    
    IN MIR-END-DT-T[99]
    {
        Length = "10";
        FieldGroup = "Table99";
        DisplayOnly;
        SType = "Date";
        Label = "End date";
        Index = "1";
    }
        
    IN MIR-EVNT-UNIT-QTY-T[99]
    {
        Length = "6";
        FieldGroup = "Table99";
        DisplayOnly;
        SType = "Text";
        Label = "Paid Unit";
        Index = "1";
    }
    
    IN MIR-MULT-AMT-T[99]
        {
            Length = "7";
            FieldGroup = "Table99";
            DisplayOnly;
            SType = "Text";
            Label = "Multiplier";
            Index = "1";
        }
    
   IN MIR-ELIG-DAYS-T[99]
   {
        Length = "7";
        FieldGroup = "Table99";
        DisplayOnly;
        SType = "Text";
        Label = "Elligible days";
        Index = "1";
    }
    
    IN MIR-CVG-FACE-AMT-T[99]
    {
        Length = "16";
        FieldGroup = "Table99";
        DisplayOnly;
        SType = "Currency";
        Label = "Face Amount at the end of 5 years";
        Index = "1";
    }
    
    IN MIR-BNFT-MED-AMT-T[99]
    {
        Length = "16";
        FieldGroup = "Table99";
        DisplayOnly;
        SType = "Currency";
        Label = "Medical Benefit Amount";
        Index = "1";
    }
    #UY3037 CHANGES STARTS HERE
   IN MIR-LOAN-RPAY-EFF-DT
    {
        Length = "10";
        SType = "Date";
        DisplayOnly;
        Label = "Loan Repayment effective date";
    }
    
    IN MIR-LOAN-INT-STRT-DT
    {
        Length = "10";
        SType = "Date";
        DisplayOnly;
        Label = "Loan interest start date";
    }
    
    IN MIR-LOAN-POL-CHNG-CAT
    {
        Length = "25";
        SType = "Text";
        DisplayOnly;
        Label = "Loan Transaction category";
    }
    
    IN MIR-LOAN-RPAY-PRCES-DT
    {
        Length = "10";
        SType = "Date";
        DisplayOnly;
        Label = "Process Date";
    } 
  
    IN MIR-CSH-LOAN-BAL-AMT
    {
        Length = "16";
        SType = "Currency";
        DisplayOnly;
        Label = "Policy Loan Balance";
    }
    
    IN MIR-XCES-SHRT-INT-AMT
    {
        Length = "40";
        SType = "Text";
        DisplayOnly;
        Label = "Excess or Shortage of Interest";
    }
    
    IN MIR-UNEARNED-INT-AMT
    {
        Length = "16";
        SType = "Currency";
        DisplayOnly;
        Label = "Unearned Interest";
    }
    
    IN MIR-OUTSTAND-INT-AMT
    {
        Length = "16";
        SType = "Currency";
        DisplayOnly;
        Label = "outstanding Interest";
    }
    
    IN MIR-TOT-LOAN-RPAY-AMT
    {
        Length = "16";
        SType = "Currency";
        DisplayOnly;
        Label = "Repayment of Loan amount";
    }
    
    IN MIR-APL-TRNSF-EFF-DT
    {
        Length = "10";
        SType = "Date";
        DisplayOnly;
        Label = "APL effective date";
    }
    
    IN MIR-APL-SELF-SWNG-CAP-DT
    {
        Length = "10";
        SType = "Date";
        DisplayOnly;
        Label = "APL next interest capitalization date";
    }
    
    IN MIR-APL-SELF-POL-CHNG-CAT
    {
        Length = "25";
        SType = "Text";
        DisplayOnly;
        Label = "APL Transaction category";
    }
    
    IN MIR-APL-PRCES-DT
    {
        Length = "10";
        SType = "Date";
        DisplayOnly;
        Label = "Process Date";
    } 
      
    IN MIR-APL-PRNCPL-INT-AMT
    {
        Length = "16";
        SType = "Currency";
        DisplayOnly;
        Label = "APL balance";
    }
    
    IN MIR-APL-INT-AMT
    {
        Length = "16";
        SType = "Currency";
        DisplayOnly;
        Label = "APL Interest";
    }
    
    IN MIR-APL-PAY-AMT
    {
        Length = "16";
        SType = "Currency";
        DisplayOnly;
        Label = "APL payment amount";
    } 
    
    IN MIR-TOT-APL-CSH-LOAN-AMT
    {
        Length = "16";
        SType = "Currency";
        DisplayOnly;
        Label = "Total amount APL/Loan Repayment";
    }
    #UY3037 CHANGES ENDS HERE
    
     #27549A - Changes Start here    
    IN MIR-ATO-NOT-APPL-IND
    {
        Length = "1";
        DisplayOnly;
        SType = "Indicator";
        Label = "ATO not applicable";
    }
#27549A- Changes ends here

}
