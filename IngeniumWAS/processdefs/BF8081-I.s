# Converted from PathFinder 2.2 to 3.0 Jun 18, 2004 3:13:04 PM EDT

#*******************************************************************************
#*  Component:   BF8081-I.s                                                    *
#*  Description:                                                               *
#*                                                                             *
#*******************************************************************************
#*  Chg#    Release  Description                                               *
#*                                                                             *
#*  014590  6.0      New for release 6.0                                       *
#*  017150  612J     Remove Currency Decimals = "2"                            *
#*                                                                             *
#*******************************************************************************

S-STEP BF8081-I
{
    ATTRIBUTES
    {
        BusinessFunctionType = "Create";
        Type = "Input";
        FocusField = "MIR-BPF-ID";
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

    INOUT MIR-BPF-ID
    {
        Key;
        Mandatory;
        Length = "15";
        CodeSource = "XTAB";
        CodeType = "BPFID";
        SType = "Selection";
        Label = "Process Flow Name";
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

}

