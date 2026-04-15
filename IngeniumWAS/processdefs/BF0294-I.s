# Converted from PathFinder 2.2 to 3.0 Jun 18, 2004 3:12:20 PM EDT

#*******************************************************************************
#*  Component:   BF0294-I.s                                                    *
#*  Description:                                                               *
#*                                                                             *
#*******************************************************************************
#*  Chg#    Release  Description                                               *
#*                                                                             *
#*  014590  6.0      New for release 6.0                                       *
#*  017150  612J     Remove Currency Decimals = "2"                            *
#*                                                                             *
#*******************************************************************************

S-STEP BF0294-I
{
    ATTRIBUTES
    {
        BusinessFunctionType = "List";
        Type = "Input";
        FocusField = "MIR-ETBL-TYP-ID";
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

    INOUT MIR-ETBL-TYP-ID
    {
        Key;
        Mandatory;
        Length = "5";
        SType = "Text";
        Label = "Value Type";
    }

    INOUT MIR-ETBL-VALU-ID
    {
        Key;
        Length = "15";
        SType = "Text";
        Label = "Value";
    }

    INOUT MIR-TTAB-ADMIN-APPL-ID
    {
        Key;
        Length = "2";
        CodeSource = "EDIT";
        CodeType = "ADMIN";
        SType = "Selection";
        Label = "Administration System";
    }

}

