# Converted from PathFinder 2.2 to 3.0 Jun 18, 2004 3:13:04 PM EDT

#*******************************************************************************
#*  Component:   BF8082-O.s                                                    *
#*  Description:                                                               *
#*                                                                             *
#*******************************************************************************
#*  Chg#    Release  Description                                               *
#*                                                                             *
#*  014590  6.0      New for release 6.0                                       *
#*  017150  612J     Remove Currency Decimals = "2"                            *
#*                                                                             *
#*******************************************************************************

S-STEP BF8082-O
{
    ATTRIBUTES
    {
        BusinessFunctionType = "Update";
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

    IN MIR-BPF-SECUR-AUD-IND
    {
        DisplayOnly;
        Length = "1";
        SType = "Indicator";
        Label = "Enable Auditting";
    }

    IN MIR-BPF-SECUR-GR-CD
    {
        DisplayOnly;
        Length = "15";
        CodeSource = "XTAB";
        CodeType = "BPFGR";
        SType = "Text";
        Label = "Security Group";
    }

    IN MIR-BPF-SECUR-LVL-NUM
    {
        DisplayOnly;
        Length = "3";
        Decimals = "0";
        SType = "Number";
        Label = "Security Level";
    }

    IN MIR-MSG-SECUR-CLAS-CD
    {
        DisplayOnly;
        Length = "1";
        CodeSource = "XTAB";
        CodeType = "MSGC";
        SType = "Text";
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

