# Converted from PathFinder 2.2 to 3.0 Jun 18, 2004 3:14:01 PM EDT

#*******************************************************************************
#*  Component:   BF9675-P.p                                                    *
#*  Description: Claim Requirements Table (CLIM) Retrieve step                 *
#*                                                                             *
#*******************************************************************************
#*  Chg#    Release  Description                                               *
#*                                                                             *
#*  HCL110  HIN/CL   CLAIM REQUIREMENTS                                        *
#*                                                                             *
#*******************************************************************************

P-STEP BF9675-P
{
    ATTRIBUTES
    {
        BusinessFunctionId = "9675";
        BusinessFunctionName = "Client Moral Risk Table Retrieve";
        BusinessFunctionType = "Retrieve";
        MirName = "CCWM9675";
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
    
    OUT MIR-CLIM-MORAL-RISK-CD
    {
        Length = "5";
        CodeSource = "EDIT";
        CodeType = "MORAL";
        DBTableName = "TCLIM";
        SType = "Text";
        Label = "Client Moral Risk Category";
    }

    OUT MIR-CLIM-PREV-UPDT-USER-ID
    {
        Length = "8";
        DBTableName = "TCLIM";
        SType = "Text";
        Label = "Last Updated By";
    }

    OUT MIR-CLIM-PREV-UPDT-DT
    {
        Length = "10";
        DBTableName = "TCLIM";
        SType = "Text";
        Label = "Date Updated";
    }

}
