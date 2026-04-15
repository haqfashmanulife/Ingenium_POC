#*******************************************************************************
#*  Component:   BF9B70-I.s                                                    *
#*  Description: Rider Surrender/Rider FA Reduction Retrieve                   *
#*                                                                             *
#*******************************************************************************
#*  Chg#    Release  Description                                               *
#*                                                                             *
#*  MP1171  CTS      INITIAL VERSION                                           *
#*  MP245K  CTS      CHANGES DONE FOR FA-REDUCTION AND SURRENDER               *
#*  UYS043  CTS      CHANGES MADE AS PART OF VIRTUAL QUOTE SCREEN              *
#*******************************************************************************

S-STEP BF9B70-I
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
        Label = "Policy Id";
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

    INOUT MIR-APPL-CTL-PRCES-DT
    {
        DefaultSession = "LSIR-PRCES-DT";
        Label = "Processing Date";
        Length = "10";
        Mandatory;
        SType = "Date";
    }
#MP245K CHANGES START HERE
    INOUT MIR-DV-PAYO-JPY-BNFT-CD
      {
        Length = "1";
        CodeSource = "DataModel";
        CodeType = "PAYO-JPY-BNFT-CD";
        SType = "Selection";
        Label = "JPY BENEFIT RIDER INDICATOR";
      } 
#MP245K CHANGES END HERE
#UYS043- Changes Start here
    INOUT MIR-VIR-SCREEN-IND
      {
        Length = "1";
        SType = "Indicator";
        Label = "Check in case of implementing virtual quote";
      }
#UYS043- Changes End here
}
