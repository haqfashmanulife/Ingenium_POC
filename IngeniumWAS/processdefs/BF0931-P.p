# Converted from PathFinder 2.2 to 3.0 Jun 18, 2004 3:13:31 PM EDT

#*******************************************************************************
#*  Component:   BF0931-P.p                                                    *
#*  Description:                                                               *
#*                                                                             *
#*******************************************************************************
#*  Chg#    Release  Description                                               *
#*                                                                             *
#*  014590  6.0      New for release 6.0                                       *
#*  017150  612J     Remove Currency Decimals = "2"                            *
#*                                                                             *
#*******************************************************************************

P-STEP BF0931-P
{
    ATTRIBUTES
    {
        BusinessFunctionId = "0931";
        BusinessFunctionName = "Annuity Destination Details Create";
        BusinessFunctionType = "Create";
        MirName = "CCWM4250";
    }

    OUT LSIR-RETURN-CD;

    OUT MIR-RETRN-CD;

    IN MIR-CDA-EFF-DT
    {
        Key;
        Mandatory;
        Length = "10";
        DBTableName = "TCDSD";
        SType = "Date";
        Label = "Effective Date";
    }

    IN MIR-DEST-CVG-NUM
    {
        Key;
        Mandatory;
        Length = "2";
        DBTableName = "TCDSD";
        SType = "Text";
        Label = "Coverage Number";
    }

    IN MIR-DEST-POL-ID-BASE
    {
        Key;
        Mandatory;
        Length = "9";
        DBTableName = "TCDSD";
        DefaultSession = "MIR-POL-ID-BASE";
        SType = "Text";
        Label = "Policy Id";
    }

    IN MIR-DEST-POL-ID-SFX
    {
        Key;
        Length = "1";
        DBTableName = "TCDSD";
        DefaultSession = "MIR-POL-ID-SFX";
        SType = "Text";
        Label = "Suffix";
    }

    OUT MIR-DEST-SEQ-NUM
    {
        Length = "3";
        DBTableName = "TCDSD";
        SType = "Text";
        Label = "Sequence Number";
    }

}

