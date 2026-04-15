# Converted from PathFinder 2.2 to 3.0 Jun 18, 2004 3:12:27 PM EDT

#*******************************************************************************
#*  Component:   BF0694-I.s                                                    *
#*  Description:                                                               *
#*                                                                             *
#*******************************************************************************
#*  Chg#    Release  Description                                               *
#*                                                                             *
#*  014590  6.0      New for release 6.0                                       *
#*  017150  612J     Remove Currency Decimals = "2"                            *
#*                                                                             *
#*******************************************************************************

S-STEP BF0694-I
{
    ATTRIBUTES
    {
        BusinessFunctionType = "List";
        Type = "Input";
        FocusField = "MIR-CLI-ID";
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

    INOUT MIR-CLI-ID
    {
        Key;
        Mandatory;
        Length = "10";
        DefaultSession = "MIR-CLI-ID";
        SType = "Text";
        Label = "Client Number";
    }

    INOUT MIR-REL-SYS-ID
    {
        Key;
        Length = "8";
        CodeSource = "EDIT";
        CodeType = "SYSTM";
        SType = "Selection";
        Label = "System Policy Residing In";
    }

    INOUT MIR-REL-SYS-REF-ID
    {
        Key;
        Length = "12";
        SType = "Text";
        Label = "Reference Number";
    }

    INOUT MIR-REL-TYP-CD
    {
        Key;
        Length = "40";
        CodeSource = "EDIT";
        CodeType = "RELCD";
        SType = "Selection";
        Label = "Relationship Type";
    }

}

