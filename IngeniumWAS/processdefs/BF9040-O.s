# Converted from PathFinder 2.2 to 3.0 Jun 18, 2004 3:13:06 PM EDT

#*******************************************************************************
#*  Component:   BF0940-O.s                                                    *
#*  Description: Pending Policy Payment                                        *
#*                                                                             *
#*******************************************************************************
#*  Chg#    Release  Description                                               *
#*                                                                             *
#* 02GL57   DPK      CWA Suspense Account and Refund                           *
#* P00929   ROC      CHANGE RECPT NBR FROM 10 TO 8 BIT                         *
#*                                                                             *
#*  M245B2  CTS      Foreign Currency Formatting                       *
#*******************************************************************************
 
S-STEP BF9040-O
{
  ATTRIBUTES
  {
    BusinessFunctionType = "Payment";
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

  IN MIR-POL-APP-FORM-ID 
  {
    Key;
    DisplayOnly;
    Length = "15";
    SType = "Text";
    Label = "Application Form ID";
  }

  IN MIR-RECPT-NBR 
  {
    DisplayOnly;
#* P00929    Length = "10";
    Length = "8";
    SType = "Number";
    Label = "Receipt Number";
  }

  IN MIR-RECPT-DT 
  {
    DisplayOnly;
    Length = "10";
    SType = "Date";
    Label = "Receipt Date";
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
    Length = "15";
    SType = "Currency";
    Label = "Cash with Application Amount";
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
    Label = "Cash with App Suspense Balance";
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
#M245B2 CHANGES START HERE   
  IN MIR-PMT-CRCY-CD
    {
      Length = "5";
      CodeSource = "EDIT";
      CodeType = "CRCY";
      SType = "Selection";
      Label = "Currency";
     }
#M245B2 CHANGES END HERE      
}
