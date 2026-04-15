# Converted from PathFinder 2.2 to 3.0 Jun 18, 2004 3:12:47 PM EDT

#*******************************************************************************
#*  Component:   BF1624-O.s                                                    *
#*  Description:                                                               *
#*                                                                             *
#*******************************************************************************
#*  Chg#    Release  Description                                               *
#*                                                                             *
#*  014590  6.0      New for release 6.0                                       *
#*  017150  612J     Remove Currency Decimals = "2"                            *
#*                                                                             *
#*******************************************************************************

S-STEP BF1624-O
{
    ATTRIBUTES
    {
        BusinessFunctionType = "List";
        Type = "Output";
        DelEmptyRows;
        FocusField = "MIR-PLAN-ID";
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

    INOUT MIR-PLAN-BON-IDT-NUM
    {
        Key;
        Length = "10";
        SType = "Date";
        Label = "Effective Date";
    }

    INOUT MIR-PLAN-ID
    {
        Key;
        Mandatory;
        Length = "40";
        CodeSource = "EDIT";
        CodeType = "PLAN";
        SType = "Selection";
        Label = "Plan";
    }

    INOUT MIR-SBSDRY-CO-ID
    {
        Key;
        Mandatory;
        Length = "40";
        CodeSource = "EDIT";
        CodeType = "SUBCO";
        SType = "Selection";
        Label = "Sub Company";
    }

    IN MIR-PLAN-BON-IDT-NUM-T[11]
    {
        DisplayOnly;
        Length = "10";
        FieldGroup = "Table11";
        SType = "Date";
        Label = "Effective Date";
        Index = "1";
    }

    IN MIR-PLAN-ID-T[11]
    {
        DisplayOnly;
        Length = "40";
        FieldGroup = "Table11";
        KeyColumn;
        CodeSource = "EDIT";
        CodeType = "PLAN";
        Link;
        SType = "Text";
        Label = "Plan";
        Action = "SelectItem";
        Index = "1";
    }

    IN MIR-SBSDRY-CO-ID-T[11]
    {
        DisplayOnly;
        Length = "40";
        FieldGroup = "Table11";
        CodeSource = "EDIT";
        CodeType = "SUBCO";
        SType = "Text";
        Label = "Sub Company";
        Index = "1";
    }

}

