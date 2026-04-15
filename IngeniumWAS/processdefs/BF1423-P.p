# Converted from PathFinder 2.2 to 3.0 Jun 18, 2004 3:13:39 PM EDT

#*******************************************************************************
#*  Component:   BF1423-P.p                                                    *
#*  Description:                                                               *
#*                                                                             *
#*******************************************************************************
#*  Chg#    Release  Description                                               *
#*                                                                             *
#*  014590  6.0      New for release 6.0                                       *
#*  017150  612J     Remove Currency Decimals = "2"                            *
#*                                                                             *
#*******************************************************************************

P-STEP BF1423-P
{
    ATTRIBUTES
    {
        BusinessFunctionId = "1423";
        BusinessFunctionName = "Agent Record Delete";
        BusinessFunctionType = "Delete";
        MirName = "CCWM0081";
    }

    OUT LSIR-RETURN-CD;

    OUT MIR-RETRN-CD;

    IN MIR-AGT-ID
    {
        Key;
        Mandatory;
        Length = "6";
        DBTableName = "TAG";
        SType = "Text";
        Label = "Agent ID";
    }

}

