# Converted from PathFinder 2.2 to 3.0 Jun 18, 2004 3:13:10 PM EDT

#*******************************************************************************
#*  Component:   BF9422-I.s                                                    *
#*  Description: Input step for Monthly MCL GL Account Balance Update          *
#*                                                                             *
#*******************************************************************************
#*  Chg#    Release  Description                                               *
#*                                                                             *
#*  M00026  12DEC03  New for this release                                      *
#*******************************************************************************
 
S-STEP BF9422-I
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

  INOUT MIR-DV-MCL-GL-NUM-TXT
  {
    Length = "40";
    SType = "Text";
    Label = "GL Account #";
  }

  INOUT MIR-DV-OPER-CAT-CD-TXT
  {
    Length = "40";
    SType = "Text";
    Label = "Operation Category";
  }

  INOUT MIR-DV-DT-FROM-TXT
  {
    Length = "7";
    SType = "Text";
    Label = "From";
  }

  INOUT MIR-DV-DT-TO-TXT
  {
    Length = "7";
    SType = "Text";
    Label = "To";
  }

  INOUT MIR-DV-MCL-GL-NM-TXT
  {
    Length = "40";
    SType = "Text";
    Label = "GL Account Name";
  }

  INOUT MIR-ACCT-YR-T[25]
  {
    Length = "4";
    FieldGroup = "Table25";
    Index = "1";
    SType = "Text";
    Label = "Year";
  }

  INOUT MIR-ACCT-MO-T[25]
  {
    Length = "2";
    FieldGroup = "Table25";
    Index = "1";
    SType = "Text";
    Label = "Month #";
  }

  INOUT MIR-DV-MO-NM-TXT-T[25]
  {
    Length = "10";
    FieldGroup = "Table25";
    Index = "1";
    SType = "Text";
    Label = "Month";
  }

  INOUT MIR-ACCT-BAL-DR-AMT-T[25]
  {
    Length = "17";
    FieldGroup = "Table25";
    Index = "1";
    SType = "Currency";
    Label = "Dr.";
  }

  INOUT MIR-ACCT-BAL-CR-AMT-T[25]
  {
    Length = "17";
    FieldGroup = "Table25";
    Index = "1";
    SType = "Currency";
    Label = "Cr.";
  }
}
