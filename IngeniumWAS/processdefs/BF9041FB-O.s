# Converted from PathFinder 2.2 to 3.0 Jun 18, 2004 3:13:06 PM EDT


#*******************************************************************************
#*  Component:   BF0941FB-O.s                                                  *
#*  Description: Cash Refund for Firm Banking Remittance                       *
#*                                                                             *
#*******************************************************************************
#*  Chg#    Release  Description                                               *
#*  MP168D  CTS      NEW FOR PROCESS FLOW BF9041 FOR FIRM BANKING              *
#*  M245B2  CTS      Foreign Currency Formatting                               *
#*******************************************************************************

S-STEP BF9041FB-O
{
  ATTRIBUTES
  {
    BusinessFunctionType = "Retrieve";
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

  IN MIR-DV-TYP-CSH-RFND-CD
  {
    DisplayOnly;
    Length = "1";
    CodeSource = "DataModel";
    CodeType = "DV-TYP-CSH-RFND-CD";
    SType = "Text";
    Label = "Type of Refund";
  }

  IN MIR-RECPT-NBR 
  {
    DisplayOnly;
    Length = "8";
    SType = "Number";
    Label = "Receipt Number";
  }

  IN MIR-RECPT-DT 
  {
    DisplayOnly;
    Length = "10";
    SType = "Date";
    Label = "Settlement Date";
  }

  IN MIR-JRNL-DT 
  {
    DisplayOnly;
    Length = "10";
    SType = "Date";
    Label = "Journal Date";
  }

  IN MIR-RECPT-AMT 
  {
#M245B2 CHANGES START HERE    
        CurrencyCode="MIR-PMT-CRCY-CD";
#M245B2 CHANGES END HERE 
    DisplayOnly;
#M245B2 CHANGES START HERE         
#        Length = "15";
        Length = "16"; 
#M245B2 CHANGES END HERE
    SType = "Currency";
    Label = "Settlement Amount";
  }

  IN MIR-POL-CSTAT-CD 
  {
    DisplayOnly;
    Length = "40";
    CodeSource = "DataModel";
    CodeType = "POL-CSTAT-CD";
    SType = "Text";
    Label = "Current Policy Status";
  }

  IN MIR-DV-CWA-SUSP-BAL 
  {
#M245B2 CHANGES START HERE    
        CurrencyCode="MIR-PMT-CRCY-CD";
#M245B2 CHANGES END HERE 
    DisplayOnly;
    Signed;
    Length = "17";
    SType = "Currency";
    Label = "Cash With App Suspense Balance";
  }

  IN MIR-DV-OWN-CLI-NM 
  {
    DisplayOnly;
    Length = "75";
    SType = "Text";
    Label = "Owner Name";
  }

  IN MIR-DV-OWN-CLI-KANA-NM 
  {
    DisplayOnly;
    Length = "75";
    SType = "Text";
    Label = "Owner Katakana Name";
  }
  
  IN MIR-DV-TRNXT-PAYO-MTHD-CD
  {
      DisplayOnly;
      Length = "1";
      CodeSource = "DataModel";
      CodeType = "CRFND-PAYO-MTHD-CD";
      SType = "Text";
      Label = "Payout Method";
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
      Label = "Account Number";
  }
  
  IN MIR-BNK-ACCT-HLDR-NM
  {
      DisplayOnly;
      Length = "50";
      SType = "Text";
      Label = "Account Holder's Name";
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
    Label = "Branch Name";
  }
#M245B2 CHANGES START HERE   
   IN MIR-PMT-CRCY-CD
   {   
      DisplayOnly;
      Length = "5";
      CodeSource = "EDIT";
      CodeType = "CRCY";
      SType = "Selection";
      Label = "Currency";
   }
#M245B2 CHANGES END HERE        
}
