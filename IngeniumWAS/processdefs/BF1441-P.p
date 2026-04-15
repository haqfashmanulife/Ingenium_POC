# Converted from PathFinder 2.2 to 3.0 Jun 18, 2004 3:13:39 PM EDT

#*******************************************************************************
#*  Component:   BF1441-P.p                                                    *
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

P-STEP BF1441-P
{
    ATTRIBUTES
    {
        BusinessFunctionId = "1441";
        BusinessFunctionName = "Policy Loan Reversal";
        BusinessFunctionType = "Reversal";
        MirName = "CCWM0681";
    }

    OUT LSIR-RETURN-CD;

    OUT MIR-RETRN-CD;

    INOUT MIR-ACCT-BASE-ID-T[2]
    {
        Length = "6";
        FieldGroup = "Table2";
        DBTableName = "TAC";
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
        DBTableName = "TAC";
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
        DBTableName = "TAC";
        SType = "Selection";
        Label = "Issue Location";
        Index = "1";
    }

    INOUT MIR-AGT-ID-T[2]
    {
        Length = "6";
        FieldGroup = "Table2";
        DBTableName = "TAG";
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
        DBTableName = "TAC";
        SType = "Selection";
        Label = "Branch";
        Index = "1";
    }

    INOUT MIR-DV-ACCT-DESC-TXT-T[2]
    {
        Length = "20";
        FieldGroup = "Table2";
        DBTableName = "Derived";
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
        DBTableName = "Derived";
        SType = "Selection";
        Label = "Reason for Agent Accounting Entry";
        Index = "1";
    }

    INOUT MIR-DV-POL-LOAN-CR-AMT-T[2]
    {
        Signed;
        Length = "13";
        FieldGroup = "Table2";
        DBTableName = "Derived";
        SType = "Currency";
        Label = "Credit";
        Index = "1";
    }

    INOUT MIR-DV-POL-LOAN-DR-AMT-T[2]
    {
        Signed;
        Length = "13";
        FieldGroup = "Table2";
        DBTableName = "Derived";
        SType = "Currency";
        Label = "Debit";
        Index = "1";
    }

    INOUT MIR-LOAN-AMT
    {
        Signed;
        Length = "15";
        DBTableName = "TPOLL";
        SType = "Currency";
        Label = "Loan Amount Requested";
    }

    INOUT MIR-LOAN-DT
    {
        Length = "10";
        DBTableName = "TPOLL";
        DefaultSession = "LSIR-PRCES-DT";
        SType = "Date";
        Label = "Effective Date";
    }
    
# NWLPLP CHANGES STARTS HERE

    INOUT MIR-JRNL-DT
    {
        Length = "10";
        DefaultSession = "LSIR-PRCES-DT";
        SType = "Date";
        Label = "Journal Date";
    }
    
    INOUT MIR-LOAN-REPAY-AMT
    {
        Signed;
        Length = "17";
        DBTableName = "TPOLL";        
        SType = "Currency";
        Label = "Loan Repayment Amount";
    }  
    
    INOUT MIR-LOAN-INT-AMT
    {
        Signed;
        Length = "17";
        SType = "Currency";
        Label = "Loan Interest";
    }   
    
    INOUT MIR-LOAN-XCES-AMT
    {
        Signed;
        Length = "17";
        DBTableName = "TPOLL";                
        SType = "Currency";
        Label = "Excess Interest";
    } 
    
    INOUT MIR-LOAN-SHRT-AMT 
    {
        Signed;
        Length = "17";
        DBTableName = "TPOLL";                
        SType = "Currency";
        Label = "Short Interest";
    } 
    
    INOUT MIR-OS-DISB-LOAN-AMT
    {
        Signed;
        Length = "17";
        DBTableName = "TPOLL";                        
        SType = "Currency";
        Label = "OS Disb - Loan";
    }
    
    INOUT MIR-FB-SUSP-AMT
    {
        Signed;
        Length = "17";
        DBTableName = "TPOLL";
        SType = "Currency";
        Label = "FB Suspense";
    }    
        
# NWLPLP CHANGES ENDS HERE          

    INOUT MIR-POL-MISC-SUSP-AMT
    {
        Signed;
        Length = "17";
        DBTableName = "TPOL";
        SType = "Currency";
        Label = "Miscellaneous Suspense";
    }

    INOUT MIR-POL-OS-DISB-AMT
    {
        Signed;
        Length = "17";
        DBTableName = "TPOL";
        SType = "Currency";
        Label = "Outstanding Disbursements";
    }

    INOUT MIR-POL-PREM-SUSP-AMT
    {
        Signed;
        Length = "17";
        DBTableName = "TPOL";
        SType = "Currency";
        Label = "Premium Suspense";
    }

    INOUT MIR-SBSDRY-CO-ID-T[2]
    {
        Key;
        Length = "40";
        FieldGroup = "Table2";
        CodeSource = "EDIT";
        CodeType = "SUBCO";
        DBTableName = "TPOL";
        SType = "Selection";
        Label = "Sub Company";
        Index = "1";
    }

    INOUT MIR-SUPRES-CNFRM-IND
    {
        Length = "1";
        DBTableName = "TPOLP";
        SType = "Indicator";
        Label = "Suppress confirmation statement";
    }

    IN MIR-DV-PRCES-STATE-CD
    {
        Length = "1";
        DBTableName = "Derived";
        SType = "Hidden";
        Label = "Process State";
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

    IN MIR-POL-LOAN-SEQ-NUM
    {
        Key;
        Mandatory;
        Length = "3";
        DBTableName = "TLHST";
        SType = "Text";
        Label = "Sequence Number";
    }

    OUT MIR-DV-OWN-CLI-NM
    {
        Length = "75";
        DBTableName = "Derived";
        SType = "Text";
        Label = "Owner Name";
    }
#M319A2 CHANGES STARTS HERE
    OUT MIR-HO-RECV-DT
    {
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

     INOUT MIR-POL-CRCY-CD-T[2]
     {     
         Length = "2";
         SType = "Hidden";
         Label = "Currency";
     }        
#M319A2 CHANGES ENDS HERE 
}

