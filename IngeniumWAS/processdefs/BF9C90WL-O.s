#*******************************************************************************
#*  Component:   BF9C90WL-O.s                                                  *
#*  Description: Output Step for Whole life Inquiry Process                    *
#*                                                                             *
#*******************************************************************************
#*  Chg#    Release  Description                                               *
#*                                                                             *
#*  MP142F  CTS      Intial Version                                            *
#*  UY3064  CTS      Whole Life Premium Payment Completion Changes             *
#*******************************************************************************

S-STEP BF9C90WL-O
{
    ATTRIBUTES
    {
        BusinessFunctionType = "Retrieve";
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
    
    IN MIR-PBRQ-EFF-DT
    {
        Key;
        Mandatory;
        Length = "10";
        SType = "Date";
        Label = "Policy billing request Effective Date";
    }

    IN MIR-DV-POL-FUT-ACTV-TYP-CD
    {
        DisplayOnly;
        Length = "2";
        CodeSource = "DataModel";
        CodeType = "DV-POL-FUT-ACTV-TYP-CD";
        SType = "Text";
        Label = "Activity Type";
    }
    
    IN MIR-POL-FUT-ACTV-STAT-CD
    {
        DisplayOnly;
        Length = "1";
        CodeSource = "DataModel";
        CodeType = "POL-FUT-ACTV-STAT-CD";
        SType = "Text";
        Label = "Activity Status";
    }    
    
    IN MIR-PMT-RQST-TYP-CD
    {
      DisplayOnly;
      CodeSource = "DataModel";
      CodeType = "PMT-RQST-TYP-CD";
      Label = "Type of Payment Requested";
      Length = "1";
      Mandatory;
      SType = "Text";
    }
    
    IN MIR-PMT-RQST-AMT
    {
        DisplayOnly;
        Signed;
        Length = "15";
        SType = "Currency";
        Label = "Amount of payment requested";
    }

    IN MIR-ACUM-DIV-AMT-IND
    {
        Length = "1";
        DBTableName = "TPOL";
        SType = "Indicator";
        Label = "Accum Dividend";
    }
    IN MIR-INCR-SURV-BNFT-IND
    {
        Length = "1";
        DBTableName = "TPOL";
        SType = "Indicator";
        Label = "Increase purchase of Survival benfit";
    }
   IN MIR-VEST-IND
    {
        Length = "1";
        DBTableName = "TPOL";
        SType = "Indicator";
        Label = "vesting";
    }
    IN MIR-HLTH-BNFT-IND
    {
        Length = "1";
        DBTableName = "TPOL";
        SType = "Indicator";
        Label = "health benefit";
    }
   IN MIR-XCES-PREM-IND
    {
        Length = "1";
        DBTableName = "TPOL";
        SType = "Indicator";
        Label = "Excees Premium";
    }
    
    IN MIR-PAYE-GIV-NM 
    {
        DisplayOnly;
        Length = "25";
        SType = "Text";
        Label = "Payee's First Name";
    }

    IN MIR-PAYE-SUR-NM 
    {
       DisplayOnly;
       Length = "25";
       SType = "Text";
       Label = "Payee's Last Name";
    }

    IN MIR-PAYE-CO-NM 
    {
       DisplayOnly;
       Length = "50";
       SType = "Text";
       Label = "Company Name";
    }

    IN MIR-CLI-ADDR-LOC-CD 
    {
       DisplayOnly;
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

    IN MIR-CLI-ADDR-ADDL-TXT
    {
       DisplayOnly;
       Length = "60";
       SType = "Text";
       Label = "Samakata-bu";
    }

    IN MIR-DV-CLI-ADDR 
    {
       DisplayOnly;
       Length = "50";
       SType = "Text";
       Label = "Kanji Address";
    }

    IN MIR-BNK-ID
    {
        DisplayOnly;
        Length = "4";
        SType = "Text";
        Label = "Bank ID";
    }

    IN MIR-BNK-BR-ID
    {
        DisplayOnly;
        Length = "5";
        SType = "Text";
        Label = "Branch ID";
    }

    IN MIR-BNK-ACCT-ID
    {
        DisplayOnly;
        Length = "17";
        SType = "Text";
        Label = "Bank Account Number";
    }

    IN MIR-BNK-ACCT-HLDR-NM
    {
        DisplayOnly;
        Length = "50";
        SType = "Text";
        Label = "Account Holder Name";
    }

    IN MIR-BNK-ACCT-TYP-CD
    {
        DisplayOnly;
        Length = "3";
        CodeSource = "EDIT";
        CodeType = "FBACC";
        SType = "Text";
        Label = "Account Type";
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


}    