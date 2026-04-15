S-STEP BF9A20-I
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
    DefaultSession = "MIR-POL-ID-BASE";
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
