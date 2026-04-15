# Converted from PathFinder 2.2 to 3.0 Jun 18, 2004 3:13:59 PM EDT

#*******************************************************************************
#*  Component:   BF9254-P.p                                                    *
#*  Description: Master Claim Update                                           *
#*                                                                             *
#*******************************************************************************
#*  Chg#    Release  Description                                               *
#*                                                                             *
#*  HCL104  HIN/CL   Initial Version                                           *
#*                                                                             *
#*******************************************************************************

P-STEP BF9254-P
{
    ATTRIBUTES
    {
        BusinessFunctionId = "9254";
        BusinessFunctionName = "Run Auto Adjudication";
        BusinessFunctionType = "Update";
        MirName = "CCWM9254";
    }

    OUT LSIR-RETURN-CD;

    OUT MIR-RETRN-CD;

    INOUT MIR-CLM-ID
    {
        Length = "8";
        DBTableName = "TCLMA";
        SType = "Text";
        Label = "Claim ID";
    }

}
