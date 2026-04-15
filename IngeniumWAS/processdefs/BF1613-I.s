# Converted from PathFinder 2.2 to 3.0 Jun 18, 2004 3:12:47 PM EDT

#*******************************************************************************
#*  Component:   BF1613-I.s                                                    *
#*  Description:                                                               *
#*                                                                             *
#*******************************************************************************
#*  Chg#    Release  Description                                               *
#*                                                                             *
#*  014590  6.0      New for release 6.0                                       *
#*  017150  612J     Remove Currency Decimals = "2"                            *
#*                                                                             *
#*******************************************************************************

S-STEP BF1613-I
{
    ATTRIBUTES
    {
        Type = "Input";
        FocusField = "MIR-OCCP-ID";
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

    INOUT MIR-OCCP-ID
    {
        Key;
        Mandatory;
        Length = "10";
        CodeSource = "EDIT";
        CodeType = "OCCCD";
        SType = "Selection";
        Label = "Occupation";
    }

}

