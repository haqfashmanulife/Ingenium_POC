# Converted from PathFinder 2.2 to 3.0 Jun 18, 2004 3:13:07 PM EDT

#*******************************************************************************
#*  Component:   BF9091-O.s                                                    *
#*  Description:                                                               *
#*                                                                             *
#*******************************************************************************
#*  Chg#    Release  Description                                               *
#*                                                                             *
#*  DBL63   25JAN02  Module created                                            *
#*                                                                             *
#*******************************************************************************

S-STEP BF9091-O
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

    IN MIR-PRCES-DT-YYYY
    {
        Key;
        DisplayOnly;
        Length = "4";
        SType = "Text";
        Label = "Process Date:  Year";
    }

    IN MIR-PRCES-DT-MM
    {
        Key;
        DisplayOnly;
        Length = "2";
        SType = "Text";
        Label = "Month";
    }

}

