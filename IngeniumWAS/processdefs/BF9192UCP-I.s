# Converted from PathFinder 2.2 to 3.0 Jun 18, 2004 3:13:08 PM EDT

#*******************************************************************************
#*  Component:   BF9192-I                                                      *
#*  Description:                                                               *
#*                                                                             *
#*******************************************************************************
#*  Chg#    Release  Description                                               *
#*                                                                             *
#*  UCPUPL  SC       New for UCP Upload  - UCP Switch project                  *
#*******************************************************************************

S-STEP BF9192UCP-I
{
  ATTRIBUTES
  {
    BusinessFunctionType = "Update";
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
    SType = "text";
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

  IN  MIR-CNVR-KEY-NUM
  {
    DisplayOnly;
    Length = "10";
    SType = "Text";
    Label = "Conversion Key Number";
  }

  IN    MIR-CSTAT-CD
  {
    Length = "20";
    CodeSource = "DataModel";
    CodeType = "CSTAT-CD";
    DBTableName = "TPOLX";
    SType = "Text";
    Label = "Current Status Code";
  }

  INOUT MIR-CNVR-ISS-EFF-DT
  {
    Length = "10";
    SType = "Date";
    Label = "Conversion Target Effective Date";
  }

  INOUT MIR-CNVR-XPRY-DT
  {
    Length = "10";
    SType = "Date";
    Label = "Converion Target Maturity Date";
  }

  INOUT MIR-ESC-SPREM-AMT
  {
    Length = "16";
    SType = "Currency";
    Label = "Conversion Flex Fund (SP)";
  }

  INOUT MIR-ESC-RSRV-AMT
  {
    Length = "16";
    SType = "Currency";
    Label = "Conversion Flex Fund (V)";
  }

  INOUT MIR-ESC-XEMP-SPREM-AMT
  {
    Length = "16";
    SType = "Currency";
    Label = "Conversion Fund SE (SP)";
  }

  INOUT MIR-ESC-XEMP-RSRV-AMT
  {
    Length = "16";
    SType = "Currency";
    Label = "Conversion Fund SE (V)";
  }

  INOUT MIR-ESC-CHRG-AMT
  {
    Length = "16";
    SType = "Currency";
    Label = "ESC Chargeable ";
  }

  
  IN MIR-ADJ-ESC-CHRG-AMT
  {
    Length = "16";
    SType = "Currency";
    Label = "Adjusted ESC Chargeable ";
  }

  
  IN MIR-ADJ-MO-PREM-AMT
  {
    Length = "16";
    SType = "Currency";
    Label = "Adjusted Monthly Standard Premium";
  }

  
  INOUT MIR-ORIG-SML-PROD-CD
  {
    Length = "3";
    SType = "Text";
    Label = "Small Product Code";
  }

  INOUT MIR-ORIG-POL-ID
  {
    Length = "7";
    SType = "Text";
    Label = "Pre-Conversion Policy Id";
  }

  INOUT MIR-ORIG-POL-ISS-DT
  {
    Length = "10";
    SType = "Date";
    Label = "Issue Date";
  }

  INOUT MIR-ORIG-POL-MAT-DT
  {
    Length = "10";
    SType = "Date";
    Label = "Maturity Date";
  }

  INOUT MIR-INSRD-CLI-NM
  {
    DisplayOnly;
    Length = "50";
    SType = "Text";
    Label = "Insured Name";
  }

  INOUT MIR-INSRD-CLI-ID
  {
    Length = "10";
    CodeSource = "CSOM4904";
    FilterFields = "2";
    FilterField1 = "MIR-POL-ID-BASE";
    FilterField2 = "MIR-POL-ID-SFX";
    SType = "Selection";
    Label = "Select Application Clients";
  }

  INOUT MIR-ORIG-MO-PREM-AMT
  {
    Length = "16";
    SType = "Currency";
    Label = "Monthly  Standard Premium";
  }

  INOUT MIR-ORIG-LTD-PREM-PD
  {
    Length = "16";
    SType = "Currency";
    Label = "Premium Recieved withoutDividend";
  }

  INOUT MIR-DTH-BNFT-AMT
  {
    DisplayOnly;
    Length = "16";
    SType = "Currency";
    Label = "Death Benefit Amount";
  }

  INOUT MIR-DLY-HOSP-BNFT-AMT
  {
    DisplayOnly;
    Length = "16";
    SType = "Currency";
    Label = " Hospital Benefit Per Day";
  }

  INOUT MIR-ORIG-TOT-LOAN-AMT
  {
    Length = "16";
    SType = "Currency";
    Label = "Loans";
  }

  INOUT MIR-ORIG-PMT-MTHD-CD
  {
    Length = "2";
    CodeSource = "EDIT";
    CodeType = "DHYPC";
    SType = "Selection";
    Label = "Payment Method";
  }

  INOUT MIR-ORIG-AFYC-AMT
  {
    Length = "16";
    SType = "Currency";
    Label = "AFYC";
  }

  INOUT MIR-ORIG-PAY-NUM
  {
    Length = "4";
    SType = "Text";
    Label = "Number of Months Elapsed";
  }

  INOUT MIR-ORIG-CPREM-AMT
  {
    Length = "16";
    SType = "Currency";
    Label = "Premium For Commission";
  }

  INOUT MIR-ORIG-COMM-FACE-AMT
  {
    Length = "16";
    SType = "Currency";
    Label = "Face Amount For Commission";
  }

  INOUT MIR-INSRD-CLI-ID-T[1]
  {
     SType = "Hidden";
  }

}
