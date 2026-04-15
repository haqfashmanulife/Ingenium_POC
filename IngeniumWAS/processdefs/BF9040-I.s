# Converted from PathFinder 2.2 to 3.0 Jun 18, 2004 3:13:06 PM EDT

#*******************************************************************************
#*  Component:   BF9040-I.S                                                    *
#*  Description: Pending Policy Payment                                        *
#*                                                                             *
#*******************************************************************************
#*  Chg#    Release  Description                                               *
#*                                                                             *
#* 02GL57   DPK      CWA Suspense Account and Refund                           *
#* P00929   ROC      REVISE RECPT NBR FROM 10 TO 8 BIT                         *
#*                                                                             *
#*  M245B2  CTS      Foreign Currency Formatting                       *
#*******************************************************************************
S-STEP BF9040-I
{
  ATTRIBUTES
  {
    BusinessFunctionType = "Payment";
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

  INOUT MIR-POL-ID-BASE
  {
    Key;
    Length = "9";
    DefaultSession = "MIR-POL-ID-BASE";
    SType = "Text";
    Label = "Policy Id";
  }

  INOUT MIR-POL-ID-SFX
  {
    Key;
    Length = "1";
    DefaultSession = "MIR-POL-ID-SFX";
    SType = "Text";
    Label = "Suffix";
  }

  INOUT MIR-POL-APP-FORM-ID
  {
    Key;
    Length = "15";
    SType = "Text";
    Label = "Application Form ID";
  }

  INOUT MIR-RECPT-NBR
  {
    Mandatory;

#*P00929  Length = "10";  

    Length = "08";
    SType = "Number";
    Label = "Receipt Number";
  }

  INOUT MIR-RECPT-DT
  {
    Mandatory;
    Length = "10";
    SType = "Date";
    Label = "Receipt Date";
  }

  INOUT MIR-RECPT-AMT
  {
#M245B2 CHANGES START HERE    
        CurrencyCode="MIR-PMT-CRCY-CD";
#M245B2 CHANGES END HERE   
    Mandatory;
    Length = "15";
    SType = "Currency";
    Label = "Cash with Application Amount";
  }

  INOUT MIR-JRNL-DT
  {
    Length = "10";
                DefaultSession = "LSIR-PRCES-DT";
    SType = "Date";
    Label = "Journal Date";
  }

  INOUT MIR-DV-PRCES-STATE-CD
  {
    Length = "1";
    SType = "Hidden";
    Label = "Process State";
  }
#M245B2 CHANGES START HERE  
  INOUT MIR-PMT-CRCY-CD
    {
      Key;
      Mandatory;
      Length = "5";
      CodeSource = "EDIT";
      CodeType = "CRCY";
      SType = "Selection";
      Label = "Currency";
     }
#M245B2 CHANGES END HERE      
}
