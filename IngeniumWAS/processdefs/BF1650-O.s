# Converted from PathFinder 2.2 to 3.0 Jun 18, 2004 3:12:48 PM EDT

#*******************************************************************************
#*  Component:   BF1650-O.s                                                    *
#*  Description:                                                               *
#*                                                                             *
#*******************************************************************************
#*  Chg#    Release  Description                                               *
#*                                                                             *
#*  014590  6.0      New for release 6.0                                       *
#*  017150  612J     Remove Currency Decimals = "2"                            *
#*                                                                             *
#*******************************************************************************

S-STEP BF1650-O
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

    IN MIR-POL-REPL-OVRID-IND
    {
        DisplayOnly;
        Length = "10";
        SType = "Indicator";
        Label = "Override Notification";
    }

    IN MIR-POL-REPL-PRT-DT
    {
        DisplayOnly;
        Length = "10";
        SType = "Date";
        Label = "Last Replacement Print Date";
    }

    IN MIR-POL-REPL-STAT-CD
    {
        DisplayOnly;
        Length = "40";
        CodeSource = "DataModel";
        CodeType = "POL-REPL-STAT-CD";
        SType = "Text";
        Label = "Record Status";
    }

    IN MIR-POL-REPL-TYP-CD
    {
        DisplayOnly;
        Length = "40";
        CodeSource = "DataModel";
        CodeType = "POL-REPL-TYP-CD";
        SType = "Text";
        Label = "Replacement Type";
    }

    IN MIR-REPL-CO-CLI-ID
    {
        DisplayOnly;
        Length = "10";
        SType = "Text";
        Label = "Replaced Company Client Number";
    }

    IN MIR-REPL-POL-ID
    {
        DisplayOnly;
        Length = "20";
        SType = "Text";
        Label = "Replaced Policy Number";
    }

}

