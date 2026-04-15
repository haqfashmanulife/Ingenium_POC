# Converted from PathFinder 2.2 to 3.0 Jun 18, 2004 3:14:01 PM EDT

#*******************************************************************************
#*  Component:   BF9676-P.p                                                    *
#*  Description: Claim Requirements Table (CLIM) Create step                   *
#*                                                                             *
#*******************************************************************************
#*  Chg#    Release  Description                                               *
#*                                                                             *
#*  HCL110  HIN/CL   CLAIM REQUIREMENTS                                        *
#*                                                                             *
#*******************************************************************************

P-STEP BF9676-P
{
    ATTRIBUTES
    {
        BusinessFunctionId = "9676";
        BusinessFunctionName = "Client Moral Risk Table Create";
        BusinessFunctionType = "Create";
        MirName = "CCWM9676";
    }

    OUT LSIR-RETURN-CD;

    OUT MIR-RETRN-CD;

    IN MIR-CLI-ID
    {
        Key;
        Mandatory;
        Length = "10";
        DBTableName = "TCLIM";
        SType = "Text";
        Label = "Client ID";
    }

}
