# Converted from PathFinder 2.2 to 3.0 Jun 18, 2004 3:12:55 PM EDT

#*******************************************************************************
#*  Component:   BF2042-I.s                                                    *
#*  Description:                                                               *
#*                                                                             *
#*******************************************************************************
#*  Chg#    Release  Description                                               *
#*                                                                             *
#*  014590  6.0      New for release 6.0                                       *
#*  017150  612J     Remove Currency Decimals = "2"                            *
#*                                                                             *
#*******************************************************************************

S-STEP BF2042-I
{
    ATTRIBUTES
    {
        Type = "Input";
        FocusField = "MIR-TXT-STR-TXT";
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

    INOUT MIR-TXT-COMNT-TXT
    {
        Length = "50";
        SType = "Text";
        Label = "Comments";
    }

    INOUT MIR-TXT-MAX-STR-LEN
    {
        Mandatory;
        Length = "3";
        SType = "Text";
        Label = "Text Description Length";
    }

    INOUT MIR-TXT-STR-TXT
    {
        Length = "132";
        SType = "Text";
        Label = "Text Description";
    }

    IN MIR-TXT-LANG-CD
    {
        Key;
        DisplayOnly;
        Length = "1";
        CodeSource = "EDIT";
        CodeType = "LANG";
        SType = "Text";
        Label = "Text Description Language";
    }

    IN MIR-TXT-SRC-ID
    {
        Key;
        DisplayOnly;
        Length = "8";
        SType = "Text";
        Label = "Source Module";
    }

    IN MIR-TXT-SRC-REF-ID
    {
        Key;
        DisplayOnly;
        Length = "5";
        SType = "Text";
        Label = "Text Reference Identifier";
    }

}

