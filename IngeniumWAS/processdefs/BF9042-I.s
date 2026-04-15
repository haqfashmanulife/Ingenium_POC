# Converted from PathFinder 2.2 to 3.0 Jun 18, 2004 3:13:06 PM EDT

#*******************************************************************************
#*  Component:   BF9042-I.s                                                    *
#*  Description:                                                               *
#*                                                                             *
#*******************************************************************************
#*  Chg#    Release  AUTH.   Description                                       *
#*                                                                             *
#*  P00064  09Oct02          New for Pending Policy Payment Update - NB33      *
#*  P00929  24APR03  ROC     REVISE RECPT NBR FROM 10 TO 8 DIGITAL             *
#*                                                                             *
#*******************************************************************************

S-STEP BF9042-I
{
    ATTRIBUTES
    {
        Type = "Input";
        FocusField = "MIR-POL-ID-BASE";
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
        SType = "Hidden";
    }

    OUT index
    {
        SType = "Hidden";
    }

    INOUT MIR-POL-ID-BASE
    {
        Key;
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

    INOUT MIR-POL-APP-FORM-ID
    {
      Key;
      Length = "15";
      SType = "Text";
      Label = "Application Form ID";
    }

    INOUT MIR-RECPT-NBR
    {
      Mandatory;
#*P00929    Length = "10";  *
      Length = "8";
      SType = "Number";
      Label = "Receipt Number";
    }

}

