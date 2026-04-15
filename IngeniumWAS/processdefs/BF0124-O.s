# Converted from PathFinder 2.2 to 3.0 Jun 18, 2004 3:12:16 PM EDT

#*******************************************************************************
#*  Component:   BF0124-O.s                                                    *
#*  Description:                                                               *
#*                                                                             *
#*******************************************************************************
#*  Chg#    Release  Description                                               *
#*                                                                             *
#*  014590  6.0      New for release 6.0                                       *
#*  017150  612J     Remove Currency Decimals = "2"                            *
#*                                                                             *
#*******************************************************************************

S-STEP BF0124-O
{
    ATTRIBUTES
    {
        BusinessFunctionType = "Copy";
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
        DisplayOnly;
        Length = "2";
        CodeSource = "EDIT";
        CodeType = "COMP";
        DefaultSession = "MIR-CO-ID";
        SType = "Text";
        Label = "To Company";
    }

    IN MIR-DV-RQST-KEY-1-TXT-T[6]
    {
        Key;
        DisplayOnly;
        Length = "12";
        FieldGroup = "Table6";
        SType = "Text";
        Label = "From Key";
        Index = "1";
    }

    IN MIR-DV-RQST-KEY-2-TXT-T[6]
    {
        Key;
        DisplayOnly;
        Length = "12";
        FieldGroup = "Table6";
        SType = "Text";
        Label = "To Key";
        Index = "1";
    }

    IN MIR-DV-FILE-KEY-TXT
    {
        DisplayOnly;
        Length = "56";
        SType = "Text";
        Label = "System generated key fields";
    }

}

