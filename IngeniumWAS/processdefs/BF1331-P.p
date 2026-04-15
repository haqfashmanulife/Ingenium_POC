# Converted from PathFinder 2.2 to 3.0 Jun 18, 2004 3:13:37 PM EDT

#*******************************************************************************
#*  Component:   BF1331-P.p                                                    *
#*  Description:                                                               *
#*                                                                             *
#*******************************************************************************
#*  Chg#    Release  Description                                               *
#*                                                                             *
#*  014590  6.0      New for release 6.0                                       *
#*  017150  612J     Remove Currency Decimals = "2"                            *
#*                                                                             *
#*******************************************************************************

P-STEP BF1331-P
{
    ATTRIBUTES
    {
        BusinessFunctionId = "1331";
        BusinessFunctionName = "Reinsurance Cession Record Create";
        BusinessFunctionType = "Create";
        MirName = "CCWM0381";
    }

    OUT LSIR-RETURN-CD;

    OUT MIR-RETRN-CD;

    IN MIR-CSN-REC-NUM
    {
        Key;
        Mandatory;
        Length = "2";
        DBTableName = "TRI";
        DefaultConstant = "01";
        SType = "Text";
        Label = "Reinsurance Cession Record";
    }

    IN MIR-CVG-NUM
    {
        Key;
        Mandatory;
        Length = "2";
        DBTableName = "TRI";
        DefaultConstant = "01";
        SType = "Text";
        Label = "Coverage Number";
    }

    IN MIR-POL-ID-BASE
    {
        Key;
        Mandatory;
        Length = "9";
        DBTableName = "TRI";
        DefaultSession = "MIR-POL-ID-BASE";
        SType = "Text";
        Label = "Policy Id";
    }

    IN MIR-POL-ID-SFX
    {
        Key;
        Length = "1";
        DBTableName = "TRI";
        DefaultSession = "MIR-POL-ID-SFX";
        SType = "Text";
        Label = "Suffix";
    }

}

