# Converted from PathFinder 2.2 to 3.0 Jun 18, 2004 3:12:53 PM EDT

#*******************************************************************************
#*  Component:   BF1932-I.s                                                    *
#*  Description:                                                               *
#*                                                                             *
#*******************************************************************************
#*  Chg#    Release  Description                                               *
#*                                                                             *
#*  014590  6.0      New for release 6.0                                       *
#*  017150  612J     Remove Currency Decimals = "2"                            *
#*                                                                             *
#*******************************************************************************

S-STEP BF1932-I
{
    ATTRIBUTES
    {
        BusinessFunctionType = "Update";
        Type = "Input";
        FocusField = "MIR-APPL-EDIT-LANG-CD";
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

    INOUT MIR-APPL-CRCY-1-1-CD-T[5]
    {
        Length = "2";
        FieldGroup = "Table5";
        CodeSource = "XTAB";
        CodeType = "CURR";
        SType = "Selection";
        Label = "Currency";
        Index = "1";
    }

    INOUT MIR-APPL-CRCY-2-1-CD-T[5]
    {
        Length = "2";
        FieldGroup = "Table5";
        CodeSource = "XTAB";
        CodeType = "CURR";
        SType = "Selection";
        Label = "Currency";
        Index = "1";
    }

    INOUT MIR-APPL-CRCY-3-1-CD-T[5]
    {
        Length = "2";
        FieldGroup = "Table5";
        CodeSource = "XTAB";
        CodeType = "CURR";
        SType = "Selection";
        Label = "Currency";
        Index = "1";
    }

    INOUT MIR-APPL-CRCY-4-1-CD-T[5]
    {
        Length = "2";
        FieldGroup = "Table5";
        CodeSource = "XTAB";
        CodeType = "CURR";
        SType = "Selection";
        Label = "Currency";
        Index = "1";
    }

    INOUT MIR-APPL-CRCY-5-1-CD-T[5]
    {
        Length = "2";
        FieldGroup = "Table5";
        CodeSource = "XTAB";
        CodeType = "CURR";
        SType = "Selection";
        Label = "Currency";
        Index = "1";
    }

    INOUT MIR-APPL-CTRY-1-CD-T[5]
    {
        Length = "2";
        FieldGroup = "Table5";
        KeyColumn;
        CodeSource = "XTAB";
        CodeType = "CNTRY";
        SType = "Selection";
        Label = "Country";
        Index = "1";
    }

    INOUT MIR-APPL-EDIT-LANG-CD
    {
        Length = "1";
        CodeSource = "XTAB";
        CodeType = "ELANG";
        SType = "Selection";
        Label = "Edit Language";
    }

    IN MIR-CO-ID
    {
        Key;
        DisplayOnly;
        Length = "2";
        CodeSource = "XTAB";
        CodeType = "COMP";
        SType = "Text";
        Label = "Company";
    }

}

