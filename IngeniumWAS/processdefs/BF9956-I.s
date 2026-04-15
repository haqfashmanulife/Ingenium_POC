# Converted from PathFinder 2.2 to 3.0 Jun 18, 2004 3:13:54 PM EDT

#*******************************************************************************
#*  Component:   BF9956-I.s                                                    *
#*  Description:                                                               *
#*                                                                             *
#*******************************************************************************
#*  Chg#    Release  Description                                               *
#*                                                                             *
#*  PIRAEX  CTS      PIRA INGENIUM DATA EXTRACT                                *
#*******************************************************************************
S-STEP BF9956-I
{
  ATTRIBUTES
  {
    BusinessFunctionType = "Retrieve";
    FocusField = "MIR-POL-ID-BASE";
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

  INOUT MIR-POL-ID-BASE
  {
    DefaultSession = "MIR-POL-ID-BASE";
    Key;
    Label = "Policy ID";
    Length = "9";
    Mandatory;
    SType = "Text";
  }

  INOUT MIR-POL-ID-SFX
  {
    DefaultSession = "MIR-POL-ID-SFX";
    Key;
    Label = "Suffix";
    Length = "1";
    SType = "Text";
  }

  INOUT MIR-SERV-AGT-ID
  {
    Label = "Servicing Agent ID";
    Length = "6";
    Mandatory;
    SType = "Text";
  }
}
