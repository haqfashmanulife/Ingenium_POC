# Converted from PathFinder 2.2 to 3.0 Jun 18, 2004 3:13:50 PM EDT

#*******************************************************************************
#*  Component:   BF2122-P.p                                                    *
#*  Description:                                                               *
#*                                                                             *
#*******************************************************************************
#*  Chg#    Release  Description                                               *
#*                                                                             *
#*  014590  6.0      New for release 6.0                                       *
#*  017150  612J     Remove Currency Decimals = "2"                            *
#*                                                                             *
#*******************************************************************************

P-STEP BF2122-P
{
    ATTRIBUTES
    {
        BusinessFunctionId = "2122";
        BusinessFunctionName = "Client Miscellaneous Billing Change";
        BusinessFunctionType = "Mischg";
        MirName = "CCWM5060";
    }

    OUT LSIR-RETURN-CD;

    OUT MIR-RETRN-CD;

    INOUT MIR-CLI-ADDR-TYP-CD
    {
        Length = "40";
        CodeSource = "EDIT";
        CodeType = "ADTYP";
        DBTableName = "TPOLC";
        SType = "Selection";
        Label = "Address Type";
    }

    INOUT MIR-CLI-ADDR-TYP-CD-T[100]
    {
        Length = "40";
        FieldGroup = "Table100";
        CodeSource = "EDIT";
        CodeType = "ADTYP";
        DBTableName = "TPOLC";
        SType = "Selection";
        Label = "Address Type";
        Index = "1";
    }

    INOUT MIR-CLI-ID-T[100]
    {
        Length = "10";
        FieldGroup = "Table100";
        DBTableName = "TPOLC";
        SType = "Text";
        Label = "Assignee Client Number";
        Index = "1";
    }

    INOUT MIR-DV-CLI-ID
    {
        Length = "10";
        DBTableName = "TPOLC";
        SType = "Text";
        Label = "Assignee Client Number";
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

    INOUT MIR-POL-DIV-OPT-CD
    {
        Length = "1";
        CodeSource = "DataModel";
        CodeType = "POL-DIV-OPT-CD";
        DBTableName = "TPOL";
        SType = "Selection";
        Label = "Policy Dividend Option";
    }

    INOUT MIR-POL-DIV-OPT-CD-T[100]
    {
        Length = "40";
        FieldGroup = "Table100";
        CodeSource = "DataModel";
        CodeType = "POL-DIV-OPT-CD";
        DBTableName = "TPOL";
        SType = "Selection";
        Label = "Policy Dividend Option";
        Index = "1";
    }

    INOUT MIR-POL-ID-BASE-T[100]
    {
        Length = "9";
        FieldGroup = "Table100";
        KeyColumn;
        DBTableName = "TPOL";
        SType = "Text";
        Label = "Policy Id";
        Index = "1";
    }

    INOUT MIR-POL-ID-SFX-T[100]
    {
        Length = "1";
        FieldGroup = "Table100";
        DBTableName = "TPOL";
        SType = "Text";
        Label = "Suffix";
        Index = "1";
    }

    INOUT MIR-POL-NFO-CD
    {
        Length = "1";
        CodeSource = "DataModel";
        CodeType = "POL-NFO-CD";
        DBTableName = "TPOL";
        SType = "Selection";
        Label = "Non-forfeiture Option";
    }

    INOUT MIR-POL-NFO-CD-T[100]
    {
        Length = "1";
        FieldGroup = "Table100";
        CodeSource = "DataModel";
        CodeType = "POL-NFO-CD";
        DBTableName = "TPOL";
        SType = "Selection";
        Label = "Non-forfeiture Option";
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

    INOUT MIR-SERV-AGT-ID
    {
        Length = "6";
        DBTableName = "TPOL";
        SType = "Text";
        Label = "Servicing Agent Number";
    }

    INOUT MIR-SERV-AGT-ID-T[100]
    {
        Length = "6";
        FieldGroup = "Table100";
        DBTableName = "TPOL";
        SType = "Text";
        Label = "Servicing Agent Number";
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

}

