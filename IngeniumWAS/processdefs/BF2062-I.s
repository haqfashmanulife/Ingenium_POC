# Converted from PathFinder 2.2 to 3.0 Jun 18, 2004 3:12:55 PM EDT

#*******************************************************************************
#*  Component:   BF2062-I.s                                                    *
#*  Description:                                                               *
#*                                                                             *
#*******************************************************************************
#*  Chg#    Release  Description                                               *
#*                                                                             *
#*  014590  6.0      New for release 6.0                                       *
#*  017150  612J     Remove Currency Decimals = "2"                            *
#*                                                                             *
#*******************************************************************************

S-STEP BF2062-I
{
    ATTRIBUTES
    {
        BusinessFunctionType = "Update";
        Type = "Input";
        FocusField = "MIR-MXDX-MX-AMT";
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

    INOUT MIR-MXDX-DX-AMT
    {
        Mandatory;
        Length = "12";
        SType = "Text";
        Label = "Dx Value";
    }

    INOUT MIR-MXDX-MX-AMT
    {
        Mandatory;
        Length = "12";
        SType = "Text";
        Label = "Mx Value";
    }

    IN MIR-MXDX-AGE
    {
        Key;
        DisplayOnly;
        Length = "3";
        Decimals = "0";
        SType = "Number";
        Label = "Age";
    }

    IN MIR-MXDX-ID
    {
        Key;
        DisplayOnly;
        Length = "2";
        SType = "Text";
        Label = "Commutation Pointer";
    }

}

