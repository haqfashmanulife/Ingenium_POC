# Converted from PathFinder 2.2 to 3.0 Jun 18, 2004 3:13:19 PM EDT

#*******************************************************************************
#*  Component:   BF0311-P.p                                                    *
#*  Description:                                                               *
#*                                                                             *
#*******************************************************************************
#*  Chg#    Release  Description                                               *
#*                                                                             *
#*  014590  6.0      New for release 6.0                                       *
#*  017150  612J     Remove Currency Decimals = "2"                            *
#*                                                                             *
#*******************************************************************************

P-STEP BF0311-P
{
    ATTRIBUTES
    {
        BusinessFunctionId = "0311";
        BusinessFunctionName = "User Exit Table Create";
        BusinessFunctionType = "Create";
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

}

