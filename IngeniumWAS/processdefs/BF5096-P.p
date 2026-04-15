# Converted from PathFinder 2.2 to 3.0 Jun 18, 2004 3:13:52 PM EDT

#*******************************************************************************
#*  Component:   BF5096-P.p                                                    *
#*  Description:                                                               *
#*                                                                             *
#*******************************************************************************
#*  Chg#    Release  Description                                               *
#*                                                                             *
#*  014590  6.0      New for release 6.0                                       *
#*  017150  612J     Remove Currency Decimals = "2"                            *
#*                                                                             *
#*******************************************************************************

P-STEP BF5096-P
{
    ATTRIBUTES
    {
        BusinessFunctionId = "5096";
        BusinessFunctionName = "Bank Billing History Reversal";
        BusinessFunctionType = "RevPACDrw";
        MirName = "CCWM5090";
    }

    OUT LSIR-RETURN-CD;

    OUT MIR-RETRN-CD;

    INOUT MIR-PAC-DRW-RETRN-CD
    {
        Mandatory;
        Length = "1";
        CodeSource = "DataModel";
        CodeType = "PAC-DRW-RETRN-CD";
        DBTableName = "TPDRW";
        SType = "Selection";
        Label = "PAC Draw Reversal Reason";
    }

    IN MIR-BNK-ACCT-ID
    {
        Key;
        Mandatory;
        Length = "17";
        DBTableName = "TPDRW";
        SType = "Text";
        Label = "Account Number";
    }

    IN MIR-BNK-BR-ID
    {
        Key;
        Mandatory;
        Length = "5";
        DBTableName = "TPDRW";
        SType = "Text";
        Label = "Branch Number";
    }

    IN MIR-BNK-ID
    {
        Key;
        Mandatory;
        Length = "4";
        DBTableName = "TPDRW";
        SType = "Text";
        Label = "Bank Number";
    }

    IN MIR-DV-PRCES-STATE-CD
    {
        Length = "1";
        DBTableName = "Derived";
        SType = "Hidden";
        Label = "process code";
    }

    IN MIR-PAC-DRW-IDT-NUM
    {
        Key;
        Mandatory;
        Length = "10";
        DBTableName = "TPDRW";
        SType = "Date";
        Label = "PAC Withdrawal Date";
    }

    IN MIR-PAC-DRW-SEQ-NUM
    {
        Key;
        Mandatory;
        Length = "3";
        DBTableName = "TPDRW";
        SType = "Text";
        Label = "Sequence Number";
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

    OUT MIR-PAC-DRW-STAT-CD
    {
        Length = "1";
        CodeSource = "DataModel";
        CodeType = "PAC-DRW-STAT-CD";
        DBTableName = "TPDRW";
        SType = "Selection";
        Label = "Status";
    }

    OUT MIR-PAC-DRW-TOT-AMT
    {
        Signed;
        Length = "11";
        DBTableName = "TPDRW";
        SType = "Currency";
        Label = "PAC Amount";
    }

    OUT MIR-SBSDRY-CO-ID
    {
        Length = "40";
        CodeSource = "EDIT";
        CodeType = "SUBCO";
        DBTableName = "TSCOM";
        SType = "Selection";
        Label = "Sub-company";
    }

}

