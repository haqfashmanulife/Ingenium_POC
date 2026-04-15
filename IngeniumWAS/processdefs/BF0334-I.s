# Converted from PathFinder 2.2 to 3.0 Jun 18, 2004 3:12:21 PM EDT

#*******************************************************************************
#*  Component:   BF0334-I.s                                                    *
#*  Description:                                                               *
#*                                                                             *
#*******************************************************************************
#*  Chg#    Release  Description                                               *
#*                                                                             *
#*  014590  6.0      New for release 6.0                                       *
#*  017150  612J     Remove Currency Decimals = "2"                            *
#*                                                                             *
#*******************************************************************************

S-STEP BF0334-I
{
    ATTRIBUTES
    {
        BusinessFunctionType = "List";
        Type = "Input";
        FocusField = "MIR-DFLT-REQIR-ID";
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

    INOUT MIR-DFLT-REQIR-AGE
    {
        Key;
        Length = "3";
        Decimals = "0";
        SType = "Number";
        Label = "Maximum Age";
    }

    INOUT MIR-DFLT-REQIR-ID
    {
        Key;
        Length = "6";
        CodeSource = "EDIT";
        CodeType = "AATBL";
        SType = "Selection";
        Label = "Table Name";
    }

    INOUT MIR-DFLT-REQIR-TCR-AMT
    {
        Key;
        Length = "15";
        Decimals = "0";
        SType = "Currency";
        Label = "Maximum Coverage Amount";
    }

    INOUT MIR-LOC-GR-ID
    {
        Key;
        Length = "3";
        CodeSource = "EDIT";
        CodeType = "LOCGP";
        SType = "Selection";
        Label = "Location Group";
    }

    INOUT MIR-OCCP-CLAS-CD
    {
        Key;
        Length = "2";
        CodeSource = "EDIT";
        CodeType = "OCCCL";
        SType = "Selection";
        Label = "Occupation Class";
    }

}

