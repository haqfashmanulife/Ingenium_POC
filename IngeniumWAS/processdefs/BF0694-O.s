# Converted from PathFinder 2.2 to 3.0 Jun 18, 2004 3:12:27 PM EDT

#*******************************************************************************
#*  Component:   BF0694-O.s                                                    *
#*  Description:                                                               *
#*                                                                             *
#*******************************************************************************
#*  Chg#    Release  Description                                               *
#*                                                                             *
#*  014590  6.0      New for release 6.0                                       *
#*  017150  612J     Remove Currency Decimals = "2"                            *
#*                                                                             *
#*******************************************************************************

S-STEP BF0694-O
{
    ATTRIBUTES
    {
        BusinessFunctionType = "List";
        Type = "Output";
        DelEmptyRows;
        FocusField = "MIR-CLI-ID";
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

    INOUT MIR-CLI-ID
    {
        Key;
        Mandatory;
        Length = "10";
        DefaultSession = "MIR-CLI-ID";
        SType = "Text";
        Label = "Client Number";
    }

    INOUT MIR-REL-SYS-ID
    {
        Key;
        Length = "8";
        CodeSource = "EDIT";
        CodeType = "SYSTM";
        SType = "Selection";
        Label = "System Policy Residing In";
    }

    INOUT MIR-REL-SYS-REF-ID
    {
        Key;
        Length = "12";
        SType = "Text";
        Label = "Reference Number";
    }

    INOUT MIR-REL-TYP-CD
    {
        Key;
        Length = "40";
        CodeSource = "EDIT";
        CodeType = "RELCD";
        SType = "Selection";
        Label = "Relationship Type";
    }

    IN MIR-REL-DESC-TXT-T[13]
    {
        DisplayOnly;
        Length = "40";
        FieldGroup = "Table13";
        SType = "Text";
        Label = "Relationship Description";
        Index = "1";
    }

    IN MIR-REL-PREV-UPDT-DT-T[13]
    {
        DisplayOnly;
        Length = "10";
        FieldGroup = "Table13";
        SType = "Date";
        Label = "Date Last Changed";
        Index = "1";
    }

    IN MIR-REL-SYS-ID-T[13]
    {
        DisplayOnly;
        Length = "8";
        FieldGroup = "Table13";
        CodeSource = "EDIT";
        CodeType = "SYSTM";
        SType = "Text";
        Label = "System Policy Residing In";
        Index = "1";
    }

    IN MIR-REL-SYS-REF-ID-T[13]
    {
        DisplayOnly;
        Length = "12";
        FieldGroup = "Table13";
        SType = "Text";
        Label = "Reference Number";
        Index = "1";
    }

    IN MIR-REL-TYP-CD-T[13]
    {
        DisplayOnly;
        Length = "40";
        FieldGroup = "Table13";
        CodeSource = "EDIT";
        CodeType = "RELCD";
        SType = "Text";
        Label = "Relationship Type";
        Index = "1";
    }

}

