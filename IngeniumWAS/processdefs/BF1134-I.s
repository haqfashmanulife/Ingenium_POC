# Converted from PathFinder 2.2 to 3.0 Jun 18, 2004 3:12:34 PM EDT

#*******************************************************************************
#*  Component:   BF1134-I.s                                                    *
#*  Description:                                                               *
#*                                                                             *
#*******************************************************************************
#*  Chg#    Release  Description                                               *
#*                                                                             *
#*  014590  6.0      New for release 6.0                                       *
#*  017150  612J     Remove Currency Decimals = "2"                            *
#*                                                                             *
#*******************************************************************************

S-STEP BF1134-I
{
    ATTRIBUTES
    {
        BusinessFunctionType = "Browsew";
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

    INOUT MIR-DPOS-CDA-SEQ-NUM
    {
        Key;
        Length = "3";
        DefaultConstant = "999";
        SType = "Text";
        Label = "Sequence Number";
    }

    INOUT MIR-DPOS-EFF-IDT-NUM
    {
        Key;
        Length = "10";
        DefaultSession = "LSIR-PRCES-DT";
        SType = "Date";
        Label = "Deposit Effective Date";
    }

    INOUT MIR-DPOS-POL-PAYO-NUM
    {
        Key;
        Length = "5";
        DefaultConstant = "99999";
        SType = "Text";
        Label = "Payout Number";
    }

    INOUT MIR-POL-ID-SFX
    {
        Key;
        Length = "1";
        DefaultSession = "MIR-POL-ID-SFX";
        SType = "Text";
        Label = "Suffix";
    }

    INOUT MIR-CDA-EFF-IDT-NUM
    {
        Key;
        Mandatory;
        Length = "10";
        DefaultSession = "LSIR-PRCES-DT";
        SType = "Date";
        Label = "Withdrawal Effective Date";
    }

    INOUT MIR-CDA-SEQ-NUM
    {
        Key;
        Mandatory;
        Length = "3";
        DefaultConstant = "999";
        SType = "Text";
        Label = "Withdrawal Sequence Number";
    }

    INOUT MIR-DWCHRG-SEQ-NUM
    {
        Key;
        Length = "3";
        DefaultConstant = "999";
        SType = "Text";
        Label = "Sub-Sequence";
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

    INOUT MIR-POL-PAYO-NUM
    {
        Key;
        Mandatory;
        Length = "5";
        DefaultConstant = "99999";
        SType = "Text";
        Label = "Withdrawal Payout Number";
    }

}

