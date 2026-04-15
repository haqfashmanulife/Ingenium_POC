# Converted from PathFinder 2.2 to 3.0 Jun 18, 2004 3:13:47 PM EDT

#*******************************************************************************
#*  Component:   BF1933-P.p                                                    *
#*  Description:                                                               *
#*                                                                             *
#*******************************************************************************
#*  Chg#    Release  Description                                               *
#*                                                                             *
#*  014590  6.0      New for release 6.0                                       *
#*  017150  612J     Remove Currency Decimals = "2"                            *
#*                                                                             *
#*******************************************************************************

P-STEP BF1933-P
{
    ATTRIBUTES
    {
        BusinessFunctionId = "1933";
        BusinessFunctionName = "Application ID Record Delete";
        BusinessFunctionType = "Delete";
        MirName = "XCWM0150";
    }

    OUT LSIR-RETURN-CD;

    OUT MIR-RETRN-CD;

    IN MIR-CO-ID
    {
        Key;
        Mandatory;
        Length = "2";
        CodeSource = "XTAB";
        CodeType = "COMP";
        DBTableName = "TAPPL";
        SType = "Selection";
        Label = "Company";
    }

}

