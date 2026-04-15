# Converted from PathFinder 2.2 to 3.0 Jun 18, 2004 3:13:46 PM EDT

#*******************************************************************************
#*  Component:   BF1923-P.p                                                    *
#*  Description:                                                               *
#*                                                                             *
#*******************************************************************************
#*  Chg#    Release  Description                                               *
#*                                                                             *
#*  014590  6.0      New for release 6.0                                       *
#*  017150  612J     Remove Currency Decimals = "2"                            *
#*                                                                             *
#*******************************************************************************

P-STEP BF1923-P
{
    ATTRIBUTES
    {
        BusinessFunctionId = "1923";
        BusinessFunctionName = "Previous Name Delete";
        BusinessFunctionType = "Delete";
        MirName = "CCWM1923";
    }

    OUT LSIR-RETURN-CD;

    OUT MIR-RETRN-CD;

    IN MIR-CLI-ID
    {
        Key;
        Mandatory;
        Length = "10";
        DBTableName = "TCLNM";
        SType = "Text";
        Label = "Client Number";
    }

    IN MIR-CLI-INDV-SEQ-NUM
    {
        Key;
        Mandatory;
        Length = "3";
        DBTableName = "TCLNM";
        SType = "Text";
        Label = "Sequence Number";
    }

}

