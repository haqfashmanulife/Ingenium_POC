# Converted from PathFinder 2.2 to 3.0 Jun 18, 2004 3:12:13 PM EDT

#*******************************************************************************
#*  Component:   BF0064-I.s                                                    *
#*  Description:                                                               *
#*                                                                             *
#*******************************************************************************
#*  Chg#    Release  Description                                               *
#*                                                                             *
#*  014590  6.0      New for release 6.0                                       *
#*  017150  612J     Remove Currency Decimals = "2"                            *
#*                                                                             *
#*******************************************************************************

S-STEP BF0064-I
{
    ATTRIBUTES
    {
        BusinessFunctionType = "Login";
        Type = "Input";
        FocusField = "MIR-USER-ID";
        FocusFrame = "ContentFrame";
    }

    IN Title;

    IN MessageFrame;

    IN MessageFrameSize;

    OUT action
    {
        SType = "Hidden";
    }

    INOUT MIR-CO-ID;

    INOUT MIR-USER-ID
    {
        Key;
        Mandatory;
        Length = "8";
        SType = "Text";
        Label = "User ID";
    }

    INOUT MIR-USER-PSWD-TXT
    {
        Mandatory;
        Length = "8";
        SType = "Text";
        Label = "Password";
    }


}

