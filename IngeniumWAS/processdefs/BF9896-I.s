# Converted from PathFinder 2.2 to 3.0 Jun 18, 2004 3:13:13 PM EDT

#*******************************************************************************
#*  Component:   BF9896-I.s                                                    *
#*  Description: Insured Claim Retrieve - Input                                *
#*                                                                             *
#*******************************************************************************
#*  Chg#    Release  Description                                               *
#*                                                                             *
#* HAC002  HIN/CL   HEAD AND BRANCH OFFICE CLAIM INQ (HAC002C)                 *
#* EN000224   GW  ADD DECISION CODE                                            *
#*                                                                             *
#*******************************************************************************

S-STEP BF9896-I
{
  ATTRIBUTES
  {
    BusinessFunctionType = "Retrieve";
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
    SType = "Text";
    Label = "Insured Client ID";
  }

  INOUT MIR-POL-ID
  {
    Key;
    Mandatory;
    Length = "10";
    SType = "Text";
    Label = "Policy ID";
  }

  INOUT MIR-CLM-ID
  {
    Length = "8";
    SType = "Hidden";
    Label = "Claim ID";
  }

  INOUT MIR-CVG-NUM
  {
    Length = "2";
    SType = "Hidden";
    Label = "Coverage Number";
  }

  INOUT MIR-BNFT-NM-ID
  {
    Length = "5";
    SType = "Hidden";
    Label = "Benefit Name";
  }

  INOUT MIR-CLM-AGG-NUM
  {
    Length = "3";
    SType = "Hidden";
    Label = "Aggregation Number";
  }
   
  INOUT MIR-BNFT-DECSN-CD
  {
    Length = "2";
    SType = "Hidden";
    Label = "Decision Code";
  }
}
