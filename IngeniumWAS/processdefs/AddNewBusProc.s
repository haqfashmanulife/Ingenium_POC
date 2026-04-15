# Converted from PathFinder 2.2 to 3.0 Jun 18, 2004 3:12:11 PM EDT

#*******************************************************************************
#*  Component:   AddNewBusProc.s                                               *
#*  Description:                                                               *
#*                                                                             *
#*******************************************************************************
#*  Chg#    Release  Description                                               *
#*                                                                             *
#*  016423  602J     New for release 602J                                      *
#*  017150  612J     Remove Currency Decimals = "2"                            *
#*                                                                             *
#*******************************************************************************

S-STEP AddNewBusProc
{
    ATTRIBUTES
    {
        BusinessFunctionType = "Update";
        Type = "Input";
        FocusField = "MIR-ETBL-VALU-ID";
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

    INOUT MIR-ETBL-VALU-ID
    {
        Mandatory;
        Length = "15";
        SType = "Text";
        Label = "Process Flow ID";
    }

    INOUT MIR-ETBL-DESC-TXT
    {
        Mandatory;
        Length = "40";
        SType = "Text";
        Label = "Description to appear on Menu";
    }

    INOUT MIR-SECUR-CLAS-ID
    {
        Mandatory;
        Length = "10";
        CodeSource = "XTAB";
        CodeType = "USCL";
        SType = "Selection";
        Label = "Security Class assigned to this flow";
    }

    INOUT MIR-BPF-SECUR-GR-CD
    {
        Mandatory;
        Length = "15";
        CodeSource = "XTAB";
        CodeType = "BPFGR";
        SType = "Selection";
        Label = "Security Group (to appear on Menu)";
    }

    INOUT MIR-BPF-SECUR-LVL-NUM
    {
        Mandatory;
        Length = "3";
        Decimals = "0";
        SType = "Number";
        Label = "Security Level (to order items on Menu)";
    }

    INOUT MIR-MSG-SECUR-CLAS-CD
    {
        Length = "1";
        CodeSource = "XTAB";
        CodeType = "MSGC";
        SType = "Selection";
        Label = "Message Class";
    }

    INOUT MIR-BPF-SECUR-AUD-IND
    {
        Length = "1";
        SType = "Indicator";
        Label = "Enable Auditing";
    }

    OUT CheckSecurityLevelsLink
    {
        Link;
        SType = "Text";
        Action = "CheckSecurityLevels";
    }

}

