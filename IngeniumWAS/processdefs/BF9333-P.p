# Converted from PathFinder 2.2 to 3.0 Jun 18, 2004 3:13:59 PM EDT

#*******************************************************************************
#*  Component:   BF9333-P.p                                                    *
#*  Description: Final Approval Reversal                                       *
#*                                                                             *
#*******************************************************************************
#*  Chg#    Release  Description                                               *
#*                                                                             *
#*  HCL109  HIN/CL   CLAIM PAYMENT                                             *
#*                                                                             *
#*******************************************************************************

P-STEP BF9333-P
{
    ATTRIBUTES
    {
        BusinessFunctionId = "9333";
        BusinessFunctionName = "Approval Reversal";
        BusinessFunctionType = "Create";
        MirName = "CCWM9333";
    }

    OUT LSIR-RETURN-CD;

    OUT MIR-RETRN-CD;

    IN MIR-CLM-ID
    {
        Length = "8";
        DBTableName = "TCLMA";
        SType = "Text";
        Label = "Master Claim ID";
    }
    
    IN MIR-APROV-SEQ-NUM
    {
        Length = "3";
        SType = "Text";
        Label = "Sequence Number";
    }     

}
