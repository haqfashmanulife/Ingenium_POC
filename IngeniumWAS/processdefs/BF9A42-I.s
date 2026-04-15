# Converted from PathFinder 2.2 to 3.0 Jun 18, 2004 3:14:00 PM EDT

#*******************************************************************************
#*  Component:   BF9A42-I.s                                                    *
#*  Description: Death Plan Benefit Update Screen                              *
#*                                                                             *
#*******************************************************************************
#*  Chg#    Release  Description                                               *
#*  IPCAMC  CTS      Intial Version                                            *
#*                                                                             *
#*******************************************************************************

S-STEP BF9A42-I
{
  ATTRIBUTES
  {
    BusinessFunctionType = "Update";
    FocusField = "MIR-PLAN-ID";
    FocusFrame = "ContentFrame";
    Type = "Input";
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

  IN MIR-PLAN-ID
  {
    Key;
    DisplayOnly;
    Length = "6";
    CodeSource = "EDIT";
    CodeType = "PLAN";
    SType = "Text";
    Label = "Plan ID";
  }

  IN MIR-CAUSE-CAT-CD
  {
    Key;
    DisplayOnly;
    Length = "4";
    CodeSource = "EDIT";
    CodeType = "DTCAT";
    SType = "Text";
    Label = "Cause Category Code";
  }

  INOUT MIR-BNFT-NM-ID
  {
    Length = "5";
    CodeSource = "EDIT";
    CodeType = "BNNM";
    SType = "Selection";
    Label = "Benefit Name";
  }

  INOUT MIR-PAYBL-AMT-CALC-CD
  {
    Length = "1";
    Label = "Payable amount calculation code";
    SType = "Text";
  }
}
