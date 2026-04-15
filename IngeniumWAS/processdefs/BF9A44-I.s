# Converted from PathFinder 2.2 to 3.0 Jun 18, 2004 3:14:00 PM EDT

#*******************************************************************************
#*  Component:   BF9A44-I.s                                                    *
#*  Description: Death Plan Benefit List Screen                                *
#*                                                                             *
#*******************************************************************************
#*  Chg#    Release  Description                                               *
#*  IPCAMC  CTS      Intial Version                                            *
#*                                                                             *
#*******************************************************************************

S-STEP BF9A44-I
{
  ATTRIBUTES
  {
    BusinessFunctionType = "List";
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

  INOUT MIR-PLAN-ID
  {
    Key;
    Mandatory;
    Length = "6";
    CodeSource = "EDIT";
    CodeType = "PLAN";
    SType = "Selection";
    Label = "Plan ID";
  }

  INOUT MIR-CAUSE-CAT-CD
  {
    Key;
    Mandatory;
    Length = "5";
    CodeSource = "EDIT";
    CodeType = "DTCAT";
    SType = "Selection";
    Label = "Cause Category Code";
  }
}
