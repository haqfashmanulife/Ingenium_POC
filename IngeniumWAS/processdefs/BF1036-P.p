# Converted from PathFinder 2.2 to 3.0 Jun 18, 2004 3:13:33 PM EDT

#*******************************************************************************
#*  Component:   BF1036-P.p                                                    *
#*  Description:                                                               *
#*                                                                             *
#*******************************************************************************
#*  Chg#    Release  Description                                               *
#*                                                                             *
#*  014590  6.0      New for release 6.0                                       *
#*  017150  612J     Remove Currency Decimals = "2"                            *
#*  B00675  Van      Max length of Bank Account ID is 7                        *
#*******************************************************************************

P-STEP BF1036-P
{
    ATTRIBUTES
    {
        BusinessFunctionId = "1036";
        BusinessFunctionName = "Bank Account Table Unlink";
        BusinessFunctionType = "Unlink";
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

    IN MIR-CLI-ID
    {
        Key;
        Mandatory;
        Length = "10";
        DBTableName = "TCLI";
        DefaultSession = "MIR-CLI-ID";
        SType = "Text";
        Label = "Client Number";
    }

}

