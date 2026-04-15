# Converted from PathFinder 2.2 to 3.0 Jun 18, 2004 3:13:50 PM EDT

#*******************************************************************************
#*  Component:   BF2120-P.p                                                    *
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

P-STEP BF2120-P
{
    ATTRIBUTES
    {
        BusinessFunctionId = "2120";
        BusinessFunctionName = "Client Billing Change";
        BusinessFunctionType = "Billchg";
        MirName = "CCWM5060";
    }

    OUT LSIR-RETURN-CD;

    OUT MIR-RETRN-CD;

    INOUT MIR-BILL-LEAD-TIME-DUR
    {
        Length = "3";
        DBTableName = "TPOL";
        SType = "Text";
        Label = "Billing Lead Time";
    }

    INOUT MIR-BILL-LEAD-TIME-DUR-T[100]
    {
        Length = "3";
        FieldGroup = "Table100";
        DBTableName = "TPOL";
        SType = "Text";
        Label = "Billing Lead Time";
        Index = "1";
    }

    INOUT MIR-CLI-ID-T[100]
    {
        Length = "10";
        FieldGroup = "Table100";
        DBTableName = "TPOLC";
        SType = "Text";
        Label = "Billing Client Number";
        Index = "1";
    }

    INOUT MIR-DV-CLI-ID
    {
        Length = "10";
        DBTableName = "TPOLC";
        SType = "Text";
        Label = "Billing Client Number";
    }

    INOUT MIR-DV-SELCT-CD-T[100]
    {
        Length = "1";
        FieldGroup = "Table100";
        DBTableName = "Derived";
        SType = "Indicator";
        Label = "Select";
        Index = "1";
    }

    INOUT MIR-POL-BILL-MODE-CD
    {
        Length = "40";
        CodeSource = "DataModel";
        CodeType = "POL-BILL-MODE-CD";
        DBTableName = "TPOL";
        SType = "Selection";
        Label = "Premium Mode";
    }

    INOUT MIR-POL-BILL-MODE-CD-T[100]
    {
        Length = "40";
        FieldGroup = "Table100";
        CodeSource = "DataModel";
        CodeType = "POL-BILL-MODE-CD";
        DBTableName = "TPOL";
        SType = "Selection";
        Label = "Premium Mode";
        Index = "1";
    }

    INOUT MIR-POL-BILL-TYP-CD
    {
        Length = "1";
        CodeSource = "DataModel";
        CodeType = "POL-BILL-TYP-CD";
        DBTableName = "TPOL";
        SType = "Selection";
        Label = "Billing Type";
    }

    INOUT MIR-POL-BILL-TYP-CD-T[100]
    {
        Length = "1";
        FieldGroup = "Table100";
        CodeSource = "DataModel";
        CodeType = "POL-BILL-TYP-CD";
        DBTableName = "TPOL";
        SType = "Selection";
        Label = "Billing Type";
        Index = "1";
    }

    INOUT MIR-POL-CLI-REL-SUB-CD
    {
        Length = "40";
        CodeSource = "DataModel";
        CodeType = "POL-CLI-REL-SUB-CD";
        DBTableName = "TPOLC";
        SType = "Selection";
        Label = "Policy / Client Relationship Type (2)";
    }

    INOUT MIR-POL-CLI-REL-SUB-CD-T[100]
    {
        Length = "40";
        FieldGroup = "Table100";
        CodeSource = "DataModel";
        CodeType = "POL-CLI-REL-SUB-CD";
        DBTableName = "TPOLC";
        SType = "Selection";
        Label = "Policy / Client Relationship Type (2)";
        Index = "1";
    }

    INOUT MIR-POL-CLI-REL-TYP-CD
    {
        Length = "40";
        CodeSource = "DataModel";
        CodeType = "POL-CLI-REL-TYP-CD";
        DBTableName = "TPOLC";
        SType = "Selection";
        Label = "Policy / Client Relationship Type";
    }

    INOUT MIR-POL-CLI-REL-TYP-CD-T[100]
    {
        Length = "40";
        FieldGroup = "Table100";
        CodeSource = "DataModel";
        CodeType = "POL-CLI-REL-TYP-CD";
        DBTableName = "TPOLC";
        SType = "Selection";
        Label = "Policy / Client Relationship Type";
        Index = "1";
    }

    INOUT MIR-POL-CSTAT-CD-T[100]
    {
        Length = "40";
        FieldGroup = "Table100";
        CodeSource = "DataModel";
        CodeType = "POL-CSTAT-CD";
        DBTableName = "TPOL";
        SType = "Text";
        Label = "Policy Status";
        Index = "1";
    }

    INOUT MIR-POL-ID-BASE-T[100]
    {
        Length = "9";
        FieldGroup = "Table100";
        KeyColumn;
        DBTableName = "TPHST";
        SType = "Text";
        Label = "Policy Id";
        Index = "1";
    }

    INOUT MIR-POL-ID-SFX-T[100]
    {
        Length = "1";
        FieldGroup = "Table100";
        DBTableName = "TPHST";
        SType = "Text";
        Label = "Suffix";
        Index = "1";
    }

    INOUT MIR-POL-PAC-DRW-DY
    {
        Length = "10";
        DBTableName = "TPOL";
        SType = "Day";
        Label = "Deposit Day";
    }

    INOUT MIR-POL-PAC-DRW-DY-T[100]
    {
        Length = "10";
        FieldGroup = "Table100";
        DBTableName = "TPOL";
        SType = "Day";
        Label = "Deposit Day";
        Index = "1";
    }

    INOUT MIR-POL-RBILL-CD
    {
        Length = "1";
        CodeSource = "DataModel";
        CodeType = "POL-RBILL-CD";
        DBTableName = "TPOL";
        SType = "Selection";
        Label = "Restrict Billing";
    }

    INOUT MIR-POL-RBILL-CD-T[100]
    {
        Length = "1";
        FieldGroup = "Table100";
        CodeSource = "DataModel";
        CodeType = "POL-RBILL-CD";
        DBTableName = "TPOL";
        SType = "Selection";
        Label = "Restrict Billing";
        Index = "1";
    }

    INOUT MIR-RBILL-DEPT-ID
    {
        Length = "20";
        CodeSource = "EDIT";
        CodeType = "DEPT";
        DBTableName = "TRSTB";
        SType = "Selection";
        Label = "Department Responsible";
    }

    INOUT MIR-RBILL-DEPT-ID-T[100]
    {
        Length = "20";
        FieldGroup = "Table100";
        CodeSource = "EDIT";
        CodeType = "DEPT";
        DBTableName = "TRSTB";
        SType = "Selection";
        Label = "Department Responsible";
        Index = "1";
    }

    INOUT MIR-RBILL-EFF-DT
    {
        Length = "10";
        DBTableName = "TRSTB";
        SType = "Date";
        Label = "Effective Date";
    }

    INOUT MIR-RBILL-EFF-DT-T[100]
    {
        Length = "10";
        FieldGroup = "Table100";
        DBTableName = "TRSTB";
        SType = "Date";
        Label = "Effective Date";
        Index = "1";
    }

    INOUT MIR-RBILL-END-DT
    {
        Length = "10";
        DBTableName = "TRSTB";
        SType = "Date";
        Label = "End Date";
    }

    INOUT MIR-RBILL-END-DT-T[100]
    {
        Length = "10";
        FieldGroup = "Table100";
        DBTableName = "TRSTB";
        SType = "Date";
        Label = "End Date";
        Index = "1";
    }

    INOUT MIR-RBILL-MISC-1-CD
    {
        Length = "40";
        DBTableName = "TRSTB";
        SType = "Text";
        Label = "Restrict Billing Code 1";
    }

    INOUT MIR-RBILL-MISC-1-CD-T[100]
    {
        Length = "40";
        FieldGroup = "Table100";
        DBTableName = "TRSTB";
        SType = "Text";
        Label = "Restrict Billing Code 1";
        Index = "1";
    }

    INOUT MIR-RBILL-MISC-2-CD
    {
        Length = "40";
        DBTableName = "TRSTB";
        SType = "Text";
        Label = "Restrict Billing Code 2";
    }

    INOUT MIR-RBILL-MISC-2-CD-T[100]
    {
        Length = "40";
        FieldGroup = "Table100";
        DBTableName = "TRSTB";
        SType = "Text";
        Label = "Restrict Billing Code 2";
        Index = "1";
    }

    INOUT MIR-SBSDRY-CO-ID-T[100]
    {
        Length = "40";
        FieldGroup = "Table100";
        CodeSource = "EDIT";
        CodeType = "SUBCO";
        DBTableName = "TPOL";
        SType = "Selection";
        Label = "Sub Company";
        Index = "1";
    }

    IN MIR-CLI-ID
    {
        Key;
        Mandatory;
        Length = "10";
        DBTableName = "TCLI";
        DefaultSession = "MIR-CLI-ID";
        SType = "Text";
        Label = "Owner Client Number";
    }

    IN MIR-DV-PRCES-STATE-CD
    {
        Length = "1";
        DBTableName = "Derived";
        SType = "Hidden";
        Label = "Process State";
    }

    OUT MIR-DV-OWN-CLI-NM
    {
        Length = "75";
        DBTableName = "Derived";
        SType = "Text";
        Label = "Owner Name";
    }
#UYS133 CHANGES START 
    OUT MIR-PD-GR-TYP-CD
    {
        Length = "1";
        CodeSource = "DataModel";
        CodeType = "PD-GR-TYP-CD";
        SType = "Text";
        Label = "PD group size";
    }
#UYS133 CHANGES END 
}

