# Converted from PathFinder 2.2 to 3.0 Jun 18, 2004 3:12:32 PM EDT

#*******************************************************************************
#*  Component:   BF0945-I.s                                                    *
#*  Description:                                                               *
#*                                                                             *
#*******************************************************************************
#*  Chg#    Release  Description                                               *
#*                                                                             *
#*  014590  6.0      New for release 6.0                                       *
#*  017150  612J     Remove Currency Decimals = "2"                            *
#*  MPCR01  14DEC07  Added Delay Interest Override fields                      *
#*                                                                             *
#*******************************************************************************

S-STEP BF0945-I
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

    INOUT MIR-POL-PAYO-NUM
    {
        Key;
        Mandatory;
        Length = "5";
        DefaultConstant = "00000";
        SType = "Text";
        Label = "Payout Number";
    }

    INOUT MIR-SUPRES-CNFRM-IND
    {
        Length = "1";
        SType = "Indicator";
        Label = "Suppress Confirm Indicator";
    }

# MPCR01 Changes start here

    INOUT MIR-BPSS-DLAY-INT-IND
    {
        Length = "1";
        SType = "Indicator";
        Label = "Bypass Delay Interest Computation";
    }

    INOUT MIR-DLAY-INT-OVRID-AMT
    {
        Length = "15";
        SType = "Currency";
        Label = "Delay Interest Override Amount";
    }

# MPCR01 Changes end here

}

