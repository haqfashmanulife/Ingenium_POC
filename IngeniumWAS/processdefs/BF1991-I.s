# Converted from PathFinder 2.2 to 3.0 Jun 18, 2004 3:12:54 PM EDT

#*******************************************************************************
#*  Component:   BF1991-I.s                                                    *
#*  Description:                                                               *
#*                                                                             *
#*******************************************************************************
#*  Chg#    Release  Description                                               *
#*                                                                             *
#*  014590  6.0      New for release 6.0                                       *
#*  017150  612J     Remove Currency Decimals = "2"                            *
#*                                                                             *
#*******************************************************************************

S-STEP BF1991-I
{
    ATTRIBUTES
    {
        BusinessFunctionType = "Force";
        Type = "Input";
        FocusField = "MIR-CO-ID";
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
        Length = "2";
        CodeSource = "XTAB";
        CodeType = "COMP";
        SType = "Selection";
        Label = "Individual Company";
    }

    INOUT MIR-DV-CO-ID-IND
    {
        Key;
        Length = "1";
        DefaultConstant = "N";
        SType = "Indicator";
        Label = "All Companies";
    }

    INOUT MIR-DV-PRCES-STATE-CD
    {
        Length = "1";
        SType = "Hidden";
        Label = "Process code";
    }

    INOUT MIR-DV-USER-ID-IND
    {
        Key;
        Length = "1";
        DefaultConstant = "Y";
        SType = "Indicator";
        Label = "All Users";
    }

    INOUT MIR-USER-ID
    {
        Key;
        Length = "8";
        SType = "Text";
        Label = "Individual User ID";
    }

    INOUT MIR-USER-PSWD-TXT
    {
        Mandatory;
        Length = "8";
        SType = "Text";
        Label = "Password";
    }

}

