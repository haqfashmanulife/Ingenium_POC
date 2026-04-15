# Converted from PathFinder 2.2 to 3.0 Jun 18, 2004 3:12:27 PM EDT

#*******************************************************************************
#*  Component:   BF0674-O.s                                                    *
#*  Description:                                                               *
#*                                                                             *
#*******************************************************************************
#*  Chg#    Release  Description                                               *
#*                                                                             *
#*  014590  6.0      New for release 6.0                                       *
#*  017150  612J     Remove Currency Decimals = "2"                            *
#*                                                                             *
#*******************************************************************************

S-STEP BF0674-O
{
    ATTRIBUTES
    {
        BusinessFunctionType = "List";
        Type = "Output";
        DelEmptyRows;
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

    INOUT MIR-UVAL-ID
    {
        Key;
        Length = "6";
        CodeSource = "EDIT";
        CodeType = "UVAL";
        SType = "Selection";
        Label = "Plan";
    }

    INOUT MIR-UVAL-PAR-CD
    {
        Key;
        Length = "1";
        CodeSource = "DataModel";
        CodeType = "UVAL-PAR-CD";
        SType = "Selection";
        Label = "Dividend Option";
    }

    INOUT MIR-UVAL-SEX-CD
    {
        Key;
        Length = "1";
        CodeSource = "DataModel";
        CodeType = "UVAL-SEX-CD";
        SType = "Selection";
        Label = "Sex";
    }

    INOUT MIR-UVAL-SMKR-CD
    {
        Key;
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
        Length = "3";
        CodeSource = "EDIT";
        CodeType = "UVREC";
        SType = "Selection";
        Label = "Unit Value Type";
    }

    IN MIR-UVAL-AGE-T[100]
    {
        DisplayOnly;
        Length = "3";
        Decimals = "0";
        FieldGroup = "Table100";
        SType = "Number";
        Label = "Age";
        Index = "1";
    }

    IN MIR-UVAL-HIGH-DUR-T[100]
    {
        DisplayOnly;
        Length = "3";
        FieldGroup = "Table100";
        SType = "Text";
        Label = "High Duration Limit";
        Index = "1";
    }

    IN MIR-UVAL-ID-T[100]
    {
        DisplayOnly;
        Length = "6";
        FieldGroup = "Table100";
        KeyColumn;
        CodeSource = "EDIT";
        CodeType = "UVAL";
        Link;
        SType = "Text";
        Label = "Plan";
        Action = "SelectItem";
        Index = "1";
    }

    IN MIR-UVAL-LOW-DUR-T[100]
    {
        DisplayOnly;
        Length = "3";
        FieldGroup = "Table100";
        SType = "Text";
        Label = "Low Duration Limit";
        Index = "1";
    }

    IN MIR-UVAL-PAR-CD-T[100]
    {
        DisplayOnly;
        Length = "1";
        FieldGroup = "Table100";
        CodeSource = "DataModel";
        CodeType = "UVAL-PAR-CD";
        SType = "Text";
        Label = "Dividend Option";
        Index = "1";
    }

    IN MIR-UVAL-SEX-CD-T[100]
    {
        DisplayOnly;
        Length = "1";
        FieldGroup = "Table100";
        CodeSource = "DataModel";
        CodeType = "UVAL-SEX-CD";
        SType = "Text";
        Label = "Sex";
        Index = "1";
    }

    IN MIR-UVAL-SMKR-CD-T[100]
    {
        DisplayOnly;
        Length = "1";
        FieldGroup = "Table100";
        CodeSource = "DataModel";
        CodeType = "UVAL-SMKR-CD";
        SType = "Text";
        Label = "Smoker";
        Index = "1";
    }

    IN MIR-UVAL-STBL-1-CD-T[100]
    {
        DisplayOnly;
        Length = "2";
        FieldGroup = "Table100";
        CodeSource = "EDIT";
        CodeType = "STB1";
        SType = "Text";
        Label = "Sub-table 1";
        Index = "1";
    }

    IN MIR-UVAL-STBL-2-CD-T[100]
    {
        DisplayOnly;
        Length = "3";
        FieldGroup = "Table100";
        CodeSource = "EDIT";
        CodeType = "STB2";
        SType = "Text";
        Label = "Sub-table 2";
        Index = "1";
    }

    IN MIR-UVAL-STBL-3-CD-T[100]
    {
        DisplayOnly;
        Length = "5";
        FieldGroup = "Table100";
        CodeSource = "EDIT";
        CodeType = "STB3";
        SType = "Text";
        Label = "Sub-table 3";
        Index = "1";
    }

    IN MIR-UVAL-STBL-4-CD-T[100]
    {
        DisplayOnly;
        Length = "2";
        FieldGroup = "Table100";
        CodeSource = "EDIT";
        CodeType = "STB4";
        SType = "Text";
        Label = "Sub-table 4";
        Index = "1";
    }

    IN MIR-UVAL-TYP-CD-T[100]
    {
        DisplayOnly;
        Length = "3";
        FieldGroup = "Table100";
        CodeSource = "EDIT";
        CodeType = "UVREC";
        SType = "Text";
        Label = "Unit Value Type";
        Index = "1";
    }

}

