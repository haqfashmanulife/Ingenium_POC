# Converted from PathFinder 2.2 to 3.0 Jun 18, 2004 3:13:06 PM EDT

#*******************************************************************************
#*  Component:   BF9029-I.s                                                    *
#*  Description:                                                               *
#*                                                                             *
#*******************************************************************************
#*  Chg#    Release  Description                                               *
#*                                                                             *
#*  B00317  01AUG01  Module created                                            *
#*                                                                             *
#*******************************************************************************

S-STEP BF9029-I
{
    ATTRIBUTES
    {
        BusinessFunctionType = "List";
        Type = "Input";
        FocusField = "MIR-PRCES-DT-YYYY";
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

    INOUT MIR-PRCES-DT-YYYY
    {
        Key;
        Length = "4";
        SType = "Text";
        Label = "Process Date:  Year";
    }

    INOUT MIR-PRCES-DT-MM
    {
        Key;
        Length = "2";
        SType = "Text";
        Label = "Month";
    }


}

