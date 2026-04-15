# Converted from PathFinder 2.2 to 3.0 Jun 18, 2004 3:13:08 PM EDT

#*******************************************************************************
#*  Component:   BF9194-O                                                      *
#*  Description:                                                               *
#*                                                                             *
#*******************************************************************************
#*  Chg#    Release  Description                                               *
#*                                                                             *
#*  1CNB02  DEL      NEW FOR CONVERSION POLICIES                               *
#*  B01104  AT       Conversion status - display description                   *
#*******************************************************************************

S-STEP BF9194-O
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
  
  INOUT index
  {
    SType = "Hidden";
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

  IN MIR-PLAN-ID 
  {
    DisplayOnly;
    Length = "40";
    CodeSource = "EDIT";
    CodeType = "PLAN";
    SType = "Text";
    Label = "Product Name";
  }

  IN MIR-OWN-CLI-NM 
  {
    DisplayOnly;
    Length = "50";
    SType = "Text";
    Label = "Policy Owner";
  }

  IN MIR-POL-ISS-EFF-DT 
  {
    DisplayOnly;
    Length = "10";
    SType = "Date";
    Label = "Policy Issue Effective Date";
  }

  IN MIR-POL-FINAL-DISP-DT 
  {
    DisplayOnly;
    Length = "10";
    SType = "Date";
    Label = "Final Disposition Date";
  }

  IN MIR-POL-STAT-CD 
  {
    DisplayOnly;
    Length = "40";
    CodeSource = "DataModel";
    CodeType = "POL-CSTAT-CD";
    SType = "Text";
    Label = "Current Policy Status";
  }

  IN MIR-POL-CNVR-KEY-NUM 
  {
    DisplayOnly;
    Length = "10";
    SType = "Text";
    Label = "Conversion Number";
  }

  IN MIR-ORIG-POL-ID-T[5] 
  {
    DisplayOnly;
    Length = "10";
    FieldGroup = "Table05";
    SType = "Text";
    Label = "Orig Pol ID";
                Index = "1";
  }

  IN MIR-SEQ-NUM-T[5] 
  {
    DisplayOnly;
    Length = "02";
    FieldGroup = "Table05";
    SType = "Text";
    Label = "Sequence Number";
                Index = "1";
  }

  IN MIR-ORIG-SML-PROD-CD-T[5] 
  {
    DisplayOnly;
    Length = "3";
    FieldGroup = "Table05";
    SType = "Text";
    Label = "Small Product Code";
                Index = "1";
  }

  IN MIR-ORIG-POL-ISS-DT-T[5] 
  {
    DisplayOnly;
    Length = "2";
    FieldGroup = "Table05";
    SType = "Date";
    Label = "Polciy Issue Date";
                Index = "1";
  }

  IN MIR-ORIG-POL-MAT-DT-T[5] 
  {
    DisplayOnly;
    Length = "2";
    FieldGroup = "Table05";
    SType = "Date";
    Label = "Policy Maturity Date";
                Index = "1";
  }

  IN MIR-DV-OWN-CLI-KANA-NM-T[5] 
  {
    DisplayOnly;
    Length = "75";
    FieldGroup = "Table05";
    SType = "Text";
    Label = "Insured Name";
    Index = "1";
  }
         IN MIR-CSTAT-CD-T[5] 
  {
    Length = "20";
    CodeSource = "DataModel";
    CodeType = "CSTAT-CD";
    DBTableName = "TPOLX";
    DisplayOnly;
    FieldGroup = "Table05";
    SType = "Text";
    Label = "Complete Status";
    Index = "1";
  }

}
