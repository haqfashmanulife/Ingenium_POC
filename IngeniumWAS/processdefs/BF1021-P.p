# Converted from PathFinder 2.2 to 3.0 Jun 18, 2004 3:13:33 PM EDT

#*******************************************************************************
#*  Component:   BF1021-P.p                                                    *
#*  Description:                                                               *
#*                                                                             *
#*******************************************************************************
#*  Chg#    Release  Description                                               *
#*                                                                             *
#*  014590  6.0      New for release 6.0                                       *
#*  017150  612J     Remove Currency Decimals = "2"                            *
#*                                                                             *
#*******************************************************************************

P-STEP BF1021-P
{
    ATTRIBUTES
    {
        BusinessFunctionId = "1021";
        BusinessFunctionName = "Client/Policy Payment Reversals";
        BusinessFunctionType = "Reversal";
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

    INOUT MIR-DV-TRNXT-PAYO-MTHD-CD-T[13]
    {
        Length = "1";
        FieldGroup = "Table13";
        CodeSource = "DataModel";
        CodeType = "DV-TRNXT-PAYO-MTHD-CD";
        DBTableName = "Derived";
        SType = "Selection";
        Label = "Pay Out Method";
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

    INOUT MIR-BNK-ID-T[13]
    {
        Length = "4";
        FieldGroup = "Table13";
        DBTableName = "TBNKB";
        SType = "Text";
        Label = "Bank ID";
        Index = "1";
    }

    INOUT MIR-BNK-BR-ID-T[13]
    {
        Length = "5";
        FieldGroup = "Table13";
        DBTableName = "TBNKB";
        SType = "Text";
        Label = "Branch ID";
        Index = "1";
    }

    INOUT MIR-BNK-ACCT-ID-T[13]
    {
        Length = "17";
        FieldGroup = "Table13";
        DBTableName = "TBNKA";
        SType = "Text";
        Label = "Bank Account Number";
        Index = "1";
    }

    INOUT MIR-BNK-ACCT-TYP-CD-T[13]
    {
        Length = "3";
        FieldGroup = "Table13";
        CodeSource = "EDIT";
        CodeType = "ACTYP";
        DBTableName = "TBNKA";
        SType = "Selection";
        Label = "Account Type";
        Index = "1";
    }

    INOUT MIR-BNK-ACCT-HLDR-NM-T[13]
    {
        Length = "50";
        FieldGroup = "Table13";
        DBTableName = "TBNKA";
        SType = "Text";
        Label = "Account Holder Name";
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

