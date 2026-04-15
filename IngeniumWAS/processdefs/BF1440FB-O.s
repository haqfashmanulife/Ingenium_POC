#*******************************************************************************
#*  Component:   BF1440FB-O.s                                                  *
#*  Description: Firm Banking Remittance Details Confirmation                  *
#*                                                                             *
#*******************************************************************************
#*  Chg#    Release  Description                                               *
#*                                                                             *
#*  MP228A  CTS      INITIAL VERSION                                           *
#*******************************************************************************

S-STEP BF1440FB-O
{
    ATTRIBUTES
    {
        BusinessFunctionType = "Update";
        Type = "Output";
        DelEmptyRows;
        FocusField = "confirmButton";
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

    IN LSIR-RETURN-CD
    {
        DisplayOnly;
    }

    IN MIR-RETRN-CD
    {
        DisplayOnly;
    }

    IN MIR-DV-PRCES-STATE-CD
    {
        DisplayOnly;
        Length = "1";
        SType = "Hidden";
        Label = "Process State";
    }

    IN MIR-LOAN-DT
    {
        DisplayOnly;
        Length = "10";
        DefaultSession = "LSIR-PRCES-DT";
        SType = "Date";
        Label = "Effective Date";
    }

    IN MIR-DV-TRNXT-PAYO-MTHD-CD
    {
        DisplayOnly;
        Length = "1";
        CodeSource = "DataModel";
        CodeType = "DV-TRNXT-PAYO-MTHD-CD";
        SType = "Text";
        Label = "Pay Out Method";
    }

    IN MIR-BNK-ID
    {
        DisplayOnly;
        Length = "4";
        SType = "Text";
        Label = "Bank Number";
    }

    IN MIR-BNK-BR-ID
    {
        DisplayOnly;
        Length = "5";
        SType = "Text";
        Label = "Branch Number";
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

    IN MIR-POL-ID-BASE
    {
        DisplayOnly;
        Length = "9";
        DefaultSession = "MIR-POL-ID-BASE";
        SType = "Text";
        Label = "Policy Id";
    }

    IN MIR-POL-ID-SFX
    {
        DisplayOnly;
        Length = "1";
        DefaultSession = "MIR-POL-ID-SFX";
        SType = "Text";
        Label = "Suffix";
    }
    IN MIR-PAYE-CLI-FRST-NM 
    {
        DisplayOnly;
        Length = "25";
        SType = "Text";
        Label = "Payee's First Name";
    }

    IN MIR-PAYE-CLI-LAST-NM 
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

    IN MIR-DV-CLI-ADDR 
    {
       DisplayOnly;
       Length = "50";
       SType = "Text";
       Label = "Kanji Address";
    }

    IN MIR-CLI-ADDR-ADDL-TXT
    {
       DisplayOnly;
       Length = "60";
       SType = "Text";
       Label = "Samakata-bu";
    }

    IN MIR-DV-OWN-CLI-NM
    {
        DisplayOnly;
        Length = "75";
        SType = "Text";
        Label = "Owner Name";
    }

    IN MIR-DV-INSRD-CLI-NM
    {
        DisplayOnly;
        Length = "75";
        SType = "Text";
        Label = "Insured Name";
    }

    IN MIR-PLAN-ID
    {
        DisplayOnly;
        Length = "40";
        CodeSource = "EDIT";
        CodeType = "PLAN";
        SType = "Text";
        Label = "Plan Name";
    }

    IN MIR-JRNL-DT
    {
      DisplayOnly;
      Length = "10";
      SType = "Date";
      Label = "Journal Date";
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

