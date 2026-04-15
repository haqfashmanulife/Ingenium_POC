# Converted from PathFinder 2.2 to 3.0 Jun 18, 2004 3:12:19 PM EDT

#*******************************************************************************
#*  Component:   BF0291-O.s                                                    *
#*  Description:                                                               *
#*                                                                             *
#*******************************************************************************
#*  Chg#    Release  Description                                               *
#*                                                                             *
#*  014590  6.0      New for release 6.0                                       *
#*  017150  612J     Remove Currency Decimals = "2"                            *
#*                                                                             *
#*******************************************************************************

S-STEP BF0291-O
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

    IN MIR-ETBL-TYP-ID
    {
        Key;
        DisplayOnly;
        Length = "5";
        SType = "Text";
        Label = "Value Type";
    }

    IN MIR-ETBL-VALU-ID
    {
        Key;
        DisplayOnly;
        Length = "15";
        SType = "Text";
        Label = "Value";
    }

    IN MIR-TTAB-ADMIN-APPL-ID
    {
        Key;
        DisplayOnly;
        Length = "2";
        CodeSource = "EDIT";
        CodeType = "ADMIN";
        SType = "Text";
        Label = "Administration System";
    }

}

