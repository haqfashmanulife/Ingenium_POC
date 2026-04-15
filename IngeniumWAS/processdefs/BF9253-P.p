# Converted from PathFinder 2.2 to 3.0 Jun 18, 2004 3:13:59 PM EDT

#*******************************************************************************
#*  Component:   BF9253-P.p                                                    *
#*  Description: Master Claim Delete                                           *
#*                                                                             *
#*******************************************************************************
#*  Chg#    Release  Description                                               *
#*                                                                             *
#*  HCL104  HIN/CL   INITIAL VERSION                                           *
#*                                                                             *
#*******************************************************************************

P-STEP BF9253-P
{
    ATTRIBUTES
    {
        BusinessFunctionId = "9253";
        BusinessFunctionName = "Master Claim Delete";
        BusinessFunctionType = "Delete";
        MirName = "CCWM9253";
    }

    OUT LSIR-RETURN-CD;

    OUT MIR-RETRN-CD;


    IN MIR-CLM-ID
    {
        Key;
        Length = "8";
        DBTableName = "TCLMA";
        DefaultSession = "MIR-CLM-ID";
        SType = "Text";
        Label = "Master Claim ID";
    }

    IN MIR-CLAIM-NOTE-IND
    {
        Length = "1";
        DBTableName = "Derived";
        SType = "Indicator";
        Label = "Claim Note";
    }

}

