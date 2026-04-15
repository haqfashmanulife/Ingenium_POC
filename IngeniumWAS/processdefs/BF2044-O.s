# Converted from PathFinder 2.2 to 3.0 Jun 18, 2004 3:12:55 PM EDT

#*******************************************************************************
#*  Component:   BF2044-O.s                                                    *
#*  Description:                                                               *
#*                                                                             *
#*******************************************************************************
#*  Chg#    Release  Description                                               *
#*                                                                             *
#*  014590  6.0      New for release 6.0                                       *
#*  017150  612J     Remove Currency Decimals = "2"                            *
#*                                                                             *
#*******************************************************************************

S-STEP BF2044-O
{
    ATTRIBUTES
    {
        BusinessFunctionType = "List";
        Type = "Output";
        DelEmptyRows;
        FocusField = "MIR-TXT-SRC-ID";
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

    INOUT MIR-TXT-LANG-CD
    {
        Key;
        Length = "1";
        CodeSource = "EDIT";
        CodeType = "LANG";
        SType = "Selection";
        Label = "Text Description Language";
    }

    INOUT MIR-TXT-SRC-ID
    {
        Key;
        Mandatory;
        Length = "8";
        SType = "Text";
        Label = "Source Module";
    }

    INOUT MIR-TXT-SRC-REF-ID
    {
        Key;
        Length = "5";
        SType = "Text";
        Label = "Text Reference Identifier";
    }

    IN MIR-TXT-LANG-CD-T[6]
    {
        DisplayOnly;
        Length = "25";
        FieldGroup = "Table6";
        CodeSource = "EDIT";
        CodeType = "LANG";
        SType = "Text";
        Label = "Text Description Language";
        Index = "1";
    }

    IN MIR-TXT-SRC-REF-ID-T[6]
    {
        DisplayOnly;
        Length = "5";
        FieldGroup = "Table6";
        SType = "Text";
        Label = "Text Reference Identifier";
        Index = "1";
    }

    IN MIR-TXT-STR-TXT-T[6]
    {
        DisplayOnly;
        Length = "132";
        FieldGroup = "Table6";
        SType = "Text";
        Label = "Text Description";
        Index = "1";
    }

}

