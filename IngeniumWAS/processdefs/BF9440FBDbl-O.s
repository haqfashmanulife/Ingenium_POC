# Converted from PathFinder 2.2 to 3.0 Jun 18, 2004 3:12:44 PM EDT

#*******************************************************************************
#*  Component:   BF9440Dbl-O.s                                                    *
#*  Description:                                                               *
#*                                                                             *
#*******************************************************************************
#*  Chg#    Release  Description                                               *
#*                                                                             *
#*  M271AA  CTS      NEW S-STEP AS PART OF FRA                                 *
#*******************************************************************************

S-STEP BF9440FBDbl-O
{
  ATTRIBUTES
  {
    BusinessFunctionType = "TPlaps";
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
    SType="Hidden";
  }

  IN MIR-APPL-CTL-PRCES-DT 
  {
    DisplayOnly;
    Length = "10";
    DefaultSession = "LSIR-PRCES-DT";
    SType = "Date";
    Label = "Process Date";
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

  IN MIR-POST-LAPS-SURR-AMT 
  {
    DisplayOnly;
            CurrencyCode = "MIR-PAYO-CRCY-CD";
    Signed;
    Length = "17";
    SType = "Currency";
    Label = "Post Lapse Surrender Amount";
  }

  IN MIR-DV-OWN-CLI-NM 
  {
    DisplayOnly;
    Length = "75";
    SType = "Text";
    Label = "Owner Name";
  }

  IN MIR-JRNL-DT
  {
    DisplayOnly;
    Length = "10";
    SType = "Date";
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

  IN MIR-DV-POL-CSV-AMT 
  {
      CurrencyCode = "MIR-POL-CRCY-CD";
      DisplayOnly;
      Signed;
      Length = "19";
      SType = "Currency";
      Label = "Cash Surrender Value";
  }
  IN MIR-DV-UNEARN-PREM
  {
    CurrencyCode = "MIR-PREM-CRCY-CD";
    DisplayOnly;
    Signed;
    Length = "17";
    SType = "Currency";
    Label = "Unearned Premium";
  }
  IN MIR-PREM-XCES-SHRT-AMT
  {
    CurrencyCode = "MIR-PREM-CRCY-CD";
    DisplayOnly;
    Signed;
    Length = "13";
    SType = "Currency";
    Label = "Excess / Shortage in Premium";
  }
  IN MIR-APL-LOAN-AMT
  {
    CurrencyCode = "MIR-PREM-CRCY-CD";
    DisplayOnly;
    Signed;
    Length = "17";
    SType = "Currency";
    Label = "APL Balance";
  }
  IN MIR-DV-APL-LOAN-INT-AMT
  {
    CurrencyCode = "MIR-PREM-CRCY-CD";
    DisplayOnly;
    Signed;
    Length = "17";
    SType = "Currency";
    Label = "APL Interest";
  }
  IN MIR-LOAN-AMT
  {
    DisplayOnly;
    Signed;
    Length = "17";
    SType = "Currency";
    Label = "Policy Loan Balance";
  }
  IN MIR-DV-LOAN-INT-AMT
  {
    DisplayOnly;
    Signed;
    Length = "17";
    SType = "Currency";
    Label = "Policy Loan Interest";
  }
  IN MIR-LOAN-XCES-SHRT-AMT
  {
    DisplayOnly;
    Signed;
    Length = "17";
    SType = "Currency";
    Label = "Excess / Shortage of Policy Loan Interest";
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
    IN MIR-PREM-CRCY-CD
    {
        Length = "2";
        SType = "Hidden";
        Label = "Currency";
    }  
   IN MIR-PAYO-CRCY-CD
        {
         
             Length = "2";
             SType = "Hidden";
             Label = "Currency";
        }      
    IN MIR-MRF-IND-1
    {
        DisplayOnly;
        Length = "1";
        SType = "Indicator";
        Label = "MRF Indicator";
    }

    IN MIR-BNK-ID-1
    {
        DisplayOnly;
        Length = "4";
        SType = "Text";
        Label = "Bank ID";
    }

    IN MIR-BNK-BR-ID-1
    {
        DisplayOnly;
        Length = "5";
        SType = "Text";
        Label = "Branch ID";
    }

    IN MIR-BNK-ACCT-ID-1
    {
        DisplayOnly;
        Length = "17";
        SType = "Text";
        Label = "Bank Account Number";
    }

    IN MIR-BNK-ACCT-HLDR-NM-1
    {
        DisplayOnly;
        Length = "50";
        SType = "Text";
        Label = "Account Holder Name";
    }

    IN MIR-BNK-ACCT-TYP-CD-1
    {
        DisplayOnly;
        Length = "3";
        CodeSource = "EDIT";
        CodeType = "FBACC";
        SType = "Text";
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
    IN MIR-PMT-CRCY-CD
    {
      Length = "2";
      SType = "Hidden";
      Label = "Currency";
    }    
     IN MIR-POL-CRCY-CD
     {
          Length = "2";
          SType = "Hidden";
          Label = "Currency";
      }        

         
    IN MIR-DV-JP-XCHNG-EFF-DT
    { 
	DisplayOnly;
	Length = "10";
	SType = "Date";
	Label = "Conversion Exchange Effective date";
    }
    IN MIR-DV-JP-XCHNG-RT
    { 
        DisplayOnly;
        Length = "7";
        Decimals = "2";
        DBTableName = "TCXRT";
        SType = "Text";
        Label = "Exchange rate from FC to JPY";     
    } 
  IN MIR-DV-PAYO-JPY-BNFT-CD
  {
    Length = "1";
    CodeSource = "DataModel";
    CodeType = "PAYO-JPY-BNFT-CD";
    SType = "Selection";
    Label = "JPY BENEFIT RIDER INDICATOR";
  }  
    IN MIR-DV-HO-RECV-DT
    {
        DisplayOnly;
        Length = "10";
        SType = "Date";
        Label = "Head Office Received Date";
    }
    IN MIR-DV-NATNL-TAXWH-AMT
    { 
        Signed;    
        CurrencyCode = "MIR-PAYO-CRCY-CD";
	DisplayOnly;
	Length = "20";
	SType = "Currency";
	Label = "Separate Withholding Tax (Income Tax)";
    }
    IN MIR-DV-LOC-TAXWH-AMT
    { 
        Signed;    
        CurrencyCode = "MIR-PAYO-CRCY-CD";
	DisplayOnly;
	Length = "20";
	SType = "Currency";
	Label = "Separate Withholding Tax (Local Tax)";
    } 
    IN MIR-DV-PREM-RFND-AMT    
    {     
        Signed;        
        CurrencyCode = "MIR-PMT-CRCY-CD";    
	DisplayOnly;    
	Length = "20";    
	SType = "Currency";    
	Label = "Premium Refund(JPY)";    
    }            
}
