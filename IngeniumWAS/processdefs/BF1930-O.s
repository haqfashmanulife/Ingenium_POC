# Converted from PathFinder 2.2 to 3.0 Jun 18, 2004 3:12:53 PM EDT

#*******************************************************************************
#*  Component:   BF1930-O.s                                                    *
#*  Description:                                                               *
#*                                                                             *
#*******************************************************************************
#*  Chg#    Release  Description                                               *
#*                                                                             *
#*  014590  6.0      New for release 6.0                                       *
#*  017150  612J     Remove Currency Decimals = "2"                            *
#*                                                                             *
#*******************************************************************************

S-STEP BF1930-O
{
    ATTRIBUTES
    {
        BusinessFunctionType = "Retrieve";
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

    IN MIR-APPL-ASCL-REL-CTR
    {
        DisplayOnly;
        Length = "5";
        SType = "Text";
        Label = "Number of Security Classes";
    }

    IN MIR-APPL-CRCY-1-1-CD-T[5]
    {
        DisplayOnly;
        Length = "2";
        FieldGroup = "Table5";
        CodeSource = "XTAB";
        CodeType = "CURR";
        SType = "Text";
        Label = "Currency";
        Index = "1";
    }

    IN MIR-APPL-CRCY-2-1-CD-T[5]
    {
        DisplayOnly;
        Length = "2";
        FieldGroup = "Table5";
        CodeSource = "XTAB";
        CodeType = "CURR";
        SType = "Text";
        Label = "Currency";
        Index = "1";
    }

    IN MIR-APPL-CRCY-3-1-CD-T[5]
    {
        DisplayOnly;
        Length = "2";
        FieldGroup = "Table5";
        CodeSource = "XTAB";
        CodeType = "CURR";
        SType = "Text";
        Label = "Currency";
        Index = "1";
    }

    IN MIR-APPL-CRCY-4-1-CD-T[5]
    {
        DisplayOnly;
        Length = "2";
        FieldGroup = "Table5";
        CodeSource = "XTAB";
        CodeType = "CURR";
        SType = "Text";
        Label = "Currency";
        Index = "1";
    }

    IN MIR-APPL-CRCY-5-1-CD-T[5]
    {
        DisplayOnly;
        Length = "2";
        FieldGroup = "Table5";
        CodeSource = "XTAB";
        CodeType = "CURR";
        SType = "Text";
        Label = "Currency";
        Index = "1";
    }

    IN MIR-APPL-CTRY-1-CD-T[5]
    {
        DisplayOnly;
        Length = "2";
        FieldGroup = "Table5";
        KeyColumn;
        CodeSource = "XTAB";
        CodeType = "CNTRY";
        SType = "Text";
        Label = "Country";
        Index = "1";
    }

    IN MIR-APPL-EDIT-LANG-CD
    {
        DisplayOnly;
        Length = "1";
        CodeSource = "XTAB";
        CodeType = "ELANG";
        SType = "Text";
        Label = "Edit Language";
    }

}

