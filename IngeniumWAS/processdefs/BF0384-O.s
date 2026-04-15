# Converted from PathFinder 2.2 to 3.0 Jun 18, 2004 3:12:22 PM EDT

#*******************************************************************************
#*  Component:   BF0384-O.s                                                    *
#*  Description:                                                               *
#*                                                                             *
#*******************************************************************************
#*  Chg#    Release  Description                                               *
#*                                                                             *
#*  014590  6.0      New for release 6.0                                       *
#*  017150  612J     Remove Currency Decimals = "2"                            *
#*                                                                             *
#*******************************************************************************

S-STEP BF0384-O
{
    ATTRIBUTES
    {
        BusinessFunctionType = "List";
        Type = "Output";
        DelEmptyRows;
        FocusField = "MIR-EVNT-ACT-CD";
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

    INOUT MIR-EVNT-ACT-CD
    {
        Key;
        Length = "4";
        CodeSource = "EDIT";
        CodeType = "DACTN";
        SType = "Selection";
        Label = "Action Type";
    }

    INOUT MIR-EVNT-ACTV-CD
    {
        Key;
        Length = "5";
        CodeSource = "EDIT";
        CodeType = "DACTV";
        SType = "Selection";
        Label = "Activity Type";
    }

    INOUT MIR-EVNT-SRC-CD
    {
        Key;
        Length = "1";
        CodeSource = "DataModel";
        CodeType = "EVNT-SRC-CD";
        SType = "Selection";
        Label = "Source of Log Entry";
    }

    IN MIR-EVNT-ACT-CD-T[13]
    {
        DisplayOnly;
        Length = "4";
        FieldGroup = "Table13";
        CodeSource = "EDIT";
        CodeType = "DACTN";
        SType = "Text";
        Label = "Action Type";
        Index = "1";
    }

    IN MIR-EVNT-ACTV-CD-T[13]
    {
        DisplayOnly;
        Length = "5";
        FieldGroup = "Table13";
        CodeSource = "EDIT";
        CodeType = "DACTV";
        SType = "Text";
        Label = "Activity Type";
        Index = "1";
    }

    IN MIR-EVNT-GR-CD-T[13]
    {
        DisplayOnly;
        Length = "3";
        FieldGroup = "Table13";
        CodeSource = "EDIT";
        CodeType = "GROUP";
        SType = "Text";
        Label = "Category Grouped";
        Index = "1";
    }

    IN MIR-EVNT-SECUR-CD-T[13]
    {
        DisplayOnly;
        Length = "1";
        FieldGroup = "Table13";
        CodeSource = "DataModel";
        CodeType = "EVNT-SECUR-CD";
        SType = "Text";
        Label = "Security Code";
        Index = "1";
    }

    IN MIR-EVNT-SRC-CD-T[13]
    {
        DisplayOnly;
        Length = "1";
        FieldGroup = "Table13";
        CodeSource = "DataModel";
        CodeType = "EVNT-SRC-CD";
        SType = "Text";
        Label = "Source of Log Entry";
        Index = "1";
    }

    IN MIR-EVNT-USE-IND-T[13]
    {
        DisplayOnly;
        Length = "1";
        FieldGroup = "Table13";
        SType = "Indicator";
        Label = "Produce log entries for this log entry type";
        Index = "1";
    }

    IN MIR-MSG-REF-ID-T[13]
    {
        DisplayOnly;
        Length = "6";
        FieldGroup = "Table13";
        Link;
        SType = "Text";
        Label = "Message Source";
        Action = "SelectItem";
        Index = "1";
    }

    IN MIR-MSG-REF-NUM-T[13]
    {
        DisplayOnly;
        Length = "4";
        FieldGroup = "Table13";
        SType = "Text";
        Label = "Message Number";
        Index = "1";
    }

}

