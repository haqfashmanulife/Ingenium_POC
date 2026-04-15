# Converted from PathFinder 2.2 to 3.0 Jun 18, 2004 3:14:01 PM EDT

#*******************************************************************************
#*  Component:   BF9793-P.p                                                    *
#*  Description:                                                               *
#*                                                                             *
#*******************************************************************************
#*  Chg#    Release  Description                                               *
#*                                                                             *
#*  2BAC03  07MAY02  Module created                                            *
#*                                                                             *
#*******************************************************************************

P-STEP BF9793-P
{
    ATTRIBUTES
    {
        BusinessFunctionId = "9793";
        BusinessFunctionName = "AVE Reformat Control Table Delete";
        BusinessFunctionType = "Delete";
        MirName = "CCWM9793";
    }

    OUT LSIR-RETURN-CD;

    OUT MIR-RETRN-CD;

    IN MIR-PLAN-ID
    {
        Key;
        Mandatory;
        Length = "6";
        DBTableName = "TAVE";
        SType = "Text";
        Label = "Ingenium Plan Code";
    }

    IN MIR-CVG-STAT-TYP-CD
    {
        Key;
        Mandatory;
        Length = "1";
        DBTableName = "TAVE";
        SType = "Text";
        Label = "Coverage Type";
    }


}

