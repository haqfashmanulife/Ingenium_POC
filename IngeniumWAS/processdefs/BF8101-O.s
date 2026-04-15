# Converted from PathFinder 2.2 to 3.0 Jun 18, 2004 3:13:04 PM EDT

#*******************************************************************************
#*  Component:   BF8101-O.s                                                    *
#*  Description:                                                               *
#*                                                                             *
#*******************************************************************************
#*  Chg#    Release  Description                                               *
#*                                                                             *
#*  014590  6.0      New for release 6.0                                       *
#*  017150  612J     Remove Currency Decimals = "2"                            *
#*                                                                             *
#*******************************************************************************

S-STEP BF8101-O
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

    IN MIR-DM-AV-CD
    {
        Key;
        DisplayOnly;
        Length = "15";
        SType = "Text";
        Label = "Allowed Value";
    }

    IN MIR-DM-AV-DESC-LANG-CD
    {
        Key;
        DisplayOnly;
        Length = "1";
        SType = "Text";
        Label = "Language";
    }

    IN MIR-DM-AV-TBL-CD
    {
        Key;
        DisplayOnly;
        Length = "30";
        SType = "Text";
        Label = "Allowed Value Table Name";
    }

}

