# Converted from PathFinder 2.2 to 3.0 Jun 18, 2004 3:12:21 PM EDT

#*******************************************************************************
#*  Component:   BF0354-O.s                                                    *
#*  Description:                                                               *
#*                                                                             *
#*******************************************************************************
#*  Chg#    Release  Description                                               *
#*                                                                             *
#*  014590  6.0      New for release 6.0                                       *
#*  017150  612J     Remove Currency Decimals = "2"                            *
#*                                                                             *
#*******************************************************************************

S-STEP BF0354-O
{
    ATTRIBUTES
    {
        BusinessFunctionType = "List";
        Type = "Output";
        DelEmptyRows;
        FocusField = "MIR-RAT-STD-AGE";
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

    INOUT MIR-RAT-STD-AGE
    {
        Key;
        Length = "3";
        Decimals = "0";
        SType = "Number";
        Label = "Maximum Age";
    }

    INOUT MIR-RAT-STD-HT-QTY
    {
        Key;
        Length = "3";
        SType = "Text";
        Label = "Maximum Height";
    }

    INOUT MIR-RAT-STD-SEX-CD
    {
        Key;
        Length = "1";
        CodeSource = "DataModel";
        CodeType = "RAT-STD-SEX-CD";
        SType = "Selection";
        Label = "Sex";
    }

    INOUT MIR-RAT-STD-WGT-QTY
    {
        Key;
        Length = "3";
        SType = "Text";
        Label = "Maximum Weight";
    }

    IN MIR-CO-HWTB-SCALE-CD
    {
        DisplayOnly;
        Length = "1";
        CodeSource = "DataModel";
        CodeType = "CO-HWTB-SCALE-CD";
        SType = "Text";
        Label = "Scale";
    }

    IN MIR-DV-RAT-STD-CM-HT-T[11]
    {
        DisplayOnly;
        Length = "3";
        FieldGroup = "Table11";
        SType = "Text";
        Label = "Maximum Height Cm";
        Index = "1";
    }

    IN MIR-DV-RAT-STD-FT-HT-T[11]
    {
        DisplayOnly;
        Length = "3";
        FieldGroup = "Table11";
        SType = "Text";
        Label = "Maximum Height Ft";
        Index = "1";
    }

    IN MIR-DV-RAT-STD-INCH-HT-T[11]
    {
        DisplayOnly;
        Length = "3";
        FieldGroup = "Table11";
        SType = "Text";
        Label = "Maximum Height In";
        Index = "1";
    }

    IN MIR-DV-RAT-STD-KG-WGT-T[11]
    {
        DisplayOnly;
        Length = "3";
        FieldGroup = "Table11";
        SType = "Text";
        Label = "Maximum Weight Kgs";
        Index = "1";
    }

    IN MIR-DV-RAT-STD-LB-WGT-T[11]
    {
        DisplayOnly;
        Length = "3";
        FieldGroup = "Table11";
        SType = "Text";
        Label = "Maximum Weight Lbs";
        Index = "1";
    }

    IN MIR-MAX-RAT-QTY-T[11]
    {
        DisplayOnly;
        Length = "3";
        FieldGroup = "Table11";
        SType = "Text";
        Label = "Rating Maximum";
        Index = "1";
    }

    IN MIR-MIN-RAT-QTY-T[11]
    {
        DisplayOnly;
        Length = "3";
        FieldGroup = "Table11";
        SType = "Text";
        Label = "Rating Minimum";
        Index = "1";
    }

    IN MIR-RAT-STD-AGE-T[11]
    {
        DisplayOnly;
        Length = "3";
        Decimals = "0";
        FieldGroup = "Table11";
        KeyColumn;
        Link;
        SType = "Text";
        Label = "Maximum Age";
        Action = "SelectItem";
        Index = "1";
    }

    IN MIR-RAT-STD-HT-QTY-T[11]
    {
        DisplayOnly;
        Length = "3";
        FieldGroup = "Table11";
        SType = "Text";
        Label = "Maximum Height";
        Index = "1";
    }

    IN MIR-RAT-STD-SEX-CD-T[11]
    {
        DisplayOnly;
        Length = "1";
        FieldGroup = "Table11";
        CodeSource = "DataModel";
        CodeType = "RAT-STD-SEX-CD";
        SType = "Text";
        Label = "Sex";
        Index = "1";
    }

    IN MIR-RAT-STD-WGT-QTY-T[11]
    {
        DisplayOnly;
        Length = "3";
        FieldGroup = "Table11";
        SType = "Text";
        Label = "Maximum Weight";
        Index = "1";
    }

    IN MIR-RECMND-RAT-QTY-T[11]
    {
        DisplayOnly;
        Length = "3";
        FieldGroup = "Table11";
        SType = "Text";
        Label = "Rating Recommended";
        Index = "1";
    }

}

