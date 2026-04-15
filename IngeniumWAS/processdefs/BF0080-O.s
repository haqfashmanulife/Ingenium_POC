# Converted from PathFinder 2.2 to 3.0 Jun 18, 2004 3:12:13 PM EDT

#*******************************************************************************
#*  Component:   BF0080-O.s                                                    *
#*  Description:                                                               *
#*                                                                             *
#*******************************************************************************
#*  Chg#    Release  Description                                               *
#*                                                                             *
#*  014590  6.0      New for release 6.0                                       *
#*  017150  612J     Remove Currency Decimals = "2"                            *
#*                                                                             *
#*******************************************************************************

S-STEP BF0080-O
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

    IN MIR-MSG-AUD-IND
    {
        DisplayOnly;
        Length = "1";
        SType = "Indicator";
        Label = "Message is to be audited";
    }

    IN MIR-MSG-GUI-IND
    {
        DisplayOnly;
        Length = "1";
        SType = "Indicator";
        Label = "Display message to users?";
    }

    IN MIR-MSG-SEVRTY-CD
    {
        DisplayOnly;
        Length = "1";
        CodeSource = "DataModel";
        CodeType = "MSG-SEVRTY-CD";
        SType = "Text";
        Label = "Message Severity Level";
    }

    IN MIR-MSG-TXT
    {
        DisplayOnly;
        Length = "120";
        SType = "Text";
        Label = "Message Text";
    }

}

