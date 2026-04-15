# Converted from PathFinder 2.2 to 3.0 Jun 18, 2004 3:13:06 PM EDT


#*******************************************************************************
#*  Component:   BF0941-I.s                                                    *
#*  Description: Pending Policy Reversal Payment                               *
#*                                                                             *
#*******************************************************************************
#*  Chg#    Release  Description                                               *
#*  01nb31           new for procees flow BF9040                               *
#*  B10325  SRO      Add Journal Date                                          *
#*  02GL57  CSS      CWA SUSPENSE ACCOUNT AND REFUND                           *
#*  02GL57           - Removed Application Form Id                             *
#*  02GL57           - Added Type of Refund                                    *
#*  02GL57           - Renamed function from Pending Policy Reversal Payment   *
#*  02GL57             to CASH REFUND                                          *
#*  P00929  ROC      REVISE RECPT NBR FROM 10 TO 8 BIT                         *
#*                                                                             *
#*  MP168D  CTS      ADDED NEW FIELD PAYOUT METHOD MIR-DV-TRNXT-PAYO-MTHD-CD   *
#*  M245B2  CTS      Foreign Currency Formatting                               *
#*******************************************************************************

S-STEP BF9041-I
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

  INOUT MIR-DV-TYP-CSH-RFND-CD
  {
    Mandatory;
    Length = "1";
    CodeSource = "DataModel";
    CodeType = "DV-TYP-CSH-RFND-CD";
    SType = "Selection";
    Label = "Type of Refund";
  }

  INOUT MIR-RECPT-NBR
  {
#*P00929    Length = "10";
    Length = "8";
    SType = "Number";
    Label = "Receipt Number";
  }

  INOUT MIR-RECPT-DT
  {
    Mandatory;
    Length = "10";
    SType = "Date";
    Label = "Settlement Date";
  }

  INOUT MIR-JRNL-DT
  {
    Length = "10";
    DefaultSession = "LSIR-PRCES-DT";
    SType = "Date";
    Label = "Journal Date";
  }

  INOUT MIR-RECPT-AMT
  {
#M245B2 CHANGES START HERE    
        CurrencyCode="MIR-PMT-CRCY-CD";
#M245B2 CHANGES END HERE 
    Mandatory;
#M245B2 CHANGES START HERE         
#        Length = "15";
        Length = "16"; 
#M245B2 CHANGES END HERE
    SType = "Currency";
    Label = "Settlement Amount";
  }

  INOUT MIR-DV-PRCES-STATE-CD
  {
    Length = "1";
    SType = "Hidden";
    Label = "Process State";
  }
  
# MP168D CHANGES STARTS HERE
  INOUT MIR-DV-TRNXT-PAYO-MTHD-CD
  {    
    Mandatory;
    Length = "1";
    CodeSource = "DataModel";
    CodeType = "CRFND-PAYO-MTHD-CD";
    SType = "Selection";
    Label = "Payout Method";
  }
# MP168D CHANGES ENDS HERE
#M245B2 CHANGES START HERE 
   INOUT MIR-PMT-CRCY-CD
   {
      Mandatory;
      Length = "5";
      CodeSource = "EDIT";
      CodeType = "CRCY";
      SType = "Selection";
      Label = "Currency";
  }
#M245B2 CHANGES END HERE        
}
