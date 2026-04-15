# Converted from PathFinder 2.2 to 3.0 Jun 18, 2004 3:14:00 PM EDT

#*******************************************************************************
#*  Component:   BF9A44-O.s                                                    *
#*  Description: Death Plan Benefit List Screen                                *
#*                                                                             *
#*******************************************************************************
#*  Chg#    Release  Description                                               *
#*  IPCAMC  CTS      Intial Version                                            *
#*                                                                             *
#*******************************************************************************

S-STEP BF9A44-O
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

  IN MIR-PLAN-ID
  {
    CodeSource = "EDIT";
    CodeType = "PLAN";
    DisplayOnly;
    Key;
    Label = "Plan ID";
    Length = "6";
    SType = "Selection";
  }

  IN MIR-CAUSE-CAT-CD
  {
    CodeSource = "EDIT";
    CodeType = "DTCAT";
    DisplayOnly;
    Key;
    Label = "Cause Category Code";
    Length = "5";
    SType = "Selection";
  }

  IN MIR-PLAN-ID-T[50]
  {
    DisplayOnly;
    Length = "6";
    FieldGroup = "Table1";
    CodeSource = "EDIT";
    CodeType = "PLAN";
    SType = "Text";
    Label = "Plan ID";
    Index = "1";
  }

  IN MIR-CAUSE-CAT-CD-T[50]
  {
    CodeSource = "EDIT";
    CodeType = "DTCAT";
    DisplayOnly;
    FieldGroup = "Table1";
    Index = "1";
    Label = "Cause Category Code";
    Length = "5";
    SType = "Text";
  }

  IN MIR-BNFT-NM-ID-T[50]
  {
    DisplayOnly;
    Length = "5";
    FieldGroup = "Table1";
    CodeSource = "EDIT";
    CodeType = "BNNM";
    SType = "Text";
    Label = "Benefit Name";
    Index = "1";
  }

  IN MIR-PAYBL-AMT-CALC-CD-T[50]
  {
    DisplayOnly;
    Length = "1";
    FieldGroup = "Table1";
    SType = "Text";
    Label = "Payable amount calculation code";
    Index = "1";
  }
}
