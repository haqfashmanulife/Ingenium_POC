# Converted from PathFinder 2.2 to 3.0 Jun 18, 2004 3:12:45 PM EDT

#*******************************************************************************
#*  Component:   BF1520-I.s                                                    *
#*  Description:                                                               *
#*                                                                             *
#*******************************************************************************
#*  Chg#    Release  Description                                               *
#*                                                                             *
#*  014590  6.0      New for release 6.0                                       *
#*  017150  612J     Remove Currency Decimals = "2"                            *
#*                                                                             *
#*******************************************************************************

S-STEP BF1520-I
{
    ATTRIBUTES
    {
        Type = "Input";
        FocusField = "MIR-ACCT-DESC-ID";
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

    INOUT MIR-ACCT-DESC-ID
    {
        Key;
        Mandatory;
        Length = "6";
        SType = "Text";
        Label = "Account Number";
    }

    INOUT MIR-ACCT-DESC-LANG-CD
    {
        Key;
        Mandatory;
        Length = "1";
        CodeSource = "EDIT";
        CodeType = "LANG";
        SType = "Selection";
        Label = "Language";
    }

    INOUT MIR-ACCT-DESC-REASN-CD
    {
        Key;
        Length = "8";
        CodeSource = "DataModel";
        CodeType = "ACCT-DESC-REASN-CD";
        SType = "Selection";
        Label = "Reason";
    }

}

