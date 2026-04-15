# Converted from PathFinder 2.2 to 3.0 Jun 18, 2004 3:12:56 PM EDT

#*******************************************************************************
#*  Component:   BF2120-O.s                                                    *
#*  Description:                                                               *
#*                                                                             *
#*******************************************************************************
#*  Chg#    Release  Description                                               *
#*                                                                             *
#*  014590  6.0      New for release 6.0                                       *
#*  017150  612J     Remove Currency Decimals = "2"                            *
#*  UYS133  CTS      Addition of PD group size field                           *
#*                                                                             *
#*******************************************************************************

S-STEP BF2120-O
{
    ATTRIBUTES
    {
        BusinessFunctionType = "Billchg";
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

    IN MIR-BILL-LEAD-TIME-DUR
    {
        DisplayOnly;
        Length = "3";
        SType = "Text";
        Label = "Billing Lead Time";
    }

    IN MIR-BILL-LEAD-TIME-DUR-T[100]
    {
        DisplayOnly;
        Length = "3";
        FieldGroup = "Table100";
        SType = "Text";
        Label = "Billing Lead Time";
        Index = "1";
    }

    IN MIR-CLI-ID-T[100]
    {
        DisplayOnly;
        Length = "10";
        FieldGroup = "Table100";
        SType = "Text";
        Label = "Billing Client Number";
        Index = "1";
    }

    IN MIR-DV-CLI-ID
    {
        DisplayOnly;
        Length = "10";
        SType = "Text";
        Label = "Billing Client Number";
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

    IN MIR-POL-BILL-MODE-CD
    {
        DisplayOnly;
        Length = "40";
        CodeSource = "DataModel";
        CodeType = "POL-BILL-MODE-CD";
        SType = "Text";
        Label = "Premium Mode";
    }

    IN MIR-POL-BILL-MODE-CD-T[100]
    {
        DisplayOnly;
        Length = "40";
        FieldGroup = "Table100";
        CodeSource = "DataModel";
        CodeType = "POL-BILL-MODE-CD";
        SType = "Text";
        Label = "Premium Mode";
        Index = "1";
    }

    IN MIR-POL-BILL-TYP-CD
    {
        DisplayOnly;
        Length = "1";
        CodeSource = "DataModel";
        CodeType = "POL-BILL-TYP-CD";
        SType = "Text";
        Label = "Billing Type";
    }

    IN MIR-POL-BILL-TYP-CD-T[100]
    {
        DisplayOnly;
        Length = "1";
        FieldGroup = "Table100";
        CodeSource = "DataModel";
        CodeType = "POL-BILL-TYP-CD";
        SType = "Text";
        Label = "Billing Type";
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

    IN MIR-POL-CLI-REL-TYP-CD
    {
        DisplayOnly;
        Length = "40";
        CodeSource = "DataModel";
        CodeType = "POL-CLI-REL-TYP-CD";
        SType = "Text";
        Label = "Policy / Client Relationship Type";
    }

    IN MIR-POL-CLI-REL-TYP-CD-T[100]
    {
        DisplayOnly;
        Length = "40";
        FieldGroup = "Table100";
        CodeSource = "DataModel";
        CodeType = "POL-CLI-REL-TYP-CD";
        SType = "Text";
        Label = "Policy / Client Relationship Type";
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

    IN MIR-POL-PAC-DRW-DY
    {
        DisplayOnly;
        Length = "10";
        SType = "Day";
        Label = "Deposit Day";
    }

    IN MIR-POL-PAC-DRW-DY-T[100]
    {
        DisplayOnly;
        Length = "10";
        FieldGroup = "Table100";
        SType = "Day";
        Label = "Deposit Day";
        Index = "1";
    }

    IN MIR-POL-RBILL-CD
    {
        DisplayOnly;
        Length = "1";
        CodeSource = "DataModel";
        CodeType = "POL-RBILL-CD";
        SType = "Text";
        Label = "Restrict Billing";
    }

    IN MIR-POL-RBILL-CD-T[100]
    {
        DisplayOnly;
        Length = "1";
        FieldGroup = "Table100";
        CodeSource = "DataModel";
        CodeType = "POL-RBILL-CD";
        SType = "Text";
        Label = "Restrict Billing";
        Index = "1";
    }

    IN MIR-RBILL-DEPT-ID
    {
        DisplayOnly;
        Length = "20";
        CodeSource = "EDIT";
        CodeType = "DEPT";
        SType = "Text";
        Label = "Department Responsible";
    }

    IN MIR-RBILL-DEPT-ID-T[100]
    {
        DisplayOnly;
        Length = "20";
        FieldGroup = "Table100";
        CodeSource = "EDIT";
        CodeType = "DEPT";
        SType = "Text";
        Label = "Department Responsible";
        Index = "1";
    }

    IN MIR-RBILL-EFF-DT
    {
        DisplayOnly;
        Length = "10";
        SType = "Date";
        Label = "Effective Date";
    }

    IN MIR-RBILL-EFF-DT-T[100]
    {
        DisplayOnly;
        Length = "10";
        FieldGroup = "Table100";
        SType = "Date";
        Label = "Effective Date";
        Index = "1";
    }

    IN MIR-RBILL-END-DT
    {
        DisplayOnly;
        Length = "10";
        SType = "Date";
        Label = "End Date";
    }

    IN MIR-RBILL-END-DT-T[100]
    {
        DisplayOnly;
        Length = "10";
        FieldGroup = "Table100";
        SType = "Date";
        Label = "End Date";
        Index = "1";
    }

    IN MIR-RBILL-MISC-1-CD
    {
        DisplayOnly;
        Length = "40";
        SType = "Text";
        Label = "Restrict Billing Code 1";
    }

    IN MIR-RBILL-MISC-1-CD-T[100]
    {
        DisplayOnly;
        Length = "40";
        FieldGroup = "Table100";
        SType = "Text";
        Label = "Restrict Billing Code 1";
        Index = "1";
    }

    IN MIR-RBILL-MISC-2-CD
    {
        DisplayOnly;
        Length = "40";
        SType = "Text";
        Label = "Restrict Billing Code 2";
    }

    IN MIR-RBILL-MISC-2-CD-T[100]
    {
        DisplayOnly;
        Length = "40";
        FieldGroup = "Table100";
        SType = "Text";
        Label = "Restrict Billing Code 2";
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
#UYS133 CHANGES START
    IN MIR-PD-GR-TYP-CD
    {
        DisplayOnly;
        Length = "1";
        CodeSource = "DataModel";
        CodeType = "PD-GR-TYP-CD";
        SType = "Text";
        Label = "PD group size";
    }
#UYS133 CHANGES END
}

