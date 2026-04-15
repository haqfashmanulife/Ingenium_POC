# Converted from PathFinder 2.2 to 3.0 Jun 18, 2004 3:12:56 PM EDT

#*******************************************************************************
#*  Component:   BF2104-O.s                                                    *
#*  Description:                                                               *
#*                                                                             *
#*******************************************************************************
#*  Chg#    Release  Description                                               *
#*                                                                             *
#*  014590  6.0      New for release 6.0                                       *
#*  017150  612J     Remove Currency Decimals = "2"                            *
#*                                                                             *
#*******************************************************************************

S-STEP BF2104-O
{
    ATTRIBUTES
    {
        BusinessFunctionType = "List";
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

    INOUT MIR-RTBL2-ID
    {
        Key;
        Length = "5";
        CodeSource = "EDIT";
        CodeType = "PCNT";
        SType = "Selection";
        Label = "Percentage Table Pointer";
    }

    IN MIR-RTBL2-1-RT-T[11]
    {
        DisplayOnly;
        Signed;
        Length = "7";
        Decimals = "4";
        FieldGroup = "Table11";
        SType = "Percent";
        Label = "Percentage Rate";
        Index = "1";
    }

    IN MIR-RTBL2-ID-T[11]
    {
        DisplayOnly;
        Length = "5";
        FieldGroup = "Table11";
        CodeSource = "EDIT";
        CodeType = "PCNT";
        SType = "Text";
        Label = "Percentage Table Pointer";
        Index = "1";
    }

}

