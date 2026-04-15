# Converted from PathFinder 2.2 to 3.0 Jun 18, 2004 3:12:55 PM EDT

#*******************************************************************************
#*  Component:   BF2051-I.s                                                    *
#*  Description:                                                               *
#*                                                                             *
#*******************************************************************************
#*  Chg#    Release  Description                                               *
#*                                                                             *
#*  014590  6.0      New for release 6.0                                       *
#*  017150  612J     Remove Currency Decimals = "2"                            *
#*                                                                             *
#*******************************************************************************

S-STEP BF2051-I
{
    ATTRIBUTES
    {
        Type = "Input";
        FocusField = "MIR-REQIR-ID";
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

    INOUT MIR-LAB-ID
    {
        Key;
        Length = "3";
        CodeSource = "EDIT";
        CodeType = "LABCD";
        SType = "Selection";
        Label = "Laboratory";
    }

    INOUT MIR-LTST-ID
    {
        Key;
        Mandatory;
        Length = "40";
        CodeSource = "EDIT";
        CodeType = "TSTNO";
        SType = "Selection";
        Label = "Test";
    }

    INOUT MIR-REQIR-ID
    {
        Key;
        Mandatory;
        Length = "5";
        CodeSource = "EDIT";
        CodeType = "REQTC";
        SType = "Selection";
        Label = "Lab Requirement";
    }

    INOUT MIR-REQIR-LTST-RGN-CD
    {
        Key;
        Length = "2";
        CodeSource = "CTLC";
        CodeType = "CLOC";
        FilterFields = "1";
        FilterField1 = "MIR-USER-SESN-CTRY-CD";
        SType = "Selection";
        Label = "Region";
    }

}

