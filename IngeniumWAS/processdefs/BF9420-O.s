# Converted from PathFinder 2.2 to 3.0 Jun 18, 2004 3:13:10 PM EDT

#*******************************************************************************
#*  Component:   BF9420-O.s                                                    *
#*  Description: Output step for Monthly MCL GL Account Balance Inquiry        *
#*                                                                             *
#*******************************************************************************
#*  Chg#    Release  Description                                               *
#*                                                                             *
#*  M00026  12DEC03  New for this release                                      *
#*******************************************************************************
 
S-STEP BF9420-O
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

  IN MIR-FROM-ACCT-YR 
  {
    Key;
    DisplayOnly;
    Length = "4";
    SType = "Year";
    Label = "From Year";
  }

  IN MIR-FROM-ACCT-MO 
  {
    Key;
    DisplayOnly;
    Length = "2";
    SType = "Month";
    Label = "From Month";
  }

  IN MIR-TO-ACCT-YR 
  {
    Key;
    DisplayOnly;
    Length = "4";
    SType = "Year";
    Label = "To Year";
  }

  IN MIR-TO-ACCT-MO 
  {
    Key;
    DisplayOnly;
    Length = "2";
    SType = "Month";
    Label = "To Month";
  }

  IN MIR-DV-MCL-GL-NUM-TXT 
  {
    DisplayOnly;
    Length = "40";
    SType = "Text";
    Label = "GL Account #";
  }

  IN MIR-DV-OPER-CAT-CD-TXT 
  {
    DisplayOnly;
    Length = "40";
    SType = "Text";
    Label = "Operation Category";
  }

  IN MIR-DV-DT-FROM-TXT 
  {
    DisplayOnly;
    Length = "7";
    SType = "Text";
    Label = "From";
  }

  IN MIR-DV-DT-TO-TXT 
  {
    DisplayOnly;
    Length = "7";
    SType = "Text";
    Label = "To";
  }

  IN MIR-DV-MCL-GL-NM-TXT 
  {
    DisplayOnly;
    Length = "40";
    SType = "Text";
    Label = "GL Account Name";
  }

  IN MIR-ACCT-YR-T[25] 
  {
    DisplayOnly;
    Length = "4";
    FieldGroup = "Table25";
    Index = "1";
    SType = "Text";
    Label = "Year";
  }

  IN MIR-ACCT-MO-T[25] 
  {
    DisplayOnly;
    Length = "2";
    FieldGroup = "Table25";
    Index = "1";
    SType = "Text";
    Label = "Month #";
  }

  IN MIR-DV-MO-NM-TXT-T[25] 
  {
    DisplayOnly;
    Length = "10";
    FieldGroup = "Table25";
    Index = "1";
    SType = "Text";
    Label = "Month";
  }

  IN MIR-ACCT-BAL-DR-AMT-T[25] 
  {
    DisplayOnly;
    Length = "17";
    FieldGroup = "Table25";
    Index = "1";
    SType = "Currency";
    Label = "Dr.";
  }

  IN MIR-ACCT-BAL-CR-AMT-T[25] 
  {
    DisplayOnly;
    Length = "17";
    FieldGroup = "Table25";
    Index = "1";
    SType = "Currency";
    Label = "Cr.";
  }
}
