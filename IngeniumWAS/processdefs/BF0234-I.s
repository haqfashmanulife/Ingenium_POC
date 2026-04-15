# Converted from PathFinder 2.2 to 3.0 Jun 18, 2004 3:12:18 PM EDT

#*******************************************************************************
#*  Component:   BF0234-I.s                                                    *
#*  Description:                                                               *
#*                                                                             *
#*******************************************************************************
#*  Chg#    Release  Description                                               *
#*                                                                             *
#*  014590  6.0      New for release 6.0                                       *
#*  017150  612J     Remove Currency Decimals = "2"                            *
#*                                                                             *
#*******************************************************************************

S-STEP BF0234-I
{
    ATTRIBUTES
    {
        BusinessFunctionType = "List";
        Type = "Input";
        FocusField = "MIR-CHQ-ID";
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

    INOUT MIR-CHQ-ID
    {
        Key;
        Length = "16";
        SType = "Text";
        Label = "Reference Number";
    }

    INOUT MIR-SBSDRY-CO-ID
    {
        Key;
        Length = "40";
        CodeSource = "EDIT";
        CodeType = "SUBCO";
        SType = "Selection";
        Label = "Sub Company";
    }

}

