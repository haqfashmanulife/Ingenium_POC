# Converted from PathFinder 2.2 to 3.0 Jun 18, 2004 3:13:05 PM EDT

#*******************************************************************************
#*  Component:   BF9027-O.s                                                    *
#*  Description:                                                               *
#*                                                                             *
#*******************************************************************************
#*  Chg#    Release  Description                                               *
#*                                                                             *
#*  B00317  01AUG01  Module created                                            *
#*                                                                             *
#*******************************************************************************

S-STEP BF9027-O
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

    INOUT MIR-APP-RECV-CUT-DT
    {
        DisplayOnly;
        Length = "10";
        SType = "Date";
        Label = "App Received Cut-off Date";
    }

    INOUT MIR-POL-ISS-CUT-DT
    {
        DisplayOnly;
        Length = "10";
        SType = "Date";
        Label = "Pol Issued Cut-off Date";
    }

}

