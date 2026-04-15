# Converted from PathFinder 2.2 to 3.0 Jun 18, 2004 3:13:36 PM EDT

#*******************************************************************************
#*  Component:   BF1280-P.p                                                    *
#*  Description:                                                               *
#*                                                                             *
#*******************************************************************************
#*  Chg#    Release  Description                                               *
#*                                                                             *
#*  014590  6.0      New for release 6.0                                       *
#*  017150  612J     Remove Currency Decimals = "2"                            *
#*                                                                             *
#*******************************************************************************

P-STEP BF1280-P
{
    ATTRIBUTES
    {
        BusinessFunctionId = "1280";
        BusinessFunctionName = "Prior Month Accounting Entries";
        BusinessFunctionType = "Prmacct";
        MirName = "CCWM0171";
        Description;
    }

    OUT LSIR-RETURN-CD;

    OUT MIR-RETRN-CD;

    INOUT MIR-ACCT-BASE-ID-T[10]
    {
        Key;
        Length = "6";
        FieldGroup = "Table10";
        KeyColumn;
        DBTableName = "TAC";
        SType = "Text";
        Label = "Account Number";
        Index = "1";
    }

    INOUT MIR-ACCT-CRNT-LOC-CD-T[10]
    {
        Key;
        Length = "2";
        FieldGroup = "Table10";
        CodeSource = "CTLC";
        CodeType = "CLOC";
        DBTableName = "TAC";
        SType = "Selection";
        Label = "Current Location  (CL)";
        Index = "1";
    }

    INOUT MIR-ACCT-ISS-LOC-CD-T[10]
    {
        Key;
        Length = "2";
        FieldGroup = "Table10";
        CodeSource = "CTLC";
        CodeType = "ILOC";
        DBTableName = "TAC";
        SType = "Selection";
        Label = "Issue Location  (IL)";
        Index = "1";
    }

    INOUT MIR-BR-OR-DEPT-ID-T[10]
    {
        Key;
        Length = "5";
        FieldGroup = "Table10";
        CodeSource = "XTAB";
        CodeType = "BRCH";
        DBTableName = "TAC";
        SType = "Selection";
        Label = "Branch";
        Index = "1";
    }

    INOUT MIR-DV-ACCT-DESC-TXT
    {
        Mandatory;
        Length = "20";
        DBTableName = "Derived";
        SType = "Text";
        Label = "Description";
    }

    INOUT MIR-DV-ACCT-DESC-TXT-T[10]
    {
        Length = "20";
        FieldGroup = "Table10";
        DBTableName = "Derived";
        SType = "Text";
        Label = "Account Description";
        Index = "1";
    }

    INOUT MIR-DV-CHQ-VCHR-NUM
    {
        Length = "7";
        DBTableName = "Derived";
        SType = "Text";
        Label = "Voucher Number";
    }

    INOUT MIR-DV-TRNXT-CR-AMT-T[10]
    {
        Signed;
        Length = "13";
        FieldGroup = "Table10";
        DBTableName = "Derived";
        SType = "Currency";
        Label = "Credit Amount";
        Index = "1";
    }

    INOUT MIR-DV-TRNXT-DR-AMT-T[10]
    {
        Signed;
        Length = "13";
        FieldGroup = "Table10";
        DBTableName = "Derived";
        SType = "Currency";
        Label = "Debit Amount";
        Index = "1";
    }

    INOUT MIR-PLAN-ID-T[10]
    {
        Key;
        Length = "40";
        FieldGroup = "Table10";
        CodeSource = "EDIT";
        CodeType = "PLAN";
        DBTableName = "TAC";
        SType = "Selection";
        Label = "Plan";
        Index = "1";
    }

    INOUT MIR-POL-ID-BASE
    {
        Length = "9";
        DBTableName = "TPOL";
        SType = "Text";
        Label = "Policy Id";
    }

    INOUT MIR-POL-ID-SFX
    {
        Length = "1";
        DBTableName = "TPOL";
        SType = "Text";
        Label = "Suffix";
    }

    INOUT MIR-SBSDRY-CO-ID-T[10]
    {
        Key;
        Length = "40";
        FieldGroup = "Table10";
        CodeSource = "EDIT";
        CodeType = "SUBCO";
        DBTableName = "TSCOM";
        SType = "Selection";
        Label = "Sub Company  (SC)";
        Index = "1";
    }

    INOUT MIR-TRNXT-DT
    {
        Key;
        Mandatory;
        Length = "10";
        DBTableName = "TATRN";
        SType = "Date";
        Label = "Date";
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
        Label = "Process code";
    }

}

