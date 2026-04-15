# Converted from PathFinder 2.2 to 3.0 Jun 18, 2004 3:12:21 PM EDT

#*******************************************************************************
#*  Component:   BF0350-O.s                                                    *
#*  Description:                                                               *
#*                                                                             *
#*******************************************************************************
#*  Chg#    Release  Description                                               *
#*                                                                             *
#*  014590  6.0      New for release 6.0                                       *
#*  017150  612J     Remove Currency Decimals = "2"                            *
#*                                                                             *
#*******************************************************************************

S-STEP BF0350-O
{
    ATTRIBUTES
    {
        Type = "Output";
        DelEmptyRows;
        FocusField = "OKButton";
        FocusFrame = "ButtonFrame";
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

    IN MIR-CO-HWTB-SCALE-CD
    {
        DisplayOnly;
        Length = "1";
        SType = "Text";
        Label = "Scale";
    }

    IN MIR-DV-RAT-STD-CM-HT
    {
        DisplayOnly;
        Length = "3";
        SType = "Text";
        Label = "Maximum Height Cm";
    }

    IN MIR-DV-RAT-STD-FT-HT
    {
        DisplayOnly;
        Length = "3";
        SType = "Text";
        Label = "Maximum Height Ft";
    }

    IN MIR-DV-RAT-STD-INCH-HT
    {
        DisplayOnly;
        Length = "3";
        SType = "Text";
        Label = "Maximum Height In";
    }

    IN MIR-DV-RAT-STD-KG-WGT
    {
        DisplayOnly;
        Length = "3";
        SType = "Text";
        Label = "Maximum Weight Kgs";
    }

    IN MIR-DV-RAT-STD-LB-WGT
    {
        DisplayOnly;
        Length = "3";
        SType = "Text";
        Label = "Maximum Weight Lbs";
    }

    IN MIR-MAX-RAT-QTY
    {
        DisplayOnly;
        Length = "3";
        SType = "Text";
        Label = "Rating Maximum";
    }

    IN MIR-MIN-RAT-QTY
    {
        DisplayOnly;
        Length = "3";
        SType = "Text";
        Label = "Rating Minimum";
    }

    IN MIR-RECMND-RAT-QTY
    {
        DisplayOnly;
        Length = "3";
        SType = "Text";
        Label = "Rating Recommended";
    }

}

