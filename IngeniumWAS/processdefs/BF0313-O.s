# Converted from PathFinder 2.2 to 3.0 Jun 18, 2004 3:12:20 PM EDT

#*******************************************************************************
#*  Component:   BF0313-O.s                                                    *
#*  Description:                                                               *
#*                                                                             *
#*******************************************************************************
#*  Chg#    Release  Description                                               *
#*                                                                             *
#*  014590  6.0      New for release 6.0                                       *
#*  017150  612J     Remove Currency Decimals = "2"                            *
#*                                                                             *
#*******************************************************************************

S-STEP BF0313-O
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

}

