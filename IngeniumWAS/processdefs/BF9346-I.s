# Converted from PathFinder 2.2 to 3.0 Jun 18, 2004 3:13:10 PM EDT

#*******************************************************************************
#*  Component:   BF9346-I.s                                                    *
#*  Description:                                                               *
#*                                                                             *
#*******************************************************************************
#*  Chg#    Release  Description                                               *
#*                                                                             *
#*  01BL20  01AUG01  New for this release                                      *
#*  01BL20  01AUG01  Client field is mandatory                                 *
#*  01BL20  01AUG01  Add Seq Num to key lookup                                 *
#*                                                                             *
#*******************************************************************************
 
S-STEP BF9346-I
{
  ATTRIBUTES
  {
    BusinessFunctionType = "list";
    Type = "Input";
    FocusField = "MIR-CLI-ID";
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

  INOUT MIR-CLI-ID
  {
    Key;
    Mandatory;
    Length = "10";
    DefaultSession = "MIR-CLI-ID";
    SType = "Text";
    Label = "Client id";
  }

  INOUT MIR-APPL-CTL-PRCES-DT
  {
    Key;
    Length = "10";
    SType = "Date";
    Label = "Date";
  }

  INOUT MIR-SEQ-NUM
  {
    Length = "03";
    SType = "Text";
    Label = "Seq. Number";
  }
 
  INOUT MIR-POL-ID-BASE
  {
    Key;
    Length = "9";
    DefaultSession = "MIR-POL-ID-BASE";
    SType = "Text";
    Label = "Policy Id";
  }

  INOUT MIR-POL-ID-SFX
  {
    Key;
    Length = "1";
    DefaultSession = "MIR-POL-ID-SFX";
    SType = "Text";
    Label = "Suffix";
  }
}
