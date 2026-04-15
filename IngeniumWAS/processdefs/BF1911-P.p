# Converted from PathFinder 2.2 to 3.0 Jun 18, 2004 3:13:46 PM EDT

#*******************************************************************************
#*  Component:   BF1911-P.p                                                    *
#*  Description:                                                               *
#*                                                                             *
#*******************************************************************************
#*  Chg#    Release  Description                                               *
#*                                                                             *
#*  014590  6.0      New for release 6.0                                       *
#*  017150  612J     Remove Currency Decimals = "2"                            *
#*                                                                             *
#*******************************************************************************

P-STEP BF1911-P
{
    ATTRIBUTES
    {
        BusinessFunctionId = "1911";
        BusinessFunctionName = "User Security Record Create";
        BusinessFunctionType = "Create";
        MirName = "XCWM0100";
    }

    OUT LSIR-RETURN-CD;

    OUT MIR-RETRN-CD;

    IN MIR-USER-ID
    {
        Key;
        Mandatory;
        Length = "8";
        DBTableName = "TUSEC";
        DefaultSession = "MIR-USER-ID";
        SType = "Text";
        Label = "User ID";
    }

}

