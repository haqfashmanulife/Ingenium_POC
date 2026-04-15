# Converted from PathFinder 2.2 to 3.0 Jun 18, 2004 3:13:08 PM EDT

S-STEP BF9214-I
{
  ATTRIBUTES
  {
    BusinessFunctionType = "List";
    Type = "Input";
    FocusField = "MIR-BUS-CAL-DT-YR";
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
}
