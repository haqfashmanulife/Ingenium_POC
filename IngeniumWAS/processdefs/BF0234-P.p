# Converted from PathFinder 2.2 to 3.0 Jun 18, 2004 3:13:18 PM EDT

#*******************************************************************************
#*  Component:   BF0234-P.p                                                    *
#*  Description:                                                               *
#*                                                                             *
#*******************************************************************************
#*  Chg#    Release  Description                                               *
#*                                                                             *
#*  014590  6.0      New for release 6.0                                       *
#*  017150  612J     Remove Currency Decimals = "2"                            *
#*                                                                             *
#*******************************************************************************

P-STEP BF0234-P
{
    ATTRIBUTES
    {
        BusinessFunctionId = "0234";
        BusinessFunctionName = "Cheque Reconciliation List";
        BusinessFunctionType = "List";
        MirName = "CCWM0175";
    }

    OUT LSIR-RETURN-CD;

    OUT MIR-RETRN-CD;

    INOUT MIR-CHQ-ID
    {
        Key;
        Length = "16";
        DBTableName = "TCR";
        SType = "Text";
        Label = "Reference Number";
    }

    INOUT MIR-SBSDRY-CO-ID
    {
        Key;
        Length = "40";
        CodeSource = "EDIT";
        CodeType = "SUBCO";
        DBTableName = "TCR";
        SType = "Selection";
        Label = "Sub Company";
    }

    OUT MIR-CHQ-AMT-T[100]
    {
        Length = "17";
        FieldGroup = "Table100";
        DBTableName = "TCR";
        SType = "Currency";
        Label = "Amount";
        Index = "1";
    }

    OUT MIR-CHQ-DT-T[100]
    {
        Length = "10";
        FieldGroup = "Table100";
        DBTableName = "TCR";
        SType = "Date";
        Label = "Date";
        Index = "1";
    }

    OUT MIR-CHQ-ID-T[100]
    {
        Length = "16";
        FieldGroup = "Table100";
        KeyColumn;
        DBTableName = "TCR";
        SType = "Text";
        Label = "Reference Number";
        Index = "1";
    }

    OUT MIR-CHQ-MICR-NUM-T[100]
    {
        Length = "8";
        FieldGroup = "Table100";
        DBTableName = "TCR";
        SType = "Text";
        Label = "MICR Number";
        Index = "1";
    }

    OUT MIR-CHQ-PAYE-1-TXT-T[100]
    {
        Length = "50";
        FieldGroup = "Table100";
        DBTableName = "TCR";
        SType = "Text";
        Label = "Payee (1)";
        Index = "1";
    }

    OUT MIR-CHQ-STAT-CD-T[100]
    {
        Length = "1";
        FieldGroup = "Table100";
        CodeSource = "DataModel";
        CodeType = "CHQ-STAT-CD";
        DBTableName = "TCR";
        SType = "Text";
        Label = "Status";
        Index = "1";
    }

    OUT MIR-SBSDRY-CO-ID-T[100]
    {
        Length = "40";
        FieldGroup = "Table100";
        CodeSource = "EDIT";
        CodeType = "SUBCO";
        DBTableName = "TCR";
        SType = "Text";
        Label = "Sub Company";
        Index = "1";
    }

}

