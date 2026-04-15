# Converted from PathFinder 2.2 to 3.0 Jun 18, 2004 3:13:52 PM EDT

#*******************************************************************************
#*  Component:   BF5094-P.p                                                    *
#*  Description:                                                               *
#*                                                                             *
#*******************************************************************************
#*  Chg#    Release  Description                                               *
#*                                                                             *
#*  014590  6.0      New for release 6.0                                       *
#*  017150  612J     Remove Currency Decimals = "2"                            *
#*                                                                             *
#*******************************************************************************

P-STEP BF5094-P
{
    ATTRIBUTES
    {
        BusinessFunctionId = "5094";
        BusinessFunctionName = "Bank Billing History List";
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

    INOUT MIR-PAC-DRW-IDT-NUM
    {
        Key;
        Length = "10";
        DBTableName = "TPDRW";
        SType = "Date";
        Label = "PAC Withdrawal Date";
    }

    INOUT MIR-PAC-DRW-SEQ-NUM
    {
        Key;
        Length = "3";
        DBTableName = "TPDRW";
        SType = "Text";
        Label = "Sequence Number";
    }

    INOUT MIR-SBSDRY-CO-ID
    {
        Key;
        Length = "40";
        CodeSource = "EDIT";
        CodeType = "SUBCO";
        DBTableName = "TSCOM";
        SType = "Selection";
        Label = "Sub Company";
    }

    OUT MIR-PAC-DRW-CREAT-CD-T[100]
    {
        Length = "1";
        FieldGroup = "Table100";
        CodeSource = "DataModel";
        CodeType = "PAC-DRW-CREAT-CD";
        DBTableName = "TPDRW";
        SType = "Selection";
        Label = "Type of PAC Draw";
        Index = "1";
    }

    OUT MIR-PAC-DRW-IDT-NUM-T[100]
    {
        Length = "10";
        FieldGroup = "Table100";
        KeyColumn;
        DBTableName = "TPDRW";
        SType = "Date";
        Label = "PAC Withdrawal Date";
        Index = "1";
    }

    OUT MIR-PAC-DRW-RETRN-CD-T[100]
    {
        Length = "1";
        FieldGroup = "Table100";
        CodeSource = "DataModel";
        CodeType = "PAC-DRW-RETRN-CD";
        DBTableName = "TPDRW";
        SType = "Selection";
        Label = "PAC Draw Reversal Reason";
        Index = "1";
    }

    OUT MIR-PAC-DRW-SEQ-NUM-T[100]
    {
        Length = "3";
        FieldGroup = "Table100";
        DBTableName = "TPDRW";
        SType = "Text";
        Label = "Sequence Number";
        Index = "1";
    }

    OUT MIR-PAC-DRW-STAT-CD-T[100]
    {
        Length = "1";
        FieldGroup = "Table100";
        CodeSource = "DataModel";
        CodeType = "PAC-DRW-STAT-CD";
        DBTableName = "TPDRW";
        SType = "Selection";
        Label = "Status";
        Index = "1";
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

    OUT MIR-SBSDRY-CO-ID-T[100]
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

}

