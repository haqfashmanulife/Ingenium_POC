# Converted from PathFinder 2.2 to 3.0 Jun 18, 2004 3:12:29 PM EDT

#*******************************************************************************
#*  Component:   BF0785-O.s                                                    *
#*  Description:                                                               *
#*                                                                             *
#*******************************************************************************
#*  Chg#    Release  Description                                               *
#*                                                                             *
#*  014590  6.0      New for release 6.0                                       *
#*  017150  612J     Remove Currency Decimals = "2"                            *
#*                                                                             *
#*******************************************************************************

S-STEP BF0785-O
{
    ATTRIBUTES
    {
        BusinessFunctionType = "Copy";
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

    IN MIR-LOC-GR-COLCT-ID
    {
        Key;
        DisplayOnly;
        Length = "6";
        CodeSource = "EDIT";
        CodeType = "LOCPT";
        SType = "Text";
        Label = "From Group Location Pointer";
    }

    IN MIR-LOC-GR-COLCT-ID-TO
    {
        Key;
        DisplayOnly;
        Length = "6";
        CodeSource = "EDIT";
        CodeType = "LOCPT";
        SType = "Text";
        Label = "To Group Location Pointer";
    }

    IN MIR-LOC-GR-TYP-CD
    {
        Key;
        DisplayOnly;
        Length = "5";
        CodeSource = "DataModel";
        CodeType = "LOC-GR-TYP-CD";
        SType = "Text";
        Label = "From Type";
    }

    IN MIR-LOC-GR-TYP-CD-TO
    {
        Key;
        DisplayOnly;
        Length = "5";
        CodeSource = "DataModel";
        CodeType = "LOC-GR-TYP-CD";
        SType = "Text";
        Label = "To Type";
    }

}

