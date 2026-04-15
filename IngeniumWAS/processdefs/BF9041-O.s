# Converted from PathFinder 2.2 to 3.0 Jun 18, 2004 3:13:06 PM EDT


#*******************************************************************************
#*  Component:   BF0941-O.s                                                    *
#*  Description: Pending Policy Reversal Payment                               *
#*                                                                             *
#*******************************************************************************
#*  Chg#    Release  Description                                               *
#*  01nb31           new for procees flow BF9040                               *
#*  B10325  SRO      Add Journal Date                                          *
#*  02GL57  CSS      CWA SUSPENSE ACCOUNT AND REFUND                           *
#*  02GL57           - Removed Application Form Id, Miscellaneous Balance      *
#*  02GL57           - Added Type of Refund, CWA Suspense Balance              *
#*  02GL57           - Renamed function from Pending Policy Reversal Payment   *
#*  02GL57             to CASH REFUND                                          *
#*  P00929  ROC      REVISE RECPT NBR FROM 10 TO 8 BIT                         *
#*  MP168D  CTS      ADDED NEW FIELD PAYOUT METHOD FOR FIRM BANKING            *
#*                                                                             *
#*  M245B2  CTS      Foreign Currency Formatting                               *
#*******************************************************************************

S-STEP BF9041-O
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
#*P00929    Length = "10";
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
  
# MP168D Changes starts  
  IN MIR-DV-TRNXT-PAYO-MTHD-CD
  {
      DisplayOnly;
      Length = "1";
      CodeSource = "DataModel";
      CodeType = "CRFND-PAYO-MTHD-CD";
      SType = "Text";
      Label = "Payout Method";
  }  
# MP168D Changes ends

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
