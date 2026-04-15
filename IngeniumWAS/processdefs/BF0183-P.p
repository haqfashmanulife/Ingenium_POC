# Converted from PathFinder 2.2 to 3.0 Jun 18, 2004 3:13:17 PM EDT

#*******************************************************************************
#*  Component:   BF0183-P.p                                                    *
#*  Description:                                                               *
#*                                                                             *
#*******************************************************************************
#*  Chg#    Release  Description                                               *
#*                                                                             *
#*  014590  6.0      New for release 6.0                                       *
#*  017150  612J     Remove Currency Decimals = "2"                            *
#*                                                                             *
#*******************************************************************************

P-STEP BF0183-P
{
    ATTRIBUTES
    {
        BusinessFunctionId = "0183";
        BusinessFunctionName = "Policy Notification Delete";
        BusinessFunctionType = "Delete";
        MirName = "CCWM0180";
    }

    OUT LSIR-RETURN-CD;

    OUT MIR-RETRN-CD;

    IN MIR-POL-ID-BASE
    {
        Key;
        Mandatory;
        Length = "9";
        DBTableName = "TPOL";
        DefaultSession = "MIR-POL-ID-BASE";
        SType = "Text";
        Label = "Policy Id";
    }

    IN MIR-POL-ID-SFX
    {
        Key;
        Length = "1";
        DBTableName = "TPOL";
        DefaultSession = "MIR-POL-ID-SFX";
        SType = "Text";
        Label = "Suffix";
    }

    IN MIR-POL-NOTI-DT
    {
        Key;
        Mandatory;
        Length = "10";
        DBTableName = "TPOLN";
        SType = "Date";
        Label = "Date Notices Produced";
    }

    IN MIR-POL-NOTI-SEQ-NUM
    {
        Key;
        Mandatory;
        Length = "3";
        DBTableName = "TPOLN";
        SType = "Text";
        Label = "Sequence Number";
    }

}

