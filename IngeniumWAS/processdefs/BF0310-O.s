# Converted from PathFinder 2.2 to 3.0 Jun 18, 2004 3:12:20 PM EDT

#*******************************************************************************
#*  Component:   BF0310-O.s                                                    *
#*  Description:                                                               *
#*                                                                             *
#*******************************************************************************
#*  Chg#    Release  Description                                               *
#*                                                                             *
#*  014590  6.0      New for release 6.0                                       *
#*  017150  612J     Remove Currency Decimals = "2"                            *
#*                                                                             *
#*******************************************************************************

S-STEP BF0310-O
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

    IN MIR-BTCH-PGM-ID
    {
        DisplayOnly;
        Length = "8";
        SType = "Text";
        Label = "Batch Program";
    }

    IN MIR-ONLN-PGM-ID
    {
        DisplayOnly;
        Length = "8";
        SType = "Text";
        Label = "Online Program";
    }

    IN MIR-USER-EXIT-INVOK-CD
    {
        DisplayOnly;
        Length = "1";
        CodeSource = "DataModel";
        CodeType = "USER-EXIT-INVOK-CD";
        SType = "Text";
        Label = "Invocation Type";
    }

}

