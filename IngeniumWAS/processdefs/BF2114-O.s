# Converted from PathFinder 2.2 to 3.0 Jun 18, 2004 3:12:56 PM EDT

#*******************************************************************************
#*  Component:   BF2114-O.s                                                    *
#*  Description:                                                               *
#*                                                                             *
#*******************************************************************************
#*  Chg#    Release  Description                                               *
#*                                                                             *
#*  014590  6.0      New for release 6.0                                       *
#*  017150  612J     Remove Currency Decimals = "2"                            *
#*                                                                             *
#*******************************************************************************

S-STEP BF2114-O
{
    ATTRIBUTES
    {
        BusinessFunctionType = "List";
        Type = "Output";
        DelEmptyRows;
        FocusField = "MIR-OVRID-BASE-AGT-ID";
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

    INOUT MIR-OVRID-BASE-AGT-ID
    {
        Key;
        Length = "6";
        SType = "Text";
        Label = "Override";
    }

    INOUT MIR-OVRID-ID
    {
        Key;
        Length = "2";
        SType = "Text";
        Label = "Agent Situation";
    }

    IN MIR-OVRID-BASE-AGT-ID-T[100]
    {
        DisplayOnly;
        Length = "6";
        FieldGroup = "Table100";
        SType = "Text";
        Label = "Override";
        Index = "1";
    }

    IN MIR-OVRID-ID-T[100]
    {
        DisplayOnly;
        Length = "2";
        FieldGroup = "Table100";
        SType = "Text";
        Label = "Agent Situation";
        Index = "1";
    }

}

