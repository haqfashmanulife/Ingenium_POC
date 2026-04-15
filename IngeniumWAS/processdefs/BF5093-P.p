# Converted from PathFinder 2.2 to 3.0 Jun 18, 2004 3:13:52 PM EDT

#*******************************************************************************
#*  Component:   BF5093-P.p                                                    *
#*  Description:                                                               *
#*                                                                             *
#*******************************************************************************
#*  Chg#    Release  Description                                               *
#*                                                                             *
#*  014590  6.0      New for release 6.0                                       *
#*  017150  612J     Remove Currency Decimals = "2"                            *
#*                                                                             *
#*******************************************************************************

P-STEP BF5093-P
{
    ATTRIBUTES
    {
        BusinessFunctionId = "5093";
        BusinessFunctionName = "Bank Billing History Delete";
        BusinessFunctionType = "Delete";
        MirName = "CCWM5090";
    }

    OUT LSIR-RETURN-CD;

    OUT MIR-RETRN-CD;

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

}

