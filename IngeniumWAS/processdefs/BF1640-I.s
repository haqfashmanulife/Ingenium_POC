# Converted from PathFinder 2.2 to 3.0 Jun 18, 2004 3:12:47 PM EDT

#*******************************************************************************
#*  Component:   BF1640-I.s                                                    *
#*  Description:                                                               *
#*                                                                             *
#*******************************************************************************
#*  Chg#    Release  Description                                               *
#*                                                                             *
#*  014590  6.0      New for release 6.0                                       *
#*  017150  612J     Remove Currency Decimals = "2"                            *
#*                                                                             *
#*******************************************************************************

S-STEP BF1640-I
{
    ATTRIBUTES
    {
        Type = "Input";
        FocusField = "MIR-EVNT-REQIR-TYP-CD";
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

    INOUT MIR-BUS-CLAS-CD
    {
        Key;
        Length = "1";
        CodeSource = "EDIT";
        CodeType = "CLASS";
        SType = "Selection";
        Label = "Class of Business";
    }

    INOUT MIR-EVNT-REQIR-SEQ-NUM
    {
        Key;
        Mandatory;
        Length = "3";
        SType = "Text";
        Label = "Sequence Number";
    }

    INOUT MIR-EVNT-REQIR-TYP-CD
    {
        Key;
        Mandatory;
        Length = "40";
        CodeSource = "DataModel";
        CodeType = "EVNT-REQIR-TYP-CD";
        SType = "Selection";
        Label = "Requirement";
    }

    INOUT MIR-LOC-GRP-ID
    {
        Key;
        Mandatory;
        Length = "3";
        CodeSource = "EDIT";
        CodeType = "LOCGP";
        SType = "Selection";
        Label = "Location Group";
    }

}

