# Converted from PathFinder 2.2 to 3.0 Jun 18, 2004 3:13:06 PM EDT


#*******************************************************************************
#*  Component:   BF9043-I.s                                                    *
#*  Description: Pending Policy Payment Update                                 *
#*                                                                             *
#*******************************************************************************
#*  Chg#    Release  Description                                               *
#*                                                                             *
#*  P00064  09Oct02  Initial build - see spec. NB33                            *
#*  P00929   ROC      REVISE RECPT NBR FROM 10 TO 8 BIT                        *
#*                                                                             *
#*******************************************************************************

S-STEP BF9043-I
{
  ATTRIBUTES
  {
    BusinessFunctionType = "Update";
    Type = "Input";
    FocusField = "MIR-RECPT-DT";
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

  IN MIR-DV-OWN-CLI-NM
  {
    DisplayOnly;
    Length = "75";
    SType = "Text";
    Label = "Owner Name";
  }

  IN MIR-POL-ID-BASE
  {
    Key;
    Length = "9";
    DefaultSession = "MIR-POL-ID-BASE";
    SType = "Text";
    Label = "Policy Id";
  }

  IN MIR-POL-ID-SFX
  {
    Key;
    Length = "1";
    DefaultSession = "MIR-POL-ID-SFX";
    SType = "Text";
    Label = "Suffix";
  }

  IN MIR-POL-APP-FORM-ID
  {
    Key;
    Length = "15";
    SType = "Text";
    Label = "Application Form ID";
  }

  IN MIR-OLD-RECPT-NBR
  {
    Mandatory;
#*P00929    Length = "10";
    Length = "8";
    SType = "Number";
    Label = "Existing Receipt Number";
  }

  IN MIR-OLD-RECPT-DT
  {
    Mandatory;
    Length = "10";
    SType = "Date";
    Label = "Existing Receipt Date";
  }

  INOUT MIR-RECPT-NBR
  {
    Mandatory;
#*P00929    Length = "10";
    Length = "8";
    SType = "Number";
    Label = "Receipt Number";
  }

  INOUT MIR-RECPT-DT
  {
    Mandatory;
    Length = "10";
    SType = "Date";
    Label = "Receipt Date";
  }

  INOUT MIR-DV-PRCES-STATE-CD
  {
    Length = "1";
    SType = "Hidden";
    Label = "Process State";
  }
}
