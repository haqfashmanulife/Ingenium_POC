# Converted from PathFinder 2.2 to 3.0 Jun 18, 2004 3:12:23 PM EDT

#*******************************************************************************
#*  Component:   BF9H30-O.s                                                    *
#*  Description:                                                               *
#*                                                                             *
#*******************************************************************************
#*  Chg#    Release  Description                                               *
#*                                                                             *
#*  014590  6.0      New for release 6.0                                       *
#*  017150  612J     Remove Currency Decimals = "2"                            *
#*                                                                             *
#*******************************************************************************

S-STEP BF9H30-O
{
    ATTRIBUTES
    {
        BusinessFunctionType = "Wholelife";
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
    IN MIR-POL-ID-BASE
    {
        Key;
        Mandatory;
        Length = "9";
        DefaultSession = "MIR-POL-ID-BASE";
        SType = "Text";
        Label = "Policy ID";
    }

    IN MIR-POL-ID-SFX
    {  
        Key;
        Length = "1";
        DefaultSession = "MIR-POL-ID-SFX";
        SType = "Text";
        Label = "Suffix";
    }
    IN MIR-PRCS-EFF-DT
    { 
        Mandatory;
        Length = "10";
        SType = "Date";
        Label = "Effective Date";
    }
    IN MIR-PAY-OUT-MTHD-CD
    { 
       Length = "1";
       CodeSource = "DataModel";
       CodeType = "DV-TRNXT-PAYO-MTHD-CD";
       SType = "Selection";
       Label = "Pay Out Method";
    }
    IN MIR-COMP-RECD-DT
    {   
        Length = "10";
        SType = "Date";
        Label = "Company Received Date";
    }
    IN MIR-JOUR-EFF-DT 
    {  
        Length = "10";
        SType = "Date";
        Label = "Journal Date";
    }
    IN MIR-PAYE-SUR-NM
    {   
         Length = "17";
         SType = "Text";
         Label = "Payee's Last Name ";
    }
    IN MIR-PAYE-GIV-NM
    {   
        Length = "17";
        SType = "Currency";
        Label = "Payee's First Name";
    }
    IN MIR-CO-NM
    {
       
        Length = "17";
        SType = "Currency";
        Label = "Company Name";
    }
    IN MIR-ADDR-LOC-CD
    {
        
        Length = "17";
        SType = "Currency";
        Label = "Address Code";
    }
    IN MIR-SAMAKATA-BU
    {
        
        Length = "60";
        SType = "Text";
        Label = "Samakata bu";
    }
    IN MIR-PSTL-CD
    {
         
         Length = "17";
         SType = "Currency";
         Label = "Postal Code ";
    }

    IN MIR-KJ-ADDR
    {
      
        Length = "17";
        SType = "Currency";
        Label = "Kanji Address";
    }
    IN MIR-MRF-IND
    {
        
        Length = "1";
        SType = "Indicator";
        Label = "MRF Indicator";

    }
    IN MIR-BNK-ID
    {
         
         Length = "17";
         SType = "Currency";
         Label = "Bank Number ";
    }
    IN MIR-BNK-NM
    {
        
        Length = "17";
        SType = "Currency";
        Label = "Bank Name";
    }
    
    IN MIR-BNK-BR-ID
    {
       
        Length = "17";
        SType = "Currency";
        Label = "Branch Number";
    }
    IN MIR-BNK-BR-NM
    {
        
        Length = "17";
        SType = "Currency";
        Label = "Branch Name ";
    }
    IN MIR-ACCT-TYP-CD
    {
         
        Length = "40";
        FieldGroup = "Table9";
        CodeSource = "EDIT";
        CodeType = "ACTYP";
        SType = "Selection";
        Label = "Account Type";
    }
    IN MIR-BNK-ACCT-ID 
    {
        
        Length = "17";
        SType = "Currency";
        Label ="Bank Account Number";
    }
    IN MIR-ACCT-HLDR-NM
    {
        
        Length = "17";
        SType = "Currency";
        Label = "Account Holder Name";
    }
    IN MIR-ACCUM-DIV-IND
    {
        
        Length = "10";
        FieldGroup = "Table9";
        CodeSource = "EDIT";
        CodeType = "STIND";
        SType = "Text";
        Label = "Accumulated Dividend Amount";
    }
    IN MIR-PUR-SURV-BEN-IND
    {
        
        Length = "10";
        FieldGroup = "Table9";
        CodeSource = "EDIT";
        CodeType = "STIND";
        SType = "Text";
        Label = "Increased purchase of survival benefit";
    }
    IN MIR-VEST-IND
    {
        
        Length = "10";
        FieldGroup = "Table9";
        CodeSource = "EDIT";
        CodeType = "STIND";
        SType = "Text";
        Label = "Vesting";
    }
    IN MIR-HLTH-CONG-IND
    {
        
        Length = "10";
        FieldGroup = "Table9";
        CodeSource = "EDIT";
        CodeType = "STIND";
        SType = "Text";
        Label = "Health Congratulatory Benefit";
    }
    
    IN MIR-LOAN-REPAY-IND
    {
        
        Length = "10";
        FieldGroup = "Table9";
        CodeSource = "EDIT";
        CodeType = "STIND";
        SType = "Text";
        Label = "Loan repayment";
    }
	
    IN MIR-OWN-NM
    {
        
        Length = "75";
        SType = "Text";
        Label = "Owner Name";
    }
    IN MIR-INSR-NM
    {
        
        Length = "75";
        SType = "Text";
        Label = "Insured Name";
    }
    IN MIR-PLAN-ID
    {
        
        Length = "40";
        CodeSource = "EDIT";
        CodeType = "PLAN";
        SType = "Text";
        Label = "Plan ID";
    }

    IN MIR-BASE-PREM-CMPL-IND
    {
        
        Length = "10";
        SType = "Indicator";
        Label = "Base policy premium payment completion Indicator";
    }  
    IN MIR-BASE-PREM-CMPL-DT
    {
        
        Length = "10";
        SType = "Date";
        Label = "Base policy premium payment completion Date";
      
    }
    IN MIR-POL-DIV-CD
    {
        
        Length = "40";
        CodeSource = "DataModel";
        CodeType = "POL-DIV-OPT-CD";
        SType = "Text";
        Label = "Policy Dividend Option";
    }
    IN MIR-PAY-TYP-MED-CD
    {
        DisplayOnly;
        Length = "1";
        CodeSource = "DataModel";
        CodeType = "MEDIC-CVG-PMT-TYP-CD";
        SType = "Text";
        Label = "Payment type of Medical Rider";
    }
    IN MIR-RIDER-CSV-AMT
    {
        
        Length = "17";
        SType = "Currency";
        Label = "Rider CSV";
    }
    IN MIR-HTH-BEN-AMT
    {
        
        Length = "17";
        SType = "Currency";
        Label = "Health Congratulatory Benefit";
    }
    IN MIR-HTH-BEN-DEF-AMT
    {
        
        Length = "17";
        SType = "Currency";
        Label = "Health congratulatory benefit Deferred Amount";
    }
    IN MIR-HTH-DEF-INT-AMT
    {
        
        Length = "17";
        SType = "Currency";
        Label = "Health congratulatory Deferred Interest Amount";
    }
     IN MIR-SURV-BEN-DEF-AMT
    {
        
        Length = "17";
        SType = "Currency";
        Label = "Survival Benefit Deferral Amount";
    }
    IN MIR-SURV-DEF-INT-AMT
    {
        
        Length = "17";
        SType = "Currency";
        Label = "Survival Benefit Deferral Interest";
    }
    
    IN MIR-INC-PUR-SUR-AMT
    {
        
        Length = "17";
        SType = "Currency";
        Label = "Increased purchase of Survival Benefit Amount";
    }
    IN MIR-INC-PUR-SUR-DEF-AMT
    {
        
        Length = "17";
        SType = "Currency";
        Label = "Increased purchase of Survival Benefit Deferred amount";
    }
    IN MIR-ACC-DIV-AMT
    {
        
        Length = "17";
        SType = "Currency";
        Label = "Accumulated Dividend Amount";
    }
    IN MIR-SPE-DIV-AMT
    {
        
        Length = "17";
        SType = "Currency";
        Label = "Special dividend amount";
    }
    IN MIR-SPE-DIV-DEF-AMT
    {
        
        Length = "17";
        SType = "Currency";
        Label = "Special dividend deferreal amount ";
    }   
        
    IN MIR-VES-AMT
    {
        
        Length = "17";
        SType = "Currency";
        Label = "Vesting Amount";
    }
    IN MIR-VES-DEF-AMT
    {
        
        Length = "17";
        SType = "Currency";
        Label = "Vesting deferred amount";
    }
    IN MIR-EXC-PREM-AMT
    {
        
        Length = "17";
        SType = "Currency";
        Label = "Excess of premium";
    }
    IN MIR-BAL-POL-LOAN-AMT
    {
         
         Length = "11";
         SType = "Currency";
         Label = "Policy Loan Balance";
    }
    IN MIR-BAL-LOAN-INT-AMT
    {
         
         Length = "11";
         SType = "Currency";
         Label = "Policy Loan Interest";
    }
    IN MIR-APL-BAL-AMT
    {
        
        Length = "11";
        SType = "Currency";
        Label = "APL balance";
    }
    IN MIR-APL-INT-AMT
    {
        
        Length = "11";
        SType = "Currency";
        Label = "APL Interest ";
    }
    IN MIR-SHRT-PREM-AMT
    {
        
        Length = "11";
        SType = "Currency";
        Label = "Over/Short Premium";
    }
    IN MIR-UNEARN-PREM-AMT
    {
        
        Length = "11";
        SType = "Currency";
        Label = "Unearned Premium ";
    }
    IN MIR-LUMP-SUM-PREM-AMT
    {
         
         Length = "11";
         SType = "Currency";
         Label = "Lumpsum Prepaid Premium ";
    }
    IN MIR-INST-PRE-PREM-AMT
    {
        
        Length = "11";
        SType = "Currency";
        Label = "Installment Prepaid Premium";
    }
    IN MIR-NET-PAY-AMT
    {
        
        Length = "11";
        SType = "Currency";
        Label = "Net Payment Amount";
    }
}

