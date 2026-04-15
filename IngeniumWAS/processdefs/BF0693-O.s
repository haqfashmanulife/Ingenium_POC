# Converted from PathFinder 2.2 to 3.0 Jun 18, 2004 3:12:27 PM EDT

#*******************************************************************************
#*  Component:   BF0693-O.s                                                    *
#*  Description:                                                               *
#*                                                                             *
#*******************************************************************************
#*  Chg#    Release  Description                                               *
#*                                                                             *
#*  014590  6.0      New for release 6.0                                       *
#*  017150  612J     Remove Currency Decimals = "2"                            *
#*                                                                             *
#*******************************************************************************

S-STEP BF0693-O
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

    IN MIR-CLI-ID
    {
        Key;
        DisplayOnly;
        Length = "10";
        DefaultSession = "MIR-CLI-ID";
        SType = "Text";
        Label = "Client Number";
    }

    IN MIR-REL-SYS-ID
    {
        Key;
        DisplayOnly;
        Length = "8";
        CodeSource = "EDIT";
        CodeType = "SYSTM";
        SType = "Text";
        Label = "System Policy Residing In";
    }

    IN MIR-REL-SYS-REF-ID
    {
        Key;
        DisplayOnly;
        Length = "12";
        SType = "Text";
        Label = "Reference Number";
    }

    IN MIR-REL-TYP-CD
    {
        Key;
        DisplayOnly;
        Length = "40";
        CodeSource = "EDIT";
        CodeType = "RELCD";
        SType = "Text";
        Label = "Relationship Type";
    }

}

