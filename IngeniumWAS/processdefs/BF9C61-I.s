#*******************************************************************************
#*  Component:   BF9C61-I.s                                                    *
#*  Description: CSOM9C60                                                      *
#*                                                                             *
#*******************************************************************************
#*  Chg#    Release  Description                                               *
#*                                                                             *
#*  M161CA  CTS     Implementing the Screen changes for the Credit card        *
#*  M161CA          processing                                                 *
#*  Q10193  CTS     M161CA CREATE / UPDATE CRC SCREEN ISSUE                    * 
#*******************************************************************************

S-STEP BF9C61-I
{
    ATTRIBUTES
    {
        BusinessFunctionType = "Create";
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
        Mandatory;
        Length = "9";
        #Q10193 START
        DefaultSession = "MIR-POL-ID-BASE";
        #Q10193 END
        SType = "Text";
        Label = "Policy ID";
    }

    INOUT MIR-POL-ID-SFX
    {
        Key;
        Length = "1";
        #Q10193 START
        DefaultSession = "MIR-POL-ID-SFX";
        #Q10193 END
        SType = "Text";
        Label = "Suffix";
    }
}

