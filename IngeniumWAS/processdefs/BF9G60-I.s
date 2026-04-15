# Converted from PathFinder 2.2 to 3.0 Jun 18, 2004 3:12:17 PM EDT

#*******************************************************************************
#*  Component:   BF9G60-I.s                                                    *
#*  Description:                                                               *
#*                                                                             *
#*******************************************************************************
#*  Chg#    Release  Description                                               *
#*                                                                             *
#*  UYS065  CTS     Client History Maintenance                                 *
#*                                                                             *
#*******************************************************************************

S-STEP BF9G60-I
{
    ATTRIBUTES
    {
        Type = "Input";
        FocusField = "MIR-POL-ID";
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

    INOUT MIR-POL-ID
    {
        Length = "10";
        SType = "Text";
        Label = "Policy Id";
    }

    INOUT MIR-CLI-ID
    {
        Length = "10";
        SType = "Text";
        Label = "Client Id";
    }
}

