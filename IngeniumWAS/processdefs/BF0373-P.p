# Converted from PathFinder 2.2 to 3.0 Jun 18, 2004 3:13:20 PM EDT

#*******************************************************************************
#*  Component:   BF0373-P.p                                                    *
#*  Description:                                                               *
#*                                                                             *
#*******************************************************************************
#*  Chg#    Release  Description                                               *
#*                                                                             *
#*  014590  6.0      New for release 6.0                                       *
#*  017150  612J     Remove Currency Decimals = "2"                            *
#*                                                                             *
#*******************************************************************************

P-STEP BF0373-P
{
    ATTRIBUTES
    {
        BusinessFunctionId = "0373";
        BusinessFunctionName = "Defined Field Table Delete";
        BusinessFunctionType = "Delete";
        MirName = "NCWM0370";
    }

    OUT LSIR-RETURN-CD;

    OUT MIR-RETRN-CD;

    IN MIR-FLD-ID
    {
        Key;
        Mandatory;
        Length = "10";
        DBTableName = "TDFLD";
        SType = "Text";
        Label = "Defined Field Name";
    }

}

