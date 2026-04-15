# Converted from PathFinder 2.2 to 3.0 Jun 18, 2004 3:13:05 PM EDT

#*******************************************************************************
#*  Component:   BF8144-O.s                                                    *
#*  Description:                                                               *
#*                                                                             *
#*******************************************************************************
#*  Chg#    Release  Description                                               *
#*                                                                             *
#*  014590  6.0      New for release 6.0                                       *
#*  017150  612J     Remove Currency Decimals = "2"                            *
#*                                                                             *
#*******************************************************************************

S-STEP BF8144-O
{
    ATTRIBUTES
    {
        BusinessFunctionType = "List";
        Type = "Output";
        DelEmptyRows;
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
        Length = "15";
        CodeSource = "XTAB";
        CodeType = "BPFID";
        SType = "Selection";
        Label = "Business Process Flow ID";
    }

    IN MIR-BPF-ID-T[100]
    {
        DisplayOnly;
        Length = "15";
        FieldGroup = "Table100";
        CodeSource = "XTAB";
        CodeType = "BPFID";
        SType = "Text";
        Label = "Business Process Flow ID";
        Index = "1";
    }

}

