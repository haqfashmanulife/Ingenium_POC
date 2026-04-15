# Converted from PathFinder 2.2 to 3.0 Jun 18, 2004 3:12:54 PM EDT

#*******************************************************************************
#*  Component:   BF1980-O.s                                                    *
#*  Description:                                                               *
#*                                                                             *
#*******************************************************************************
#*  Chg#    Release  Description                                               *
#*                                                                             *
#*  014590  6.0      New for release 6.0                                       *
#*  017150  612J     Remove Currency Decimals = "2"                            *
#*                                                                             *
#*******************************************************************************

S-STEP BF1980-O
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

    IN MIR-SECUR-CLAS-ID
    {
        Key;
        DisplayOnly;
        Length = "10";
        CodeSource = "XTAB";
        CodeType = "USCL";
        SType = "Text";
        Label = "Security Class";
    }

    IN MIR-ASCL-CRCY-1-1-CD-T[10]
    {
        DisplayOnly;
        Length = "2";
        FieldGroup = "Table10";
        CodeSource = "XTAB";
        CodeType = "CURR";
        SType = "Text";
        Label = "Currency";
        Index = "1";
    }

    IN MIR-ASCL-CRCY-2-1-CD-T[10]
    {
        DisplayOnly;
        Length = "2";
        FieldGroup = "Table10";
        CodeSource = "XTAB";
        CodeType = "CURR";
        SType = "Text";
        Label = "Currency";
        Index = "1";
    }

    IN MIR-ASCL-CRCY-3-1-CD-T[10]
    {
        DisplayOnly;
        Length = "2";
        FieldGroup = "Table10";
        CodeSource = "XTAB";
        CodeType = "CURR";
        SType = "Text";
        Label = "Currency";
        Index = "1";
    }

    IN MIR-ASCL-CRCY-4-1-CD-T[10]
    {
        DisplayOnly;
        Length = "2";
        FieldGroup = "Table10";
        CodeSource = "XTAB";
        CodeType = "CURR";
        SType = "Text";
        Label = "Currency";
        Index = "1";
    }

    IN MIR-ASCL-CRCY-5-1-CD-T[10]
    {
        DisplayOnly;
        Length = "2";
        FieldGroup = "Table10";
        CodeSource = "XTAB";
        CodeType = "CURR";
        SType = "Text";
        Label = "Currency";
        Index = "1";
    }

    IN MIR-ASCL-CTRY-1-CD-T[10]
    {
        DisplayOnly;
        Length = "2";
        FieldGroup = "Table10";
        KeyColumn;
        CodeSource = "XTAB";
        CodeType = "CNTRY";
        SType = "Text";
        Label = "Country";
        Index = "1";
    }

}

