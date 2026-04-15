# Converted from PathFinder 2.2 to 3.0 Jun 18, 2004 3:12:21 PM EDT

#*******************************************************************************
#*  Component:   BF0364-O.s                                                    *
#*  Description:                                                               *
#*                                                                             *
#*******************************************************************************
#*  Chg#    Release  Description                                               *
#*                                                                             *
#*  014590  6.0      New for release 6.0                                       *
#*  017150  612J     Remove Currency Decimals = "2"                            *
#*                                                                             *
#*******************************************************************************

S-STEP BF0364-O
{
    ATTRIBUTES
    {
        BusinessFunctionType = "List";
        Type = "Output";
        DelEmptyRows;
        FocusField = "MIR-CCAS-TST-ID";
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

    INOUT MIR-CCAS-TST-ID
    {
        Key;
        Length = "4";
        SType = "Text";
        Label = "Test Number";
    }

    INOUT MIR-CCAS-TST-SUBSET-ID
    {
        Key;
        Length = "1";
        SType = "Text";
        Label = "Subset Test";
    }

    IN MIR-CCAS-TST-ID-T[12]
    {
        DisplayOnly;
        Length = "4";
        FieldGroup = "Table12";
        KeyColumn;
        Link;
        SType = "Text";
        Label = "Test Number";
        Action = "SelectItem";
        Index = "1";
    }

    IN MIR-CCAS-TST-NM-T[12]
    {
        DisplayOnly;
        Length = "45";
        FieldGroup = "Table12";
        SType = "Text";
        Label = "Test Name";
        Index = "1";
    }

    IN MIR-CCAS-TST-SUBSET-ID-T[12]
    {
        DisplayOnly;
        Length = "1";
        FieldGroup = "Table12";
        SType = "Text";
        Label = "Subset Test";
        Index = "1";
    }

    IN MIR-FLD-ID-T[12]
    {
        DisplayOnly;
        Length = "10";
        FieldGroup = "Table12";
        KeyColumn;
        Link;
        SType = "Text";
        Label = "Defined Field Name";
        Action = "SelectItem";
        Index = "1";
    }

}

