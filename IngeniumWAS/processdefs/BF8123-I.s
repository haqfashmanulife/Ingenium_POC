# Converted from PathFinder 2.2 to 3.0 Jun 18, 2004 3:13:05 PM EDT

#*******************************************************************************
#*  Component:   BF8123-I.s                                                    *
#*  Description:                                                               *
#*                                                                             *
#*******************************************************************************
#*  Chg#    Release  Description                                               *
#*                                                                             *
#*  014590  6.0      New for release 6.0                                       *
#*  017150  612J     Remove Currency Decimals = "2"                            *
#*                                                                             *
#*******************************************************************************

S-STEP BF8123-I
{
    ATTRIBUTES
    {
        Type = "Input";
        FocusField = "MIR-CO-ID";
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

    INOUT MIR-CO-ID
    {
        Key;
        Mandatory;
        Length = "2";
        SType = "Text";
        Label = "Company";
    }

    INOUT MIR-CTRY-CD
    {
        Key;
        Mandatory;
        Length = "2";
        SType = "Text";
        Label = "Country";
    }

    INOUT MIR-CTRY-LOC-CD
    {
        Key;
        Mandatory;
        Length = "2";
        SType = "Text";
        Label = "Location";
    }

    INOUT MIR-CTRY-LOC-TYP-CD
    {
        Key;
        Mandatory;
        Length = "5";
        SType = "Text";
        Label = "Location Type";
    }

}

