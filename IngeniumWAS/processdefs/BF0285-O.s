# Converted from PathFinder 2.2 to 3.0 Jun 18, 2004 3:12:18 PM EDT

#*******************************************************************************
#*  Component:   BF0285-O.s                                                    *
#*  Description:                                                               *
#*                                                                             *
#*******************************************************************************
#*  Chg#    Release  Description                                               *
#*                                                                             *
#*  014590  6.0      New for release 6.0                                       *
#*  017150  612J     Remove Currency Decimals = "2"                            *
#*                                                                             *
#*******************************************************************************

S-STEP BF0285-O
{
    ATTRIBUTES
    {
        BusinessFunctionType = "List";
        Type = "Output";
        DelEmptyRows;
        FocusField = "OKButton";
        FocusFrame = "ButtonFrame";
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

    INOUT MIR-LBILL-CLI-ID
    {
        Key;
        Length = "10";
        SType = "Text";
        Label = "Group";
    }

    INOUT MIR-LBILL-EFF-DT
    {
        Key;
        Length = "10";
        DefaultSession = "LSIR-PRCES-DT";
        SType = "Date";
        Label = "Billing Date";
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

    IN MIR-LBILL-CLI-ID-T[9]
    {
        DisplayOnly;
        Length = "10";
        FieldGroup = "Table9";
        KeyColumn;
        Link;
        SType = "Text";
        Label = "List Billing Group";
        Action = "SelectItem";
        Index = "1";
    }

    IN MIR-LBILL-EFF-DT-T[9]
    {
        DisplayOnly;
        Length = "10";
        FieldGroup = "Table9";
        SType = "Date";
        Label = "Billing Date";
        Index = "1";
    }

}

