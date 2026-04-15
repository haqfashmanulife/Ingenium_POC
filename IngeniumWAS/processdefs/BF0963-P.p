# Converted from PathFinder 2.2 to 3.0 Jun 18, 2004 3:13:32 PM EDT

#*******************************************************************************
#*  Component:   BF0963-P.p                                                    *
#*  Description:                                                               *
#*                                                                             *
#*******************************************************************************
#*  Chg#    Release  Description                                               *
#*                                                                             *
#*  014590  6.0      New for release 6.0                                       *
#*  017150  612J     Remove Currency Decimals = "2"                            *
#*                                                                             *
#*******************************************************************************

P-STEP BF0963-P
{
    ATTRIBUTES
    {
        BusinessFunctionId = "0963";
        BusinessFunctionName = "Undo/Redo Activity Table Delete";
        BusinessFunctionType = "Delete";
        MirName = "CCWM4500";
    }

    OUT LSIR-RETURN-CD;

    OUT MIR-RETRN-CD;

    IN MIR-POL-ACTV-TYP-ID
    {
        Key;
        Mandatory;
        Length = "4";
        DBTableName = "TPTAB";
        SType = "Text";
        Label = "Activity Number";
    }

}

