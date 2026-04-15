#*******************************************************************************
#*  Component:   BF9001-O.s                                                    *
#*  Description:                                                               *
#*                                                                             *
#*******************************************************************************
#*  Chg#    Release  Description                                               *
#*                                                                             *
#*  SESCAP  31OCT04  New for Session Cap Enhancement                           *
#*******************************************************************************

S-STEP BF9001-O
{
  ATTRIBUTES
  {
    BusinessFunctionType = "List";
    DelEmptyRows;
    FocusField = "OKButton";
    FocusFrame = "ButtonFrame";
    Type = "Output";
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

  INOUT MIR-SECUR-CLAS-ID 
  {
    Key;
    Length = "25";
    CodeSource = "XTAB";
    CodeType = "USCL";
    SType = "Selection";
    Label = "Security Class";
  }

  INOUT MIR-DV-SESN-CTL-ONLY-IND 
  {
    Key;
    Label = "Display Session Control Only";
    Length = "1";
    SType = "Indicator";
  }

  IN MIR-DV-SESN-TOT-SESN-CTL 
  {
    DisplayOnly;
    Label = "Total Number of Sessions with Session Control";
    Length = "5";
    SType = "Text";
  }

  IN MIR-DV-SESN-TOT-ALL 
  {
    DisplayOnly;
    Label = "Total Number of Sessions (Approx)";
    Length = "5";
    SType = "Text";
  }

  IN MIR-SECUR-CLAS-ID-T[25] 
  {
    CodeSource = "XTAB";
    CodeType = "USCL";
    DisplayOnly;
    FieldGroup = "Table25";
    Index = "1";
    Label = "Security Class";
    Length = "25";
    SType = "Text";
  }

  IN MIR-SESN-CTL-IND-T[25] 
  {
    DisplayOnly;
    FieldGroup = "Table25";
    Index = "1";
    Label = "Session Control Indicator";
    Length = "1";
    SType = "Indicator";
  }

  IN MIR-MAX-SESN-NUM-T[25] 
  {
    DisplayOnly;
    FieldGroup = "Table25";
    Index = "1";
    Label = "Maximum Sessions";
    Length = "5";
    SType = "Text";
  }

  IN MIR-DV-SESN-TOT-T[25] 
  {
    DisplayOnly;
    FieldGroup = "Table25";
    Index = "1";
    Label = "Number of Active Sessions";
    Length = "5";
    SType = "Text";
  }
}
