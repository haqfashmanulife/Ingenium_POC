# Converted from PathFinder 2.2 to 3.0 Jun 18, 2004 3:12:13 PM EDT

#*******************************************************************************
#*  Component:   BF0082-I.s                                                    *
#*  Description:                                                               *
#*                                                                             *
#*******************************************************************************
#*  Chg#    Release  Description                                               *
#*                                                                             *
#*  014590  6.0      New for release 6.0                                       *
#*  017150  612J     Remove Currency Decimals = "2"                            *
#*                                                                             *
#*******************************************************************************

S-STEP BF0082-I
{
    ATTRIBUTES
    {
        Type = "Input";
        FocusField = "MIR-MSG-SEVRTY-CD";
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

    INOUT MIR-MSG-AUD-IND
    {
        Length = "1";
        SType = "Indicator";
        Label = "Message is to be audited";
    }

    INOUT MIR-MSG-GUI-IND
    {
        Length = "1";
        SType = "Indicator";
        Label = "Display message to users?";
    }

    INOUT MIR-MSG-SEVRTY-CD
    {
        Mandatory;
        Length = "1";
        CodeSource = "DataModel";
        CodeType = "MSG-SEVRTY-CD";
        SType = "Selection";
        Label = "Message Severity Level";
    }

    INOUT MIR-MSG-TXT
    {
        Length = "120";
        SType = "Text";
        Label = "Message Text";
    }

    IN MIR-MSG-LANG-CD
    {
        Key;
        DisplayOnly;
        Length = "1";
        CodeSource = "EDIT";
        CodeType = "LANG";
        SType = "Text";
        Label = "Language";
    }

    IN MIR-MSG-REF-ID
    {
        Key;
        DisplayOnly;
        Length = "6";
        SType = "Text";
        Label = "Source Number";
    }

    IN MIR-MSG-REF-NUM
    {
        Key;
        DisplayOnly;
        Length = "4";
        SType = "Text";
        Label = "Message Number";
    }

    IN MIR-MSG-SECUR-CLAS-CD
    {
        Key;
        DisplayOnly;
        Length = "1";
        CodeSource = "XTAB";
        CodeType = "MSGC";
        SType = "Text";
        Label = "Security Class Level";
    }

}

