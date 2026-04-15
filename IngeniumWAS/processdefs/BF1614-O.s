# Converted from PathFinder 2.2 to 3.0 Jun 18, 2004 3:12:47 PM EDT

#*******************************************************************************
#*  Component:   BF1614-O.s                                                    *
#*  Description:                                                               *
#*                                                                             *
#*******************************************************************************
#*  Chg#    Release  Description                                               *
#*                                                                             *
#*  014590  6.0      New for release 6.0                                       *
#*  017150  612J     Remove Currency Decimals = "2"                            *
#*                                                                             *
#*******************************************************************************

S-STEP BF1614-O
{
    ATTRIBUTES
    {
        BusinessFunctionType = "List";
        Type = "Output";
        DelEmptyRows;
        FocusField = "MIR-OCCP-ID";
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

    INOUT MIR-OCCP-ID
    {
        Key;
        Length = "40";
        CodeSource = "EDIT";
        CodeType = "OCCCD";
        SType = "Selection";
        Label = "Occupation";
    }

    IN MIR-OCCP-CLAS-CD-T[11]
    {
        DisplayOnly;
        Length = "2";
        FieldGroup = "Table11";
        CodeSource = "EDIT";
        CodeType = "OCCCL";
        SType = "Text";
        Label = "Occupation Class";
        Index = "1";
    }

    IN MIR-OCCP-ID-T[11]
    {
        DisplayOnly;
        Length = "40";
        FieldGroup = "Table11";
        KeyColumn;
        CodeSource = "EDIT";
        CodeType = "OCCCD";
        Link;
        SType = "Text";
        Label = "Occupation";
        Action = "SelectItem";
        Index = "1";
    }

    IN MIR-OCCP-UWG-REQIR-IND-T[11]
    {
        DisplayOnly;
        Length = "1";
        FieldGroup = "Table11";
        SType = "Indicator";
        Label = "Underwriter review required";
        Index = "1";
    }

}

