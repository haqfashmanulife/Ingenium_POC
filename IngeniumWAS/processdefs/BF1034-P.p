# Converted from PathFinder 2.2 to 3.0 Jun 18, 2004 3:13:33 PM EDT

#*******************************************************************************
#*  Component:   BF1034-P.p                                                    *
#*  Description:                                                               *
#*                                                                             *
#*******************************************************************************
#*  Chg#    Release  Description                                               *
#*                                                                             *
#*  014590  6.0      New for release 6.0                                       *
#*  017150  612J     Remove Currency Decimals = "2"                            *
#*  B00675  Van      Max length of Bank Account ID is 7                        *
#*******************************************************************************

P-STEP BF1034-P
{
    ATTRIBUTES
    {
        BusinessFunctionId = "1034";
        BusinessFunctionName = "Bank Account Table List";
        BusinessFunctionType = "List";
        MirName = "CCWM5080";
    }

    OUT LSIR-RETURN-CD;

    OUT MIR-RETRN-CD;

    IN MIR-BNK-ACCT-ID
    {
        Key;
        Mandatory;
        Length = "7";
        DBTableName = "TCLIB";
        SType = "Text";
        Label = "Account Number";
    }

    IN MIR-BNK-BR-ID
    {
        Key;
        Mandatory;
        Length = "5";
        DBTableName = "TCLIB";
        SType = "Text";
        Label = "Branch Number";
    }

    IN MIR-BNK-ID
    {
        Key;
        Mandatory;
        Length = "4";
        DBTableName = "TCLIB";
        SType = "Text";
        Label = "Bank Number";
    }

    OUT MIR-BNK-ACCT-HLDR-NM
    {
        Length = "50";
        DBTableName = "TBNKA";
        SType = "Text";
        Label = "Accountholder Name";
    }

    OUT MIR-CLI-BNK-ACCT-NUM-T[11]
    {
        Length = "1";
        FieldGroup = "Table11";
        DBTableName = "TCLIB";
        SType = "Text";
        Label = "Bank Account Number";
        Index = "1";
    }

    OUT MIR-CLI-ID-T[11]
    {
        Length = "10";
        FieldGroup = "Table11";
        DBTableName = "TCLI";
        SType = "Text";
        Label = "Client Number";
        Index = "1";
    }

    OUT MIR-POL-CSTAT-CD-T[11]
    {
        Length = "40";
        FieldGroup = "Table11";
        CodeSource = "DataModel";
        CodeType = "POL-CSTAT-CD";
        DBTableName = "TPOL";
        SType = "Text";
        Label = "Policy Status";
        Index = "1";
    }

    OUT MIR-POL-ID-BASE-T[11]
    {
        Length = "9";
        FieldGroup = "Table11";
        DBTableName = "TPOL";
        SType = "Text";
        Label = "Policy Id";
        Index = "1";
    }

    OUT MIR-POL-ID-SFX-T[11]
    {
        Length = "1";
        FieldGroup = "Table11";
        DBTableName = "TPOL";
        SType = "Text";
        Label = "Suffix";
        Index = "1";
    }

    OUT MIR-POL-LOAN-REPAY-AMT-T[11]
    {
        Signed;
        Length = "13";
        FieldGroup = "Table11";
        DBTableName = "TPOL";
        SType = "Currency";
        Label = "Loan Repayment Amount";
        Index = "1";
    }

    OUT MIR-POL-MPREM-AMT-T[11]
    {
        Signed;
        Length = "15";
        FieldGroup = "Table11";
        DBTableName = "TPOL";
        SType = "Currency";
        Label = "Mode Premium Amount";
        Index = "1";
    }

    OUT MIR-POL-PAC-DRW-DY-T[11]
    {
        Length = "10";
        FieldGroup = "Table11";
        DBTableName = "TPOL";
        SType = "Day";
        Label = "Deposit Day";
        Index = "1";
    }

    OUT MIR-POL-PD-TO-DT-NUM-T[11]
    {
        Length = "10";
        FieldGroup = "Table11";
        DBTableName = "TPOL";
        SType = "Text";
        Label = "Paid to Date";
        Index = "1";
    }

    OUT MIR-POL-PREM-SUSP-AMT-T[11]
    {
        Signed;
        Length = "17";
        FieldGroup = "Table11";
        DBTableName = "TPOL";
        SType = "Currency";
        Label = "Premium Suspense";
        Index = "1";
    }

}

