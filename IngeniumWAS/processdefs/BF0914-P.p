# Converted from PathFinder 2.2 to 3.0 Jun 18, 2004 3:13:31 PM EDT

#*******************************************************************************
#*  Component:   BF0914-P.p                                                    *
#*  Description:                                                               *
#*                                                                             *
#*******************************************************************************
#*  Chg#    Release  Description                                               *
#*                                                                             *
#*  014590  6.0      New for release 6.0                                       *
#*  017150  612J     Remove Currency Decimals = "2"                            *
#*                                                                             *
#*******************************************************************************

P-STEP BF0914-P
{
    ATTRIBUTES
    {
        BusinessFunctionId = "0914";
        BusinessFunctionName = "U.S. Agent Taxable Event List";
        BusinessFunctionType = "List";
        MirName = "CCWM4150";
    }

    OUT LSIR-RETURN-CD;

    OUT MIR-RETRN-CD;

    INOUT MIR-AGT-ID
    {
        Key;
        Mandatory;
        Length = "6";
        DBTableName = "TAG";
        SType = "Text";
        Label = "Agent ID";
    }

    INOUT MIR-USTM-EFF-DT
    {
        Key;
        Length = "10";
        DBTableName = "TUSTM";
        DefaultSession = "LSIR-PRCES-DT";
        SType = "Date";
        Label = "Effective Date";
    }

    INOUT MIR-USTM-EFF-YR
    {
        Key;
        Length = "4";
        DBTableName = "TUSTM";
        SType = "Year";
        Label = "Tax Year";
    }

    INOUT MIR-USTM-SEQ-NUM
    {
        Key;
        Length = "3";
        DBTableName = "TUSTM";
        DefaultConstant = "001";
        SType = "Text";
        Label = "Sequence Number";
    }

    OUT MIR-CLI-ID
    {
        Length = "10";
        DBTableName = "TCLI";
        SType = "Text";
        Label = "Client Number";
    }

    OUT MIR-CLI-TAX-ID
    {
        Length = "9";
        DBTableName = "TCLI";
        SType = "Text";
        Label = "Tax Identification Number";
    }

    OUT MIR-DV-OWN-CLI-NM
    {
        Length = "75";
        DBTableName = "Derived";
        SType = "Text";
        Label = "Agent Name";
    }

    OUT MIR-SBSDRY-CO-ID-T[10]
    {
        Length = "40";
        FieldGroup = "Table10";
        CodeSource = "EDIT";
        CodeType = "SUBCO";
        DBTableName = "TUSTM";
        SType = "Text";
        Label = "Sub Company";
        Index = "1";
    }

    OUT MIR-USTM-EFF-DT-T[10]
    {
        Length = "10";
        FieldGroup = "Table10";
        DBTableName = "TUSTM";
        SType = "Date";
        Label = "Effective Date";
        Index = "1";
    }

    OUT MIR-USTM-FED-TAXWH-AMT-T[10]
    {
        Length = "13";
        FieldGroup = "Table10";
        DBTableName = "TUSTM";
        SType = "Currency";
        Label = "Federal Tax Withheld";
        Index = "1";
    }

    OUT MIR-USTM-SEQ-NUM-T[10]
    {
        Length = "3";
        FieldGroup = "Table10";
        KeyColumn;
        DBTableName = "TUSTM";
        SType = "Text";
        Label = "Sequence Number";
        Index = "1";
    }

    OUT MIR-USTM-STAT-CD-T[10]
    {
        Length = "40";
        FieldGroup = "Table10";
        CodeSource = "DataModel";
        CodeType = "USTM-STAT-CD";
        DBTableName = "TUSTM";
        SType = "Text";
        Label = "Status";
        Index = "1";
    }

    OUT MIR-USTM-TAXBL-AMT-T[10]
    {
        Length = "15";
        FieldGroup = "Table10";
        DBTableName = "TUSTM";
        SType = "Currency";
        Label = "Non-Employee Compensation";
        Index = "1";
    }

    OUT MIR-USTM-TAXBL-EVNT-CD-T[10]
    {
        Length = "40";
        FieldGroup = "Table10";
        CodeSource = "DataModel";
        CodeType = "USTM-TAXBL-EVNT-CD";
        DBTableName = "TUSTM";
        SType = "Text";
        Label = "Tax Reporting Event";
        Index = "1";
    }

}

