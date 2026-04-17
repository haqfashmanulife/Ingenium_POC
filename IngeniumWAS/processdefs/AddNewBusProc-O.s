# Converted from PathFinder 2.2 to 3.0 Jun 18, 2004 3:12:11 PM EDT

#*******************************************************************************
#*  Component:   AddNewBusProc-O.s                                             *
#*  Description:                                                               *
#*                                                                             *
#*******************************************************************************
#*  Chg#    Release  Description                                               *
#*                                                                             *
#*  016423  602J     New for release 602J                                      *
#*  017150  612J     Remove Currency Decimals = "2"                            *
#*                                                                             *
#FASHUL TEST
#*******************************************************************************

S-STEP AddNewBusProc-O
{
    ATTRIBUTES
    {
        BusinessFunctionType = "Update";
        Type = "Input";
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

    IN MIR-ETBL-TYP-ID
    {
        DisplayOnly;
        Length = "5";
        CodeSource = "XTAB";
        CodeType = "BPFID";
        CodeRefresh;
        SType = "Text";
        Label = "Security Edit Table Name";
    }

    IN MIR-ETBL-VALU-ID
    {
        DisplayOnly;
        Length = "15";
        SType = "Text";
        Label = "Process Flow ID";
    }

    IN MIR-ETBL-LANG-CD
    {
        DisplayOnly;
        Length = "1";
        CodeSource = "XTAB";
        CodeType = "LANG";
        SType = "Text";
        Label = "Language";
    }

    IN MIR-ETBL-DESC-TXT
    {
        DisplayOnly;
        Length = "40";
        SType = "Text";
        Label = "Description to appear on Menu";
    }

    IN MIR-SECUR-CLAS-ID
    {
        DisplayOnly;
        Length = "10";
        CodeSource = "XTAB";
        CodeType = "USCL";
        SType = "Text";
        Label = "Security Class assigned to this flow";
    }

    IN MIR-BPF-SECUR-GR-CD
    {
        DisplayOnly;
        Length = "15";
        CodeSource = "XTAB";
        CodeType = "BPFGR";
        SType = "Text";
        Label = "Security Group (to appear on Menu)";
    }

    IN MIR-BPF-SECUR-LVL-NUM
    {
        DisplayOnly;
        Length = "3";
        Decimals = "0";
        SType = "Number";
        Label = "Security Level (to order items on Menu)";
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

    IN MIR-BPF-SECUR-AUD-IND
    {
        DisplayOnly;
        Length = "1";
        SType = "Indicator";
        Label = "Enable Auditing";
    }

    OUT AddOtherLanguageDescriptionsLink
    {
        Link;
        SType = "Text";
        Action = "AddOtherLanguageDescriptions";
    }

    OUT AddOtherSecurityClassesLink
    {
        Link;
        SType = "Text";
        Action = "AddOtherSecurityClasses";
    }

}

