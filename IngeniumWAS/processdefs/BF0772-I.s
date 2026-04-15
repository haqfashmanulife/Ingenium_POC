# Converted from PathFinder 2.2 to 3.0 Jun 18, 2004 3:12:29 PM EDT

#*******************************************************************************
#*  Component:   BF0772-I.s                                                    *
#*  Description:                                                               *
#*                                                                             *
#*******************************************************************************
#*  Chg#    Release  Description                                               *
#*                                                                             *
#*  014590  6.0      New for release 6.0                                       *
#*  017150  612J     Remove Currency Decimals = "2"                            *
#*                                                                             *
#*******************************************************************************

S-STEP BF0772-I
{
    ATTRIBUTES
    {
        Type = "Input";
        FocusField = "MIR-RH-ID";
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

    INOUT MIR-RH-ID
    {
        Length = "6";
        CodeSource = "EDIT";
        CodeType = "RHDR";
        SType = "Selection";
        Label = "Rate Header Pointer";
    }

    IN MIR-PLAN-ID
    {
        Key;
        DisplayOnly;
        Length = "40";
        CodeSource = "EDIT";
        CodeType = "PLAN";
        SType = "Text";
        Label = "Plan";
    }

    IN MIR-PLAN-RT-TYP-CD
    {
        Key;
        DisplayOnly;
        Length = "5";
        CodeSource = "DataModel";
        CodeType = "PLAN-RT-TYP-CD";
        SType = "Text";
        Label = "Plan Rate Type";
    }

}

