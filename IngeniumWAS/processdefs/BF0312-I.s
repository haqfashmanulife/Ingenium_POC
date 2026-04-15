# Converted from PathFinder 2.2 to 3.0 Jun 18, 2004 3:12:20 PM EDT

#*******************************************************************************
#*  Component:   BF0312-I.s                                                    *
#*  Description:                                                               *
#*                                                                             *
#*******************************************************************************
#*  Chg#    Release  Description                                               *
#*                                                                             *
#*  014590  6.0      New for release 6.0                                       *
#*  017150  612J     Remove Currency Decimals = "2"                            *
#*                                                                             *
#*******************************************************************************

S-STEP BF0312-I
{
    ATTRIBUTES
    {
        Type = "Input";
        FocusField = "MIR-ONLN-PGM-ID";
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

    INOUT MIR-BTCH-PGM-ID
    {
        Mandatory;
        Length = "8";
        SType = "Text";
        Label = "Batch Program";
    }

    INOUT MIR-ONLN-PGM-ID
    {
        Mandatory;
        Length = "8";
        SType = "Text";
        Label = "Online Program";
    }

    INOUT MIR-USER-EXIT-INVOK-CD
    {
        Mandatory;
        Length = "1";
        CodeSource = "DataModel";
        CodeType = "USER-EXIT-INVOK-CD";
        SType = "Selection";
        Label = "Invocation Type";
    }

    IN MIR-USER-EXIT-ID
    {
        Key;
        DisplayOnly;
        Length = "4";
        CodeSource = "DataModel";
        CodeType = "USER-EXIT-ID";
        SType = "Text";
        Label = "User Exit Pointer";
    }

}

