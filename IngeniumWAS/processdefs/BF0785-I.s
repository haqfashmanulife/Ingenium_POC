# Converted from PathFinder 2.2 to 3.0 Jun 18, 2004 3:12:29 PM EDT

#*******************************************************************************
#*  Component:   BF0785-I.s                                                    *
#*  Description:                                                               *
#*                                                                             *
#*******************************************************************************
#*  Chg#    Release  Description                                               *
#*                                                                             *
#*  014590  6.0      New for release 6.0                                       *
#*  017150  612J     Remove Currency Decimals = "2"                            *
#*                                                                             *
#*******************************************************************************

S-STEP BF0785-I
{
    ATTRIBUTES
    {
        BusinessFunctionType = "Copy";
        Type = "Input";
        FocusField = "MIR-LOC-GR-COLCT-ID";
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

    INOUT MIR-LOC-GR-COLCT-ID
    {
        Key;
        Mandatory;
        Length = "6";
        CodeSource = "EDIT";
        CodeType = "LOCPT";
        SType = "Selection";
        Label = "From Group Location Pointer";
    }

    INOUT MIR-LOC-GR-COLCT-ID-TO
    {
        Key;
        Mandatory;
        Length = "6";
        CodeSource = "EDIT";
        CodeType = "LOCPT";
        SType = "Selection";
        Label = "To Group Location Pointer";
    }

    INOUT MIR-LOC-GR-TYP-CD
    {
        Key;
        Length = "5";
        CodeSource = "DataModel";
        CodeType = "LOC-GR-TYP-CD";
        SType = "Selection";
        Label = "From Type";
    }

    INOUT MIR-LOC-GR-TYP-CD-TO
    {
        Key;
        Length = "5";
        CodeSource = "DataModel";
        CodeType = "LOC-GR-TYP-CD";
        SType = "Selection";
        Label = "To Type";
    }

}

