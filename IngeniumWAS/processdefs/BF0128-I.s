# Converted from PathFinder 2.2 to 3.0 Jun 18, 2004 3:12:16 PM EDT

#*******************************************************************************
#*  Component:   BF0128-I.s                                                    *
#*  Description:                                                               *
#*                                                                             *
#*******************************************************************************
#*  Chg#    Release  Description                                               *
#*                                                                             *
#*  014590  6.0      New for release 6.0                                       *
#*  017150  612J     Remove Currency Decimals = "2"                            *
#*                                                                             *
#*******************************************************************************

S-STEP BF0128-I
{
    ATTRIBUTES
    {
        BusinessFunctionType = "Copy";
        Type = "Input";
        FocusField = "MIR-CO-ID";
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

    INOUT MIR-CO-ID
    {
        Length = "2";
        CodeSource = "EDIT";
        CodeType = "COMP";
        DefaultSession = "MIR-CO-ID";
        SType = "Selection";
        Label = "To Company";
    }

    INOUT MIR-DV-RQST-KEY-1-TXT-T[6]
    {
        Key;
        Length = "16";
        FieldGroup = "Table6";
        SType = "Text";
        Label = "From Key";
        Index = "1";
    }

    INOUT MIR-DV-RQST-KEY-2-TXT-T[6]
    {
        Key;
        Length = "16";
        FieldGroup = "Table6";
        SType = "Text";
        Label = "To Key";
        Index = "1";
    }

}

