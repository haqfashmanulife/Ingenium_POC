# Converted from PathFinder 2.2 to 3.0 Jun 18, 2004 3:12:48 PM EDT

#*******************************************************************************
#*  Component:   BF1644-O.s                                                    *
#*  Description:                                                               *
#*                                                                             *
#*******************************************************************************
#*  Chg#    Release  Description                                               *
#*                                                                             *
#*  014590  6.0      New for release 6.0                                       *
#*  017150  612J     Remove Currency Decimals = "2"                            *
#*                                                                             *
#*******************************************************************************

S-STEP BF1644-O
{
    ATTRIBUTES
    {
        BusinessFunctionType = "List";
        Type = "Output";
        DelEmptyRows;
        FocusField = "MIR-EVNT-REQIR-TYP-CD";
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

    INOUT MIR-BUS-CLAS-CD
    {
        Key;
        Length = "1";
        CodeSource = "EDIT";
        CodeType = "CLASS";
        SType = "Selection";
        Label = "Class of Business";
    }

    INOUT MIR-EVNT-REQIR-SEQ-NUM
    {
        Key;
        Length = "3";
        SType = "Text";
        Label = "Sequence Number";
    }

    INOUT MIR-EVNT-REQIR-TYP-CD
    {
        Key;
        Mandatory;
        Length = "40";
        CodeSource = "DataModel";
        CodeType = "EVNT-REQIR-TYP-CD";
        SType = "Selection";
        Label = "Requirement";
    }

    INOUT MIR-LOC-GRP-ID
    {
        Key;
        Length = "3";
        CodeSource = "EDIT";
        CodeType = "LOCGP";
        SType = "Selection";
        Label = "Location Group";
    }

    IN MIR-BUS-CLAS-CD-T[13]
    {
        DisplayOnly;
        Length = "40";
        FieldGroup = "Table13";
        CodeSource = "EDIT";
        CodeType = "CLASS";
        SType = "Text";
        Label = "Class of Business";
        Index = "1";
    }

    IN MIR-EVNT-REQIR-SEQ-NUM-T[13]
    {
        DisplayOnly;
        Length = "3";
        FieldGroup = "Table13";
        SType = "Text";
        Label = "Sequence Number";
        Index = "1";
    }

    IN MIR-LOC-GRP-ID-T[13]
    {
        DisplayOnly;
        Length = "40";
        FieldGroup = "Table13";
        KeyColumn;
        CodeSource = "EDIT";
        CodeType = "LOCGP";
        Link;
        SType = "Text";
        Label = "Location Group";
        Action = "SelectItem";
        Index = "1";
    }

    IN MIR-REQIR-ID-T[13]
    {
        DisplayOnly;
        Length = "40";
        FieldGroup = "Table13";
        CodeSource = "EDIT";
        CodeType = "REQTC";
        SType = "Text";
        Label = "Requirement Description";
        Index = "1";
    }

}

