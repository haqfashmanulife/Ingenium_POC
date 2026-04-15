# Converted from PathFinder 2.2 to 3.0 Jun 18, 2004 3:12:44 PM EDT

#*******************************************************************************
#*  Component:   BF1490-I.s                                                    *
#*  Description:                                                               *
#*                                                                             *
#*******************************************************************************
#*  Chg#    Release  Description                                               *
#*                                                                             *
#*  014590  6.0      New for release 6.0                                       *
#*  017150  612J     Remove Currency Decimals = "2"                            *
#*                                                                             *
#*******************************************************************************

S-STEP BF1490-I
{
    ATTRIBUTES
    {
        BusinessFunctionType = "Retrieve";
        Type = "Input";
        FocusField = "MIR-POL-ID-BASE";
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

    INOUT MIR-POL-ID-BASE
    {
        Key;
        Mandatory;
        Length = "9";
        DefaultSession = "MIR-POL-ID-BASE";
        SType = "Text";
        Label = "Policy Id";
    }

    INOUT MIR-POL-ID-SFX
    {
        Key;
        Length = "1";
        DefaultSession = "MIR-POL-ID-SFX";
        SType = "Text";
        Label = "Suffix";
    }

    INOUT MIR-CVG-NUM
    {
        Key;
        Length = "2";
        DefaultConstant = "00";
        SType = "Text";
        Label = "Coverage Number";
    }

    INOUT MIR-DOC-ID
    {
        Key;
        Length = "40";
        CodeSource = "EDIT";
        CodeType = "DOCM";
        SType = "Selection";
        Label = "Document Name";
    }

    INOUT MIR-DV-PG-FRMT-TST-AMT
    {
        Key;
        Length = "15";
        SType = "Currency";
        Label = "Amount";
    }

    INOUT MIR-DV-PRCES-STATE-CD
    {
        Length = "1";
        SType = "Hidden";
        Label = "Process State";
    }

    INOUT MIR-DV-DOC-PG-NUM
    {
        Length = "3";
        SType = "Hidden";
        Label = "Page";
    }

    INOUT MIR-DV-DOC-MAX-PG-NUM
    {
        Length = "3";
        SType = "Hidden";
        Label = "Max Page";
    }

}

