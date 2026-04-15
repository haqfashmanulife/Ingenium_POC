# Converted from PathFinder 2.2 to 3.0 Jun 18, 2004 3:13:59 PM EDT

#*******************************************************************************
#*  Component:   BF9251-P.p                                                    *
#*  Description: Master Claim Create                                           *
#*                                                                             *
#*******************************************************************************
#*  Chg#    Release  Description                                               *
#*                                                                             *
#*  HCL103  HIN/CL   INITIAL VERSION                                           *
#*  HCCL05  HIN/CL   Pick-up facility (add Historical Claim Indicator)         *
#*  UYSDMC  CTS      USYS CLAIM IND ADDITION                                   *
#*******************************************************************************

P-STEP BF9251-P
{
    ATTRIBUTES
    {
        BusinessFunctionId = "9251";
        BusinessFunctionName = "Master Claim Create";
        BusinessFunctionType = "Create";
        MirName = "CCWM9251";
    }

    OUT LSIR-RETURN-CD;

    OUT MIR-RETRN-CD;

    INOUT MIR-CLI-ID
    {
        Key;
        Length = "10";
        DBTableName = "TCLI";
        DefaultSession = "MIR-CLI-ID";
        SType = "Text";
        Label = "Client ID";
    }

    OUT MIR-CLM-ID
    {
        Length = "8";
        DBTableName = "TCLMA";
        SType = "Text";
        Label = "Master Claim ID";
    }

    IN MIR-CLMA-HIST-CLM-IND
    {
        Length = "1";
        DBTableName = "TCLMA";
        SType = "Hidden";
        Label = "Historical Claim Indicator";
    }

#UYSDMC CHANGES STARTS HERE
    IN MIR-CLMA-USYS-CLM-IND
    {
        Length = "1";
        DBTableName = "TCLMA";
        SType = "Hidden";
        Label = "Unisys Claim Indicator";
    }
#UYSDMC CHANGES ENDS HERE

}
