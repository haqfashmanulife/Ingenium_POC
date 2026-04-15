# Converted from PathFinder 2.2 to 3.0 Jun 18, 2004 3:14:01 PM EDT

#*******************************************************************************
#*  Component:   BF9861-P.p                                                    *
#*  Description: Claim Requirements Table (CRTB) Create step                   *
#*                                                                             *
#*******************************************************************************
#*  Chg#    Release  Description                                               *
#*                                                                             *
#*  HCL102  HIN/CL   CLAIM REQUIREMENTS                                        *
#*                                                                             *
#*******************************************************************************

P-STEP BF9861-P
{
    ATTRIBUTES
    {
        BusinessFunctionId = "9861";
        BusinessFunctionName = "Claim Requirement Table Create";
        BusinessFunctionType = "Create";
        MirName = "CCWM9861";
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
