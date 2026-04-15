# Converted from PathFinder 2.2 to 3.0 Jun 18, 2004 3:13:10 PM EDT

#*******************************************************************************
#*  Component:   BF9410-O.s                                                    *
#*  Description: Output step for Daily MCL GL Account Balance Inquiry          *
#*                                                                             *
#*******************************************************************************
#*  Chg#    Release  Description                                               *
#*                                                                             *
#*  M00026  12DEC03  New for this release                                      *
#*******************************************************************************
 
S-STEP BF9410-O
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

  IN MIR-MCL-ACCT-BASE-ID 
  {
    Key;
    DisplayOnly;
    Length = "8";
    CodeSource = "EDIT";
    CodeType = "MCLGL";
    SType = "Text";
    Label = "GL Account #";
  }

  IN MIR-OPER-CAT-CD 
  {
    Key;
    DisplayOnly;
    Length = "6";
    CodeSource = "EDIT";
    CodeType = "AFOC";
    SType = "Text";
    Label = "Operation Category";
  }

  IN MIR-ACCT-YR 
  {
    Key;
    DisplayOnly;
    Length = "4";
    SType = "Year";
    Label = "Year";
  }

  IN MIR-ACCT-MO 
  {
    Key;
    DisplayOnly;
    Length = "2";
    SType = "Month";
    Label = "Month";
  }

  IN MIR-DV-OPER-CAT-CD-TXT 
  {
    DisplayOnly;
    Length = "40";
    SType = "Text";
    Label = "Operation Category";
  }

  IN MIR-DV-MCL-GL-NUM-TXT 
  {
    DisplayOnly;
    Length = "40";
    SType = "Text";
    Label = "GL Account #";
  }

  IN MIR-DV-MCL-GL-NM-TXT 
  {
    DisplayOnly;
    Length = "40";
    SType = "Text";
    Label = "GL Account Name";
  }

  IN MIR-DV-DT-MTH-TXT 
  {
    DisplayOnly;
    Length = "10";
    SType = "Text";
    Label = "Month";
  }

  IN MIR-ACCT-DY-T[32] 
  {
    DisplayOnly;
    Length = "2";
    FieldGroup = "Table32";
    Index = "1";
    SType = "Text";
    Label = "Day #";
  }

  IN MIR-DV-DY-NUM-T[32] 
  {
    DisplayOnly;
    Length = "5";
    FieldGroup = "Table32";
    Index = "1";
    SType = "Text";
    Label = "Day";
  }

  IN MIR-ACCT-BAL-DR-AMT-T[32] 
  {
    DisplayOnly;
    Length = "17";
    FieldGroup = "Table32";
    Index = "1";
    SType = "Currency";
    Label = "Dr.";
  }

  IN MIR-ACCT-BAL-CR-AMT-T[32] 
  {
    DisplayOnly;
    Length = "17";
    FieldGroup = "Table32";
    Index = "1";
    SType = "Currency";
    Label = "Cr.";
  }
}
