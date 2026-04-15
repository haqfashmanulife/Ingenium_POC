#*******************************************************************************
#*  Component:   BF9A24-O.s                                                    *
#*  Description: For LIST FUNCTIONALITY                                        *
#*                                                                             *
#*******************************************************************************
#*  Chg#    Release  Description                                               *
#*                                                                             *
#*  WF2004  CTS      INITIAL VERSION                                           *
#*  AHS150  CTS      CHANGED LENGTH OF USER-ID                                 *
#*  BU3679  CTS      FIX FOR PF/CS ERROR LOGS                                  *
#*******************************************************************************
S-STEP BF9A24-O
{
  ATTRIBUTES
  {
    BusinessFunctionType = "List";
    DelEmptyRows;
    FocusField = "OKButton";
    FocusFrame = "ButtonFrame";
    Type = "Output";
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

  OUT index
  {
    SType = "Hidden";
  }

  IN MIR-USER-ID
  {
    DisplayOnly;
    Key;
    Label = "User ID";
    Length = "10";
    SType = "Text";
  }

  IN MIR-POL-ID
  {
    DisplayOnly;
    Key;
    Label = "Policy ID";
    Length = "10";
    SType = "Text";
  }

  IN MIR-CLI-ID
  {
    DisplayOnly;
    Key;
    Label = "Client Id";
    Length = "10";
    SType = "Text";
  }

  IN MIR-SEQ-NUM
  {
    DisplayOnly;
    Key;
    Label = "Sequence Number";
    Length = "2";
    SType = "Text";
  }

  IN MIR-APP-TYP-CD
  {
    DisplayOnly;
    Key;
    Label = "Application Type";
    Length = "10";
    SType = "Text";
  }

  IN MIR-USER-ID-T[15]
  {
    DefaultSession = "MIR-USER-ID";
    DisplayOnly;
    Key;
    Label = "User ID";
    Length = "10";
    SType = "Text";
  }

  IN MIR-POL-ID-T[15]
  {
   # Changes for AHS150
   # Fix for BU3679 start
   # DefaultSession = "MIR-POL-ID";
   # Fix for BU3679 end
    DisplayOnly;
    Key;
    Label = "Policy ID";
    Length = "10";
    SType = "Text";
  }

  IN MIR-CLI-ID-T[15]
  {
    DefaultSession = "MIR-CLI-ID";
    DisplayOnly;
    Key;
    Label = "Client Id";
    Length = "10";
    SType = "Text";
  }

  IN MIR-SEQ-NUM-T[15]
  {
    DisplayOnly;
    Key;
    Label = "Sequence Number";
    Length = "10";
    SType = "Text";
  }

  IN MIR-APP-TYP-CD-T[15]
  {
    DisplayOnly;
    Key;
    Label = "Application Type";
    Length = "10";
    SType = "Text";
  }
}
