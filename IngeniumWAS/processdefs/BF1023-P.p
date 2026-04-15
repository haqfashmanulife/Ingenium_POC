# Converted from PathFinder 2.2 to 3.0 Jun 18, 2004 3:13:33 PM EDT

#*******************************************************************************
#*  Component:   BF1023-P.p                                                    *
#*  Description:                                                               *
#*                                                                             *
#*******************************************************************************
#*  Chg#    Release  Description                                               *
#*                                                                             *
#*  014590  6.0      New for release 6.0                                       *
#*  017150  612J     Remove Currency Decimals = "2"                            *
#*                                                                             *
#*******************************************************************************

P-STEP BF1023-P
{
    ATTRIBUTES
    {
        BusinessFunctionId = "1023";
        BusinessFunctionName = "Client Transfers";
        BusinessFunctionType = "Clixfer";
        MirName = "CCWM5070";
    }

    OUT LSIR-RETURN-CD;

    OUT MIR-RETRN-CD;

    INOUT MIR-CLI-ID-T[13]
    {
        Length = "10";
        FieldGroup = "Table13";
        KeyColumn;
        DBTableName = "TCLI";
        SType = "Text";
        Label = "Client Number";
        Index = "1";
    }

    INOUT MIR-DV-ACCT-TRXN-AMT-T[13]
    {
        Signed;
        Length = "13";
        FieldGroup = "Table13";
        DBTableName = "Derived";
        SType = "Currency";
        Label = "Amount";
        Index = "1";
    }

    INOUT MIR-SBSDRY-CO-ID-T[13]
    {
        Length = "40";
        FieldGroup = "Table13";
        CodeSource = "EDIT";
        CodeType = "SUBCO";
        DBTableName = "TPOL";
        SType = "Selection";
        Label = "Sub Company";
        Index = "1";
    }

    IN MIR-DV-PRCES-STATE-CD
    {
        Length = "1";
        DBTableName = "Derived";
        SType = "Hidden";
        Label = "Process code";
    }

    OUT MIR-DV-OWN-CLI-NM-T[13]
    {
        Length = "30";
        FieldGroup = "Table13";
        DBTableName = "Derived";
        SType = "Text";
        Label = "Owner Name";
        Index = "1";
    }

}

