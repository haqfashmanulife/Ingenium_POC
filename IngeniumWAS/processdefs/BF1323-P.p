# Converted from PathFinder 2.2 to 3.0 Jun 18, 2004 3:13:36 PM EDT

#*******************************************************************************
#*  Component:   BF1323-P.p                                                    *
#*  Description:                                                               *
#*                                                                             *
#*******************************************************************************
#*  Chg#    Release  Description                                               *
#*                                                                             *
#*  014590  6.0      New for release 6.0                                       *
#*  017150  612J     Remove Currency Decimals = "2"                            *
#*                                                                             *
#*******************************************************************************

P-STEP BF1323-P
{
    ATTRIBUTES
    {
        BusinessFunctionId = "1323";
        BusinessFunctionName = "Client Contact History Delete";
        BusinessFunctionType = "Delete";
        MirName = "CCWM0351";
    }

    OUT LSIR-RETURN-CD;

    OUT MIR-RETRN-CD;

    IN MIR-CLI-CNTCT-DT
    {
        Key;
        Mandatory;
        Length = "10";
        DBTableName = "TCH";
        DefaultSession = "LSIR-PRCES-DT";
        SType = "Date";
        Label = "Activity Date";
    }

    IN MIR-CLI-CNTCT-SEQ-NUM
    {
        Key;
        Mandatory;
        Length = "2";
        DBTableName = "TCH";
        DefaultConstant = "01";
        SType = "Text";
        Label = "Sequence Number";
    }

    IN MIR-CLI-ID
    {
        Key;
        Mandatory;
        Length = "10";
        DBTableName = "TCH";
        DefaultSession = "MIR-CLI-ID";
        SType = "Text";
        Label = "Client Number";
    }

}

