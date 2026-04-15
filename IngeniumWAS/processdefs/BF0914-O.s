# Converted from PathFinder 2.2 to 3.0 Jun 18, 2004 3:12:31 PM EDT

#*******************************************************************************
#*  Component:   BF0914-O.s                                                    *
#*  Description:                                                               *
#*                                                                             *
#*******************************************************************************
#*  Chg#    Release  Description                                               *
#*                                                                             *
#*  014590  6.0      New for release 6.0                                       *
#*  017150  612J     Remove Currency Decimals = "2"                            *
#*                                                                             *
#*******************************************************************************

S-STEP BF0914-O
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

    INOUT MIR-USTM-EFF-DT
    {
        Key;
        Length = "10";
        DefaultSession = "LSIR-PRCES-DT";
        SType = "Date";
        Label = "Effective Date";
    }

    INOUT MIR-AGT-ID
    {
        Key;
        Mandatory;
        Length = "6";
        SType = "Text";
        Label = "Agent ID";
    }

    INOUT MIR-USTM-EFF-YR
    {
        Key;
        Length = "4";
        SType = "Year";
        Label = "Tax Year";
    }

    INOUT MIR-USTM-SEQ-NUM
    {
        Key;
        Length = "3";
        DefaultConstant = "001";
        SType = "Text";
        Label = "Sequence Number";
    }

    IN MIR-CLI-ID
    {
        DisplayOnly;
        Length = "10";
        SType = "Text";
        Label = "Client Number";
    }

    IN MIR-CLI-TAX-ID
    {
        DisplayOnly;
        Length = "9";
        SType = "Text";
        Label = "Tax Identification Number";
    }

    IN MIR-DV-OWN-CLI-NM
    {
        DisplayOnly;
        Length = "75";
        SType = "Text";
        Label = "Agent Name";
    }

    IN MIR-SBSDRY-CO-ID-T[10]
    {
        DisplayOnly;
        Length = "40";
        FieldGroup = "Table10";
        CodeSource = "EDIT";
        CodeType = "SUBCO";
        SType = "Text";
        Label = "Sub Company";
        Index = "1";
    }

    IN MIR-USTM-EFF-DT-T[10]
    {
        DisplayOnly;
        Length = "10";
        FieldGroup = "Table10";
        SType = "Date";
        Label = "Effective Date";
        Index = "1";
    }

    IN MIR-USTM-FED-TAXWH-AMT-T[10]
    {
        DisplayOnly;
        Length = "13";
        FieldGroup = "Table10";
        SType = "Currency";
        Label = "Federal Tax Withheld";
        Index = "1";
    }

    IN MIR-USTM-SEQ-NUM-T[10]
    {
        DisplayOnly;
        Length = "3";
        FieldGroup = "Table10";
        KeyColumn;
        Link;
        SType = "Text";
        Label = "Sequence Number";
        Action = "SelectItem";
        Index = "1";
    }

    IN MIR-USTM-STAT-CD-T[10]
    {
        DisplayOnly;
        Length = "40";
        FieldGroup = "Table10";
        CodeSource = "DataModel";
        CodeType = "USTM-STAT-CD";
        SType = "Text";
        Label = "Status";
        Index = "1";
    }

    IN MIR-USTM-TAXBL-AMT-T[10]
    {
        DisplayOnly;
        Length = "15";
        FieldGroup = "Table10";
        SType = "Currency";
        Label = "Non-Employee Compensation";
        Index = "1";
    }

    IN MIR-USTM-TAXBL-EVNT-CD-T[10]
    {
        DisplayOnly;
        Length = "40";
        FieldGroup = "Table10";
        CodeSource = "DataModel";
        CodeType = "USTM-TAXBL-EVNT-CD";
        SType = "Text";
        Label = "Tax Reporting Event";
        Index = "1";
    }

}

