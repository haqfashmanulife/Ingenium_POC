# Converted from PathFinder 2.2 to 3.0 Jun 18, 2004 3:13:06 PM EDT


#*******************************************************************************
#*  Component:   BF0945-O.s                                                    *
#*  Description: Cash Refund Reversal for Firm Banking                         *
#*                                                                             *
#*******************************************************************************
#*  Chg#    Release  Description                                               *
#*  MP168D  CTS      NEW FOR PROCEES FLOW BF9045 FOR FIRM BANKING              *
#*  M245B2  CTS      Foreign Currency Formatting                               *
#*******************************************************************************

S-STEP BF9045-O
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

  IN MIR-DV-PRCES-STATE-CD
  {
    Length = "1";
    SType = "Hidden";
  }

  IN MIR-DV-OWN-CLI-NM 
  {
    DisplayOnly;
    Length = "75";
    SType = "Text";
    Label = "Policyholder Name";
  }

  IN MIR-DV-OWN-CLI-KANA-NM 
  {
    DisplayOnly;
    Length = "75";
    SType = "Text";
    Label = "Policyholder Name (Kana)";
  }
    
  INOUT MIR-CSH-RFND-TYP-CD
  {
    DisplayOnly;
    Length = "1";
    CodeSource = "DataModel";
    CodeType = "DV-TYP-CSH-RFND-CD";
    SType = "Text";
    Label = "Type of Refund";
  }

  IN MIR-POL-CSTAT-CD 
  {
    DisplayOnly;
    Length = "4";
    CodeSource = "DataModel";
    CodeType = "POL-CSTAT-CD";
    SType = "Text";
    Label = "Policy Status";
  }

  IN MIR-RECPT-AMT 
  {
#M245B2 CHANGES START HERE    
        CurrencyCode="MIR-PMT-CRCY-CD";
#M245B2 CHANGES END HERE 
    DisplayOnly;
    Length = "15";
    SType = "Currency";
    Label = "Transaction Amount";
  }

  IN MIR-JRNL-DT 
  {
    DisplayOnly;
    Length = "10";
    SType = "Date";
    Label = "Journal Date";
  }

  IN MIR-CWA-SUSP-BAL 
  {
    
 #M245B2 CHANGES START HERE    
         CurrencyCode="MIR-PMT-CRCY-CD";
#M245B2 CHANGES END HERE 
    DisplayOnly;
    Signed;
    Length = "17";
    SType = "Currency";
    Label = "CWA Suspense";
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
          
           Length = "2";
           SType = "Hidden";
           Label = "Currency";
       } 
#M245B2 CHANGES END HERE   
}
