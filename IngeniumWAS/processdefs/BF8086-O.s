# Converted from PathFinder 2.2 to 3.0 Jun 18, 2004 3:13:04 PM EDT

#*******************************************************************************
#*  Component:   BF8086-O.s                                                    *
#*  Description:                                                               *
#*                                                                             *
#*******************************************************************************
#*  Chg#    Release  Description                                               *
#*                                                                             *
#*  016423  602J     New for release 602J                                      *
#*  017150  612J     Remove Currency Decimals = "2"                            *
#*                                                                             *
#*******************************************************************************

S-STEP BF8086-O
{
    ATTRIBUTES
    {
        BusinessFunctionType = "List";
        Type = "Output";
        DelEmptyRows;
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

    IN MIR-BPF-ID-T[100]
    {
        DisplayOnly;
        Length = "15";
        FieldGroup = "Table1";
        CodeSource = "XTAB";
        CodeType = "BPFID";
        SType = "Text";
        Label = "Process Flow Name";
        Index = "1";
    }

    IN MIR-BPF-SECUR-AUD-IND-T[100]
    {
        DisplayOnly;
        Length = "1";
        FieldGroup = "Table1";
        SType = "Indicator";
        Label = "Enable Auditting";
        Index = "1";
    }

    IN MIR-BPF-SECUR-GR-CD-1-T[100]
    {
        DisplayOnly;
        Length = "15";
        FieldGroup = "Table1";
        SType = "Text";
        Label = "Security Group Code";
        Index = "1";
    }

    IN MIR-BPF-SECUR-GR-CD-2-T[100]
    {
        DisplayOnly;
        Length = "15";
        FieldGroup = "Table1";
        CodeSource = "XTAB";
        CodeType = "BPFGR";
        SType = "Text";
        Label = "Security Group";
        Index = "1";
    }

    IN MIR-BPF-SECUR-LVL-NUM-T[100]
    {
        DisplayOnly;
        Length = "3";
        Decimals = "0";
        FieldGroup = "Table1";
        SType = "Number";
        Label = "Security Level";
        Index = "1";
    }

    IN MIR-MSG-SECUR-CLAS-CD-T[100]
    {
        DisplayOnly;
        Length = "1";
        FieldGroup = "Table1";
        CodeSource = "XTAB";
        CodeType = "MSGC";
        SType = "Text";
        Label = "Message Class";
        Index = "1";
    }

    IN MIR-SECUR-CLAS-ID-T[100]
    {
        DisplayOnly;
        Length = "10";
        FieldGroup = "Table1";
        KeyColumn;
        CodeSource = "XTAB";
        CodeType = "USCL";
        Link;
        SType = "Text";
        Label = "Security Class";
        Action = "SelectItem";
        Index = "1";
    }

}

