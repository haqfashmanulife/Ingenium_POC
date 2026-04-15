# Converted from PathFinder 2.2 to 3.0 Jun 18, 2004 3:13:04 PM EDT

#*******************************************************************************
#*  Component:   BF8082-I.s                                                    *
#*  Description:                                                               *
#*                                                                             *
#*******************************************************************************
#*  Chg#    Release  Description                                               *
#*                                                                             *
#*  014590  6.0      New for release 6.0                                       *
#*  016564  6.02J    Correct focus field                                       *
#*  017150  612J     Remove Currency Decimals = "2"                            *
#*                                                                             *
#*******************************************************************************

S-STEP BF8082-I
{
    ATTRIBUTES
    {
        BusinessFunctionType = "Update";
        Type = "Input";
        FocusField = "MIR-BPF-SECUR-GR-CD";
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

    INOUT MIR-BPF-SECUR-AUD-IND
    {
        Length = "1";
        SType = "Indicator";
        Label = "Enable Auditting";
    }

    INOUT MIR-BPF-SECUR-GR-CD
    {
        Length = "15";
        CodeSource = "XTAB";
        CodeType = "BPFGR";
        SType = "Selection";
        Label = "Security Group";
    }

    INOUT MIR-BPF-SECUR-LVL-NUM
    {
        Length = "3";
        Decimals = "0";
        SType = "Number";
        Label = "Security Level";
    }

    INOUT MIR-MSG-SECUR-CLAS-CD
    {
        Length = "1";
        CodeSource = "XTAB";
        CodeType = "MSGC";
        SType = "Selection";
        Label = "Message Class";
    }

    IN MIR-BPF-ID
    {
        Key;
        DisplayOnly;
        Length = "15";
        CodeSource = "XTAB";
        CodeType = "BPFID";
        SType = "Text";
        Label = "Process Flow Name";
    }

    IN MIR-SECUR-CLAS-ID
    {
        Key;
        DisplayOnly;
        Length = "10";
        CodeSource = "XTAB";
        CodeType = "USCL";
        SType = "Text";
        Label = "Security Class";
    }

}

