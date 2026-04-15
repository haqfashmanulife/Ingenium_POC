# Converted from PathFinder 2.2 to 3.0 Jun 18, 2004 3:13:06 PM EDT
#*******************************************************************************
#*  Component:   BF0941FB-I.s                                                 *
#*  Description: INPUT S-STEP FOR FIRM BANKING PROCESS IN CASH REFUND          *
#*                                                                             *
#*******************************************************************************
#*  Chg#    Release  Description                                               *
#*  MP168D  CTS      CREATED NEWLY FOR HANDLING FB REMITTANCE FOR CASH REFUND  *
#*  M245B2  CTS      Foreign Currency Formatting                       *
#*  Q50745  CTS      Changes done for currency formatting                      * 
#*******************************************************************************

S-STEP BF9041FB-I
{
  ATTRIBUTES
  {
    BusinessFunctionType = "Update";
    Type = "Input";
    FocusField = "MIR-BNK-ID";
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

  IN MIR-DV-PRCES-STATE-CD
  {
    DisplayOnly;
    Length = "1";
    SType = "Hidden";
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
#Q50745 CHANGES START HERE  
#M245B2 CHANGES START HERE
#   INOUT MIR-PMT-CRCY-CD
   IN MIR-PMT-CRCY-CD
#Q50745 CHANGES START HERE    
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
