# Converted from PathFinder 2.2 to 3.0 Jun 18, 2004 3:12:22 PM EDT

#*******************************************************************************
#*  Component:   BF0393-O.s                                                    *
#*  Description:                                                               *
#*                                                                             *
#*******************************************************************************
#*  Chg#    Release  Description                                               *
#*                                                                             *
#*  014590  6.0      New for release 6.0                                       *
#*  017150  612J     Remove Currency Decimals = "2"                            *
#*                                                                             *
#*******************************************************************************

S-STEP BF0393-O
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

    IN MIR-CHKPT-INSTC-ID
    {
        Key;
        DisplayOnly;
        Length = "3";
        SType = "Text";
        Label = "Instance Number";
    }

    IN MIR-CHKPT-PGM-ID
    {
        Key;
        DisplayOnly;
        Length = "8";
        CodeSource = "XTAB";
        CodeType = "PROGM";
        SType = "Text";
        Label = "Program Name";
    }

}

