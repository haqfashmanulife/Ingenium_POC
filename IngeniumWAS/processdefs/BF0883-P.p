# Converted from PathFinder 2.2 to 3.0 Jun 18, 2004 3:13:30 PM EDT

#*******************************************************************************
#*  Component:   BF0883-P.p                                                    *
#*  Description:                                                               *
#*                                                                             *
#*******************************************************************************
#*  Chg#    Release  Description                                               *
#*                                                                             *
#*  014590  6.0      New for release 6.0                                       *
#*  017150  612J     Remove Currency Decimals = "2"                            *
#*                                                                             *
#*******************************************************************************

P-STEP BF0883-P
{
    ATTRIBUTES
    {
        BusinessFunctionId = "0883";
        BusinessFunctionName = "T4RSP Receipt History Delete";
        BusinessFunctionType = "Delete";
        MirName = "CCWM3800";
    }

    OUT LSIR-RETURN-CD;

    OUT MIR-RETRN-CD;

    IN MIR-POL-ID-BASE
    {
        Key;
        Mandatory;
        Length = "9";
        DBTableName = "TTHST";
        DefaultSession = "MIR-POL-ID-BASE";
        SType = "Text";
        Label = "Policy Id";
    }

    IN MIR-POL-ID-SFX
    {
        Key;
        Length = "1";
        DBTableName = "TTHST";
        DefaultSession = "MIR-POL-ID-SFX";
        SType = "Text";
        Label = "Suffix";
    }

    IN MIR-T4RSP-RHST-DT
    {
        Key;
        Mandatory;
        Length = "10";
        DBTableName = "TTHST";
        DefaultSession = "LSIR-PRCES-DT";
        SType = "Date";
        Label = "Effective Date";
    }

    IN MIR-T4RSP-RHST-SEQ-NUM
    {
        Key;
        Mandatory;
        Length = "3";
        DBTableName = "TTHST";
        DefaultConstant = "000";
        SType = "Text";
        Label = "Sequence Number";
    }

}

