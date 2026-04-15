# Converted from PathFinder 2.2 to 3.0 Jun 18, 2004 3:13:46 PM EDT

#*******************************************************************************
#*  Component:   BF1921-P.p                                                    *
#*  Description:                                                               *
#*                                                                             *
#*******************************************************************************
#*  Chg#    Release  Description                                               *
#*                                                                             *
#*  014590  6.0      New for release 6.0                                       *
#*  017150  612J     Remove Currency Decimals = "2"                            *
#*                                                                             *
#*******************************************************************************

P-STEP BF1921-P
{
    ATTRIBUTES
    {
        BusinessFunctionId = "1921";
        BusinessFunctionName = "Previous Name Create";
        BusinessFunctionType = "Create";
        MirName = "CCWM1921";
    }

    OUT LSIR-RETURN-CD;

    OUT MIR-RETRN-CD;

    IN MIR-CLI-ID
    {
        Key;
        Mandatory;
        Length = "10";
        DBTableName = "TCLNM";
        SType = "Text";
        Label = "Client Number";
    }

    INOUT MIR-CLI-INDV-SEQ-NUM
    {
        Key;
        Mandatory;
        Length = "3";
        DBTableName = "TCLNM";
        SType = "Text";
        Label = "Sequence Number";
    }

}

