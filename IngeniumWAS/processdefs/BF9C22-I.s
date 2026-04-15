#*******************************************************************************
#*  Component:   BF9C22-I.s                                                    *
#*  Description: TD Reinstatement Information Update Screen                    *
#*                                                                             *
#*******************************************************************************
#*  Chg#    Release  Description                                               *
#*  NWLGLR  CTS      Intial Version                                            *
#*  C13892  CTS      ADDED LAPSE DATE                                          *
#*******************************************************************************

S-STEP BF9C22-I
{
  ATTRIBUTES
  {
    BusinessFunctionType = "Update";
    FocusField = "MIR-POL-ID-BASE";
    FocusFrame = "ContentFrame";
    Type = "Input";
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
    Label = "Policy ID";
    Length = "9";
    SType = "Text";
  }

  IN MIR-POL-ID-SFX
  {
    Key;
    DisplayOnly;
    Label = "Suffix";
    Length = "1";
    SType = "Text";
  }

  IN MIR-PRCES-DT
  {
    Key;
    DisplayOnly;
    Label = "Processing Date";
    Length = "10";
    SType = "Date";
  }

  IN MIR-INFO-STAT-CD
  {
    CodeSource = "EDIT";
    CodeType = "ISTAT";
    DisplayOnly;
    Key;
    Label = "Information status";
    Length = "1";
    SType = "Text";
  }

  IN MIR-INSRD-CLI-ID
  {
    DisplayOnly;
    Key;
    Label = "Insured Client Number";
    Length = "10";
    SType = "Text";
  }

  IN MIR-DV-INSRD-NM
  {
    DisplayOnly;
    Key;
    Label = "Insured Name";
    Length = "50";
    SType = "Text";
  }

  INOUT MIR-SELF-DSCLSRE-DT
  {
    Label = "Self Disclosure Date";
    Length = "10";
    SType = "Date";
  }

  INOUT MIR-APCHD-LOC-CD
  {
    CodeSource = "EDIT";
    CodeType = "APLOC";
    Label = "Approached Loaction";
    Length = "1";
    SType = "Selection";
  }

  INOUT MIR-UWG-RSLT-CD
  {
    CodeSource = "EDIT";
    CodeType = "UWRES";
    Label = "Underwriting Result";
    Length = "1";
    SType = "Selection";
  }

  INOUT MIR-EXCL-INFO-TXT
  {
    Label = "Exclusion Information";
    Length = "30";
    SType = "Text";
  }

  INOUT MIR-UWG-DT
  {
    Label = "Underwriting Date";
    Length = "10";
    SType = "Date";
  }

  INOUT MIR-OVRDU-PREM-AMT
  {
    Label = "Delinquent Premium";
    Length = "15";
    SType = "Currency";
  }

  INOUT MIR-OVRDU-INT-AMT
  {
    Label = "Delinquent Interest";
    Length = "15";
    SType = "Currency";
  }

  INOUT MIR-TOT-REQIR-AMT
  {
    Label = "Total Amount to be paid";
    Length = "15";
    SType = "Currency";
  }

  INOUT MIR-PREM-DUE-MO-NUM
  {
    Label = "Premium Due Month";
    Length = "07";
    SType = "Text";
  }

  INOUT MIR-PREM-DUE-QTY
  {
    Label = "Number of Times";
    Length = "03";
    SType = "Number";
  }

# NWLLR3 CHANGES STARTS HERE
#  IN MIR-DV-EXP-DT
#  {
#    DisplayOnly;
#    Label = "Expiry Date";
#    Length = "10";
#    SType = "Date";
#  }
  
  INOUT MIR-REINST-XPRY-DT
  {
    Label = "Expiry Date";
    Length = "10";
    SType = "Date";
  } 
# NWLLR3 CHANGES ENDS HERE  

  INOUT MIR-REINST-DT
  {
    Label = "Reinstatement Date";
    Length = "10";
    SType = "Date";
  }
  
# C13892 CHANGES STARTS HERE
  INOUT MIR-LAPS-DT
  {
    Label = "Lapse Date";
    Length = "10";
    SType = "Date";
  } 
# C13892 CHANGES ENDS HERE
}
