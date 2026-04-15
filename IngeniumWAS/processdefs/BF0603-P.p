# Converted from PathFinder 2.2 to 3.0 Jun 18, 2004 3:13:23 PM EDT

#*******************************************************************************
#*  Component:   BF0603-P.p                                                    *
#*  Description:                                                               *
#*                                                                             *
#*******************************************************************************
#*  Chg#    Release  Description                                               *
#*                                                                             *
#*  014590  6.0      New for release 6.0                                       *
#*  017150  612J     Remove Currency Decimals = "2"                            *
#*                                                                             *
#*******************************************************************************

P-STEP BF0603-P
{
    ATTRIBUTES
    {
        BusinessFunctionId = "0603";
        BusinessFunctionName = "Underwriter Caseload Delete";
        BusinessFunctionType = "Delete";
        MirName = "NCWM0600";
    }

    OUT LSIR-RETURN-CD;

    OUT MIR-RETRN-CD;

    IN MIR-CLI-ID
    {
        Key;
        Mandatory;
        Length = "10";
        DBTableName = "TUWWK";
        DefaultSession = "MIR-CLI-ID";
        SType = "Text";
        Label = "Client Number";
    }

    IN MIR-USER-ID
    {
        Key;
        Mandatory;
        Length = "8";
        DBTableName = "TUWWK";
        DefaultSession = "MIR-USER-ID";
        SType = "Text";
        Label = "Underwriter's Initials";
    }

}

