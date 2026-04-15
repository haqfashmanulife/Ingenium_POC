# Converted from PathFinder 2.2 to 3.0 Jun 18, 2004 3:12:21 PM EDT

#*******************************************************************************
#*  Component:   BF0354-I.s                                                    *
#*  Description:                                                               *
#*                                                                             *
#*******************************************************************************
#*  Chg#    Release  Description                                               *
#*                                                                             *
#*  014590  6.0      New for release 6.0                                       *
#*  017150  612J     Remove Currency Decimals = "2"                            *
#*                                                                             *
#*******************************************************************************

S-STEP BF0354-I
{
    ATTRIBUTES
    {
        BusinessFunctionType = "List";
        Type = "Input";
        FocusField = "MIR-RAT-STD-AGE";
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

    INOUT MIR-RAT-STD-AGE
    {
        Key;
        Length = "3";
        Decimals = "0";
        SType = "Number";
        Label = "Maximum Age";
    }

    INOUT MIR-RAT-STD-HT-QTY
    {
        Key;
        Length = "3";
        DefaultConstant = "000";
        SType = "Text";
        Label = "Maximum Height";
    }

    INOUT MIR-RAT-STD-SEX-CD
    {
        Key;
        Length = "1";
        CodeSource = "DataModel";
        CodeType = "RAT-STD-SEX-CD";
        SType = "Selection";
        Label = "Sex";
    }

    INOUT MIR-RAT-STD-WGT-QTY
    {
        Key;
        Length = "3";
        DefaultConstant = "000";
        SType = "Text";
        Label = "Maximum Weight";
    }

}

