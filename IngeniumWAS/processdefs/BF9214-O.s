# Converted from PathFinder 2.2 to 3.0 Jun 18, 2004 3:13:08 PM EDT
#*******************************************************************************
#*  Component:   BF9214-O.s                                                    *
#*  Description:                                                               *
#*                                                                             *
#*******************************************************************************
#*  Chg#    Release  Description                                               *
#*                                                                             *
#*  PF13    PF 1.3   correct index attribute to INOUT                          *
#*******************************************************************************

S-STEP BF9214-O
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
  
 #PF13 - change for PF13 
 #OUT index
  INOUT index
  {
    SType = "Hidden";
  }

  INOUT MIR-BUS-CAL-DT-YR 
  {
    Key;
    Length = "4";
    SType = "Text";
    Label = "Year";
  }

  INOUT MIR-BUS-CAL-DT-MO 
  {
    Key;
    Length = "2";
    SType = "Text";
    Label = "Month";
  }

 IN MIR-BUS-CAL-DT-MTH-TXT
  {
    Key;
    DisplayOnly;
    Length = "10";
    DBTableName = "Derived";
    SType = "Text";
    Label = "Name";
  }
  
  IN MIR-BUS-CAL-DT-YR-T[20] 
  {
    DisplayOnly;
    Length = "4";
    FieldGroup = "Table20";
    KeyColumn;
    Index = "1";
    Link;
    SType = "Text";
    Label = "Year";
    Action = "SelectItem";
  }

  IN MIR-BUS-CAL-DT-MO-T[20] 
  {
    DisplayOnly;
    Length = "2";
    FieldGroup = "Table20";
    KeyColumn;
    Index = "1";
    Link;
    SType = "Text";
    Label = "Month";
    Action = "SelectItem";
  }

  IN MIR-BUS-CAL-DT-MTH-TXT-T[20] 
  {
    DisplayOnly;
    Length = "10";
    FieldGroup = "Table20";
    KeyColumn;
    Index = "1";
    Link;
    SType = "Text";
    Label = "Month";
    Action = "SelectItem";
  }
}
