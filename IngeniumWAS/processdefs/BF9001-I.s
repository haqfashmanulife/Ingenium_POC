#*******************************************************************************
#*  Component:   BF9001-I.s                                                    *
#*  Description:                                                               *
#*                                                                             *
#*******************************************************************************
#*  Chg#    Release  Description                                               *
#*                                                                             *
#*  SESCAP  31OCT04  New for Session Cap Enhancement                           *
#*                                                                             *
#*******************************************************************************

S-STEP BF9001-I
{
  ATTRIBUTES
  {
    BusinessFunctionType = "List";
    FocusField = "MIR-SECUR-CLAS-ID";
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

  INOUT MIR-SECUR-CLAS-ID
  {
    CodeSource = "XTAB";
    CodeType = "USCL";
    Key;
    Label = "Security Class";
    Length = "25";
    SType = "Selection";
  }

  INOUT MIR-DV-SESN-CTL-ONLY-IND
  {
    Key;
    Label = "Display Session Control Only";
    Length = "1";
    DefaultConstant = "N";
    SType = "Indicator";
  }
}
