# Converted from PathFinder 2.2 to 3.0 Jun 18, 2004 3:13:06 PM EDT

#*******************************************************************************
#*  Component:   BF9050-O.s                                                    *
#*  Description:                                                               *
#*                                                                             *
#*******************************************************************************
#*  Chg#    Release  Description                                               *
#*                                                                             *
#*  01NB05  CSS      New for MCL                                               *
#*  HNB403  HIN/AI   LINC UPLOAD CHANGES (Add Hosp & DB Amounts)               *
#*  M119NB  CTS      ADDED FLAG FOR AGGREGATE FACE AMOUNT FOR THE INSURED UNDER*
#*                   15 YEARS OLD EXCEEDING 10 MILLION YEN 		       *
#*  27676A  CTS      CHANGES DONE FOR LINC ITEMS AND TIMES                     *
#*******************************************************************************

S-STEP BF9050-O
{
  ATTRIBUTES
  {
    BusinessFunctionType = "Retrieve";
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

  IN MIR-LINC-REG-ID 
  {
    DisplayOnly;
    Length = "12";
    SType = "Text";
    Label = "Registration Number";
  }

  IN MIR-LINC-REG-DT 
  {
    DisplayOnly;
    Length = "10";
    SType = "Text";
    Label = "Registration Date";
  }

  IN MIR-LINC-TOT-HOSP-AMT
  {
    DisplayOnly;
    Length = "07";
    SType = "Currency";
    Label = "Total Hospitalization";
  }
  
  IN MIR-LINC-TOT-DB-AMT
  {
    DisplayOnly;
    Length = "11";
    SType = "Currency";
    Label = "Total Death Benefit";
  }

  IN MIR-DV-CLI-NM 
  {
    DisplayOnly;
    Length = "75";
    SType = "Text";
    Label = "Client Name";
  }
#27676A CHANGES START HERE
  IN MIR-TOT-HOSP-BNFT-AMT 
  {
    DisplayOnly;
    Length = "17";
    SType = "Currency";
    Label = "Total Hospitalization LumpSum Benefit";
  }
  IN MIR-TOT-MEDIC-BNFT-QTY
  {
    DisplayOnly;
    Length = "02";
    SType = "Currency";
    Label = "Total Advanced Medical Benefit Count";
  }
  IN MIR-TOT-CNCR-BNFT-AMT
  {
    DisplayOnly;
    Length = "17";
    SType = "Currency";
    Label = "Total Cancer LumpSum benefit";
  }
  IN MIR-TOT-IP-BNFT-AMT 
  {
    DisplayOnly;
    Length = "17";
    SType = "Currency";
    Label = "Total Living Income Protection Monthly Benefit";
  }
  IN MIR-TOT-AD-BNFT-AMT 
  {
    DisplayOnly;
    Length = "17";
    SType = "Currency";
    Label = "Total Accidental Death Face Amount";
  }
#27676A CHANGES ENDS HERE
#M119NB CHANGES STARTS HERE
  IN MIR-LINC-AGGR-FACE-AMT-IND
  {
    DisplayOnly;
    Length = "1";
    SType = "Indicator";
    Label = "Aggregate Face Amount LINC Indicator for Insured below 15 years";
 }
}
