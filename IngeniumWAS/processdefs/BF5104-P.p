# Converted from PathFinder 2.2 to 3.0 Jun 18, 2004 3:13:52 PM EDT

#*******************************************************************************
#*  Component:   BF5104-P.p                                                    *
#*  Description:                                                               *
#*                                                                             *
#*******************************************************************************
#*  Chg#    Release  Description                                               *
#*                                                                             *
#*  014590  6.0      New for release 6.0                                       *
#*  017150  612J     Remove Currency Decimals = "2"                            *
#*                                                                             *
#*******************************************************************************

P-STEP BF5104-P
{
    ATTRIBUTES
    {
        BusinessFunctionId = "5104";
        BusinessFunctionName = "Bank Billing History Policy List";
        BusinessFunctionType = "List";
        MirName = "CCWM5090";
    }

    OUT LSIR-RETURN-CD;

    OUT MIR-RETRN-CD;

    INOUT MIR-BNK-ACCT-ID
    {
        Key;
        Mandatory;
        Length = "17";
        DBTableName = "TPDRW";
        SType = "Text";
        Label = "Account Number";
    }

    INOUT MIR-BNK-BR-ID
    {
        Key;
        Mandatory;
        Length = "5";
        DBTableName = "TPDRW";
        SType = "Text";
        Label = "Branch Number";
    }

    INOUT MIR-BNK-ID
    {
        Key;
        Mandatory;
        Length = "4";
        DBTableName = "TPDRW";
        SType = "Text";
        Label = "Bank Number";
    }

    INOUT MIR-PAC-DRWD-DUE-DT
    {
        Key;
        Length = "10";
        DBTableName = "TPDRD";
        SType = "Date";
        Label = "Premium Due Date";
    }

    INOUT MIR-PAC-DRW-IDT-NUM
    {
        Key;
        Mandatory;
        Length = "10";
        DBTableName = "TPDRW";
        SType = "Date";
        Label = "PAC Withdrawal Date";
    }

    INOUT MIR-PAC-DRW-SEQ-NUM
    {
        Key;
        Mandatory;
        Length = "3";
        DBTableName = "TPDRW";
        SType = "Text";
        Label = "Sequence Number";
    }

    INOUT MIR-POL-ID-BASE
    {
        Key;
        Length = "9";
        DBTableName = "TPOL";
        DefaultSession = "MIR-POL-ID-BASE";
        SType = "Text";
        Label = "Policy Id";
    }

    INOUT MIR-POL-ID-SFX
    {
        Key;
        Length = "1";
        DBTableName = "TPOL";
        DefaultSession = "MIR-POL-ID-SFX";
        SType = "Text";
        Label = "Suffix";
    }

    OUT MIR-PAC-DRW-CREAT-CD
    {
        Length = "1";
        CodeSource = "DataModel";
        CodeType = "PAC-DRW-CREAT-CD";
        DBTableName = "TPDRW";
        SType = "Selection";
        Label = "Type of PAC Draw";
    }

    OUT MIR-PAC-DRWD-DUE-DT-T[100]
    {
        Length = "10";
        FieldGroup = "Table100";
        DBTableName = "TPDRD";
        SType = "Date";
        Label = "Premium Due Date";
        Index = "1";
    }

    OUT MIR-PAC-DRWD-LOAN-AMT-T[100]
    {
        Length = "13";
        FieldGroup = "Table100";
        DBTableName = "TPDRD";
        SType = "Currency";
        Label = "Loan Repayment";
        Index = "1";
    }

    OUT MIR-PAC-DRWD-MPREM-AMT-T[100]
    {
        Length = "13";
        FieldGroup = "Table100";
        DBTableName = "TPDRD";
        SType = "Currency";
        Label = "Mode Premium";
        Index = "1";
    }

    OUT MIR-PAC-DRWD-REDRW-IND-T[100]
    {
        Length = "1";
        FieldGroup = "Table100";
        DBTableName = "TPDRD";
        SType = "Indicator";
        Label = "PAC draw for the policy was a redraw";
        Index = "1";
    }

    OUT MIR-PAC-DRWD-SNDRY-AMT-T[100]
    {
        Length = "13";
        FieldGroup = "Table100";
        DBTableName = "TPDRD";
        SType = "Currency";
        Label = "Sundry Amount Billed";
        Index = "1";
    }

    OUT MIR-PAC-DRWD-STAT-CD-T[100]
    {
        Length = "1";
        FieldGroup = "Table100";
        CodeSource = "DataModel";
        CodeType = "PAC-DRWD-STAT-CD";
        DBTableName = "TPDRD";
        SType = "Selection";
        Label = "Status";
        Index = "1";
    }

    OUT MIR-PAC-DRWD-SUSP-AMT-T[100]
    {
        Length = "13";
        FieldGroup = "Table100";
        DBTableName = "TPDRD";
        SType = "Currency";
        Label = "Premium Suspense Amount";
        Index = "1";
    }

    OUT MIR-PAC-DRW-TOT-AMT
    {
        Signed;
        Length = "11";
        DBTableName = "TPDRW";
        SType = "Currency";
        Label = "PAC Amount";
    }

    OUT MIR-PAC-DRW-TOT-AMT-T[100]
    {
        Signed;
        Length = "11";
        FieldGroup = "Table100";
        DBTableName = "TPDRW";
        SType = "Currency";
        Label = "PAC Amount";
        Index = "1";
    }

    OUT MIR-POL-ID-BASE-T[100]
    {
        Length = "9";
        FieldGroup = "Table100";
        KeyColumn;
        DBTableName = "TPOL";
        SType = "Text";
        Label = "Policy Id";
        Index = "1";
    }

    OUT MIR-POL-ID-SFX-T[100]
    {
        Length = "1";
        FieldGroup = "Table100";
        DBTableName = "TPOL";
        SType = "Text";
        Label = "Suffix";
        Index = "1";
    }

}

