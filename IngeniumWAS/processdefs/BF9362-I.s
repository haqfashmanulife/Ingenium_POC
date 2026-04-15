# Converted from PathFinder 2.2 to 3.0 MAR 28, 2022 3:12:39 PM EDT

#*******************************************************************************
#*  Component:   BF9362-I.s                                                    *
#*  Description: CSV Certificate/Quote Create - Policy Holder Key Entry        *
#*                                                                             *
#*******************************************************************************
#*  Chg#    Release  Description                                               *
#*                                                                             *
#*  UYS304  01NOV23  Intial Version                                            *
#*******************************************************************************

S-STEP BF9362-I
{
    ATTRIBUTES
    {
        BusinessFunctionType = "Quotecsv";
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
        DefaultSession = "MIR-POL-ID-BASE";
        SType = "Text";
        Label = "Policy ID";
    }

    INOUT MIR-POL-ID-SFX
    {
        Key;
        Length = "1";
        DefaultSession = "MIR-POL-ID-SFX";
        SType = "Text";
        Label = "Suffix";
    }

}
