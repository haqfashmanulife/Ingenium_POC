# Converted from PathFinder 2.2 to 3.0 Jun 18, 2004 3:12:55 PM EDT

#*******************************************************************************
#*  Component:   BF2041-I.s                                                    *
#*  Description:                                                               *
#*                                                                             *
#*******************************************************************************
#*  Chg#    Release  Description                                               *
#*                                                                             *
#*  014590  6.0      New for release 6.0                                       *
#*  017150  612J     Remove Currency Decimals = "2"                            *
#*                                                                             *
#*******************************************************************************

S-STEP BF2041-I
{
    ATTRIBUTES
    {
        Type = "Input";
        FocusField = "MIR-TXT-SRC-ID";
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

    INOUT MIR-TXT-LANG-CD
    {
        Key;
        Mandatory;
        Length = "1";
        CodeSource = "EDIT";
        CodeType = "LANG";
        SType = "Selection";
        Label = "Text Description Language";
    }

    INOUT MIR-TXT-SRC-ID
    {
        Key;
        Mandatory;
        Length = "8";
        SType = "Text";
        Label = "Source Module";
    }

    INOUT MIR-TXT-SRC-REF-ID
    {
        Key;
        Mandatory;
        Length = "5";
        SType = "Text";
        Label = "Text Reference Identifier";
    }

}

