# Converted from PathFinder 2.2 to 3.0 Jun 18, 2004 3:12:13 PM EDT

#*******************************************************************************
#*  Component:   BF0090-I.s                                                    *
#*  Description:                                                               *
#*                                                                             *
#*******************************************************************************
#*  Chg#    Release  Description                                               *
#*                                                                             *
#*  014590  6.0      New for release 6.0                                       *
#*  017150  612J     Remove Currency Decimals = "2"                            *
#*                                                                             *
#*******************************************************************************

S-STEP BF0090-I
{
    ATTRIBUTES
    {
        BusinessFunctionType = "List";
        Type = "Input";
        FocusField = "MIR-USER-ID";
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

    INOUT MIR-USER-ID
    {
        Key;
        Length = "8";
        DefaultSession = "MIR-USER-ID";
        SType = "Text";
        Label = "User ID";
    }

    INOUT MIR-USER-MSG-DT
    {
        Key;
        Length = "10";
        DefaultSession = "LSIR-SYS-DT-EXT";
        SType = "Date";
        Label = "Date Message Created";
    }

    INOUT MIR-USER-MSG-SEQ-NUM
    {
        Key;
        Length = "3";
        DefaultConstant = "999";
        SType = "Text";
        Label = "Sequence Number";
    }

    INOUT MIR-USER-MSG-SEVRTY-CD
    {
        Length = "1";
        SType = "Hidden";
        Label = "Severity Code - for index";
    }

    INOUT MIR-USER-MSG-TASK-ID
    {
        Key;
        Length = "4";
        DefaultSession = "LSIR-TASK-ID";
        SType = "Text";
        Label = "CICS Task Number";
    }

    INOUT MIR-USER-MSG-TIME
    {
        Key;
        Length = "8";
        DefaultSession = "LSIR-SYS-TIME";
        SType = "Time";
        Label = "Time";
    }

}

