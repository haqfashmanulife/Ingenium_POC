# Converted from PathFinder 2.2 to 3.0 Jun 18, 2004 3:12:56 PM EDT

#*******************************************************************************
#*  Component:   BF2122-O.s                                                    *
#*  Description:                                                               *
#*                                                                             *
#*******************************************************************************
#*  Chg#    Release  Description                                               *
#*                                                                             *
#*  014590  6.0      New for release 6.0                                       *
#*  017150  612J     Remove Currency Decimals = "2"                            *
#*                                                                             *
#*******************************************************************************

S-STEP BF2122-O
{
    ATTRIBUTES
    {
        BusinessFunctionType = "Mischg";
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

    IN MIR-CLI-ADDR-TYP-CD
    {
        DisplayOnly;
        Length = "40";
        CodeSource = "EDIT";
        CodeType = "ADTYP";
        SType = "Text";
        Label = "Address Type";
    }

    IN MIR-CLI-ADDR-TYP-CD-T[100]
    {
        DisplayOnly;
        Length = "40";
        FieldGroup = "Table100";
        CodeSource = "EDIT";
        CodeType = "ADTYP";
        SType = "Text";
        Label = "Address Type";
        Index = "1";
    }

    IN MIR-CLI-ID-T[100]
    {
        DisplayOnly;
        Length = "10";
        FieldGroup = "Table100";
        SType = "Text";
        Label = "Assignee Client Number";
        Index = "1";
    }

    IN MIR-DV-CLI-ID
    {
        DisplayOnly;
        Length = "10";
        SType = "Text";
        Label = "Assignee Client Number";
    }

    IN MIR-DV-SELCT-CD-T[100]
    {
        DisplayOnly;
        Length = "1";
        FieldGroup = "Table100";
        SType = "Indicator";
        Label = "Select";
        Index = "1";
    }

    IN MIR-POL-CLI-REL-SUB-CD
    {
        DisplayOnly;
        Length = "40";
        CodeSource = "DataModel";
        CodeType = "POL-CLI-REL-SUB-CD";
        SType = "Text";
        Label = "Policy / Client Relationship Type (2)";
    }

    IN MIR-POL-CLI-REL-SUB-CD-T[100]
    {
        DisplayOnly;
        Length = "40";
        FieldGroup = "Table100";
        CodeSource = "DataModel";
        CodeType = "POL-CLI-REL-SUB-CD";
        SType = "Text";
        Label = "Policy / Client Relationship Type (2)";
        Index = "1";
    }

    IN MIR-POL-CSTAT-CD-T[100]
    {
        DisplayOnly;
        Length = "40";
        FieldGroup = "Table100";
        CodeSource = "DataModel";
        CodeType = "POL-CSTAT-CD";
        SType = "Text";
        Label = "Policy Status";
        Index = "1";
    }

    IN MIR-POL-DIV-OPT-CD
    {
        DisplayOnly;
        Length = "1";
        CodeSource = "DataModel";
        CodeType = "POL-DIV-OPT-CD";
        SType = "Text";
        Label = "Policy Dividend Option";
    }

    IN MIR-POL-DIV-OPT-CD-T[100]
    {
        DisplayOnly;
        Length = "40";
        FieldGroup = "Table100";
        CodeSource = "DataModel";
        CodeType = "POL-DIV-OPT-CD";
        SType = "Text";
        Label = "Policy Dividend Option";
        Index = "1";
    }

    IN MIR-POL-ID-BASE-T[100]
    {
        DisplayOnly;
        Length = "9";
        FieldGroup = "Table100";
        KeyColumn;
        SType = "Text";
        Label = "Policy Id";
        Index = "1";
    }

    IN MIR-POL-ID-SFX-T[100]
    {
        DisplayOnly;
        Length = "1";
        FieldGroup = "Table100";
        SType = "Text";
        Label = "Suffix";
        Index = "1";
    }

    IN MIR-POL-NFO-CD
    {
        DisplayOnly;
        Length = "1";
        CodeSource = "DataModel";
        CodeType = "POL-NFO-CD";
        SType = "Text";
        Label = "Non-forfeiture Option";
    }

    IN MIR-POL-NFO-CD-T[100]
    {
        DisplayOnly;
        Length = "1";
        FieldGroup = "Table100";
        CodeSource = "DataModel";
        CodeType = "POL-NFO-CD";
        SType = "Text";
        Label = "Non-forfeiture Option";
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

    IN MIR-SERV-AGT-ID
    {
        DisplayOnly;
        Length = "6";
        SType = "Text";
        Label = "Servicing Agent Number";
    }

    IN MIR-SERV-AGT-ID-T[100]
    {
        DisplayOnly;
        Length = "6";
        FieldGroup = "Table100";
        SType = "Text";
        Label = "Servicing Agent Number";
        Index = "1";
    }

    IN MIR-CLI-ID
    {
        Key;
        DisplayOnly;
        Length = "10";
        DefaultSession = "MIR-CLI-ID";
        SType = "Text";
        Label = "Owner Client Number";
    }

    IN MIR-DV-OWN-CLI-NM
    {
        DisplayOnly;
        Length = "75";
        SType = "Text";
        Label = "Owner Name";
    }

}

