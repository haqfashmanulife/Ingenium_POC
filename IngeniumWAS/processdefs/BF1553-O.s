# Converted from PathFinder 2.2 to 3.0 Jun 18, 2004 3:12:45 PM EDT

#*******************************************************************************
#*  Component:   BF1553-O.s                                                    *
#*  Description:                                                               *
#*                                                                             *
#*******************************************************************************
#*  Chg#    Release  Description                                               *
#*                                                                             *
#*  014590  6.0      New for release 6.0                                       *
#*  017150  612J     Remove Currency Decimals = "2"                            *
#*                                                                             *
#*******************************************************************************

S-STEP BF1553-O
{
    ATTRIBUTES
    {
        BusinessFunctionType = "Delete";
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

    IN MIR-CLI-ID
    {
        Key;
        DisplayOnly;
        Length = "10";
        DefaultSession = "MIR-CLI-ID";
        SType = "Text";
        Label = "Client Number";
    }

    IN MIR-CLI-LTST-DT
    {
        Key;
        DisplayOnly;
        Length = "10";
        SType = "Date";
        Label = "Date Test Performed";
    }

    IN MIR-CLI-LTST-SEQ-NUM
    {
        Key;
        DisplayOnly;
        Length = "3";
        SType = "Text";
        Label = "Sequence";
    }

    IN MIR-LTST-ID
    {
        Key;
        DisplayOnly;
        Length = "4";
        CodeSource = "EDIT";
        CodeType = "TSTNO";
        SType = "Text";
        Label = "Test Number";
    }

}

