# Converted from PathFinder 2.2 to 3.0 Jun 18, 2004 3:13:36 PM EDT

#*******************************************************************************
#*  Component:   BF1321-P.p                                                    *
#*  Description:                                                               *
#*                                                                             *
#*******************************************************************************
#*  Chg#    Release  Description                                               *
#*                                                                             *
#*  014590  6.0      New for release 6.0                                       *
#*  017150  612J     Remove Currency Decimals = "2"                            *
#*                                                                             *
#*******************************************************************************

P-STEP BF1321-P
{
    ATTRIBUTES
    {
        BusinessFunctionId = "1321";
        BusinessFunctionName = "Client Contact History Create";
        BusinessFunctionType = "Create";
        MirName = "CCWM0351";
    }

    OUT LSIR-RETURN-CD;

    OUT MIR-RETRN-CD;

    IN MIR-CLI-CNTCT-DT
    {
        Key;
        Length = "10";
        DBTableName = "TCH";
        DefaultSession = "LSIR-PRCES-DT";
        SType = "Date";
        Label = "Activity Date";
    }

    OUT MIR-CLI-CNTCT-SEQ-NUM
    {
        Key;
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

