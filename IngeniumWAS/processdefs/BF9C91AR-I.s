#*******************************************************************************
#*  Component:   BF9C91AR-I.s                                                  *
#*  Description: Input Edit Step for Annuity Request reception                 *
#*                                                                             *
#*******************************************************************************
#*  Chg#    Release  Description                                               *
#*                                                                             *
#*  UY3049  CTS   Annuity Transition processing   stream 3                     *
#*******************************************************************************
    S-STEP BF9C91AR-I
{
    ATTRIBUTES
    {
    BusinessFunctionType = "Update";
    FocusFrame = "ContentFrame";
    Type = "Input";
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
    
    OUT index
    {
        SType = "Hidden";
    }
    
    IN MIR-POL-ID-BASE
    {
    DefaultSession = "MIR-POL-ID-BASE";
    Key;
    Label = "Policy ID";
    Length = "9";
    Mandatory;
    SType = "Text";
    }
    
    IN MIR-POL-ID-SFX
    {
    DefaultSession = "MIR-POL-ID-SFX";
    Key;
    Label = "Suffix";
    Length = "1";
    SType = "Text";
    }

    IN MIR-PBRQ-EFF-DT
    {
        Key;
        Mandatory;
        Length = "10";
        SType = "Date";
        Label = "Effective Date";
    }

    INOUT MIR-DV-PRCES-STATE-CD
    {
        Length = "1";
        SType = "Hidden";
        Label = "Process State";
    }

    IN MIR-DV-POL-FUT-ACTV-TYP-CD
    {
    CodeSource = "DataModel";
    CodeType = "DV-POL-FUT-ACTV-TYP-CD";
    Label = "Activity Type";
    Length = "2";
    Mandatory;
    SType = "Text";
    }
    
    INOUT MIR-POL-FUT-ACTV-STAT-CD
    {
        CodeSource = "DataModel";
        CodeType = "POL-FUT-ACTV-STAT-CD";
        Label = "Activity Status";
        Length = "1";
        SType = "Selection";
    }    
    
    INOUT MIR-RQST-REC-PRCS-DT	
    {
        Mandatory;
        Length = "10";
        DefaultSession = "LSIR-PRCES-DT";
        SType = "Date";
        Label = "Request reception Processing date";
    }

 	INOUT MIR-MRF-ACC-IND
    {
        Length = "1";
        SType = "Indicator";
        Label = "MRF";
    }

    INOUT MIR-ANTY-FREQ-CRNT-YR
    {
        Mandatory;
        CodeSource = "DataModel";
        CodeType = "ANTY-FREQ-CRNT-YR";
        DefaultConstant = "12";
        Length="2";
        SType="Selection";
        Label="No.of installments(This year)";
    }

    INOUT MIR-ANTY-FREQ-NXT-YR
    {
        CodeSource = "DataModel";
        CodeType = "ANTY-FREQ-CRNT-YR";
        DefaultConstant = "12";
        Length = "2";
        SType = "Selection";
        Label = "No.of installments(Next year)";
    }
    
    INOUT MIR-PAYE-GIV-NM 
    {
        Length = "25";
        SType = "Text";
        Label = "Payee's First Name";
    }

    INOUT MIR-PAYE-SUR-NM 
    {
       Length = "25";
       SType = "Text";
       Label = "Payee's Last Name";
    }

    INOUT MIR-PAYE-CO-NM 
    {
       Length = "50";
       SType = "Text";
       Label = "Company Name";
    }

    INOUT MIR-BNK-ID
    {
        Length = "4";
        SType = "Text";
        Label = "Bank Number";
    }
    
    IN MIR-BNK-NM 
    {
      DisplayOnly;
      Length = "36";
      SType = "Text";
      Label = "Bank Name";
    }    

    INOUT MIR-BNK-BR-ID
    {
     Length = "5";
     SType = "Text";
     Label = "Branch ID";
    }
    
    IN MIR-BNK-BR-NM
    {
      DisplayOnly;
      Length = "36";
      SType = "Text";
      Label = "Branch Name";
    }    

    INOUT MIR-BNK-ACCT-TYP-CD
    {
        Length = "3";
        CodeSource = "EDIT";
        CodeType = "FBACC";
        SType = "Selection";
        Label = "Account Type";
    }
    
    INOUT MIR-BNK-ACCT-ID
    {
        Length = "7";
        SType = "Text";
        Label = "Bank Account Number";
    }

    INOUT MIR-BNK-ACCT-HLDR-NM
    {
        Length = "50";
        SType = "Text";
        Label = "Account Holder Name";
    }

    INOUT MIR-CLI-ADDR-LOC-CD 
    {
       Length = "8";
       SType = "Text";
       Label = "Address Code";
    }
     
    IN MIR-CLI-PSTL-CD 
    {
       DisplayOnly;
       Length = "9";
       SType = "Text";
       Label = "Postal Code";
    }


    IN MIR-DV-CLI-ADDR 
    {
       DisplayOnly;
       Length = "50";
       SType = "Text";
       Label = "Kanji Address";
    }

    INOUT MIR-CLI-ADDR-ADDL-TXT
    {
       Length = "60";
       SType = "Text";
       Label = "Samakata-bu";
    }

}
