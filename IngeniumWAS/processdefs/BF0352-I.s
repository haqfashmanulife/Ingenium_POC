# Converted from PathFinder 2.2 to 3.0 Jun 18, 2004 3:12:21 PM EDT

#*******************************************************************************
#*  Component:   BF0352-I.s                                                    *
#*  Description:                                                               *
#*                                                                             *
#*******************************************************************************
#*  Chg#    Release  Description                                               *
#*                                                                             *
#*  014590  6.0      New for release 6.0                                       *
#*  017150  612J     Remove Currency Decimals = "2"                            *
#*                                                                             *
#*******************************************************************************

S-STEP BF0352-I
{
    ATTRIBUTES
    {
        Type = "Input";
        FocusField = "MIR-MAX-RAT-QTY";
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

    INOUT MIR-DV-RAT-STD-FT-HT
    {
        Length = "3";
        SType = "Text";
        Label = "Maximum Height Ft";
    }

    INOUT MIR-DV-RAT-STD-INCH-HT
    {
        Length = "3";
        SType = "Text";
        Label = "Maximum Height In";
    }

    INOUT MIR-DV-RAT-STD-LB-WGT
    {
        Length = "3";
        SType = "Text";
        Label = "Maximum Weight Lbs";
    }

    INOUT MIR-MAX-RAT-QTY
    {
        Mandatory;
        Length = "3";
        SType = "Text";
        Label = "Rating Maximum";
    }

    INOUT MIR-MIN-RAT-QTY
    {
        Mandatory;
        Length = "3";
        SType = "Text";
        Label = "Rating Minimum";
    }

    INOUT MIR-RECMND-RAT-QTY
    {
        Mandatory;
        Length = "3";
        SType = "Text";
        Label = "Rating Recommended";
    }

    IN MIR-CO-HWTB-SCALE-CD
    {
        Key;
        DisplayOnly;
        Length = "1";
        SType = "Text";
        Label = "Scale";
    }

    IN MIR-RAT-STD-AGE
    {
        Key;
        DisplayOnly;
        Length = "3";
        Decimals = "0";
        SType = "Number";
        Label = "Maximum Age";
    }

    IN MIR-RAT-STD-HT-QTY
    {
        Key;
        DisplayOnly;
        Length = "3";
        SType = "Text";
        Label = "Maximum Height";
    }

    IN MIR-RAT-STD-SEX-CD
    {
        Key;
        DisplayOnly;
        Length = "1";
        CodeSource = "DataModel";
        CodeType = "RAT-STD-SEX-CD";
        SType = "Text";
        Label = "Sex";
    }

    IN MIR-RAT-STD-WGT-QTY
    {
        Key;
        DisplayOnly;
        Length = "3";
        SType = "Text";
        Label = "Maximum Weight";
    }

}

