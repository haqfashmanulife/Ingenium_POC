# Converted from PathFinder 2.2 to 3.0 Jun 18, 2004 3:13:48 PM EDT

#*******************************************************************************
#*  Component:   BF2013-P.p                                                    *
#*  Description:                                                               *
#*                                                                             *
#*******************************************************************************
#*  Chg#    Release  Description                                               *
#*                                                                             *
#*  014590  6.0      New for release 6.0                                       *
#*  017150  612J     Remove Currency Decimals = "2"                            *
#*                                                                             *
#*******************************************************************************

P-STEP BF2013-P
{
    ATTRIBUTES
    {
        BusinessFunctionId = "2013";
        BusinessFunctionName = "Printer Record Delete";
        BusinessFunctionType = "Delete";
        MirName = "XCWM0210";
    }

    OUT LSIR-RETURN-CD;

    OUT MIR-RETRN-CD;

    IN MIR-PRTR-ID
    {
        Key;
        Mandatory;
        Length = "8";
        CodeSource = "XTAB";
        CodeType = "PRTID";
        DBTableName = "TPRTR";
        SType = "Selection";
        Label = "Printer ID";
    }

}

