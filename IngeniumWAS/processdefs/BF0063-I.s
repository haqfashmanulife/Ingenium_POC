# Converted from PathFinder 2.2 to 3.0 Jun 18, 2004 3:12:13 PM EDT

#*******************************************************************************
#*  Component:   BF0063-I.s                                                    *
#*  Description:                                                               *
#*                                                                             *
#*******************************************************************************
#*  Chg#    Release  Description                                               *
#*                                                                             *
#*  014590  6.0      New for release 6.0                                       *
#*  017150  612J     Remove Currency Decimals = "2"                            *
#*                                                                             *
#*******************************************************************************

S-STEP BF0063-I
{
    ATTRIBUTES
    {
        BusinessFunctionType = "Newpass";
        Type = "Input";
        FocusField = "MIR-USER-PSWD-TXT";
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

    INOUT MIR-USER-PSWD-TXT
    {
        Mandatory;
        Length = "8";
        SType = "Text";
        Label = "Password";
    }

    INOUT MIR-USER-PSWD-TXT-2
    {
        Mandatory;
        Length = "8";
        SType = "Text";
        Label = "New Password";
    }

    INOUT MIR-USER-PSWD-TXT-3
    {
        Mandatory;
        Length = "8";
        SType = "Text";
        Label = "Confirm New Password";
    }

}

