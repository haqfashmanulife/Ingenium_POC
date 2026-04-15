# Converted from PathFinder 2.2 to 3.0 Jun 18, 2004 3:13:06 PM EDT

#*******************************************************************************
#*  Component:   BF9044-O.s                                                    *
#*  Description: Pending Policy Payment                                        *
#*                                                                             *
#*******************************************************************************
#*  Chg#    Release  Description                                               *
#*                                                                             *
#*  02GL57  DPK      CWA Suspense Account and Refund                           *
#*  P00929  ROC      REVISE RECPT NBR FROM 10 TO 8 BIT                         *
#*                                                                             *
#*                                                                             *
#*  M245B2  CTS      Foreign Currency Formatting 			       *
#*******************************************************************************
 
S-STEP BF9044-O
{
  ATTRIBUTES
  {
    BusinessFunctionType = "List";
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

  IN MIR-POL-APP-FORM-ID 
  {
    Key;
    DisplayOnly;
    Length = "15";
    SType = "Text";
    Label = "Application Form ID";
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

  IN MIR-RECPT-DT-T[20] 
  {
    DisplayOnly;
    Length = "10";
    FieldGroup = "Table20";
    Index = "1";
    SType = "Date";
    Label = "Receipt Date";
  }

  IN MIR-RECPT-NUM-T[20] 
  {
    DisplayOnly;
#*P00929    Length = "10";
    Length = "8";
    FieldGroup = "Table20";
    Index = "1";
    SType = "Text";
    Label = "Receipt Number";
  }

  IN MIR-RECPT-AMT-T[20] 
  {
#M245B2 CHANGES START HERE     
    CurrencyCode= "MIR-PMT-CRCY-CD-T[]";
#M245B2 CHANGES ENDS HERE       
    DisplayOnly;
    Length = "15";
    FieldGroup = "Table20";
    Index = "1";
    SType = "Currency";
    Label = "Receipt Amount";
  }

  IN MIR-CWAR-SRC-CD-T[20] 
  {
    DisplayOnly;
    Length = "1";
    FieldGroup = "Table20";
    Index = "1";
    CodeSource = "DataModel";
    CodeType = "CWAR-SRC-CD";
    SType = "Text";
    Label = "Source Code";
  }
  
#M245B2 CHANGES START HERE     
  INOUT MIR-PMT-CRCY-CD-T[20]
   {
      Length = "2";
      SType = "Hidden";
      Label = "Currency";
   }  
#M245B2 CHANGES ENDS HERE      
}
