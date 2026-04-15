# Converted from PathFinder 2.2 to 3.0 Jun 18, 2004 3:13:04 PM EDT

#*******************************************************************************
#*  Component:   BF8086-I.s                                                    *
#*  Description:                                                               *
#*                                                                             *
#*******************************************************************************
#*  Chg#    Release  Description                                               *
#*                                                                             *
#*  016423  602J     New for release 602J                                      *
#*  017150  612J     Remove Currency Decimals = "2"                            *
#*                                                                             *
#*******************************************************************************

S-STEP BF8086-I
{
    ATTRIBUTES
    {
        BusinessFunctionType = "List";
        Type = "Input";
        FocusField = "MIR-SECUR-CLAS-ID";
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

    INOUT MIR-SECUR-CLAS-ID
    {
        Key;
        Mandatory;
        Length = "10";
        CodeSource = "XTAB";
        CodeType = "USCL";
        SType = "Selection";
        Label = "Security Class";
    }

    INOUT MIR-BPF-SECUR-GR-CD
    {
        Key;
        Length = "15";
        SType = "Hidden";
        CodeSource = "XTAB";
        CodeType = "BPFGR";
        SType = "Selection";
        Label = "Security Group";
    }

    INOUT MIR-BPF-SECUR-LVL-NUM
    {
        Key;
        Length = "3";
        Decimals = "0";
        SType = "Hidden";
        Label = "Security Level";
    }

    INOUT MIR-BPF-ID
    {
        Key;
        Length = "15";
        SType = "Hidden";
        Label = "Process Flow Name";
    }

}

