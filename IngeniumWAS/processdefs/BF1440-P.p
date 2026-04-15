# Converted from PathFinder 2.2 to 3.0 Jun 18, 2004 3:13:39 PM EDT

#*******************************************************************************
#*  Component:   BF1440-P.p                                                    *
#*  Description:                                                               *
#*                                                                             *
#*******************************************************************************
#*  Chg#    Release  Description                                               *
#*                                                                             *
#*  014590  6.0      New for release 6.0                                       *
#*  017150  612J     Remove Currency Decimals = "2"                            *
#*  NWLPLP  CTS      POLICY LOAN PROCESSING                                    *
#*                                                                             *
#*  MP228A  CTS      POLICY LOAN CHANGES FOR FIRM BANKING                      *
#*  M319A2  CTS      Changes done for FXWL Policy Loan Processing              *
#*  Q91578  CTS      changes done for FXWL loan procesing                      *
#*  CSCR03  CTS      CHANGES FOR NOMURA FOREIGN HOLIDAY REMITTANCE DATE        *
#*  27549A  CTS      CHANGES DONE AS PART OF CDAP PROJECT                      *
#*******************************************************************************

P-STEP BF1440-P
{
    ATTRIBUTES
    {
        BusinessFunctionId = "1440";
        BusinessFunctionName = "Policy Loan";
        BusinessFunctionType = "Loan";
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

    INOUT MIR-DV-CHQ-AMT
    {
        Length = "15";
        DBTableName = "Derived";
        SType = "Currency";
        Label = "Cheque Amount";
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

    INOUT MIR-DV-TAX-OVRID-IND
    {
        Length = "1";
        DBTableName = "Derived";
        SType = "Indicator";
        Label = "Tax Override";
    }

    INOUT MIR-DV-TAX-VERIF-AMT
    {
        Signed;
        Length = "13";
        DBTableName = "Derived";
        SType = "Currency";
        Label = "Tax Withheld on Taxable Gain";
    }

    INOUT MIR-LOAN-AMT
    {
        Mandatory;
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
# NWLPLP CHANGES STARTS HERE
#       DefaultSession = "LSIR-PRCES-DT";
# NWLPLP CHANGES ENDS HERE
        SType = "Date";
        Label = "Effective Date";
    }

# NWLPLP CHANGES STARTS HERE
    INOUT MIR-JRNL-DT
    {
        Length = "10";
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
        Label = "MIR-DV-PRCES-STATE-CD";
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

    OUT MIR-DV-OWN-CLI-NM
    {
        Length = "75";
        DBTableName = "Derived";
        SType = "Text";
        Label = "Owner Name";
    }
# MP228A CHANGES STARTS HERE    
    INOUT MIR-DV-TRNXT-PAYO-MTHD-CD
    {
        Length = "1";
        CodeSource = "DataModel";
        CodeType = "DV-TRNXT-PAYO-MTHD-CD";
        SType = "Selection";
        DBTableName = "Derived";
        Label = "Pay Out Method";
    }

    INOUT MIR-BNK-ID
    {
        Length = "4";
        DBTableName = "TBNKB";
        SType = "Text";
        Label = "Bank ID";
    }

    INOUT MIR-BNK-BR-ID
    {
        Length = "5";
        DBTableName = "TBNKB";
        SType = "Text";
        Label = "Branch ID";
    }

    INOUT MIR-BNK-ACCT-ID
    {
        Length = "17";
        DBTableName = "TBNKA";
        SType = "Text";
        Label = "Bank Account Number";
    }

    INOUT MIR-BNK-ACCT-HLDR-NM
    {
        Length = "50";
        DBTableName = "TBNKA";
        SType = "Text";
        Label = "Account Holder Name";
    }

    INOUT MIR-BNK-ACCT-TYP-CD
    {
        Length = "3";
        CodeSource = "EDIT";
        CodeType = "FBACC";
        DBTableName = "TCLRL";
        SType = "Selection";
        Label = "Account Type";
    }

    INOUT MIR-DV-INSRD-CLI-NM
    {
        Length = "75";
        DBTableName = "Derived";
        SType = "Text";
        Label = "Insured Name";
    }

    INOUT MIR-PAYE-CLI-FRST-NM
    {
        Length = "25";
        DBTableName = "CLNM";
        SType = "Text";
        Label = "Payee's First Name";
    }

    INOUT MIR-PAYE-CLI-LAST-NM
    {
       Length = "25";
       DBTableName = "CLNM";
       SType = "Text";
       Label = "Payee's Last Name";
    }

    INOUT MIR-PAYE-CO-NM
    {
       Length = "50";
       DBTableName = "CLNC";
       SType = "Text";
       Label = "Company Name";
    }

    INOUT MIR-CLI-ADDR-LOC-CD
    {
       Length = "8";
       DBTableName = "CLIA";
       SType = "Text";
       Label = "Address Code";
    }

    INOUT MIR-CLI-PSTL-CD
    {
       Length = "9";
       DBTableName = "CLIA";
       SType = "Text";
       Label = "Postal Code";
    }

    INOUT MIR-CLI-ADDR-ADDL-TXT
    {
       Length = "60";
       DBTableName = "CLIA";
       SType = "Text";
       Label = "Samakata-bu";
    }

    INOUT MIR-DV-CLI-ADDR
    {
       Length = "50";
       DBTableName = "Derived";
       SType = "Text";
       Label = "Kanji Address";
    }

    OUT MIR-BNK-NM
    {
      Length = "36";
      DBTableName = "TBNKB";
      SType = "Text";
      Label = "Bank Name";
    }

    OUT MIR-BNK-BR-NM
    {
      Length = "36";
      DBTableName = "TBNKB";
      SType = "Text";
      Label = "Bank Branch Name";
    }
   
    INOUT MIR-PLAN-ID
    {
        Length = "40";
        CodeSource = "EDIT";
        CodeType = "PLAN";
        SType = "Text";
        Label = "Plan Name";
    }

# MP228A CHANGES ENDS HERE    
# M319A2 CHANGES STARTS HERE  

    INOUT MIR-HO-RECV-DT
    {
        Length = "10";
        SType = "Date";
        Label = "Head Office Received Date";
    }

    INOUT MIR-DV-PAYO-JPY-BNFT-CD
      {
        Length = "1";
        CodeSource = "DataModel";
        CodeType = "PAYO-JPY-BNFT-CD";
        SType = "Text";
        Label = "JPY Benefit Rider";
      } 
    INOUT MIR-JPY-XCHNG-EFF-DT
    { 
        Length = "10";
        SType = "Date";
        Label = "Exchange Effective date to JPY";
    }
    INOUT MIR-JPY-XCHNG-RT
    { 
        Length = "7";
        Decimals = "2";
        DBTableName = "TCXRT";
        SType = "Text";
        Label = "Exchange rate to JPY";     
    } 
    
   INOUT MIR-JPY-TRXN-AMT
    { 
        Length = "15";
        SType = "Currency";
        Label = "Loan Amount Converted in Yen";
    }    
# CSCR03 CHANGES START HERE
   INOUT MIR-REMIT-DT
    { 
      Length = "10";
      DBTableName = "TFBNK";
      SType = "Date";
      Label = "Remittance Date";     
    }
# CSCR03 CHANGES END HERE         

     INOUT MIR-POL-CRCY-CD
     {     
         Length = "2";
         SType = "Hidden";
         Label = "Currency";
     } 
     #Q91578 Changes begins
   # INOUT MIR-LOAN-CRCY-CD
   #  {
   #      Key;
   #      Length = "2";
   #      Label = "Currency";
   #    }
   #    
   # INOUT MIR-PREM-CRCY-CD
   # {
   #     Length = "2";
   #     SType = "Hidden";
   #     Label = "Currency";
   # }
     #Q91578 Changes ends
     INOUT MIR-POL-CRCY-CD-T[2]
     {     
         Length = "2";
         SType = "Hidden";
         Label = "Currency";
     }        
# M319A2 CHANGES ENDS HERE
#27549A - CHANGES START HERE
INOUT MIR-ATO-NOT-APPL-IND
    {
        Length = "1";
        SType = "Indicator";
        Label = "ATO not applicable";
    }
#27549A- CHANGES ENDS HERE    
}

