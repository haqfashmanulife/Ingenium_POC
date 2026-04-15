#*******************************************************************************
#*  Component:   BF9C20-I.s                                                    *
#*  Description: TD Reinstatement Information Inquiry Screen                   *
#*                                                                             *
#*******************************************************************************
#*  Chg#    Release  Description                                               *
#*  NWLGLR  CTS      Intial Version                                            *
#*******************************************************************************

S-STEP BF9C20-I
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
        Key;
        DefaultSession = "MIR-POL-ID-BASE";
        Label = "Policy ID";
        Length = "9";
        Mandatory;
        SType = "Text";
    }

    INOUT MIR-POL-ID-SFX
    {
        Key;
        Length = "1";
        DefaultSession = "MIR-POL-ID-SFX";
        SType = "Text";
        Label = "Suffix";
    }

    INOUT MIR-PRCES-DT
    {
        Key;
        Length = "10";
        DefaultSession = "LSIR-PRCES-DT";
        SType = "Date";
        Label = "Processing Date";
    }

    INOUT MIR-INSRD-CLI-ID
    {
        Length = "10";
        SType = "Text";
    }
}
