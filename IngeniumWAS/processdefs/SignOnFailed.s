# Converted from PathFinder 2.2 to 3.0 Jun 18, 2004 3:13:14 PM EDT

#*******************************************************************************
#*  Component:   SignOnFailed.s                                                *
#*  Description:                                                               *
#*                                                                             *
#*******************************************************************************
#*  Chg#    Release  Description                                               *
#*                                                                             *
#*  014590  6.0      New for release 6.0                                       *
#*  017150  612J     Remove Currency Decimals = "2"                            *
#*                                                                             *
#*******************************************************************************

S-STEP SignOnFailed
{
    ATTRIBUTES
    {
        FocusField = "prevButton";
        FocusFrame = "ButtonFrame";
    }

    IN TitleBar;

    IN TitleBarSize;

    IN Title;

    IN ButtonBar;

    IN ButtonBarSize;

    IN MessageFrame;

    IN MessageFrameSize;

    OUT action
    {
        SType = "Hidden";
    }

}


#*****************************************************
#  Field Definitions
#*****************************************************

