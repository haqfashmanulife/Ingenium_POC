# Converted from PathFinder 2.2 to 3.0 Jun 18, 2004 3:12:37 PM EDT

#*******************************************************************************
#*  Component:   BF1240-O.s                                                    *
#*  Description:                                                               *
#*                                                                             *
#*******************************************************************************
#*  Chg#    Release  Description                                               *
#*                                                                             *
#*  014590  6.0      New for release 6.0                                       *
#*  017150  612J     Remove Currency Decimals = "2"                            *
#*                                                                             *
#*******************************************************************************

S-STEP BF1240-O
{
    ATTRIBUTES
    {
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

    IN MIR-DOC-CPY-QTY
    {
        DisplayOnly;
        Length = "2";
        SType = "Text";
        Label = "Default Number of Copies";
    }

    IN MIR-DOC-ENVRMNT-PRT-CD
    {
        DisplayOnly;
        Length = "1";
        CodeSource = "DataModel";
        CodeType = "DOC-ENVRMNT-PRT-CD";
        DefaultConstant = "B";
        SType = "Text";
        Label = "Online / Batch Printing";
    }

    IN MIR-DOC-NB-DOC-CD
    {
        DisplayOnly;
        Length = "1";
        CodeSource = "DataModel";
        CodeType = "DOC-NB-DOC-CD";
        SType = "Text";
        Label = "Print System";
    }

    IN MIR-RTE-4-PRTR-ID-T[4]
    {
        DisplayOnly;
        Length = "8";
        FieldGroup = "Table1";
        KeyColumn;
        CodeSource = "XTAB";
        CodeType = "PRTID";
        SType = "Text";
        Label = "Default Routing";
        Index = "1";
    }

}

