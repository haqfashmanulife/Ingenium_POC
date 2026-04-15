# Converted from PathFinder 2.2 to 3.0 Aug 16, 2015 3:12:35 PM EDT

#*******************************************************************************
#*  Component:   BF1390IRInput-I.s                                             *
#*  Description:                                                               *
#*                                                                             *
#*******************************************************************************
#*  Chg#    Release  Description                                               *
#*                                                                             *
#*  M280Q1  CTS      CHANGES DONE AS PART OF NEW INTERVIEWER REPORT - ARM III  *
#*                                                                             *
#*******************************************************************************

S-STEP BF1390IRInput-I
{
    ATTRIBUTES
    {
        Type = "Input";
        FocusField = "IRFormType";
        FocusFrame = "ContentFrame";
    }

    IN Title;

    IN TitleBar;

    IN TitleBarSize;

    IN ButtonBar;

    IN ButtonBarSize;

    IN MessageFrame;

    IN MessageFrameSize;

    INOUT IRFormType;

    OUT action
    {
        SType = "Hidden";
    }

    OUT index
    {
        SType = "Hidden";
    }

}

