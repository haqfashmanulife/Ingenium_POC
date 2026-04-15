# Converted from PathFinder 2.2 to 3.0 Jun 18, 2004 3:13:05 PM EDT

#*******************************************************************************
#*  Component:   BF8111-I.s                                                    *
#*  Description:                                                               *
#*                                                                             *
#*******************************************************************************
#*  Chg#    Release  Description                                               *
#*                                                                             *
#*  014590  6.0      New for release 6.0                                       *
#*  017150  612J     Remove Currency Decimals = "2"                            *
#*                                                                             *
#*******************************************************************************

S-STEP BF8111-I
{
    ATTRIBUTES
    {
        Type = "Input";
        FocusField = "MIR-DM-AV-TBL-CD";
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

    INOUT MIR-DM-AV-CD
    {
        Key;
        Mandatory;
        Length = "15";
        SType = "Text";
        Label = "Allowed Value";
    }

    INOUT MIR-DM-AV-SUBSET-CD
    {
        Key;
        Mandatory;
        Length = "4";
        SType = "Text";
        Label = "Allowed Value Subset";
    }

    INOUT MIR-DM-AV-TBL-CD
    {
        Key;
        Mandatory;
        Length = "30";
        SType = "Text";
        Label = "Allowed Value Table Name";
    }

}

