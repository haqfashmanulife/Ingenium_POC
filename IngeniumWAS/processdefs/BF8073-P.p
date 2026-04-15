# Converted from PathFinder 2.2 to 3.0 Jun 18, 2004 3:13:55 PM EDT

#*******************************************************************************
#*  Component:   BF8073-P.p                                                    *
#*  Description:                                                               *
#*                                                                             *
#*******************************************************************************
#*  Chg#    Release  Description                                               *
#*                                                                             *
#*  014590  6.0      New for release 6.0                                       *
#*  017150  612J     Remove Currency Decimals = "2"                            *
#*                                                                             *
#*******************************************************************************

P-STEP BF8073-P
{
    ATTRIBUTES
    {
        BusinessFunctionId = "8073";
        BusinessFunctionName = "Business Function Delete";
        BusinessFunctionType = "Delete";
        MirName = "XCWM8073";
    }

    OUT LSIR-RETURN-CD;

    OUT MIR-RETRN-CD;

    IN MIR-DV-ENTR-BUS-FCN-ID
    {
        Key;
        Mandatory;
        Length = "4";
        DBTableName = "Derived";
        SType = "Text";
        Label = "Business Function";
    }

}

