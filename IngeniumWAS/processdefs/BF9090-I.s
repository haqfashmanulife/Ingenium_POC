# Converted from PathFinder 2.2 to 3.0 Jun 18, 2004 3:13:07 PM EDT

#*******************************************************************************
#*  Component:   BF9090-I.s                                                    *
#*  Description:                                                               *
#*                                                                             *
#*******************************************************************************
#*  Chg#    Release  Description                                               *
#*                                                                             *
#*  DBL63   24JAN02  Module created                                            *
#*  MP0016  01NOV05  2nd Bank Transfer - changed keys and added Low Pick Day   *               
#*                   and High Pick Day                                         *
#*                                                                             *
#*******************************************************************************

S-STEP BF9090-I
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


    INOUT MIR-PRCES-DT-YYYY
    {
        Key;
        Mandatory;
        Length = "4";
        SType = "Text";
        Label = "Process Date:  Year";
    }

    INOUT MIR-PRCES-DT-MM
    {
        Key;
        Mandatory;
        Length = "2";
        SType = "Text";
        Label = "Month";
    }

    INOUT MIR-PRCES-DT-DD
    {
        Key;
        Mandatory;
        Length = "2";
        SType = "Text";
        Label = "Day";
    }


}

