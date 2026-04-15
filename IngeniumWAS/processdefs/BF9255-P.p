# Converted from PathFinder 2.2 to 3.0 Jun 18, 2004 3:13:59 PM EDT

#*******************************************************************************
#*  Component:   BF9255-P.p                                                    *
#*  Description: Master Claim Cancel                                           *
#*                                                                             *
#*******************************************************************************
#*  Chg#    Release  Description                                               *
#*                                                                             *
#*  HCL104  HIN/CL   INITIAL VERSION                                           *
#*                                                                             *
#*******************************************************************************

P-STEP BF9255-P
{
    ATTRIBUTES
    {
        BusinessFunctionId = "9255";
        BusinessFunctionName = "Master Claim Cancel";
        BusinessFunctionType = "Update";
        MirName = "CCWM9255";
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

}

