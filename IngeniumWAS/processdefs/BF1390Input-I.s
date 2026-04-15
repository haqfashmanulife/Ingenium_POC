# Converted from PathFinder 2.2 to 3.0 Jun 18, 2004 3:12:35 PM EDT

#*******************************************************************************
#*  Component:   BF1390Input-I.s                                               *
#*  Description:                                                               *
#*                                                                             *
#*******************************************************************************
#*  Chg#    Release  Description                                               *
#*                                                                             *
#*  MP176G  CTS      NEW SCREEN FOR SELECTING THE SD FORM                      *
#*                                                                             *
#*******************************************************************************

S-STEP BF1390Input-I
{
    ATTRIBUTES
    {
        Type = "Input";
        FocusField = "SDFormType";
        FocusFrame = "ContentFrame";
    }

    IN Title;

    IN TitleBar;

    IN TitleBarSize;

    IN ButtonBar;

    IN ButtonBarSize;

    IN MessageFrame;

    IN MessageFrameSize;

    INOUT SDFormType;

    OUT action
    {
        SType = "Hidden";
    }

    OUT index
    {
        SType = "Hidden";
    }

}

