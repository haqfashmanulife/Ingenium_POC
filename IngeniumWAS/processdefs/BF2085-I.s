# Converted from PathFinder 2.2 to 3.0 Jun 18, 2004 3:12:56 PM EDT

#*******************************************************************************
#*  Component:   BF2085-I.s                                                    *
#*  Description:                                                               *
#*                                                                             *
#*******************************************************************************
#*  Chg#    Release  Description                                               *
#*                                                                             *
#*  014590  6.0      New for release 6.0                                       *
#*  017150  612J     Remove Currency Decimals = "2"                            *
#*                                                                             *
#*******************************************************************************

S-STEP BF2085-I
{
    ATTRIBUTES
    {
        Type = "Input";
        FocusField = "MIR-UPLD-FLD-STRUCT-NM";
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

    INOUT MIR-UPLD-FLD-APEX-NM
    {
        Key;
        Length = "20";
        SType = "Text";
        Label = "APEX Field";
    }

    INOUT MIR-UPLD-FLD-STRUCT-NM
    {
        Key;
        Length = "20";
        SType = "Text";
        Label = "Structure Name";
    }

}

