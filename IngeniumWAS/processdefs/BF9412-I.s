# Converted from PathFinder 2.2 to 3.0 Jun 18, 2004 3:13:10 PM EDT

#*******************************************************************************
#*  Component:   BF9412-I.s                                                    *
#*  Description: Input step for Daily MCL GL Account Balance Update            *
#*                                                                             *
#*******************************************************************************
#*  Chg#    Release  Description                                               *
#*                                                                             *
#*  M00026  12DEC03  New for this release                                      *
#*******************************************************************************
 
S-STEP BF9412-I
{
  ATTRIBUTES
  {
    BusinessFunctionType = "Update";
    Type = "Input";
    FocusField = "MIR-MCL-ACCT-BASE-ID";
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

  IN MIR-MCL-ACCT-BASE-ID 
  {
    Key;
    DisplayOnly;
    Length = "8";
    SType = "Text";
    Label = "GL Account #";
  }

  IN MIR-OPER-CAT-CD 
  {
    Key;
    DisplayOnly;
    Length = "6";
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

  INOUT MIR-DV-OPER-CAT-CD-TXT
  {
    Length = "40";
    SType = "Text";
    Label = "Operation Category";
  }

  INOUT MIR-DV-MCL-GL-NUM-TXT
  {
    Length = "40";
    SType = "Text";
    Label = "GL Account #";
  }

  INOUT MIR-DV-MCL-GL-NM-TXT
  {
    Length = "40";
    SType = "Text";
    Label = "GL Account Name";
  }

  INOUT MIR-DV-DT-MTH-TXT
  {
    Length = "10";
    SType = "Text";
    Label = "Month";
  }

  INOUT MIR-ACCT-DY-T[32]
  {
    Length = "2";
    FieldGroup = "Table32";
    Index = "1";
    SType = "Text";
    Label = "Day #";
  }

  INOUT MIR-DV-DY-NUM-T[32]
  {
    Length = "5";
    FieldGroup = "Table32";
    Index = "1";
    SType = "Text";
    Label = "Day";
  }

  INOUT MIR-ACCT-BAL-DR-AMT-T[32]
  {
    Length = "17";
    FieldGroup = "Table32";
    Index = "1";
    SType = "Currency";
    Label = "Dr.";
  }

  INOUT MIR-ACCT-BAL-CR-AMT-T[32]
  {
    Length = "17";
    FieldGroup = "Table32";
    Index = "1";
    SType = "Currency";
    Label = "Cr.";
  }
}
