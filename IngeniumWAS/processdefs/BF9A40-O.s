# Converted from PathFinder 2.2 to 3.0 Jun 18, 2004 3:14:00 PM EDT

#*******************************************************************************
#*  Component:   BF9A40-O.s                                                    *
#*  Description: Death Plan Benefit Inquiry Screen                             *
#*                                                                             *
#*******************************************************************************
#*  Chg#    Release  Description                                               *
#*  IPCAMC  CTS      Intial Version                                            *
#*                                                                             *
#*******************************************************************************

S-STEP BF9A40-O
{
  ATTRIBUTES
  {
    BusinessFunctionType = "Retrieve";
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

  IN MIR-PLAN-ID
  {
    Key;
    DisplayOnly;
    Length = "6";
    CodeSource = "EDIT";
    CodeType = "PLAN";
    SType = "Text";
    Label = "Plan Name";
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

  IN MIR-BNFT-NM-ID
  {
    DisplayOnly;
    Length = "5";
    CodeSource = "EDIT";
    CodeType = "BNNM";
    SType = "Text";
    Label = "Benefit Name";
  }

  IN MIR-PAYBL-AMT-CALC-CD
  {
    DisplayOnly;
    Length = "1";
    SType = "Text";
    Label = "Payable amount calculation code";
  }
}
