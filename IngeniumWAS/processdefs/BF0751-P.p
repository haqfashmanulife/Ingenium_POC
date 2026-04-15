# Converted from PathFinder 2.2 to 3.0 Jun 18, 2004 3:13:28 PM EDT

#*******************************************************************************
#*  Component:   BF0751-P.p                                                    *
#*  Description:                                                               *
#*                                                                             *
#*******************************************************************************
#*  Chg#    Release  Description                                               *
#*                                                                             *
#*  014590  6.0      New for release 6.0                                       *
#*  017150  612J     Remove Currency Decimals = "2"                            *
#*                                                                             *
#*******************************************************************************

P-STEP BF0751-P
{
    ATTRIBUTES
    {
        BusinessFunctionId = "0751";
        BusinessFunctionName = "Policy Tax Exemption Record Create";
        BusinessFunctionType = "Create";
        MirName = "CCWM0902";
    }

    OUT LSIR-RETURN-CD;

    OUT MIR-RETRN-CD;

    IN MIR-CVG-NUM
    {
        Key;
        Mandatory;
        Length = "2";
        DBTableName = "TEX";
        DefaultConstant = "01";
        SType = "Text";
        Label = "Coverage Number";
    }

    IN MIR-POL-ID-BASE
    {
        Key;
        Mandatory;
        Length = "9";
        DBTableName = "TEX";
        DefaultSession = "MIR-POL-ID-BASE";
        SType = "Text";
        Label = "Policy Id";
    }

    IN MIR-POL-ID-SFX
    {
        Key;
        Length = "1";
        DBTableName = "TEX";
        DefaultSession = "MIR-POL-ID-SFX";
        SType = "Text";
        Label = "Suffix";
    }

    IN MIR-TXEMP-TST-SEQ-NUM
    {
        Key;
        Mandatory;
        Length = "3";
        DBTableName = "TEX";
        DefaultConstant = "001";
        SType = "Text";
        Label = "Coverage Sequence Number";
    }

}

