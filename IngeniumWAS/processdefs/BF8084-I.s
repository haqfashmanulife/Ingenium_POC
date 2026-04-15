# Converted from PathFinder 2.2 to 3.0 Jun 18, 2004 3:13:04 PM EDT

#*******************************************************************************
#*  Component:   BF8084-I.s                                                    *
#*  Description:                                                               *
#*                                                                             *
#*******************************************************************************
#*  Chg#    Release  Description                                               *
#*                                                                             *
#*  014590  6.0      New for release 6.0                                       *
#*  016227  602J     Code Cleanup                                              *
#*  017150  612J     Remove Currency Decimals = "2"                            *
#*                                                                             *
#*******************************************************************************

S-STEP BF8084-I
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

    INOUT MIR-BPF-ID
    {
        Key;
        Length = "15";
        CodeSource = "XTAB";
        CodeType = "BPFID";
        SType = "Selection";
        Label = "Process Flow Name";
    }

    INOUT MIR-SECUR-CLAS-ID
    {
        Key;
        Length = "10";
        DefaultSession = "LSIR-SECUR-CLAS-ID";
        CodeSource = "XTAB";
        CodeType = "USCL";
        SType = "Selection";
        Label = "Security Class";
    }

}

