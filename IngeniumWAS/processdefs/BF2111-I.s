# Converted from PathFinder 2.2 to 3.0 Jun 18, 2004 3:12:56 PM EDT

#*******************************************************************************
#*  Component:   BF2111-I.s                                                    *
#*  Description:                                                               *
#*                                                                             *
#*******************************************************************************
#*  Chg#    Release  Description                                               *
#*                                                                             *
#*  014590  6.0      New for release 6.0                                       *
#*  017150  612J     Remove Currency Decimals = "2"                            *
#*                                                                             *
#*******************************************************************************

S-STEP BF2111-I
{
    ATTRIBUTES
    {
        Type = "Input";
        FocusField = "MIR-OVRID-BASE-AGT-ID";
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

    INOUT MIR-OVRID-BASE-AGT-ID
    {
        Key;
        Mandatory;
        Length = "6";
        SType = "Text";
        Label = "Override";
    }

    INOUT MIR-OVRID-ID
    {
        Key;
        Mandatory;
        Length = "2";
        SType = "Text";
        Label = "Agent Situation";
    }

}

