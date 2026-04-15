#*******************************************************************************
#*  Component:   BF9C91WL-I.s                                                  *
#*  Description: Input Edit Step Sundry amount change request                  *
#*                                                                             *
#*******************************************************************************
#*  Chg#    Release  Description                                               *
#*  UY3064  CTS      WHOLE LIFE PREMIUM PAYMENT COMPLETION                     *
#*******************************************************************************
    S-STEP BF9C91WL-I
{
    ATTRIBUTES
    {
    BusinessFunctionType = "Update";
    FocusField = "MIR-NEW-SNDRY-AMT";
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
    Label = "Policy billing request Effective Date";
    Length = "10";
    Mandatory;
    SType = "Date";
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
    
    INOUT MIR-PMT-RQST-TYP-CD
    {
      Length = "1";
      Mandatory;     
      CodeSource = "DataModel";
      CodeType = "PMT-RQST-TYP-CD";
      SType = "Selection";
      Label = "Type of Payment Requested";      
    }
    
    INOUT MIR-PMT-RQST-AMT
    {
        Signed;
        Length = "15";
        SType = "Currency";
        Label = "Amount of payment requested";
    }
#UY3064 START CHANGES HERE
    INOUT MIR-ACUM-DIV-AMT-IND
    {
        Length = "1";
        DBTableName = "TPOL";
        SType = "Indicator";
        Label = "Accum Dividend";
    }
    INOUT MIR-INCR-SURV-BNFT-IND
    {
        Length = "1";
        DBTableName = "TPOL";
        SType = "Indicator";
        Label = "Increase purchase of Survival benfit";
    }
   INOUT MIR-VEST-IND
    {
        Length = "1";
        DBTableName = "TPOL";
        SType = "Indicator";
        Label = "vesting";
    }
    INOUT MIR-HLTH-BNFT-IND
    {
        Length = "1";
        DBTableName = "TPOL";
        SType = "Indicator";
        Label = "health benefit";
    }
    INOUT MIR-XCES-PREM-IND
    {
        Length = "1";
        DBTableName = "TPOL";
        SType = "Indicator";
        Label = "Excees Premium";
    }
#UY3064 CHANGES END HERE
    
    
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


    IN MIR-BNK-NM 
    {
      DisplayOnly;
      Length = "36";
      SType = "Text";
      Label = "Bank Name";
    }

    IN MIR-BNK-BR-NM
    {
      DisplayOnly;
      Length = "36";
      SType = "Text";
      Label = "Bank Branch Name";
    }

    INOUT MIR-BNK-ID
    {
        Length = "4";
        SType = "Text";
        Label = "Bank ID";
    }

    INOUT MIR-BNK-BR-ID
    {
        Length = "5";
        SType = "Text";
        Label = "Branch ID";
    }

    INOUT MIR-BNK-ACCT-ID
    {
        Length = "17";
        SType = "Text";
        Label = "Bank Account Number";
    }

    INOUT MIR-BNK-ACCT-HLDR-NM
    {
        Length = "50";
        SType = "Text";
        Label = "Account Holder Name";
    }

    INOUT MIR-BNK-ACCT-TYP-CD
    {
        Length = "3";
        CodeSource = "EDIT";
        CodeType = "FBACC";
        DBTableName = "TFTRQ";        
        SType = "Selection";
        Label = "Account Type";
    }

}    