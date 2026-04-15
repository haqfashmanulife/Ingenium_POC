# Converted from PathFinder 2.2 to 3.0 Jun 18, 2004 3:13:08 PM EDT

#*******************************************************************************
#*  Component:   BF9192-O                                                      *
#*  Description:                                                               *
#*                                                                             *
#*******************************************************************************
#*  Chg#    Release  Description                                               *
#*                                                                             *
#*  1CNB02  DEL      NEW FOR CONVERSION POLICIES                               *
#*  B01151  EKM      FIXED SPELLING: MIR-HOSP-BNFT-AMT TO MIR-DLY-HOSP-BNFT-AMT*
#*******************************************************************************

S-STEP BF9192-O
{
  ATTRIBUTES
  {
    BusinessFunctionType = "Update";
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

  IN MIR-OWN-CLI-NM 
  {
    DisplayOnly;
    Length = "50";
    SType = "Text";
    Label = "Policy Owner";
  }

  IN MIR-PLAN-ID 
  {
    DisplayOnly;
    Length = "40";
    CodeSource = "EDIT";
    CodeType = "PLAN";
    SType = "Text";
    Label = "Product Name";
  }

  IN MIR-SEQ-NUM 
  {
    Key;
    DisplayOnly;
    Length = "3";
    SType = "Text";
    Label = "Conversion Sequence Number";
  }

  IN MIR-CNVR-KEY-NUM 
  {
    DisplayOnly;
    Length = "10";
    SType = "Text";
    Label = "Conversion Key Number";
  }

  IN MIR-CSTAT-CD 
  {
    DisplayOnly;
    Length = "1";
    SType = "Text";
    Label = "Current Status Code";
  }

  IN MIR-CNVR-ISS-EFF-DT 
  {
    DisplayOnly;
    Length = "10";
    SType = "Date";
    Label = "Conversion Target Effective Date";
  }

  IN MIR-CNVR-XPRY-DT 
  {
    DisplayOnly;
    Length = "10";
    SType = "Date";
    Label = "Converion Target Maturity Date";
  }

  IN MIR-ESC-XEMP-SPREM-AMT 
  {
    DisplayOnly;
    Length = "16";
    SType = "Currency";
    Label = "Conversion Flex Fund (SP)";
  }

  IN MIR-ESC-XEMP-RSRV-AMT 
  {
    DisplayOnly;
    Length = "16";
    SType = "Currency";
    Label = "Conversion Flex Fund (V)";
  }

  IN MIR-ESC-SPREM-AMT 
  {
    DisplayOnly;
    Length = "16";
    SType = "Currency";
    Label = "Conversion Fund SE (SP)";
  }

  IN MIR-ESC-RSRV-AMT 
  {
    DisplayOnly;
    Length = "16";
    SType = "Currency";
    Label = "Conversion Fund SE (V)";
  }

  IN MIR-ESC-CHRG-AMT 
  {
    DisplayOnly;
    Length = "16";
    SType = "Currency";
    Label = "ESC Chargeable ";
  }

  
  IN MIR-ORIG-SML-PROD-CD 
  {
    DisplayOnly;
    Length = "3";
    SType = "Text";
    Label = "Small Product Code";
  }

  IN MIR-ORIG-POL-ID 
  {
    DisplayOnly;
    Length = "7";
    SType = "Text";
    Label = "Pre-Conversion Policy Id";
  }

  IN MIR-ORIG-POL-ISS-DT 
  {
    DisplayOnly;
    Length = "10";
    SType = "Date";
    Label = "Issue Date";
  }

  IN MIR-ORIG-POL-MAT-DT 
  {
    DisplayOnly;
    Length = "10";
    SType = "Date";
    Label = "Maturity Date";
  }

  IN MIR-INSRD-CLI-NM 
  {
    DisplayOnly;
    Length = "50";
    SType = "Text";
    Label = "Insured Name";
  }

  IN MIR-INSRD-CLI-ID 
  {
    DisplayOnly;
    Length = "10";
    SType = "Text";
    Label = "Pre-Coversion Insured Client Id";
  }

  IN MIR-ORIG-MO-PREM-AMT 
  {
    DisplayOnly;
    Length = "16";
    SType = "Currency";
    Label = "Monthly  Standard Premium";
  }

  IN MIR-ORIG-LTD-PREM-PD 
  {
    DisplayOnly;
    Length = "16";
    SType = "Currency";
    Label = "Premium Recieved withoutDividend";
  }

  IN MIR-DTH-BNFT-AMT 
  {
    DisplayOnly;
    Length = "16";
    SType = "Currency";
    Label = "Death Benefit Amount";
  }

  IN MIR-DLY-HOSP-BNFT-AMT 
  {
    DisplayOnly;
    Length = "16";
    SType = "Currency";
    Label = " Hospital Benefit Per Day";
  }

  IN MIR-ORIG-TOT-LOAN-AMT 
  {
    DisplayOnly;
    Length = "16";
    SType = "Currency";
    Label = "Loans";
  }

  IN MIR-ORIG-PMT-MTHD-CD 
  {
    DisplayOnly;
    Length = "2";
    CodeSource = "EDIT";
    CodeType = "DHYPC";
    SType = "Text";
    Label = "Payment Method";
  }

  IN MIR-ORIG-AFYC-AMT 
  {
    DisplayOnly;
    Length = "16";
    SType = "Currency";
    Label = "AFYC";
  }

  IN MIR-ORIG-PAY-NUM 
  {
    DisplayOnly;
    Length = "4";
    SType = "Text";
    Label = "Number of Months Elapsed";
  }

  IN MIR-ORIG-CPREM-AMT 
  {
    DisplayOnly;
    Length = "16";
    SType = "Currency";
    Label = "Premium For Commission";
  }

  IN MIR-ORIG-COMM-FACE-AMT 
  {
    DisplayOnly;
    Length = "16";
    SType = "Currency";
    Label = "Face Amount For Commission";
  }
}
