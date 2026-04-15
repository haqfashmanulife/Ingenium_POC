# Converted from PathFinder 2.2 to 3.0 Jun 18, 2004 3:13:06 PM EDT

#*******************************************************************************
#*  Component:   BF9052-I.s                                                    *
#*  Description:                                                               *
#*                                                                             *
#*******************************************************************************
#*  Chg#    Release  Description                                               *
#*                                                                             *
#*  01NB05  CSS      New for MCL                                               *
#*  HNB403  HIN/AI   LINC UPLOAD CHANGES (Add Hosp & DB Amounts)               *
#*  M119NB  CTS      ADD FIELDS FOR LINC DATA                                  *
#*  27676A  CTS      CHANGES DONE FOR LINC ITEMS AND TIMES                     *
#*******************************************************************************

S-STEP BF9052-I
{
  ATTRIBUTES
  {
    BusinessFunctionType = "Update";
    Type = "Input";
    FocusField = "MIR-LINC-REG-ID";
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

  INOUT MIR-LINC-REG-ID
  {
    Mandatory;
    Length = "12";
    SType = "Text";
    Label = "Registration Number";
  }

  INOUT MIR-LINC-REG-DT
  {
    Mandatory;
    Length = "10";
    SType = "Text";
    Label = "Registration Date";
  }
  
  INOUT MIR-LINC-TOT-HOSP-AMT
  {
    Length = "07";
    SType = "Currency";
    Label = "Total Hospitalization";
  }
  
  INOUT MIR-LINC-TOT-DB-AMT
  {
    Length = "11";
    SType = "Currency";
    Label = "Total Death Benefit";
  }
#27676A CHANGES START HERE
 INOUT MIR-TOT-HOSP-BNFT-AMT
 {
  Length = "17";
  SType = "Currency";
  Label = "Total Hospitalization LumpSum Benefit";
 }
 INOUT MIR-TOT-MEDIC-BNFT-QTY 
 {
  Length = "02";
  SType = "TEXT";
  Label = "Total Advanced Medical Benefit Count";
 }
 INOUT MIR-TOT-CNCR-BNFT-AMT 
 {
  Length = "17";
  SType = "Currency";
  Label = "Total Cancer LumpSum benefit";
 }
 INOUT MIR-TOT-IP-BNFT-AMT 
 {
  Length = "17";
  SType = "Currency";
  Label = "Total Living Income Protection Monthly Benefit";
 }
 INOUT MIR-TOT-AD-BNFT-AMT 
 {
  Length = "17";
  SType = "Currency";
  Label = "Total Accidental Death Face Amount";
 }
#27676A CHANGES ENDS  HERE
#M119NB CHANGES STARTS HERE
   INOUT MIR-LINC-AGGR-FACE-AMT-IND
   {
    Length = "1";
    SType = "Indicator";
    Label = "Aggregate Face Amount LINC Indicator for Insured below 15 years";
   }
#M119NB CHANGES ENDS HERE

  IN MIR-CLI-ID 
  {
    Key;
    DisplayOnly;
    Length = "10";
    SType = "Text";
    Label = "Client Number";
  }

  IN MIR-POL-ID-BASE 
  {
    Key;
    DisplayOnly;
    Length = "10";
    SType = "Text";
    Label = "Policy ID";
  }

  IN MIR-POL-ID-SFX 
  {
    Key;
    DisplayOnly;
    Length = "1";
    SType = "Text";
    Label = "Suffix";
  }
}
