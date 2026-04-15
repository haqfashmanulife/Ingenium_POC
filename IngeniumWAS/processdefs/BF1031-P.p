# Converted from PathFinder 2.2 to 3.0 Jun 18, 2004 3:13:33 PM EDT

#*******************************************************************************
#*  Component:   BF1031-P.p                                                    *
#*  Description:                                                               *
#*                                                                             *
#*******************************************************************************
#*  Chg#    Release  Description                                               *
#*                                                                             *
#*  014590  6.0      New for release 6.0                                       *
#*  017150  612J     Remove Currency Decimals = "2"                            *
#*  B10158  KRW      Max length of Bank Account ID is 7                        *
#*                                                                             *
#*******************************************************************************

P-STEP BF1031-P
{
    ATTRIBUTES
    {
        BusinessFunctionId = "1031";
        BusinessFunctionName = "Bank Account Table Create";
        BusinessFunctionType = "Create";
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

}

