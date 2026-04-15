# Converted from PathFinder 2.2 to 3.0 Jun 18, 2004 3:12:39 PM EDT

#*******************************************************************************
#*  Component:   BF9E42-I.s                                                    *
#*  Description: Maturity Reversal Processing - Details                        *
#*                                                                             *
#*******************************************************************************
#*  Chg#    Release  Description                                               *
#*                                                                             *
#*  23802H  CTS      INITIAL VERSION                                           *
#*******************************************************************************

S-STEP BF9E42-I
{
    ATTRIBUTES
    {
        BusinessFunctionType = "Revrsmat";
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

