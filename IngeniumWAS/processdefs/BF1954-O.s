# Converted from PathFinder 2.2 to 3.0 Jun 18, 2004 3:12:53 PM EDT

#*******************************************************************************
#*  Component:   BF1954-O.s                                                    *
#*  Description:                                                               *
#*                                                                             *
#*******************************************************************************
#*  Chg#    Release  Description                                               *
#*                                                                             *
#*  014590  6.0      New for release 6.0                                       *
#*  017150  612J     Remove Currency Decimals = "2"                            *
#*                                                                             *
#*******************************************************************************

S-STEP BF1954-O
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

    INOUT MIR-CO-ID
    {
        Key;
        Length = "2";
        CodeSource = "XTAB";
        CodeType = "COMP";
        SType = "Selection";
        Label = "Company";
    }

    INOUT MIR-CTRY-CD
    {
        Key;
        Length = "2";
        CodeSource = "XTAB";
        CodeType = "CNTRY";
        SType = "Selection";
        Label = "Country";
    }

    IN MIR-CO-ID-T[20]
    {
        DisplayOnly;
        Length = "2";
        FieldGroup = "Table20";
        KeyColumn;
        CodeSource = "XTAB";
        CodeType = "COMP";
        Link;
        SType = "Text";
        Label = "Company";
        Action = "SelectItem";
        Index = "1";
    }

    IN MIR-CTRY-CD-T[20]
    {
        DisplayOnly;
        Length = "2";
        FieldGroup = "Table20";
        CodeSource = "XTAB";
        CodeType = "CNTRY";
        SType = "Text";
        Label = "Country";
        Index = "1";
    }

}

