# Converted from PathFinder 2.2 to 3.0 Jun 18, 2004 3:12:21 PM EDT

#*******************************************************************************
#*  Component:   BF0314-O.s                                                    *
#*  Description:                                                               *
#*                                                                             *
#*******************************************************************************
#*  Chg#    Release  Description                                               *
#*                                                                             *
#*  014590  6.0      New for release 6.0                                       *
#*  017150  612J     Remove Currency Decimals = "2"                            *
#*                                                                             *
#*******************************************************************************

S-STEP BF0314-O
{
    ATTRIBUTES
    {
        BusinessFunctionType = "List";
        Type = "Output";
        DelEmptyRows;
        FocusField = "MIR-USER-EXIT-ID";
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

    INOUT MIR-USER-EXIT-ID
    {
        Key;
        Length = "4";
        CodeSource = "DataModel";
        CodeType = "USER-EXIT-ID";
        SType = "Selection";
        Label = "User Exit Pointer";
    }

    IN MIR-BTCH-PGM-ID-T[12]
    {
        DisplayOnly;
        Length = "8";
        FieldGroup = "Table12";
        SType = "Text";
        Label = "Batch Program";
        Index = "1";
    }

    IN MIR-ONLN-PGM-ID-T[12]
    {
        DisplayOnly;
        Length = "8";
        FieldGroup = "Table12";
        SType = "Text";
        Label = "Online Program";
        Index = "1";
    }

    IN MIR-USER-EXIT-ID-T[12]
    {
        DisplayOnly;
        Length = "40";
        FieldGroup = "Table12";
        KeyColumn;
        CodeSource = "DataModel";
        CodeType = "USER-EXIT-ID";
        Link;
        SType = "Text";
        Label = "User Exit Pointer";
        Action = "SelectItem";
        Index = "1";
    }

    IN MIR-USER-EXIT-INVOK-CD-T[12]
    {
        DisplayOnly;
        Length = "40";
        FieldGroup = "Table12";
        CodeSource = "DataModel";
        CodeType = "USER-EXIT-INVOK-CD";
        SType = "Text";
        Label = "Invocation Type";
        Index = "1";
    }

}

