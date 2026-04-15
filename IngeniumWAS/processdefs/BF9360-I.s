# Converted from PathFinder 2.2 to 3.0 Jun 18, 2004 3:13:10 PM EDT

#*******************************************************************************
#*  Component:   BF9360-I.s                                                    *
#*  Description:                                                               *
#*                                                                             *
#*******************************************************************************
#*  Chg#    Release  Description                                               *
#*                                                                             *
#*  01PR10  CSS      New for MCL                                               *
#*                                                                             *
#*  MP1669 CTS   To support APL,loan in Future/Back dated trial calculation    *
#*  MP245K  CTS      CHANGES DONE FOR FA-REDUCTION AND SURRENDER               *
#*  RPU013  CTS      CHANGES DONE FOR POLICY SERVICE AFTER RPU PROCESSING      *
#*  UYS043  CTS      CHANGES MADE AS PART OF VIRTUAL QUOTE SCREEN              *
#*******************************************************************************
 
S-STEP BF9360-I
{
  ATTRIBUTES
  {
    BusinessFunctionType = "TabSurVal";
    Type = "Input";
    FocusField = "MIR-APPL-CTL-PRCES-DT";
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

  INOUT MIR-APPL-CTL-PRCES-DT
  {
    Key;
    Length = "10";
    DefaultSession = "LSIR-PRCES-DT";
    SType = "Date";
    Label = "Process Date";
  }

  INOUT MIR-POL-ID-BASE
  {
    Key;
    Mandatory;
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
#MP1669- Changes Start here
  INOUT  MIR-TRAD-PD-TO-MO-NUM
  {
    Length = "7";
    SType = "Text";
    Label = "Paid To Month";
  }
#MP1669- Changes End here
#MP245K- Changes Start here
    INOUT MIR-DV-PAYO-JPY-BNFT-CD
      {
        Length = "1";
        CodeSource = "DataModel";
        CodeType = "PAYO-JPY-BNFT-CD";
        SType = "Selection";
        Label = "JPY BENEFIT RIDER INDICATOR";
      }
#MP245K- Changes End here
#RPU013- Changes Start here
    INOUT MIR-RPU-TRNST-CNCL-IND
      {
        Length = "1";
        SType = "Indicator";
        Label = "During RPU Transition Period Cancel:";
      }
#RPU013- Changes End here
#UYS043- Changes Start here
    INOUT MIR-VIR-SCREEN-IND
      {
        Length = "1";
        SType = "Indicator";
        Label = "Please check in case of virtual quote implementation";
      }
#UYS043- Changes End here 

}
