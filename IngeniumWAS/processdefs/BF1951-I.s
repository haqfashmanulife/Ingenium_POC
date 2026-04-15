# Converted from PathFinder 2.2 to 3.0 Jun 18, 2004 3:12:53 PM EDT

#*******************************************************************************
#*  Component:   BF1951-I.s                                                    *
#*  Description:                                                               *
#*                                                                             *
#*******************************************************************************
#*  Chg#    Release  Description                                               *
#*                                                                             *
#*  014590  6.0      New for release 6.0                                       *
#*  017150  612J     Remove Currency Decimals = "2"                            *
#*                                                                             *
#*******************************************************************************

S-STEP BF1951-I
{
    ATTRIBUTES
    {
        Type = "Input";
        FocusField = "MIR-CTRY-CD";
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
        CodeSource = "XTAB";
        CodeType = "COMP";
        SType = "Selection";
        Label = "Company";
    }

    INOUT MIR-CTRY-CD
    {
        Key;
        Mandatory;
        Length = "2";
        CodeSource = "XTAB";
        CodeType = "CNTRY";
        SType = "Selection";
        Label = "Country";
    }

}

