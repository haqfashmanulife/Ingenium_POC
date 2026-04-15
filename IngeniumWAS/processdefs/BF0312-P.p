# Converted from PathFinder 2.2 to 3.0 Jun 18, 2004 3:13:19 PM EDT

#*******************************************************************************
#*  Component:   BF0312-P.p                                                    *
#*  Description:                                                               *
#*                                                                             *
#*******************************************************************************
#*  Chg#    Release  Description                                               *
#*                                                                             *
#*  014590  6.0      New for release 6.0                                       *
#*  017150  612J     Remove Currency Decimals = "2"                            *
#*                                                                             *
#*******************************************************************************

P-STEP BF0312-P
{
    ATTRIBUTES
    {
        BusinessFunctionId = "0312";
        BusinessFunctionName = "User Exit Table Update";
        BusinessFunctionType = "Update";
        MirName = "XCWM0310";
    }

    OUT LSIR-RETURN-CD;

    OUT MIR-RETRN-CD;

    INOUT MIR-BTCH-PGM-ID
    {
        Mandatory;
        Length = "8";
        DBTableName = "TUXIT";
        SType = "Text";
        Label = "Batch Program";
    }

    INOUT MIR-ONLN-PGM-ID
    {
        Mandatory;
        Length = "8";
        DBTableName = "TUXIT";
        SType = "Text";
        Label = "Online Program";
    }

    INOUT MIR-USER-EXIT-INVOK-CD
    {
        Mandatory;
        Length = "1";
        CodeSource = "DataModel";
        CodeType = "USER-EXIT-INVOK-CD";
        DBTableName = "TUXIT";
        SType = "Selection";
        Label = "Invocation Type";
    }

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

}

