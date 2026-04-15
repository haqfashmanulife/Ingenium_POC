#*******************************************************************************
#*  Component:   BF9A24-I.s                                                    *
#*  Description: For Updating a Underwrite's Final Decision                    *
#*                                                                             *
#*******************************************************************************
#*  Chg#    Release  Description                                               *
#*                                                                             *
#*  WF2004  CTS      INITIAL VERSION                                           *
#*  AHS150  CTS      CHANGES FOR USER-ID FIELD                                 *
#*  BU3679  CTS      FIX FOR PF/CS ERROR LOGS                                  *
#*******************************************************************************
S-STEP BF9A24-I
{
  ATTRIBUTES
  {
    BusinessFunctionType = "List";
    FocusField = "MIR-USER-ID";
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

  INOUT MIR-USER-ID
  {
    DefaultSession = "MIR-USER-ID";
    Key;
    Label = "User ID";
    Length = "10";
    SType = "Text";
  }

  INOUT MIR-POL-ID
  {
    # Changes for AHS150
    # Fix for BU3679 start
    # DefaultSession = "MIR-POL-ID";
    DefaultSession = "MIR-POL-ID-BASE";
    # Fix for BU3679 end
    Key;
    Label = "Policy ID";
    Length = "10";
    SType = "Text";
  }

  INOUT MIR-CLI-ID
  {
    DefaultSession = "MIR-CLI-ID";
    Label = "Client Id";
    Length = "10";
    SType = "Text";
  }

  INOUT MIR-SEQ-NUM
  {

    Label = "Sequence Number";
    Length = "10";
    SType = "Text";
  }

  INOUT MIR-APP-TYP-CD
  {

    Label = "Application Type";
    Length = "10";
    SType = "Text";
  }
}
