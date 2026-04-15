# Converted from PathFinder 2.2 to 3.0 Jun 18, 2004 3:12:53 PM EDT

#*******************************************************************************
#*  Component:   BF1962-I.s                                                    *
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

S-STEP BF1962-I
{
    ATTRIBUTES
    {
        Type = "Input";
        FocusField = "MIR-CRCY-SYMBL-CD";
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

    INOUT MIR-CRCY-DCML-SPRT-CD
    {
        Mandatory;
        Length = "1";
        CodeSource = "XTAB";
        CodeType = "DECSP";
        SType = "Selection";
        Label = "Decimal Separator";
    }

    INOUT MIR-CRCY-NEG-PLACE-CD
    {
        Mandatory;
        Length = "1";
        CodeSource = "DataModel";
        CodeType = "CRCY-NEG-PLACE-CD";
        SType = "Selection";
        Label = "Negative Placement";
    }

    INOUT MIR-CRCY-PLACE-CD
    {
        Mandatory;
        Length = "1";
        CodeSource = "DataModel";
        CodeType = "CRCY-PLACE-CD";
        SType = "Selection";
        Label = "Currency Placement";
    }

    INOUT MIR-CRCY-SYMBL-CD
    {
        Mandatory;
        Length = "3";
        CodeSource = "XTAB";
        CodeType = "CSYMB";
        SType = "Selection";
        Label = "Currency Symbol";
    }

    INOUT MIR-CRCY-THOU-SPRT-CD
    {
        Mandatory;
        Length = "1";
        CodeSource = "XTAB";
        CodeType = "THSSP";
        SType = "Selection";
        Label = "1,000 Separator";
    }

    INOUT MIR-CRCY-SCALE-QTY
    {
        Mandatory;
        Length = "1";
        CodeSource = "DataModel";
        CodeType = "CRCY-SCALE-QTY";
        SType = "Selection";
        Label = "Currency Scale";
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

}

