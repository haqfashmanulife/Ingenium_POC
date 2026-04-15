# Converted from PathFinder 2.2 to 3.0 Jun 18, 2004 3:13:19 PM EDT

#*******************************************************************************
#*  Component:   BF0310-P.p                                                    *
#*  Description:                                                               *
#*                                                                             *
#*******************************************************************************
#*  Chg#    Release  Description                                               *
#*                                                                             *
#*  014590  6.0      New for release 6.0                                       *
#*  017150  612J     Remove Currency Decimals = "2"                            *
#*                                                                             *
#*******************************************************************************

P-STEP BF0310-P
{
    ATTRIBUTES
    {
        BusinessFunctionId = "0310";
        BusinessFunctionName = "User Exit Table Retrieve";
        BusinessFunctionType = "Retrieve";
        MirName = "XCWM0310";
    }

    OUT LSIR-RETURN-CD;

    OUT MIR-RETRN-CD;

    IN MIR-USER-EXIT-ID
    {
        Key;
        Mandatory;
        Length = "4";
        CodeSource = "DataModel";
        CodeType = "USER-EXIT-ID";
        DBTableName = "TUXIT";
        SType = "Selection";
        Label = "User Exit Pointer";
    }

    OUT MIR-BTCH-PGM-ID
    {
        Length = "8";
        DBTableName = "TUXIT";
        SType = "Text";
        Label = "Batch Program";
    }

    OUT MIR-ONLN-PGM-ID
    {
        Length = "8";
        DBTableName = "TUXIT";
        SType = "Text";
        Label = "Online Program";
    }

    OUT MIR-USER-EXIT-INVOK-CD
    {
        Length = "1";
        CodeSource = "DataModel";
        CodeType = "USER-EXIT-INVOK-CD";
        DBTableName = "TUXIT";
        SType = "Text";
        Label = "Invocation Type";
    }

}

