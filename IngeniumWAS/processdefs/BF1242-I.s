# Converted from PathFinder 2.2 to 3.0 Jun 18, 2004 3:12:37 PM EDT

#*******************************************************************************
#*  Component:   BF1242-I.s                                                    *
#*  Description:                                                               *
#*                                                                             *
#*******************************************************************************
#*  Chg#    Release  Description                                               *
#*                                                                             *
#*  014590  6.0      New for release 6.0                                       *
#*  017150  612J     Remove Currency Decimals = "2"                            *
#*                                                                             *
#*******************************************************************************

S-STEP BF1242-I
{
    ATTRIBUTES
    {
        Type = "Input";
        FocusField = "MIR-DOC-CPY-QTY";
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

    INOUT MIR-DOC-CPY-QTY
    {
        Mandatory;
        Length = "2";
        SType = "Text";
        Label = "Default Number of Copies";
    }

    INOUT MIR-DOC-ENVRMNT-PRT-CD
    {
        Mandatory;
        Length = "1";
        CodeSource = "DataModel";
        CodeType = "DOC-ENVRMNT-PRT-CD";
        DefaultConstant = "B";
        SType = "Selection";
        Label = "Online / Batch Printing";
    }

    INOUT MIR-DOC-NB-DOC-CD
    {
        Mandatory;
        Length = "1";
        CodeSource = "DataModel";
        CodeType = "DOC-NB-DOC-CD";
        SType = "Selection";
        Label = "Print System";
    }

    INOUT MIR-RTE-4-PRTR-ID-T[4]
    {
        Length = "8";
        FieldGroup = "Table1";
        KeyColumn;
        CodeSource = "XTAB";
        CodeType = "PRTID";
        SType = "Selection";
        Label = "Default Routing";
        Index = "1";
    }

    IN MIR-DOC-ID
    {
        Key;
        DisplayOnly;
        Length = "5";
        CodeSource = "EDIT";
        CodeType = "DOCM";
        SType = "Text";
        Label = "Document Name";
    }

    IN MIR-DOC-LANG-CD
    {
        Key;
        DisplayOnly;
        Length = "1";
        CodeSource = "EDIT";
        CodeType = "LANG";
        SType = "Text";
        Label = "Language";
    }

}

