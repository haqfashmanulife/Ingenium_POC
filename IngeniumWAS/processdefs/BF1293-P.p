# Converted from PathFinder 2.2 to 3.0 Jun 18, 2004 3:13:36 PM EDT

#*******************************************************************************
#*  Component:   BF1293-P.p                                                    *
#*  Description:                                                               *
#*                                                                             *
#*******************************************************************************
#*  Chg#    Release  Description                                               *
#*                                                                             *
#*  014590  6.0      New for release 6.0                                       *
#*  017150  612J     Remove Currency Decimals = "2"                            *
#*                                                                             *
#*******************************************************************************

P-STEP BF1293-P
{
    ATTRIBUTES
    {
        BusinessFunctionId = "1293";
        BusinessFunctionName = "Miscellaneous Receipts Reversals";
        BusinessFunctionType = "Misrevs";
        MirName = "CCWM0241";
        Description;
    }

    OUT LSIR-RETURN-CD;

    OUT MIR-RETRN-CD;

    INOUT MIR-ACCT-BASE-ID-T[100]
    {
        Length = "6";
        FieldGroup = "Table100";
        DBTableName = "TAC";
        SType = "Text";
        Label = "Account Number";
        Index = "1";
    }

    INOUT MIR-BR-OR-DEPT-ID-T[100]
    {
        Length = "5";
        FieldGroup = "Table100";
        CodeSource = "XTAB";
        CodeType = "BRCH";
        DBTableName = "TAC";
        SType = "Selection";
        Label = "Branch / Departments";
        Index = "1";
    }

    INOUT MIR-DV-ACCT-DESC-TXT
    {
        Mandatory;
        Length = "20";
        DBTableName = "Derived";
        SType = "Text";
        Label = "Accounting Entry Description";
    }

    INOUT MIR-DV-ACCT-DESC-TXT-T[100]
    {
        Length = "20";
        FieldGroup = "Table100";
        DBTableName = "Derived";
        SType = "Text";
        Label = "Accounting Entry Description";
        Index = "1";
    }

    INOUT MIR-DV-ACCT-TRXN-AMT-T[4]
    {
        Signed;
        Length = "13";
        FieldGroup = "Table4";
        DBTableName = "Derived";
        SType = "Currency";
        Label = "Amount";
        Index = "1";
    }

    INOUT MIR-DV-BNK-ACCT-BASE-ID-T[4]
    {
        Length = "6";
        FieldGroup = "Table4";
        DBTableName = "TAC";
        SType = "Text";
        Label = "Account Number";
        Index = "1";
    }

    INOUT MIR-DV-BNK-ACCT-DESC-TXT-T[4]
    {
        Length = "20";
        FieldGroup = "Table4";
        DBTableName = "TACTD";
        SType = "Text";
        Label = "Description";
        Index = "1";
    }

    INOUT MIR-DV-BNK-BR-OR-DEPT-ID-T[4]
    {
        Length = "5";
        FieldGroup = "Table4";
        CodeSource = "XTAB";
        CodeType = "BRCH";
        DBTableName = "TAC";
        SType = "Selection";
        Label = "Branch / Department";
        Index = "1";
    }

    INOUT MIR-DV-BNK-SBSDRY-CO-ID-T[4]
    {
        Length = "40";
        FieldGroup = "Table4";
        CodeSource = "EDIT";
        CodeType = "SUBCO";
        DBTableName = "TSCOM";
        SType = "Selection";
        Label = "Sub Company";
        Index = "1";
    }

    INOUT MIR-DV-CHQ-VCHR-NUM
    {
        Length = "7";
        DBTableName = "Derived";
        SType = "Text";
        Label = "Voucher Number";
    }

    INOUT MIR-DV-SCRN-ACCT-DESC-TXT-T[100]
    {
        Length = "14";
        FieldGroup = "Table100";
        DBTableName = "Derived";
        SType = "Text";
        Label = "Accounting Description";
        Index = "1";
    }

    INOUT MIR-DV-TRNXT-CR-AMT-T[100]
    {
        Signed;
        Length = "13";
        FieldGroup = "Table100";
        DBTableName = "Derived";
        SType = "Currency";
        Label = "Credit Amount";
        Index = "1";
    }

    INOUT MIR-DV-TRNXT-DR-AMT-T[100]
    {
        Signed;
        Length = "13";
        FieldGroup = "Table100";
        DBTableName = "Derived";
        SType = "Currency";
        Label = "Debit Amount";
        Index = "1";
    }

    INOUT MIR-SBSDRY-CO-ID-T[100]
    {
        Length = "40";
        FieldGroup = "Table100";
        CodeSource = "EDIT";
        CodeType = "SUBCO";
        DBTableName = "TSCOM";
        SType = "Selection";
        Label = "Sub Company";
        Index = "1";
    }

    INOUT MIR-USER-SESN-CRCY-CD
    {
        Length = "2";
        CodeSource = "XTAB";
        CodeType = "CURR";
        DBTableName = "TUSES";
        DefaultSession = "MIR-USER-SESN-CRCY-CD";
        SType = "Text";
        Label = "Currency";
    }

    IN MIR-DV-PRCES-STATE-CD
    {
        Length = "1";
        DBTableName = "Derived";
        SType = "Hidden";
        Label = "process code";
    }

}

