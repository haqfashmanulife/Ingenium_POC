# Converted from PathFinder 2.2 to 3.0 Jun 18, 2004 3:13:22 PM EDT

#*******************************************************************************
#*  Component:   BF9H30-P.p                                                    *
#*  Description:                                                               *
#*                                                                             *
#*******************************************************************************
#*  Chg#    Release  Description                                               *
#*                                                                             *
#*  014590  6.0      New for release 6.0                                       *
#*  017150  612J     Remove Currency Decimals = "2"                            *
#*                                                                             *
#*******************************************************************************

P-STEP BF9H30-P
{
    ATTRIBUTES
    {
        BusinessFunctionId = "9H30";
        BusinessFunctionName = "Whole life premium Quote screen";
        BusinessFunctionType = "Wholelife";
        MirName = "CCWM9H30";
    }

    OUT LSIR-RETURN-CD;

    OUT MIR-RETRN-CD;

    INOUT MIR-POL-ID-BASE
    {
        Key;
        Mandatory;
        Length = "9";
        DefaultSession = "MIR-POL-ID-BASE";
        SType = "Text";
        Label = "Policy ID";
    }

    INOUT MIR-POL-ID-SFX
    {  
        Key;
        Length = "1";
        DefaultSession = "MIR-POL-ID-SFX";
        SType = "Text";
        Label = "Suffix";
    }
    INOUT MIR-PRCS-EFF-DT
    { 
        Mandatory;
        Length = "10";
        DefaultSession = "MIR-PRCS-EFF-DT";
        SType = "Date";
        Label = "Effective Date";
    }
    INOUT MIR-PAY-OUT-MTHD-CD
    { 
       Length = "1";
       CodeSource = "DataModel";
       CodeType = "DV-TRNXT-PAYO-MTHD-CD";
       SType = "Selection";
       Label = "Pay Out Method";
    }
    INOUT MIR-COMP-RECD-DT
    {   
        Length = "10";
        SType = "Date";
        Label = "Company Received Date";
    }
    INOUT MIR-JOUR-EFF-DT 
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
    INOUT MIR-PAYE-SUR-NM
    {   
         Length = "17";
         SType = "Text";
         Label = "Payee's Last Name ";
    }
    INOUT MIR-PAYE-GIV-NM
    {   
        Length = "17";
        SType = "Currency";
        Label = "Payee's First Name";
    }
    INOUT MIR-CO-NM
    {
       
        Length = "17";
        SType = "Currency";
        Label = "Company Name";
    }
    INOUT MIR-ADDR-LOC-CD
    {
        
        Length = "17";
        SType = "Currency";
        Label = "Address Code";
    }
    INOUT MIR-SAMAKATA-BU
    {
        
        Length = "60";
        SType = "Text";
        Label = "Samakata bu";
    }
    INOUT MIR-PSTL-CD
    {
         
         Length = "17";
         SType = "Currency";
         Label = "Postal Code ";
    }

    INOUT MIR-KJ-ADDR
    {
      
        Length = "17";
        SType = "Currency";
        Label = "Kanji Address";
    }
    INOUT MIR-MRF-IND
    {
        
        Length = "17";
        SType = "Currency";
        Label = "MRF";
    }
    INOUT MIR-BNK-ID
    {
         
        Length = "1";
        SType = "Indicator";
        Label = "Bank Number";

    }
    INOUT MIR-BNK-NM
    {
        
        Length = "17";
        SType = "Currency";
        Label = "Bank Name";
    }
    
    INOUT MIR-BNK-BR-ID
    {
       
        Length = "17";
        SType = "Currency";
        Label = "Branch Number";
    }
    INOUT MIR-BNK-BR-NM
    {
        
        Length = "17";
        SType = "Currency";
        Label = "Branch Name ";
    }
    INOUT MIR-ACCT-TYP-CD
    {
         
        Length = "40";
        FieldGroup = "Table9";
        CodeSource = "EDIT";
        CodeType = "ACTYP";
        SType = "Selection";
        Label = "Account Type";
    }
    INOUT MIR-BNK-ACCT-ID 
    {
        
        Length = "17";
        SType = "Currency";
        Label ="Bank Account Number";
    }
    INOUT MIR-ACCT-HLDR-NM
    {
        
        Length = "17";
        SType = "Currency";
        Label = "Account Holder Name";
    }
    INOUT MIR-ACCUM-DIV-IND
    {
        
        Length = "1";
        FieldGroup = "Table9";
        CodeSource = "EDIT";
        CodeType = "STIND";
        SType = "Selection";
        Label = "Accumulated Dividend Amount";
    }
    INOUT MIR-PUR-SURV-BEN-IND
    {
        
        Length = "1";
        FieldGroup = "Table9";
        CodeSource = "EDIT";
        CodeType = "STIND";
        DBTableName = "TPOL";
        SType = "Selection";
        Label = "Increased purchase of survival benefit";
    }
    INOUT MIR-VEST-IND
    {
        
        Length = "1";
        FieldGroup = "Table9";
        CodeSource = "EDIT";
        CodeType = "STIND";
        SType = "Selection";
        Label = "Vesting";
    }
    INOUT MIR-HLTH-CONG-IND
    {
        
        Length = "1";
        FieldGroup = "Table9";
        CodeSource = "EDIT";
        CodeType = "STIND";
        SType = "Selection";
        Label = "Health Congratulatory Benefit";
    }
    INOUT MIR-LOAN-REPAY-IND
    {
        
        Length = "10";
        FieldGroup = "Table9";
        CodeSource = "EDIT";
        CodeType = "STIND";
        SType = "Text";
        Label = "Loan repayment";
    }  
    INOUT MIR-OWN-NM
    {
        
        Length = "75";
        SType = "Text";
        Label = "Owner Name";
    }
    INOUT MIR-INSR-NM
    {
        
        Length = "75";
        SType = "Text";
        Label = "Insured Name";
    }
    INOUT MIR-PLAN-ID
    {
        
        Length = "40";
        CodeSource = "EDIT";
        CodeType = "PLAN";
        SType = "Text";
        Label = "Plan ID";
    }

    INOUT MIR-BASE-PREM-CMPL-IND
    {
        
        Length = "10";
        SType = "Indicator";
        Label = "Base policy premium payment completion Indicator";
    }  
    INOUT MIR-BASE-PREM-CMPL-DT
    {
        
        Length = "10";
        SType = "Date";
        Label = "Base policy premium payment completion Date";
      
    }
    INOUT MIR-POL-DIV-CD
    {
        
        Length = "40";
        CodeSource = "DataModel";
        CodeType = "POL-DIV-OPT-CD";
        SType = "Text";
        Label = "Policy Dividend Option";
    }
    INOUT MIR-PAY-TYP-MED-CD
    {
        Length = "1";
        CodeSource = "DataModel";
        CodeType = "MEDIC-CVG-PMT-TYP-CD";
        SType = "Text";
        Label = "Payment type of Medical Rider";
    }
    INOUT MIR-RIDER-CSV-AMT
    {
        
        Length = "17";
        SType = "Currency";
        Label = "Rider CSV";
    }
    INOUT MIR-HTH-BEN-AMT
    {
        
        Length = "17";
        SType = "Currency";
        Label = "Health Congratulatory Benefit";
    }
    INOUT MIR-HTH-BEN-DEF-AMT
    {
        
        Length = "17";
        SType = "Currency";
        Label = "Health congratulatory benefit Deferred Amount";
    }
    INOUT MIR-HTH-DEF-INT-AMT
    {
        
        Length = "17";
        SType = "Currency";
        Label = "Health congratulatory Deferred Interest Amount";
    }
     INOUT MIR-SURV-BEN-DEF-AMT
    {
        
        Length = "17";
        SType = "Currency";
        Label = "Survival Benefit Deferral Amount";
    }
    INOUT MIR-SURV-DEF-INT-AMT
    {
        
        Length = "17";
        SType = "Currency";
        Label = "Survival Benefit Deferral Interest";
    }
    
    INOUT MIR-INC-PUR-SUR-AMT
    {
        
        Length = "17";
        SType = "Currency";
        Label = "Increased purchase of Survival Benefit Amount";
    }
    INOUT MIR-INC-PUR-SUR-DEF-AMT
    {
        
        Length = "17";
        SType = "Currency";
        Label = "Increased purchase of Survival Benefit Deferred amount";
    }
    INOUT MIR-ACC-DIV-AMT
    {
        
        Length = "17";
        SType = "Currency";
        Label = "Accumulated Dividend Amount";
    }
    INOUT MIR-SPE-DIV-AMT
    {
        
        Length = "17";
        SType = "Currency";
        Label = "Special dividend amount";
    }
    INOUT MIR-SPE-DIV-DEF-AMT
    {
        
        Length = "17";
        SType = "Currency";
        Label = "Special dividend deferreal amount ";
    }   
        
    INOUT MIR-VES-AMT
    {
        
        Length = "17";
        SType = "Currency";
        Label = "Vesting Amount";
    }
    INOUT MIR-VES-DEF-AMT
    {
        
        Length = "17";
        SType = "Currency";
        Label = "Vesting deferred amount";
    }
    INOUT MIR-EXC-PREM-AMT
    {
        
        Length = "17";
        SType = "Currency";
        Label = "Excess of premium";
    }
    INOUT MIR-BAL-POL-LOAN-AMT
    {
         
         Length = "11";
         SType = "Currency";
         Label = "Policy Loan Balance";
    }
    INOUT MIR-BAL-LOAN-INT-AMT
    {
         
         Length = "11";
         SType = "Currency";
         Label = "Policy Loan Interest";
    }
    INOUT MIR-APL-BAL-AMT
    {
        
        Length = "11";
        SType = "Currency";
        Label = "APL balance";
    }
    INOUT MIR-APL-INT-AMT
    {
        
        Length = "11";
        SType = "Currency";
        Label = "APL Interest ";
    }
    INOUT MIR-SHRT-PREM-AMT
    {
        
        Length = "11";
        SType = "Currency";
        Label = "Over/Short Premium";
    }
    INOUT MIR-UNEARN-PREM-AMT
    {
        
        Length = "11";
        SType = "Currency";
        Label = "Unearned Premium ";
    }
    INOUT MIR-LUMP-SUM-PREM-AMT
    {
         
         Length = "11";
         SType = "Currency";
         Label = "Lumpsum Prepaid Premium ";
    }
    INOUT MIR-INST-PRE-PREM-AMT
    {
        
        Length = "11";
        SType = "Currency";
        Label = "Installment Prepaid Premium";
    }
    INOUT MIR-NET-PAY-AMT
    {
        
        Length = "11";
        SType = "Currency";
        Label = "Net Payment Amount";
    }
}

