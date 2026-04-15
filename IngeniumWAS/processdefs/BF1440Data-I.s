# Converted from PathFinder 2.2 to 3.0 Jun 18, 2004 3:12:43 PM EDT

#*******************************************************************************
#*  Component:   BF1440Data-I.s                                                *
#*  Description:                                                               *
#*                                                                             *
#*******************************************************************************
#*  Chg#    Release  Description                                               *
#*                                                                             *
#*  014590  6.0      New for release 6.0                                       *
#*  017150  612J     Remove Currency Decimals = "2"                            *
#*  NWLPLP  CTS      POLICY LOAN PROCESSING                                    *
#*                                                                             *
#*  MP228A  CTS      POLICY LOAN CHANGES FOR PAYOUT METHOD CODE                *
#*  M319A2  CTS      Changes done for FXWL Policy Loan Processing              *
#*  Q91578  CTS      changes done for FXWL loan procesing                      *
#*  27549A  CTS      CHANGES DONE AS PART OF CDAP PROJECT                      *
#*******************************************************************************

S-STEP BF1440Data-I
{
    ATTRIBUTES
    {
        Type = "Input";
# NWLPLP CHANGES STARTS HERE
#       FocusField = "MIR-DV-CHQ-AMT";
        FocusField = "MIR-FB-SUSP-AMT";
# NWLPLP CHANGES ENDS HERE
        FocusFrame = "ContentFrame";
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

    INOUT MIR-ACCT-BASE-ID-T[2]
    {
        Length = "6";
        FieldGroup = "Table2";
        SType = "Text";
        Label = "Account Number";
        Index = "1";
    }

    INOUT MIR-ACCT-CRNT-LOC-CD-T[2]
    {
        Length = "2";
        FieldGroup = "Table2";
        CodeSource = "CTLC";
        CodeType = "CLOC";
        FilterFields = "1";
        FilterField1 = "MIR-USER-SESN-CTRY-CD";
        SType = "Selection";
        Label = "Current Location";
        Index = "1";
    }

    INOUT MIR-ACCT-ISS-LOC-CD-T[2]
    {
        Length = "2";
        FieldGroup = "Table2";
        CodeSource = "CTLC";
        CodeType = "ILOC";
        FilterFields = "1";
        FilterField1 = "MIR-USER-SESN-CTRY-CD";
        SType = "Selection";
        Label = "Issue Location";
        Index = "1";
    }

    INOUT MIR-AGT-ID-T[2]
    {
        Length = "6";
        FieldGroup = "Table2";
        SType = "Text";
        Label = "Agent ID";
        Index = "1";
    }

    INOUT MIR-BR-OR-DEPT-ID-T[2]
    {
        Length = "5";
        FieldGroup = "Table2";
        KeyColumn;
        CodeSource = "XTAB";
        CodeType = "BRCH";
        SType = "Selection";
        Label = "Branch";
        Index = "1";
    }

    INOUT MIR-DV-ACCT-DESC-TXT-T[2]
    {
        Length = "20";
        FieldGroup = "Table2";
        SType = "Text";
        Label = "Accounting Description";
        Index = "1";
    }

    INOUT MIR-DV-AGT-REASN-CD-T[2]
    {
        Length = "1";
        FieldGroup = "Table2";
        CodeSource = "DataModel";
        CodeType = "AGT-REASN-CD";
        SType = "Selection";
        Label = "Reason for Agent Accounting Entry";
        Index = "1";
    }

    INOUT MIR-DV-CHQ-AMT
    {
        Length = "15";
        SType = "Currency";
#M319A2 CHANGES STARTS HERE
	CurrencyCode = "MIR-POL-CRCY-CD";
#M319A2 CHANGES ENDS HERE
        Label = "Cheque Amount";
    }

    INOUT MIR-DV-POL-LOAN-CR-AMT-T[2]
    {
        Signed;
        Length = "13";
        FieldGroup = "Table2";
        SType = "Currency";
#M319A2 CHANGES STARTS HERE
	CurrencyCode = "MIR-POL-CRCY-CD-T[2]";
#M319A2 CHANGES ENDS HERE
        Label = "Credit";
        Index = "1";
    }

    INOUT MIR-DV-POL-LOAN-DR-AMT-T[2]
    {
        Signed;
        Length = "13";
        FieldGroup = "Table2";
        SType = "Currency";
#M319A2 CHANGES STARTS HERE
	CurrencyCode = "MIR-POL-CRCY-CD-T[2]";
#M319A2 CHANGES ENDS HERE
        Label = "Debit";
        Index = "1";
    }

    IN MIR-DV-TAX-OVRID-IND
    {
        DisplayOnly;
        Length = "1";
        SType = "Indicator";
        Label = "Tax Override";
    }

    IN MIR-DV-TAX-VERIF-AMT
    {
        DisplayOnly;
        Signed;
        Length = "13";
        SType = "Currency";
#M319A2 CHANGES STARTS HERE
	CurrencyCode = "MIR-POL-CRCY-CD";
#M319A2 CHANGES ENDS HERE
        Label = "Tax Withheld on Taxable Gain";
    }

    IN MIR-LOAN-AMT
    {
        DisplayOnly;
        Signed;
        Length = "15";
        SType = "Currency";
#M319A2 CHANGES STARTS HERE
        CurrencyCode="MIR-POL-CRCY-CD";
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
        Signed;
        Length = "17";
        SType = "Currency";
#M319A2 CHANGES STARTS HERE
	CurrencyCode = "MIR-POL-CRCY-CD";
#M319A2 CHANGES ENDS HERE
        Label = "Short Interest";
    } 
    
    INOUT MIR-OS-DISB-LOAN-AMT
    {
        Signed;
        Length = "17";
        SType = "Currency";
#M319A2 CHANGES STARTS HERE
	CurrencyCode = "MIR-POL-CRCY-CD";
#M319A2 CHANGES ENDS HERE
        Label = "OS Disb - Loan";
    }
    
    INOUT MIR-FB-SUSP-AMT
    {
        Signed;
        Length = "17";
        SType = "Currency";
#M319A2 CHANGES STARTS HERE
	CurrencyCode = "MIR-POL-CRCY-CD";
#M319A2 CHANGES ENDS HERE
        Label = "FB Suspense";
    }    
        
# NWLPLP CHANGES ENDS HERE        

    INOUT MIR-POL-MISC-SUSP-AMT
    {
        Signed;
        Length = "17";
        SType = "Currency";
#M319A2 CHANGES STARTS HERE
	CurrencyCode = "MIR-POL-CRCY-CD";
#M319A2 CHANGES ENDS HERE
        Label = "Miscellaneous Suspense";
    }

    INOUT MIR-POL-OS-DISB-AMT
    {
        Signed;
        Length = "17";
        SType = "Currency";
#M319A2 CHANGES STARTS HERE
	CurrencyCode = "MIR-POL-CRCY-CD";
#M319A2 CHANGES ENDS HERE
        Label = "Outstanding Disbursements";
    }

    INOUT MIR-POL-PREM-SUSP-AMT
    {
        Signed;
        Length = "17";
        SType = "Currency";
#M319A2 CHANGES STARTS HERE
	CurrencyCode = "MIR-PREM-CRCY-CD";
#M319A2 CHANGES ENDS HERE
        Label = "Premium Suspense";
    }

    INOUT MIR-SBSDRY-CO-ID-T[2]
    {
        Length = "40";
        FieldGroup = "Table2";
        CodeSource = "EDIT";
        CodeType = "SUBCO";
        SType = "Selection";
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

    INOUT MIR-DV-PRCES-STATE-CD
    {
        Length = "1";
        SType = "Hidden";
        Label = "MIR-DV-PRCES-STATE-CD";
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

    IN MIR-DV-OWN-CLI-NM
    {
        DisplayOnly;
        Length = "75";
        SType = "Text";
        Label = "Owner Name";
    }
# MP228A CHANGES STARTS HERE
    IN MIR-DV-TRNXT-PAYO-MTHD-CD
    {
        CodeSource = "DataModel";
        CodeType = "DV-TRNXT-PAYO-MTHD-CD";
        Label = "Pay Out Method";
        Length = "1";
        SType = "Text";
    }
# MP228A CHANGES ENDS HERE
# M319A2 CHANGES STARTS HERE  

    IN MIR-HO-RECV-DT
    {
        DisplayOnly;
        Length = "10";
        SType = "Date";
        Label = "Head Office Received Date";
    }

    IN MIR-DV-PAYO-JPY-BNFT-CD
      {
        Length = "1";
        CodeSource = "DataModel";
        CodeType = "PAYO-JPY-BNFT-CD";
        SType = "Text";
        Label = "JPY Benefit Rider";
      } 
    IN MIR-JPY-XCHNG-EFF-DT
    { 
        Length = "10";
        SType = "Date";
        Label = "Exchange Effective date to JPY";
    }
    IN MIR-JPY-XCHNG-RT
    { 
        Length = "7";
        Decimals = "2";
        DBTableName = "TCXRT";
        SType = "Text";
        Label = "Exchange rate to JPY";     
    } 
    
    IN MIR-JPY-TRXN-AMT
    { 
        DisplayOnly;
        Length = "17";
        SType = "Currency";
        Label = "Loan Amount Converted in Yen";
    }    

     INOUT MIR-POL-CRCY-CD
     {     
         Length = "2";
         SType = "Hidden";
         Label = "Currency";
     }
     #Q91578 Changes begins
   #  INOUT MIR-LOAN-CRCY-CD
   #  {
   #      Key;
   #      Length = "2";
   #      CodeSource = "EDIT";
   #      CodeType = "LCRCY";
   #      SType = "Selection";
   #      Label = "Currency";
   #  }
   #
#Q91578 Changes begins
     INOUT MIR-PREM-CRCY-CD
    {
        Length = "2";
        SType = "Hidden";
        Label = "Currency";
    }
     INOUT MIR-POL-CRCY-CD-T[2]
     {     
         Length = "2";
         SType = "Hidden";
         Label = "Currency";
     }     
# M319A2 CHANGES ENDS HERE
#27549A - Changes Start here
    
     IN MIR-ATO-NOT-APPL-IND
     {
         DisplayOnly; 
         Length = "1";
         SType = "Indicator";
         Label = "ATO not applicable";
     }
#27549A- Changes ends here
}

