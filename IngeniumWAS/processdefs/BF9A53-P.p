# Converted from PathFinder 2.2 to 3.0 Jun 18, 2004 3:13:59 PM EDT

#*******************************************************************************
#*  Component:   BF9A53-P.p                                                    *
#*  Description: Death Master Claim Delete                                     *
#*                                                                             *
#*******************************************************************************
#*  Chg#    Release  Description                                               *
#*  IPCAMC   CTS     INITIAL VERSION                                           *
#*                                                                             *
#*******************************************************************************

P-STEP BF9A53-P
{
    ATTRIBUTES
    {
        BusinessFunctionId = "9A53";
        BusinessFunctionName = "Death Master Claim Delete";
        BusinessFunctionType = "Delete";
        MirName = "CCWM9A53";
    }

    OUT LSIR-RETURN-CD;

    OUT MIR-RETRN-CD;


    IN MIR-CLM-ID
    {
        Key;
        Length = "8";
        DBTableName = "TDCLM";
        DefaultSession = "MIR-CLM-ID";
        SType = "Text";
        Label = "Death Master Claim ID";
    }

    

}

