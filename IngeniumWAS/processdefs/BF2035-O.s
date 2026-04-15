# Converted from PathFinder 2.2 to 3.0 Jun 18, 2004 3:12:55 PM EDT

#*******************************************************************************
#*  Component:   BF2035-O.s                                                    *
#*  Description:                                                               *
#*                                                                             *
#*******************************************************************************
#*  Chg#    Release  Description                                               *
#*                                                                             *
#*  014590  6.0      New for release 6.0                                       *
#*  017150  612J     Remove Currency Decimals = "2"                            *
#*                                                                             *
#*******************************************************************************

S-STEP BF2035-O
{
    ATTRIBUTES
    {
        BusinessFunctionType = "Summary";
        Type = "Output";
        DelEmptyRows;
        FocusField = "MIR-BASIC-PLAN-ID";
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

    INOUT MIR-BASIC-PLAN-ID
    {
        Key;
        Length = "6";
        CodeSource = "EDIT";
        CodeType = "PLAN";
        SType = "Selection";
        Label = "Basic Plan";
    }

    INOUT MIR-LOC-GR-ID
    {
        Key;
        Length = "3";
        CodeSource = "EDIT";
        CodeType = "LOCGP";
        SType = "Selection";
        Label = "Location Group";
    }

    INOUT MIR-SBSDRY-CO-ID
    {
        Key;
        Length = "40";
        CodeSource = "EDIT";
        CodeType = "SUBCO";
        SType = "Selection";
        Label = "Sub Company";
    }

    IN MIR-BASIC-PLAN-ID-T[100]
    {
        DisplayOnly;
        Length = "40";
        FieldGroup = "Table100";
        CodeSource = "EDIT";
        CodeType = "PLAN";
        SType = "Text";
        Label = "Basic Plan";
        Index = "1";
    }

    IN MIR-LOC-GR-ID-T[100]
    {
        DisplayOnly;
        Length = "40";
        FieldGroup = "Table100";
        CodeSource = "EDIT";
        CodeType = "LOCGP";
        SType = "Text";
        Label = "Location Group";
        Index = "1";
    }

    IN MIR-PLAN-PKG-ADB-CD-T[100]
    {
        DisplayOnly;
        Length = "40";
        FieldGroup = "Table100";
        CodeSource = "DataModel";
        CodeType = "PLAN-PKG-ADB-CD";
        SType = "Text";
        Label = "Embedded ADB";
        Index = "1";
    }

    IN MIR-PLAN-PKG-TYP-CD-T[100]
    {
        DisplayOnly;
        Length = "40";
        FieldGroup = "Table100";
        CodeSource = "DataModel";
        CodeType = "PLAN-PKG-TYP-CD";
        SType = "Text";
        Label = "List Type";
        Index = "1";
    }

    IN MIR-PLAN-PKG-WP-CD-T[100]
    {
        DisplayOnly;
        Length = "40";
        FieldGroup = "Table100";
        CodeSource = "DataModel";
        CodeType = "PLAN-PKG-WP-CD";
        SType = "Text";
        Label = "Embedded WP";
        Index = "1";
    }

    IN MIR-SBSDRY-CO-ID-T[100]
    {
        DisplayOnly;
        Length = "40";
        FieldGroup = "Table100";
        CodeSource = "EDIT";
        CodeType = "SUBCO";
        SType = "Text";
        Label = "Sub Company";
        Index = "1";
    }

}

