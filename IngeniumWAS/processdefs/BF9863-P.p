# Converted from PathFinder 2.2 to 3.0 Jun 18, 2004 3:14:01 PM EDT

#*******************************************************************************
#*  Component:   BF9863-P.p                                                    *
#*  Description: Claim Requirements Table (CRTB) Delete step                   *
#*                                                                             *
#*******************************************************************************
#*  Chg#    Release  Description                                               *
#*                                                                             *
#*  HCL102  HIN/CL   CLAIM REQUIREMENTS                                        *
#*                                                                             *
#*******************************************************************************

P-STEP BF9863-P
{
    ATTRIBUTES
    {
        BusinessFunctionId = "9863";
        BusinessFunctionName = "Claim Requirement Table Delete";
        BusinessFunctionType = "Delete";
        MirName = "CCWM9863";
    }

    OUT LSIR-RETURN-CD;

    OUT MIR-RETRN-CD;

    IN MIR-CLM-REQIR-ID
    {
        Key;
        Mandatory;
        Length = "5";
        CodeSource = "EDIT";
        CodeType = "CMRTC";
        DBTableName = "TCRTB";
        SType = "Selection";
        Label = "Claim Requirement Code";
    }

}
