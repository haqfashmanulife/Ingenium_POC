# Converted from PathFinder 2.2 to 3.0 Jun 18, 2004 3:13:50 PM EDT

#*******************************************************************************
#*  Component:   BF2103-P.p                                                    *
#*  Description:                                                               *
#*                                                                             *
#*******************************************************************************
#*  Chg#    Release  Description                                               *
#*                                                                             *
#*  014590  6.0      New for release 6.0                                       *
#*  017150  612J     Remove Currency Decimals = "2"                            *
#*                                                                             *
#*******************************************************************************

P-STEP BF2103-P
{
    ATTRIBUTES
    {
        BusinessFunctionId = "2103";
        BusinessFunctionName = "Rate Percentage Table Delete";
        BusinessFunctionType = "Delete";
        MirName = "CCWM0051";
    }

    OUT LSIR-RETURN-CD;

    OUT MIR-RETRN-CD;

    IN MIR-RTBL2-ID
    {
        Key;
        Mandatory;
        Length = "5";
        CodeSource = "EDIT";
        CodeType = "PCNT";
        DBTableName = "TCC";
        SType = "Selection";
        Label = "Percentage Table Pointer";
    }

}

