# Converted from PathFinder 2.2 to 3.0 Jun 18, 2004 3:12:45 PM EDT

#*******************************************************************************
#*  Component:   BF1524-O.s                                                    *
#*  Description:                                                               *
#*                                                                             *
#*******************************************************************************
#*  Chg#    Release  Description                                               *
#*                                                                             *
#*  014590  6.0      New for release 6.0                                       *
#*  017150  612J     Remove Currency Decimals = "2"                            *
#*                                                                             *
#*******************************************************************************

S-STEP BF1524-O
{
    ATTRIBUTES
    {
        BusinessFunctionType = "List";
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

    INOUT MIR-ACCT-DESC-ID
    {
        Key;
        Length = "6";
        SType = "Text";
        Label = "Account Number";
    }

    INOUT MIR-ACCT-DESC-LANG-CD
    {
        Key;
        Length = "1";
        CodeSource = "EDIT";
        CodeType = "LANG";
        SType = "Selection";
        Label = "Language";
    }

    INOUT MIR-ACCT-DESC-REASN-CD
    {
        Key;
        Length = "8";
        CodeSource = "DataModel";
        CodeType = "ACCT-DESC-REASN-CD";
        SType = "Selection";
        Label = "Reason";
    }

    IN MIR-ACCT-DESC-ID-T[13]
    {
        DisplayOnly;
        Length = "6";
        FieldGroup = "Table13";
        KeyColumn;
        Link;
        SType = "Text";
        Label = "Account Number";
        Action = "SelectItem";
        Index = "1";
    }

    IN MIR-ACCT-DESC-LANG-CD-T[13]
    {
        DisplayOnly;
        Length = "1";
        FieldGroup = "Table13";
        CodeSource = "EDIT";
        CodeType = "LANG";
        SType = "Text";
        Label = "Language";
        Index = "1";
    }

    IN MIR-ACCT-DESC-REASN-CD-T[13]
    {
        DisplayOnly;
        Length = "8";
        FieldGroup = "Table13";
        CodeSource = "DataModel";
        CodeType = "ACCT-DESC-REASN-CD";
        SType = "Text";
        Label = "Reason";
        Index = "1";
    }

    IN MIR-ACCT-DESC-TXT-T[13]
    {
        DisplayOnly;
        Length = "20";
        FieldGroup = "Table13";
        SType = "Text";
        Label = "Description";
        Index = "1";
    }

}

