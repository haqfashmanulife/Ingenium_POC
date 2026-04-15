# Converted from PathFinder 2.2 to 3.0 Jun 18, 2004 3:13:50 PM EDT

#*******************************************************************************
#*  Component:   BF2113-P.p                                                    *
#*  Description:                                                               *
#*                                                                             *
#*******************************************************************************
#*  Chg#    Release  Description                                               *
#*                                                                             *
#*  014590  6.0      New for release 6.0                                       *
#*  017150  612J     Remove Currency Decimals = "2"                            *
#*                                                                             *
#*******************************************************************************

P-STEP BF2113-P
{
    ATTRIBUTES
    {
        BusinessFunctionId = "2113";
        BusinessFunctionName = "Agent Override Profile Delete";
        BusinessFunctionType = "Delete";
        MirName = "CCWM0071";
    }

    OUT LSIR-RETURN-CD;

    OUT MIR-RETRN-CD;

    IN MIR-OVRID-BASE-AGT-ID
    {
        Key;
        Mandatory;
        Length = "6";
        DBTableName = "TAS";
        SType = "Text";
        Label = "Override";
    }

    IN MIR-OVRID-ID
    {
        Key;
        Mandatory;
        Length = "2";
        DBTableName = "TAS";
        SType = "Text";
        Label = "Agent Situation";
    }

}

