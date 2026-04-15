# Converted from PathFinder 2.2 to 3.0 Jun 18, 2004 3:12:53 PM EDT

#*******************************************************************************
#*  Component:   BF1960-O.s                                                    *
#*  Description:                                                               *
#*                                                                             *
#*******************************************************************************
#*  Chg#    Release  Description                                               *
#*                                                                             *
#*  014590  6.0      New for release 6.0                                       *
#*  017150  6.1.2 J  Currency Scaling                                          *
#*  017150  612J     Remove Currency Decimals = "2"                            *
#*                                                                             *
#*******************************************************************************

S-STEP BF1960-O
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

    IN MIR-CRCY-CD
    {
        Key;
        DisplayOnly;
        Length = "2";
        CodeSource = "XTAB";
        CodeType = "CURR";
        SType = "Text";
        Label = "Currency";
    }

    IN MIR-CRCY-DCML-SPRT-CD
    {
        DisplayOnly;
        Length = "1";
        CodeSource = "XTAB";
        CodeType = "DECSP";
        SType = "Text";
        Label = "Decimal Separator";
    }

    IN MIR-CRCY-NEG-PLACE-CD
    {
        DisplayOnly;
        Length = "1";
        CodeSource = "DataModel";
        CodeType = "CRCY-NEG-PLACE-CD";
        SType = "Text";
        Label = "Negative Placement";
    }

    IN MIR-CRCY-PLACE-CD
    {
        DisplayOnly;
        Length = "1";
        CodeSource = "DataModel";
        CodeType = "CRCY-PLACE-CD";
        SType = "Text";
        Label = "Currency Placement";
    }

    IN MIR-CRCY-SYMBL-CD
    {
        DisplayOnly;
        Length = "3";
        CodeSource = "XTAB";
        CodeType = "CSYMB";
        SType = "Text";
        Label = "Currency Symbol";
    }

    IN MIR-CRCY-THOU-SPRT-CD
    {
        DisplayOnly;
        Length = "1";
        CodeSource = "XTAB";
        CodeType = "THSSP";
        SType = "Text";
        Label = "1,000 Separator";
    }

    IN MIR-CRCY-SCALE-QTY
    {
        DisplayOnly;
        Length = "1";
        CodeSource = "DataModel";
        CodeType = "CRCY-SCALE-QTY";
        SType = "Text";
        Label = "Currency Scale";
    }

}

