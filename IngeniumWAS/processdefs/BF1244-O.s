# Converted from PathFinder 2.2 to 3.0 Jun 18, 2004 3:12:37 PM EDT

#*******************************************************************************
#*  Component:   BF1244-O.s                                                    *
#*  Description:                                                               *
#*                                                                             *
#*******************************************************************************
#*  Chg#    Release  Description                                               *
#*                                                                             *
#*  014590  6.0      New for release 6.0                                       *
#*  017150  612J     Remove Currency Decimals = "2"                            *
#*                                                                             *
#*******************************************************************************

S-STEP BF1244-O
{
    ATTRIBUTES
    {
        BusinessFunctionType = "List";
        Type = "Output";
        DelEmptyRows;
        FocusField = "MIR-DOC-ID";
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

    INOUT MIR-DOC-ID
    {
        Key;
        Length = "5";
        CodeSource = "EDIT";
        CodeType = "DOCM";
        SType = "Selection";
        Label = "Document Name";
    }

    INOUT MIR-DOC-LANG-CD
    {
        Key;
        Length = "1";
        CodeSource = "EDIT";
        CodeType = "LANG";
        SType = "Selection";
        Label = "Language";
    }

    IN MIR-DOC-ID-T[100]
    {
        DisplayOnly;
        Length = "5";
        FieldGroup = "Table100";
        CodeSource = "EDIT";
        CodeType = "DOCM";
        SType = "Text";
        Label = "Document Name";
        Index = "1";
    }

    IN MIR-DOC-LANG-CD-T[100]
    {
        DisplayOnly;
        Length = "1";
        FieldGroup = "Table100";
        CodeSource = "EDIT";
        CodeType = "LANG";
        SType = "Text";
        Label = "Language";
        Index = "1";
    }

}

