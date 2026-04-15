# Converted from PathFinder 2.2 to 3.0 Jun 18, 2004 3:12:43 PM EDT

#*******************************************************************************
#*  Component:   BF1441-O.s                                                    *
#*  Description:                                                               *
#*                                                                             *
#*******************************************************************************
#*  Chg#    Release  Description                                               *
#*                                                                             *
#*  014590  6.0      New for release 6.0                                       *
#*  017150  612J     Remove Currency Decimals = "2"                            *
#*  NWLPLP  CTS      POLICY LOAN PROCESSING                                    *
#*  M319A2  CTS      Changes done for FXWL Policy Loan Processing              *
#*                                                                             *
#*******************************************************************************

S-STEP BF1441-O
{
    ATTRIBUTES
    {
        BusinessFunctionType = "Reversal";
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

    IN MIR-ACCT-BASE-ID-T[2]
    {
        DisplayOnly;
        Length = "6";
        FieldGroup = "Table2";
        SType = "Text";
        Label = "Account Number";
        Index = "1";
    }

    IN MIR-ACCT-CRNT-LOC-CD-T[2]
    {
        DisplayOnly;
        Length = "2";
        FieldGroup = "Table2";
        CodeSource = "EDIT";
        CodeType = "LOCAT";
        SType = "Text";
        Label = "Current Location";
        Index = "1";
    }

    IN MIR-ACCT-ISS-LOC-CD-T[2]
    {
        DisplayOnly;
        Length = "2";
        FieldGroup = "Table2";
        CodeSource = "EDIT";
        CodeType = "LOCAT";
        SType = "Text";
        Label = "Issue Location";
        Index = "1";
    }

    IN MIR-AGT-ID-T[2]
    {
        DisplayOnly;
        Length = "6";
        FieldGroup = "Table2";
        SType = "Text";
        Label = "Agent ID";
        Index = "1";
    }

    IN MIR-BR-OR-DEPT-ID-T[2]
    {
        DisplayOnly;
        Length = "5";
        FieldGroup = "Table2";
        KeyColumn;
        CodeSource = "XTAB";
        CodeType = "BRCH";
        SType = "Text";
        Label = "Branch";
        Index = "1";
    }

    IN MIR-DV-ACCT-DESC-TXT-T[2]
    {
        DisplayOnly;
        Length = "20";
        FieldGroup = "Table2";
        SType = "Text";
        Label = "Accounting Description";
        Index = "1";
    }

    IN MIR-DV-AGT-REASN-CD-T[2]
    {
        DisplayOnly;
        Length = "1";
        FieldGroup = "Table2";
        CodeSource = "DataModel";
        CodeType = "AGT-REASN-CD";
        SType = "Text";
        Label = "Reason for Agent Accounting Entry";
        Index = "1";
    }

    IN MIR-DV-POL-LOAN-CR-AMT-T[2]
    {
        DisplayOnly;
        Signed;
        Length = "13";
        FieldGroup = "Table2";
        SType = "Currency";
        Label = "Credit";
#M319A2 CHANGES STARTS HERE
	CurrencyCode = "MIR-POL-CRCY-CD";
#M319A2 CHANGES ENDS HERE        
        Index = "1";
    }

    IN MIR-DV-POL-LOAN-DR-AMT-T[2]
    {
        DisplayOnly;
        Signed;
        Length = "13";
        FieldGroup = "Table2";
        SType = "Currency";
        Label = "Debit";
#M319A2 CHANGES STARTS HERE
	CurrencyCode = "MIR-POL-CRCY-CD";
#M319A2 CHANGES ENDS HERE        
        Index = "1";
    }

    IN MIR-LOAN-AMT
    {
        DisplayOnly;
        Signed;
        Length = "15";
        SType = "Currency";
#M319A2 CHANGES STARTS HERE
	CurrencyCode = "MIR-POL-CRCY-CD";
#M319A2 CHANGES ENDS HERE        
        Label = "Loan Amount Requested";
    }

    IN MIR-LOAN-DT
    {
        DisplayOnly;
        Length = "10";
        DefaultSession = "LSIR-PRCES-DT";
        SType = "Date";
        Label = "Effective Date";
    }
    
# NWLPLP CHANGES STARTS HERE

    IN MIR-JRNL-DT
    {
        DisplayOnly;
        Length = "10";
        DefaultSession = "LSIR-PRCES-DT";
        SType = "Date";
        Label = "Journal Date";
    }
    
    IN MIR-LOAN-REPAY-AMT
    {
        DisplayOnly;
        Signed;
        Length = "17";
        SType = "Currency";
#M319A2 CHANGES STARTS HERE
	CurrencyCode = "MIR-POL-CRCY-CD";
#M319A2 CHANGES ENDS HERE        
        Label = "Loan Repayment Amount";
    }

    IN MIR-LOAN-INT-AMT
    {
        DisplayOnly;
        Signed;
        Length = "17";
        SType = "Currency";
#M319A2 CHANGES STARTS HERE
	CurrencyCode = "MIR-POL-CRCY-CD";
#M319A2 CHANGES ENDS HERE        
        Label = "Loan Interest";
    }
    
    IN MIR-LOAN-XCES-AMT
    {
        DisplayOnly;
        Signed;
        Length = "17";
        SType = "Currency";
#M319A2 CHANGES STARTS HERE
	CurrencyCode = "MIR-POL-CRCY-CD";
#M319A2 CHANGES ENDS HERE        
        Label = "Excess Interest";
    }
    
    IN MIR-LOAN-SHRT-AMT
    {
        DisplayOnly;
        Signed;
        Length = "17";
        SType = "Currency";
#M319A2 CHANGES STARTS HERE
	CurrencyCode = "MIR-POL-CRCY-CD";
#M319A2 CHANGES ENDS HERE        
        Label = "Short Interest";
    }
    
    IN MIR-OS-DISB-LOAN-AMT
    {
        DisplayOnly;
        Signed;
        Length = "17";
        SType = "Currency";
#M319A2 CHANGES STARTS HERE
	CurrencyCode = "MIR-POL-CRCY-CD";
#M319A2 CHANGES ENDS HERE        
        Label = "OS Disb - Loan";
    }    

    IN MIR-FB-SUSP-AMT
    {
        DisplayOnly;
        Signed;
        Length = "17";
        SType = "Currency";
#M319A2 CHANGES STARTS HERE
	CurrencyCode = "MIR-POL-CRCY-CD";
#M319A2 CHANGES ENDS HERE        
        Label = "FB Suspense";
    }
    
# NWLPLP CHANGES ENDS HERE      

    IN MIR-POL-MISC-SUSP-AMT
    {
        DisplayOnly;
        Signed;
        Length = "17";
        SType = "Currency";
#M319A2 CHANGES STARTS HERE
	CurrencyCode = "MIR-POL-CRCY-CD";
#M319A2 CHANGES ENDS HERE        
        Label = "Miscellaneous Suspense";
    }

    IN MIR-POL-OS-DISB-AMT
    {
        DisplayOnly;
        Signed;
        Length = "17";
        SType = "Currency";
#M319A2 CHANGES STARTS HERE
	CurrencyCode = "MIR-POL-CRCY-CD";
#M319A2 CHANGES ENDS HERE        
        Label = "Outstanding Disbursements";
    }

    IN MIR-POL-PREM-SUSP-AMT
    {
        DisplayOnly;
        Signed;
        Length = "17";
        SType = "Currency";
#M319A2 CHANGES STARTS HERE
	CurrencyCode = "MIR-PREM-CRCY-CD";
#M319A2 CHANGES ENDS HERE
        Label = "Premium Suspense";
    }

    IN MIR-SBSDRY-CO-ID-T[2]
    {
        Key;
        DisplayOnly;
        Length = "40";
        FieldGroup = "Table2";
        CodeSource = "EDIT";
        CodeType = "SUBCO";
        SType = "Text";
        Label = "Sub Company";
        Index = "1";
    }

    IN MIR-SUPRES-CNFRM-IND
    {
        DisplayOnly;
        Length = "1";
        SType = "Indicator";
        Label = "Suppress confirmation statement";
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

    IN MIR-POL-LOAN-SEQ-NUM
    {
        Key;
        DisplayOnly;
        Length = "3";
        SType = "Text";
        Label = "Sequence Number";
    }

    IN MIR-DV-OWN-CLI-NM
    {
        DisplayOnly;
        Length = "75";
        SType = "Text";
        Label = "Owner Name";
    }
#M319A2 CHANGES STARTS HERE
    IN MIR-HO-RECV-DT
    {
        DisplayOnly;
        Length = "10";
        SType = "Date";
        Label = "Head Office Received Date";
    }

     INOUT MIR-POL-CRCY-CD
     {     
         Length = "2";
         SType = "Hidden";
         Label = "Currency";
     }

    INOUT MIR-PREM-CRCY-CD
    {
        Length = "2";
        SType = "Hidden";
        Label = "Currency";
    }

#M319A2 CHANGES ENDS HERE 
}

