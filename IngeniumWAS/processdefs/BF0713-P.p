# Converted from PathFinder 2.2 to 3.0 Jun 18, 2004 3:13:27 PM EDT

#*******************************************************************************
#*  Component:   BF0713-P.p                                                    *
#*  Description:                                                               *
#*                                                                             *
#*******************************************************************************
#*  Chg#    Release  Description                                               *
#*                                                                             *
#*  014590  6.0      New for release 6.0                                       *
#*  017150  612J     Remove Currency Decimals = "2"                            *
#*                                                                             *
#*******************************************************************************

P-STEP BF0713-P
{
    ATTRIBUTES
    {
        BusinessFunctionId = "0713";
        BusinessFunctionName = "Immediate Annuity Quote Delete";
        BusinessFunctionType = "Delete";
        MirName = "CCWM0851";
    }

    OUT LSIR-RETURN-CD;

    OUT MIR-RETRN-CD;

    IN MIR-IA-QUOT-NUM
    {
        Key;
        Mandatory;
        Length = "6";
        DBTableName = "TQT";
        DefaultSession = "MIR-IA-QUOT-NUM";
        SType = "Text";
        Label = "Quote Number";
    }

}

