# Converted from PathFinder 2.2 to 3.0 Jun 18, 2004 3:12:17 PM EDT

#*******************************************************************************
#*  Component:   BF9H20-I.s                                                    *
#*  Description:                                                               *
#*                                                                             *
#*******************************************************************************
#*  Chg#    Release  Description                                               *
#*                                                                             *
#*  UYDM29  CTS     Unisys Benefit History Inquiry Screen                      *
#*                                                                             *
#*******************************************************************************

S-STEP BF9H20-I
{
    ATTRIBUTES
    {
        BusinessFunctionType = "Retrieve";
        Type = "Input";
        FocusField = "MIR-POL-ID";
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

    INOUT MIR-POL-ID
    {
        Key;
        Mandatory;
        Length = "7";
        SType = "Text";
        Label = "Policy Id";
        DefaultSession = "MIR-POL-ID";
    }
}

