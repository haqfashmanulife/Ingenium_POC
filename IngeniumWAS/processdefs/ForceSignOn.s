# Converted from PathFinder 2.2 to 3.0 Jun 18, 2004 3:13:14 PM EDT

#*******************************************************************************
#*  Component:   ForceSignOn.s                                                 *
#*  Description:                                                               *
#*                                                                             *
#*******************************************************************************
#*  Chg#    Release  Description                                               *
#*                                                                             *
#*  014590  6.0      New for release 6.0                                       *
#*  017150  612J     Remove Currency Decimals = "2"                            *
#*                                                                             *
#*******************************************************************************

S-STEP ForceSignOn
{
    ATTRIBUTES
    {
        FocusField = "OKButton";
        FocusFrame = "ButtonFrame";
    }

    IN TitleBar;

    IN TitleBarSize;

    IN Title;

    IN ButtonBar;

    IN ButtonBarSize;

    OUT action
    {
        SType = "Hidden";
    }

}

