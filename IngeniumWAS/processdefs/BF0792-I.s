# Converted from PathFinder 2.2 to 3.0 Jun 18, 2004 3:12:29 PM EDT

#*******************************************************************************
#*  Component:   BF0792-I.s                                                    *
#*  Description:                                                               *
#*                                                                             *
#*******************************************************************************
#*  Chg#    Release  Description                                               *
#*                                                                             *
#*  014590  6.0      New for release 6.0                                       *
#*  017150  612J     Remove Currency Decimals = "2"                            *
#*                                                                             *
#*******************************************************************************

S-STEP BF0792-I
{
    ATTRIBUTES
    {
        Type = "Input";
        FocusField = "MIR-PLAN-DIV-DFLT-IND";
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

    INOUT MIR-PLAN-DIV-ALLOC-CD
    {
        Length = "1";
        CodeSource = "DataModel";
        CodeType = "PLAN-DIV-ALLOC-CD";
        SType = "Selection";
        Label = "Dividend Reallocation";
    }

    INOUT MIR-PLAN-DIV-DFLT-IND
    {
        Length = "1";
        SType = "Indicator";
        Label = "Default Dividend Option";
    }

    IN MIR-LOC-GR-ID
    {
        Key;
        DisplayOnly;
        Length = "3";
        CodeSource = "EDIT";
        CodeType = "LOCGP";
        SType = "Text";
        Label = "Location Group";
    }

    IN MIR-PLAN-DIV-OPT-CD
    {
        Key;
        DisplayOnly;
        Length = "1";
        CodeSource = "DataModel";
        CodeType = "PLAN-DIV-OPT-CD";
        SType = "Text";
        Label = "Dividend Option";
    }

    IN MIR-PLAN-ID
    {
        Key;
        DisplayOnly;
        Length = "40";
        CodeSource = "EDIT";
        CodeType = "PLAN";
        SType = "Text";
        Label = "Plan";
    }

}

