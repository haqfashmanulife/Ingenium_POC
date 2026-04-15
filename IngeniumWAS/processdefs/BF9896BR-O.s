# Converted from PathFinder 2.2 to 3.0 Jun 18, 2004 3:13:13 PM EDT

#*******************************************************************************
#*  Component:   BF9896BR-O.s                                                  *
#*  Description: Insured Claim Retrieve - Output (Branch Office)               *
#*                                                                             *
#*******************************************************************************
#*  Chg#    Release  Description                                               *
#*                                                                             *
#* HAC002  HIN/CL   HEAD AND BRANCH OFFICE CLAIM INQ (HAC002C)                 *
#* EN0225  RAJU     FIELD ADDED FOR USAGE BY JAVA SCRIPT TO STOP REPEATED DATA *
#* EN0212  RAJU     ADD A NEW FIELD ASSOCIATED MASTER CLAIM ID                 *
#* S23321   CTS   FIX TO POPULATE CANCR DIAGNOSED DATE-INSURED CLAIM INQ SCREEN*
#*                                                                             *
#*******************************************************************************

S-STEP BF9896BR-O
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
    Label = "Insured Client ID";
  }

  IN MIR-POL-ID 
  {
    Key;
    DisplayOnly;
    Length = "10";
    SType = "Text";
    Label = "Policy ID";
  }

  IN MIR-CLI-NM 
  {
    DisplayOnly;
    Length = "60";
    SType = "Text";
    Label = "Insured Name";
  }

  IN MIR-CLI-BTH-DT 
  {
    DisplayOnly;
    Length = "10";
    SType = "Text";
    Label = "Birth Date";
  }

  IN MIR-CLI-SEX-CD 
  {
    DisplayOnly;
    Length = "40";
    CodeSource = "DataModel";
    CodeType = "CLI-SEX-CD";
    SType = "Text";
    Label = "Sex";
  }

  IN MIR-POL-CSTAT-CD 
  {
    DisplayOnly;
    Length = "40";
    CodeSource = "DataModel";
    CodeType = "POL-CSTAT-CD";
    SType = "Text";
    Label = "Policy Status";
  }

  IN MIR-T1-CVG-NUM-T[15] 
  {
    DisplayOnly;
    Length = "2";
    FieldGroup = "Table1";
    Index = "1";
    SType = "Text";
    Label = "Coverage Number";
  }

  IN MIR-T1-BNFT-NM-ID-T[15] 
  {
    DisplayOnly;
    Length = "40";
    FieldGroup = "Table1";
    Index = "1";
    CodeSource = "EDIT";
    CodeType = "BENNM";
    SType = "Text";
    Label = "Benefit Name";
  }

  IN MIR-MAX-RIDER-UNITS-T[15] 
  {
    DisplayOnly;
    Length = "5";
    FieldGroup = "Table1";
    Index = "1";
    SType = "Number";
    Label = "Max Rider Units";
  }

  IN MIR-MAX-CLM-UNITS-T[15] 
  {
    DisplayOnly;
    Length = "5";
    FieldGroup = "Table1";
    Index = "1";
    SType = "Number";
    Label = "Max Claim Units";
  }

  IN MIR-T1-MULT-AMT-T[15] 
  {
    DisplayOnly;
    Length = "5";
    FieldGroup = "Table1";
    Index = "1";
    SType = "Number";
    Label = "Multiplier";
  }

  IN MIR-CLM-ID-T[30] 
  {
    DisplayOnly;
    Length = "8";
    FieldGroup = "Table2";
    Index = "1";
    SType = "Text";
    Label = "Master Claim ID";
  }

#*----- EN000212 Changes begin here
  IN MIR-ASSOC-CLM-ID-T[30] 
  {
    DisplayOnly;
    Length = "8";
    FieldGroup = "Table2";
    Index = "1";
    SType = "Text";
    Label = "Associated Master Claim ID";
  }

#*----- EN000212 Changes end here
  IN MIR-T2-CVG-NUM-T[30] 
  {
    DisplayOnly;
    Length = "2";
    FieldGroup = "Table2";
    Index = "1";
    SType = "Text";
    Label = "Coverage Number";
  }

  IN MIR-T2-BNFT-NM-ID-T[30] 
  {
    DisplayOnly;
    Length = "40";
    FieldGroup = "Table2";
    Index = "1";
    CodeSource = "EDIT";
    CodeType = "BENNM";
    SType = "Text";
    Label = "Benefit Name";
  }

  IN MIR-FBNK-REMIT-DT-T[30] 
  {
    DisplayOnly;
    Length = "40";
    FieldGroup = "Table2";
    Index = "1";
    SType = "Date";
    Label = "Deposit Date";
  }

  IN MIR-CLMA-INCID-DT-T[30] 
  {
    DisplayOnly;
    Length = "40";
    FieldGroup = "Table2";
    Index = "1";
    SType = "Date";
    Label = "Incident Date";
  }

  IN MIR-EVNT-STRT-DT-T[30] 
  {
    DisplayOnly;
    Length = "40";
    FieldGroup = "Table2";
    Index = "1";
    SType = "Date";
    Label = "Start Date";
  }

  IN MIR-EVNT-END-DT-T[30] 
  {
    DisplayOnly;
    Length = "40";
    FieldGroup = "Table2";
    Index = "1";
    SType = "Date";
    Label = "End Date";
  }

  IN MIR-PAID-CLM-END-DT-T[30] 
  {
    DisplayOnly;
    Length = "40";
    FieldGroup = "Table2";
    Index = "1";
    SType = "Date";
    Label = "Paid Claim End Date";
  }
  
  IN MIR-T2-MULT-AMT-T[30] 
  {
    DisplayOnly;
    Length = "5";
    FieldGroup = "Table2";
    Index = "1";
    SType = "Number";
    Label = "Multiplier";
  }

  IN MIR-PAY-AMT-T[30] 
  {
    DisplayOnly;
    Length = "15";
    FieldGroup = "Table2";
    Index = "1";
    SType = "Number";
    Label = "Payable/Paid Amount";
  }
  
# S23321 CHANGES START
  IN MIR-CLMA-CANCR-DIAG-DT-T[30] 
  {
    DisplayOnly;
    Length = "40";
    FieldGroup = "Table2";
    Index = "1";
    SType = "Date";
    Label = "Cancer Diagnosed Date";
  }
# S23321 CHANGES END 

#*----- EN000225 Changes begin here
  IN MIR-DV-JS-LOAD-CD-T[30]
  {
    DisplayOnly;
    Length = "1";
    FieldGroup = "Table2";
    SType = "Text";
    Label = "Java Script Load Code";
    Index = "1";
  }
#*----- EN000225 Changes end here
}
