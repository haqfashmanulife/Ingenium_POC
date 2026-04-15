# Converted from PathFinder 2.2 to 3.0 Jun 18, 2004 3:13:06 PM EDT

#*******************************************************************************
#*  Component:   BF9056-O.s                                                    *
#*  Description:                                                               *
#*                                                                             *
#*******************************************************************************
#*  Chg#    Release  Description                                               *
#*                                                                             *
#*  01NB05  CSS      New for MCL                                               *
#*  HNB403  HIN/AI   LINC UPLOAD CHANGES (Add Hosp & DB Amounts)               *
#*  M119NB  CTS      ADDED FLAG FOR AGGREGATE FACE AMOUNT FOR THE INSURED UNDER*
#*                   15 YEARS OLD EXCEEDING 10 MILLION YEN 		       *
#*******************************************************************************

S-STEP BF9056-O
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

  IN MIR-CLI-ID 
  {
    Key;
    DisplayOnly;
    Length = "10";
    SType = "Text";
    Label = "Client Number";
  }

  IN MIR-POL-ID-T[12] 
  {
    DisplayOnly;
    Length = "10";
    FieldGroup = "Table12";
    Index = "1";
    SType = "Text";
    Label = "Policy Number";
  }

  IN MIR-CLI-ID-T[12] 
  {
    DisplayOnly;
    Length = "10";
    FieldGroup = "Table12";
    Index = "1";
    SType = "Text";
    Label = "Client Number";
  }

  IN MIR-DV-CLI-NM-T[12] 
  {
    DisplayOnly;
    Length = "75";
    FieldGroup = "Table12";
    Index = "1";
    SType = "Text";
    Label = "Client Name";
  }

  IN MIR-LINC-REG-ID-T[12] 
  {
    DisplayOnly;
    Length = "12";
    FieldGroup = "Table12";
    Index = "1";
    SType = "Text";
    Label = "Registration Number";
  }

  IN MIR-LINC-REG-DT-T[12] 
  {
    DisplayOnly;
    Length = "10";
    FieldGroup = "Table12";
    Index = "1";
    SType = "Text";
    Label = "Registration Date";
  }
  
  IN MIR-LINC-TOT-HOSP-AMT-T[12] 
  {
    DisplayOnly;
    Length = "06";
    FieldGroup = "Table12";
    Index = "1";
    SType = "Currency";
    Label = "Total Hospitalization";
  }

  IN MIR-LINC-TOT-DB-AMT-T[12] 
  {
    DisplayOnly;
    Length = "11";
    FieldGroup = "Table12";
    Index = "1";
    SType = "Currency";
    Label = "Total Death Benefit";
  }
 #*M119NB CHANGES STARTS HERE*
  IN MIR-LINC-AGGR-FACE-AMT-IND-T[12]
  {
    DisplayOnly;
    Length = "1";
    FieldGroup = "Table12";
    Index = "1";
    SType = "Indicator";
    Label = "Aggregate Face Amount LINC Indicator for Insured below 15 years";
 }
}
