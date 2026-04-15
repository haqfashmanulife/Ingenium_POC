# Converted from PathFinder 2.2 to 3.0 Jun 18, 2004 3:13:06 PM EDT

#*******************************************************************************
#*  Component:   BF0943-O.s                                                    *
#*  Description: Pending Policy Payment Update                                 *
#*                                                                             *
#*******************************************************************************
#*  Chg#    Release  Description                                               *
#*                                                                             *
#* P00064   09Oct02  inital release Pending Policy Payment Update - Spec. NB33 *
#* P00929   ROC      REVISE RECPT NBR FROM 10 TO 8 BIT                         *
#*                                                                             *
#*******************************************************************************
 
S-STEP BF9043-O
{
  ATTRIBUTES
  {
    BusinessFunctionType = "Update";
    Type = "Output";
    DelEmptyRows;
    FocusField = "OKButton";
    FocusFrame = "ButtonFrame";
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
    DisplayOnly;
    Length = "9";
    DefaultSession = "MIR-POL-ID-BASE";
    SType = "Text";
    Label = "Policy Id";
  }

  IN MIR-POL-ID-SFX 
  {
    Key;
    DisplayOnly;
    Length = "1";
    DefaultSession = "MIR-POL-ID-SFX";
    SType = "Text";
    Label = "Suffix";
  }

  IN MIR-POL-APP-FORM-ID 
  {
    Key;
    DisplayOnly;
    Length = "15";
    SType = "Text";
    Label = "Application Form ID";
  }

  IN MIR-RECPT-NBR 
  {
    DisplayOnly;
#*P00929    Length = "10";
    Length = "8";
    SType = "Number";
    Label = "Receipt Number";
  }

  IN MIR-RECPT-DT 
  {
    DisplayOnly;
    Length = "10";
    SType = "Date";
    Label = "Receipt Date";
  }

  IN MIR-POL-CSTAT-CD 
  {
    DisplayOnly;
    Length = "40";
    CodeSource = "DataModel";
    CodeType = "POL-CSTAT-CD";
    SType = "Text";
    Label = "Current Policy Status";
  }
}
