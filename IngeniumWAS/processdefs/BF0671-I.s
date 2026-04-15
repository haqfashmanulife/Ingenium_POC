# Converted from PathFinder 2.2 to 3.0 Jun 18, 2004 3:12:27 PM EDT

#*******************************************************************************
#*  Component:   BF0671-I.s                                                    *
#*  Description:                                                               *
#*                                                                             *
#*******************************************************************************
#*  Chg#    Release  Description                                               *
#*                                                                             *
#*  014590  6.0      New for release 6.0                                       *
#*  017150  612J     Remove Currency Decimals = "2"                            *
#*                                                                             *
#*******************************************************************************

S-STEP BF0671-I
{
    ATTRIBUTES
    {
        BusinessFunctionType = "Create";
        Type = "Input";
        FocusField = "MIR-UVAL-ID";
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

    INOUT MIR-UVAL-AGE
    {
        Key;
        Length = "3";
        Decimals = "0";
        SType = "Number";
        Label = "Age";
    }

    INOUT MIR-UVAL-HIGH-DUR
    {
        Key;
        Mandatory;
        Length = "3";
        DefaultConstant = "000";
        SType = "Text";
        Label = "High Duration Limit";
    }

    INOUT MIR-UVAL-ID
    {
        Key;
        Mandatory;
        Length = "6";
        CodeSource = "EDIT";
        CodeType = "UVAL";
        SType = "Selection";
        Label = "Plan";
    }

    INOUT MIR-UVAL-LOW-DUR
    {
        Key;
        Mandatory;
        Length = "3";
        DefaultConstant = "000";
        SType = "Text";
        Label = "Low Duration Limit";
    }

    INOUT MIR-UVAL-PAR-CD
    {
        Key;
        Mandatory;
        Length = "1";
        CodeSource = "DataModel";
        CodeType = "UVAL-PAR-CD";
        SType = "Selection";
        Label = "Dividend Option";
    }

    INOUT MIR-UVAL-SEX-CD
    {
        Key;
        Mandatory;
        Length = "1";
        CodeSource = "DataModel";
        CodeType = "UVAL-SEX-CD";
        SType = "Selection";
        Label = "Sex";
    }

    INOUT MIR-UVAL-SMKR-CD
    {
        Key;
        Mandatory;
        Length = "1";
        CodeSource = "DataModel";
        CodeType = "UVAL-SMKR-CD";
        SType = "Selection";
        Label = "Smoker";
    }

    INOUT MIR-UVAL-STBL-1-CD
    {
        Key;
        Length = "2";
        CodeSource = "EDIT";
        CodeType = "STB1";
        SType = "Selection";
        Label = "Sub-table 1";
    }

    INOUT MIR-UVAL-STBL-2-CD
    {
        Key;
        Length = "3";
        CodeSource = "EDIT";
        CodeType = "STB2";
        SType = "Selection";
        Label = "Sub-table 2";
    }

    INOUT MIR-UVAL-STBL-3-CD
    {
        Key;
        Length = "5";
        CodeSource = "EDIT";
        CodeType = "STB3";
        SType = "Selection";
        Label = "Sub-table 3";
    }

    INOUT MIR-UVAL-STBL-4-CD
    {
        Key;
        Length = "2";
        CodeSource = "EDIT";
        CodeType = "STB4";
        SType = "Selection";
        Label = "Sub-table 4";
    }

    INOUT MIR-UVAL-TYP-CD
    {
        Key;
        Mandatory;
        Length = "3";
        CodeSource = "EDIT";
        CodeType = "UVREC";
        SType = "Selection";
        Label = "Unit Value Type";
    }

}

