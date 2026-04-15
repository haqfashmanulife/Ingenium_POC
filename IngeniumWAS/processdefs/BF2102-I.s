# Converted from PathFinder 2.2 to 3.0 Jun 18, 2004 3:12:56 PM EDT

#*******************************************************************************
#*  Component:   BF2102-I.s                                                    *
#*  Description:                                                               *
#*                                                                             *
#*******************************************************************************
#*  Chg#    Release  Description                                               *
#*                                                                             *
#*  014590  6.0      New for release 6.0                                       *
#*  017150  612J     Remove Currency Decimals = "2"                            *
#*                                                                             *
#*******************************************************************************

S-STEP BF2102-I
{
    ATTRIBUTES
    {
        BusinessFunctionType = "Update";
        Type = "Input";
        FocusField = "MIR-RTBL2-1-RT-T[1]";
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

    INOUT MIR-COMM-TYP-CD-T[11]
    {
        Mandatory;
        Length = "1";
        FieldGroup = "Table11";
        KeyColumn;
        CodeSource = "DataModel";
        CodeType = "COMM-TYP-CD";
        SType = "Selection";
        Label = "Commission Type";
        Index = "1";
    }

    INOUT MIR-RTBL2-1-RT-T[11]
    {
        Mandatory;
        Signed;
        Length = "7";
        Decimals = "4";
        FieldGroup = "Table11";
        SType = "Percent";
        Label = "Percentage Rate";
        Index = "1";
    }

    IN MIR-RTBL2-ID
    {
        Key;
        DisplayOnly;
        Length = "5";
        CodeSource = "EDIT";
        CodeType = "PCNT";
        SType = "Text";
        Label = "Percentage Table Pointer";
    }

}

