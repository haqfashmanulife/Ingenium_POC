# Converted from PathFinder 2.2 to 3.0 Jun 18, 2004 3:13:05 PM EDT

#*******************************************************************************
#*  Component:   BF8121-O.s                                                    *
#*  Description:                                                               *
#*                                                                             *
#*******************************************************************************
#*  Chg#    Release  Description                                               *
#*                                                                             *
#*  014590  6.0      New for release 6.0                                       *
#*  017150  612J     Remove Currency Decimals = "2"                            *
#*                                                                             *
#*******************************************************************************

S-STEP BF8121-O
{
    ATTRIBUTES
    {
        BusinessFunctionType = "Create";
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
        Key;
        DisplayOnly;
        Length = "2";
        CodeSource = "XTAB";
        CodeType = "COMP";
        SType = "Text";
        Label = "Company";
    }

    IN MIR-CTRY-CD
    {
        Key;
        DisplayOnly;
        Length = "2";
        CodeSource = "XTAB";
        CodeType = "CNTRY";
        SType = "Text";
        Label = "Country";
    }

    IN MIR-CTRY-LOC-CD
    {
        Key;
        DisplayOnly;
        Length = "2";
        CodeSource = "EDIT";
        CodeType = "LOCAT";
        SType = "Text";
        Label = "Location";
    }

    IN MIR-CTRY-LOC-TYP-CD
    {
        Key;
        DisplayOnly;
        Length = "5";
        CodeSource = "DataModel";
        CodeType = "CTRY-LOC-TYP-CD";
        SType = "Text";
        Label = "Location Type";
    }

}

