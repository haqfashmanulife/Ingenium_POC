# Converted from PathFinder 2.2 to 3.0 May 28, 2008 3:12:38 PM EDT

#*******************************************************************************
#*  Component:   BF9557-I.s                                                    *
#*  Description: Issue Reversal                                                *
#*                                                                             *
#*******************************************************************************
#*  Chg#    Release  Author Description                                        *
#*                                                                             *
#*  FEID11  28MAY08 CTS   Issue Reversal for policy                            *
#*******************************************************************************

S-STEP BF9557-I
{
    ATTRIBUTES
    {
        BusinessFunctionType = "Issue Reversal";
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

    INOUT MIR-DV-PRCES-STATE-CD
    {
        Length = "1";
        SType = "Hidden";
        Label = "MIR-DV-PRCES-STATE-CD";
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
}

