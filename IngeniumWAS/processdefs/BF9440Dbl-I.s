# Converted from PathFinder 2.2 to 3.0 Jun 18, 2004 3:13:10 PM EDT

#*******************************************************************************
#*  Component:   BF9440Dbl-I.s                                                    *
#*  Description:                                                               *
#*                                                                             *
#*******************************************************************************
#*  Chg#    Release  Description                                               *
#*                                                                             *
#*  M271AA  CTS      FRA CHANGES FOR POST LAPSE SURRENDER  01SEP2015           *
#*******************************************************************************

S-STEP BF9440Dbl-I
{
  ATTRIBUTES
  {
    BusinessFunctionType = "TPlaps";
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
    SType="Hidden";
  }

  IN MIR-APPL-CTL-PRCES-DT
  {
    DisplayOnly;
    Length = "10";
    DefaultSession = "LSIR-PRCES-DT";
    SType = "Text";
    Label = "Process Date";
  }

  IN MIR-DV-PRCES-STATE-CD
  {
    Length = "1";
    SType = "Hidden";
    Label = "Process State";
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
    IN MIR-JRNL-DT
    {
        DisplayOnly;
        Length = "10";
        DefaultSession = "LSIR-PRCES-DT";
        SType = "Text";
        Label = "Journal Date";
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

    IN MIR-CO-RECV-DT
    {
        DisplayOnly;
        Length = "10";
        DefaultSession = "LSIR-PRCES-DT";
        SType = "Date";
        Label = "Company Received Date";
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
        SType = "Selection";
        Label = "Account Type";
    }

    INOUT MIR-PAYE-CLI-FRST-NM
    {
        Length = "25";
        SType = "Text";
        Label = "Payee's First Name";
    }

    INOUT MIR-PAYE-CLI-LAST-NM
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

    INOUT MIR-CLI-ADDR-ADDL-TXT
    {
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

  IN MIR-BNK-NM 
  {
    DisplayOnly;
    Length = "36";
    SType = "Text";
    Label = "Bank Name";
  }
    INOUT MIR-MRF-IND
    {
        Length = "1";
        SType = "Indicator";
        Label = "MRF Indicator";
    }


  IN MIR-BNK-BR-NM
  {
    DisplayOnly;
    Length = "36";
    SType = "Text";
    Label = "Bank Branch Name";
  }
  
  IN MIR-SURR-FORM-ACPT-DT
  { 
      DisplayOnly;
      Length = "10";
      SType = "Date";
      Label = "Surrender Request Form Acceptance Date";
  }
  
  IN MIR-ASIGN-SURR-EFF-DT
  { 
      DisplayOnly;
      Length = "10";
      SType = "Date";
      Label = "Assigned Surrender Effective Date for Policy with Assignee";
  }
  
  IN MIR-POL-STEP-IN-RIGHT-IND
  { 
      DisplayOnly;
      Length = "1";
      SType = "Indicator";
      Label = "Policy with Step-In Right";
  }    
    IN MIR-DV-HO-RECV-DT
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
    Label = "JPY BENEFIT RIDER INDICATOR";
  }  
    INOUT MIR-MRF-IND-1
    {
        Length = "1";
        SType = "Indicator";
        Label = "MRF Indicator";
    }

    INOUT MIR-BNK-ID-1
    {
        Length = "4";
        SType = "Text";
        Label = "Bank ID";
    }

    INOUT MIR-BNK-BR-ID-1
    {
        Length = "5";
        SType = "Text";
        Label = "Branch ID";
    }

    INOUT MIR-BNK-ACCT-ID-1
    {
        Length = "17";
        SType = "Text";
        Label = "Bank Account Number";
    }

    INOUT MIR-BNK-ACCT-HLDR-NM-1
    {
        Length = "50";
        SType = "Text";
        Label = "Account Holder Name";
    }

    INOUT MIR-BNK-ACCT-TYP-CD-1
    {
        Length = "3";
        CodeSource = "EDIT";
        CodeType = "FBACC";
        SType = "Selection";
        Label = "Account Type";
    }
    
    IN MIR-BNK-NM-1 
    {
      DisplayOnly;
      Length = "36";
      SType = "Text";
      Label = "Bank Name";
    }
    
    IN MIR-BNK-BR-NM-1  
    {  
      DisplayOnly;  
      Length = "36";  
      SType = "Text";  
      Label = "Bank Branch Name";  
    }
}
