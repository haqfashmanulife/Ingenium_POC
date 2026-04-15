# Converted from PathFinder 2.2 to 3.0 Jun 18, 2004 3:12:48 PM EDT

#*******************************************************************************
#*  Component:   BF1652-I.s                                                    *
#*  Description:                                                               *
#*                                                                             *
#*******************************************************************************
#*  Chg#    Release  Description                                               *
#*                                                                             *
#*  014590  6.0      New for release 6.0                                       *
#*  017150  612J     Remove Currency Decimals = "2"                            *
#*                                                                             *
#*******************************************************************************

S-STEP BF1652-I
{
    ATTRIBUTES
    {
        BusinessFunctionType = "Update";
        Type = "Input";
        FocusField = "MIR-POL-REPL-TYP-CD";
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

    INOUT MIR-POL-REPL-OVRID-IND
    {
        Length = "10";
        SType = "Indicator";
        Label = "Override Notification";
    }

    INOUT MIR-POL-REPL-PRT-DT
    {
        DisplayOnly;
        Length = "10";
        SType = "Date";
        Label = "Last Replacement Print Date";
    }

    INOUT MIR-POL-REPL-STAT-CD
    {
        DisplayOnly;
        Length = "40";
        CodeSource = "DataModel";
        CodeType = "POL-REPL-STAT-CD";
        SType = "Text";
        Label = "Record Status";
    }

    INOUT MIR-POL-REPL-TYP-CD
    {
        Length = "40";
        CodeSource = "DataModel";
        CodeType = "POL-REPL-TYP-CD";
        SType = "Selection";
        Label = "Replacement Type";
    }

    INOUT MIR-REPL-CO-CLI-ID
    {
        Length = "10";
        SType = "Text";
        Label = "Replaced Company Client Number";
    }

    INOUT MIR-REPL-POL-ID
    {
        Mandatory;
        Length = "20";
        SType = "Text";
        Label = "Replaced Policy Number";
    }

    IN MIR-POL-ID-BASE
    {
        Key;
        DisplayOnly;
        Length = "9";
        DefaultSession = "MIR-POL-ID-BASE";
        SType = "Text";
        Label = "Policy Id";
    }

    IN MIR-POL-ID-SFX
    {
        Key;
        DisplayOnly;
        Length = "1";
        DefaultSession = "MIR-POL-ID-SFX";
        SType = "Text";
        Label = "Suffix";
    }

    IN MIR-POL-REPL-SEQ-NUM
    {
        Key;
        DisplayOnly;
        Length = "3";
        SType = "Text";
        Label = "Sequence Number";
    }

}

