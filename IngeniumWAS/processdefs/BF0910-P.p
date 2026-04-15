# Converted from PathFinder 2.2 to 3.0 Jun 18, 2004 3:13:31 PM EDT

#*******************************************************************************
#*  Component:   BF0910-P.p                                                    *
#*  Description:                                                               *
#*                                                                             *
#*******************************************************************************
#*  Chg#    Release  Description                                               *
#*                                                                             *
#*  014590  6.0      New for release 6.0                                       *
#*  017150  612J     Remove Currency Decimals = "2"                            *
#*                                                                             *
#*******************************************************************************

P-STEP BF0910-P
{
    ATTRIBUTES
    {
        BusinessFunctionId = "0910";
        BusinessFunctionName = "U.S. Agent Taxable Event Retrieve";
        BusinessFunctionType = "Retrieve";
        MirName = "CCWM4150";
    }

    OUT LSIR-RETURN-CD;

    OUT MIR-RETRN-CD;

    INOUT MIR-USTM-EFF-DT
    {
        Key;
        Length = "10";
        DBTableName = "TUSTM";
        DefaultSession = "LSIR-PRCES-DT";
        SType = "Date";
        Label = "Effective Date";
    }

    IN MIR-AGT-ID
    {
        Key;
        Mandatory;
        Length = "6";
        DBTableName = "TAG";
        SType = "Text";
        Label = "Agent ID";
    }

    IN MIR-USTM-EFF-YR
    {
        Key;
        Length = "4";
        DBTableName = "TUSTM";
        SType = "Year";
        Label = "Tax Year";
    }

    IN MIR-USTM-SEQ-NUM
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

    OUT MIR-SBSDRY-CO-ID
    {
        Length = "40";
        CodeSource = "EDIT";
        CodeType = "SUBCO";
        DBTableName = "TUSTM";
        SType = "Text";
        Label = "Sub Company";
    }

    OUT MIR-USTM-FED-TAXWH-AMT
    {
        Length = "13";
        DBTableName = "TUSTM";
        SType = "Currency";
        Label = "Federal Tax Withheld";
    }

    OUT MIR-USTM-STAT-CD
    {
        Length = "1";
        CodeSource = "DataModel";
        CodeType = "USTM-STAT-CD";
        DBTableName = "TUSTM";
        SType = "Text";
        Label = "Status";
    }

    OUT MIR-USTM-TAXBL-AMT
    {
        Length = "15";
        DBTableName = "TUSTM";
        SType = "Currency";
        Label = "Non-Employee Compensation";
    }

    OUT MIR-USTM-TAXBL-EVNT-CD
    {
        Length = "3";
        CodeSource = "DataModel";
        CodeType = "USTM-TAXBL-EVNT-CD";
        DBTableName = "TUSTM";
        SType = "Text";
        Label = "Tax Reporting Event";
    }

}

