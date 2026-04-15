# Converted from PathFinder 2.2 to 3.0 Jun 18, 2004 3:12:21 PM EDT

#*******************************************************************************
#*  Component:   BF0382-I.s                                                    *
#*  Description:                                                               *
#*                                                                             *
#*******************************************************************************
#*  Chg#    Release  Description                                               *
#*                                                                             *
#*  014590  6.0      New for release 6.0                                       *
#*  017150  612J     Remove Currency Decimals = "2"                            *
#*                                                                             *
#*******************************************************************************

S-STEP BF0382-I
{
    ATTRIBUTES
    {
        Type = "Input";
        FocusField = "MIR-EVNT-SECUR-CD-T[1]";
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

    INOUT MIR-EVNT-GR-CD-T[13]
    {
        Length = "3";
        FieldGroup = "Table1";
        CodeSource = "EDIT";
        CodeType = "GROUP";
        SType = "Selection";
        Label = "Category Grouped";
        Index = "1";
    }

    INOUT MIR-EVNT-SECUR-CD-T[13]
    {
        Mandatory;
        Length = "1";
        FieldGroup = "Table1";
        CodeSource = "DataModel";
        CodeType = "EVNT-SECUR-CD";
        SType = "Selection";
        Label = "Security Code";
        Index = "1";
    }

    INOUT MIR-EVNT-USE-IND-T[13]
    {
        Length = "1";
        FieldGroup = "Table1";
        SType = "Indicator";
        Label = "Produce log entries for this log entry type";
        Index = "1";
    }

    INOUT MIR-MSG-REF-ID-T[13]
    {
        Mandatory;
        Length = "6";
        FieldGroup = "Table1";
        KeyColumn;
        SType = "Text";
        Label = "Message Source";
        Index = "1";
    }

    INOUT MIR-MSG-REF-NUM-T[13]
    {
        Mandatory;
        Length = "4";
        FieldGroup = "Table1";
        SType = "Text";
        Label = "Message Number";
        Index = "1";
    }

    IN MIR-EVNT-ACT-CD
    {
        Key;
        DisplayOnly;
        Length = "4";
        CodeSource = "EDIT";
        CodeType = "DACTN";
        SType = "Text";
        Label = "Action Type";
    }

    IN MIR-EVNT-ACTV-CD
    {
        Key;
        DisplayOnly;
        Length = "5";
        CodeSource = "EDIT";
        CodeType = "DACTV";
        SType = "Text";
        Label = "Activity Type";
    }

    IN MIR-EVNT-SRC-CD
    {
        Key;
        DisplayOnly;
        Length = "1";
        CodeSource = "DataModel";
        CodeType = "EVNT-SRC-CD";
        SType = "Text";
        Label = "Source of Log Entry";
    }

}

