# Converted from PathFinder 2.2 to 3.0 Jun 18, 2004 3:12:56 PM EDT

#*******************************************************************************
#*  Component:   BF2094-O.s                                                    *
#*  Description:                                                               *
#*                                                                             *
#*******************************************************************************
#*  Chg#    Release  Description                                               *
#*                                                                             *
#*  014590  6.0      New for release 6.0                                       *
#*  017150  612J     Remove Currency Decimals = "2"                            *
#*                                                                             *
#*******************************************************************************

S-STEP BF2094-O
{
    ATTRIBUTES
    {
        BusinessFunctionType = "List";
        Type = "Output";
        DelEmptyRows;
        FocusField = "MIR-UPLD-TTBL-TYP-ID";
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

    INOUT MIR-UPLD-TTBL-VALU-ID
    {
        Key;
        Length = "25";
        SType = "Text";
        Label = "Value";
    }

    INOUT MIR-UPLD-TTBL-TYP-ID
    {
        Key;
        Mandatory;
        Length = "5";
        SType = "Text";
        Label = "Table Name";
    }

    IN MIR-UPLD-TTBL-TYP-ID-T[12]
    {
        DisplayOnly;
        Length = "5";
        FieldGroup = "Table12";
        SType = "Text";
        Label = "Table Name";
        Index = "1";
    }

    IN MIR-UPLD-TTBL-VALU-ID-T[12]
    {
        DisplayOnly;
        Length = "25";
        FieldGroup = "Table12";
        SType = "Text";
        Label = "Value";
        Index = "1";
    }

    IN MIR-UPLD-TTBL-VALU-TXT-T[12]
    {
        DisplayOnly;
        Length = "25";
        FieldGroup = "Table12";
        SType = "Text";
        Label = "Translate Value";
        Index = "1";
    }

}

