# Converted from PathFinder 2.2 to 3.0 Jun 18, 2004 3:13:33 PM EDT

#*******************************************************************************
#*  Component:   BF1022-P.p                                                    *
#*  Description:                                                               *
#*                                                                             *
#*******************************************************************************
#*  Chg#    Release  Description                                               *
#*                                                                             *
#*  014590  6.0      New for release 6.0                                       *
#*  017150  612J     Remove Currency Decimals = "2"                            *
#*  P00891  YC       Add Journal Date with no limitation   26MAY2003           *
#*                                                                             *
#*******************************************************************************

P-STEP BF1022-P
{
    ATTRIBUTES
    {
        BusinessFunctionId = "1022";
        BusinessFunctionName = "Policy Transfers";
        BusinessFunctionType = "Polxfer";
        MirName = "CCWM5070";
    }

    OUT LSIR-RETURN-CD;

    OUT MIR-RETRN-CD;

    INOUT MIR-CF-DPOS-TRM-DY-DUR-T[7]
    {
        Length = "3";
        FieldGroup = "Table7";
        DBTableName = "TCFLW";
        DefaultConstant = "000";
        SType = "Text";
        Label = "Deposit Term - Days";
        Index = "1";
    }

    INOUT MIR-CF-DPOS-TRM-MO-DUR-T[7]
    {
        Length = "3";
        FieldGroup = "Table7";
        DBTableName = "TCFLW";
        DefaultConstant = "000";
        SType = "Text";
        Label = "Deposit Term - Months";
        Index = "1";
    }

    INOUT MIR-CF-EFF-DT-T[7]
    {
        Length = "10";
        FieldGroup = "Table7";
        DBTableName = "TCFLW";
        SType = "Date";
        Label = "Deposit Date";
        Index = "1";
    }

    INOUT MIR-CF-REG-FND-SRC-CD-T[7]
    {
        Length = "1";
        FieldGroup = "Table7";
        CodeSource = "DataModel";
        CodeType = "CF-REG-FND-SRC-CD";
        DBTableName = "TCFLW";
        SType = "Selection";
        Label = "Source of Deposit";
        Index = "1";
    }

    INOUT MIR-CF-SEQ-NUM-T[7]
    {
        Length = "3";
        FieldGroup = "Table7";
        DBTableName = "TCFLW";
        DefaultConstant = "000";
        SType = "Text";
        Label = "Sequence Number";
        Index = "1";
    }

    INOUT MIR-CF-TAX-YR-T[7]
    {
        Length = "4";
        FieldGroup = "Table7";
        DBTableName = "TCFLW";
        SType = "Year";
        Label = "Tax Year";
        Index = "1";
    }

    INOUT MIR-CLI-ID
    {
        Length = "10";
        DBTableName = "TCLI";
        SType = "Text";
        Label = "Client Number";
    }

    INOUT MIR-CVG-NUM-T[7]
    {
        Length = "2";
        FieldGroup = "Table7";
        DBTableName = "TCVG";
        DefaultConstant = "00";
        SType = "Text";
        Label = "Coverage Number";
        Index = "1";
    }

    INOUT MIR-DV-ACCT-CD-T[7]
    {
        Length = "4";
        FieldGroup = "Table7";
        CodeSource = "DataModel";
        CodeType = "DV-ACCT-CD";
        DBTableName = "Derived";
        SType = "Selection";
        Label = "Account to Credit / Debit";
        Index = "1";
    }

    INOUT MIR-BNK-ID-T[7]
    {
        Length = "4";
        FieldGroup = "Table7";
        DBTableName = "TBNKB";
        SType = "Text";
        Label = "Bank ID";
        Index = "1";
    }

    INOUT MIR-BNK-BR-ID-T[7]
    {
        Length = "5";
        FieldGroup = "Table7";
        DBTableName = "TBNKB";
        SType = "Text";
        Label = "Branch ID";
        Index = "1";
    }

    INOUT MIR-BNK-ACCT-ID-T[7]
    {
        Length = "17";
        FieldGroup = "Table7";
        DBTableName = "TBNKA";
        SType = "Text";
        Label = "Bank Account Number";
        Index = "1";
    }

    INOUT MIR-BNK-ACCT-TYP-CD-T[7]
    {
        Length = "3";
        FieldGroup = "Table7";
        CodeSource = "EDIT";
        CodeType = "ACTYP";
        DBTableName = "TBNKA";
        SType = "Selection";
        Label = "Account Type";
        Index = "1";
    }

    INOUT MIR-BNK-ACCT-HLDR-NM-T[7]
    {
        Length = "50";
        FieldGroup = "Table7";
        DBTableName = "TBNKA";
        SType = "Text";
        Label = "Account Holder Name";
        Index = "1";
    }

    INOUT MIR-DV-ACCT-TRXN-AMT
    {
        Signed;
        Length = "13";
        DBTableName = "Derived";
        SType = "Currency";
        Label = "Amount";
    }

    INOUT MIR-DV-ACCT-TRXN-AMT-T[7]
    {
        Signed;
        Length = "13";
        FieldGroup = "Table7";
        DBTableName = "Derived";
        SType = "Currency";
        Label = "Amount";
        Index = "1";
    }

    INOUT MIR-DV-PRCES-DT
    {
        Mandatory;
        Length = "10";
        DBTableName = "TCFLW";
        DefaultSession = "LSIR-PRCES-DT";
        SType = "Date";
        Label = "Effective Date";
    }

    INOUT MIR-DV-TAX-OVRID-IND-T[7]
    {
        Length = "1";
        FieldGroup = "Table7";
        DBTableName = "Derived";
        SType = "Indicator";
        Label = "Tax Override";
        Index = "1";
    }

    INOUT MIR-POL-ID-BASE-T[7]
    {
        Length = "9";
        FieldGroup = "Table7";
        KeyColumn;
        DBTableName = "TPOL";
        SType = "Text";
        Label = "Policy Id";
        Index = "1";
    }

    INOUT MIR-POL-ID-SFX-T[7]
    {
        Length = "1";
        FieldGroup = "Table7";
        DBTableName = "TPOL";
        SType = "Text";
        Label = "Suffix";
        Index = "1";
    }

    INOUT MIR-SBSDRY-CO-ID
    {
        Length = "40";
        CodeSource = "EDIT";
        CodeType = "SUBCO";
        DBTableName = "TPOL";
        SType = "Selection";
        Label = "Sub Company";
    }

    IN MIR-DV-PRCES-STATE-CD
    {
        Length = "1";
        DBTableName = "Derived";
        SType = "Hidden";
        Label = "Process code";
    }

    OUT MIR-DV-OWN-CLI-NM
    {
        Length = "75";
        DBTableName = "Derived";
        SType = "Text";
        Label = "Owner Name";
    }

    OUT MIR-DV-OWN-CLI-NM-T[7]
    {
        Length = "30";
        FieldGroup = "Table7";
        DBTableName = "Derived";
        SType = "Text";
        Label = "Owner Name";
        Index = "1";
    }

    OUT MIR-DV-TAX-VERIF-AMT-T[7]
    {
        Signed;
        Length = "13";
        FieldGroup = "Table7";
        DBTableName = "Derived";
        SType = "Currency";
        Label = "Total Amount of Tax";
        Index = "1";
    }

#  P00891 YC      26MAY2003  Add 8 lines for Adding Journal Date
    INOUT MIR-JRNL-DT 
    {
        Length = "10";
        DefaultSession = "LSIR-PRCES-DT";
        SType = "Date";
        Label = "Journal Date";
    }

}

