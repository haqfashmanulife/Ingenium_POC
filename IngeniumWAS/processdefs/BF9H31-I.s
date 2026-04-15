# Converted from PathFinder 2.2 to 3.0 Jun 18, 2004 3:12:23 PM EDT

#*******************************************************************************
#*  Component:   BF9H31-I.s                                                    *
#*  Description:                                                               *
#*                                                                             *
#*******************************************************************************
#*  Chg#    Release  Description                                               *
#*                                                                             *
#*  014590  6.0      New for release 6.0                                       *
#*  017150  612J     Remove Currency Decimals = "2"                            *
#*                                                                             *
#*******************************************************************************

S-STEP BF9H31-I
{
    ATTRIBUTES
    {
        BusinessFunctionType = "Wholelife";
        Type = "Input";
        FocusField = "MIR-POL-ID-BASE";
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
       Length = "10";
       CodeSource = "DataModel";
       CodeType = "DV-TRNXT-PAYO-MTHD-CD";
       SType = "Text";
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
        
        Length = "1";
        SType = "Indicator";
        Label = "MRF Indicator";

    }
    INOUT MIR-BNK-ID
    {
         
         Length = "17";
         SType = "Currency";
         Label = "Bank Number ";
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
        DefaultConstant = "Y";
        SType = "Selection";
        Label = "Accumulated Dividend Amount";
    }
    INOUT MIR-LOAN-REPAY-IND
    {
        
        Length = "1";
        FieldGroup = "Table9";
        CodeSource = "EDIT";
        CodeType = "STIND";
        DefaultConstant = "Y";
        SType = "Selection";
        Label = "Loan repayment";
    }
    INOUT MIR-PUR-SURV-BEN-IND
    {
        
        Length = "1";
        FieldGroup = "Table9";
        CodeSource = "EDIT";
        CodeType = "STIND";
        DefaultConstant = "Y";
        SType = "Selection";
        Label = "Increased purchase of survival benefit";
    }
    INOUT MIR-VEST-IND
    {
        
        Length = "1";
        FieldGroup = "Table9";
        CodeSource = "EDIT";
        CodeType = "STIND";
        DefaultConstant = "Y";
        SType = "Selection";
        Label = "Vesting";
    }
    INOUT MIR-HLTH-CONG-IND
    {
        
        Length = "1";
        FieldGroup = "Table9";
        CodeSource = "EDIT";
        CodeType = "STIND";
        DefaultConstant = "Y";
        SType = "Selection";
        Label = "Health Congratulatory Benefit";
    }
    
}

