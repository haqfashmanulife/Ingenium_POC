# Converted from PathFinder 2.2 to 3.0 Jun 18, 2004 3:13:07 PM EDT

#*******************************************************************************
#*  Component:   BF9091-I.s                                                    *
#*  Description:                                                               *
#*                                                                             *
#*******************************************************************************
#*  Chg#    Release  Description                                               *
#*                                                                             *
#*  DBL63   24JAN02  Module created                                            *
#*  PF13    TBA      s-step name was listed as BF9026-I, This was corrected.   *
#*                                                                             *
#*******************************************************************************

S-STEP BF9091-I
{
    ATTRIBUTES
    {
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

    OUT MIR-PRCES-DT-YYYY
    {
        Key;
        Length = "4";
        SType = "Text";
        Label = "Process Date:  Year";
    }

    OUT MIR-PRCES-DT-MM
    {
        Key;
        Length = "2";
        SType = "Text";
        Label = "Month";
    }


}

