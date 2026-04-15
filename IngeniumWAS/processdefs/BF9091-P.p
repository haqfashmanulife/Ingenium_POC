# Converted from PathFinder 2.2 to 3.0 Jun 18, 2004 3:13:57 PM EDT
#*******************************************************************************
#*  Component:   BF9091-P.p                                                    *
#*  Description:                                                               *
#*                                                                             *
#*******************************************************************************
#*  Chg#    Release  Description                                               *
#*                                                                             *
#*  DBL63   24JAN02  Module created                                            *
#*  MP0016  01NOV05  2nd Bank Transfer - changed keys to include Process Day   *              
#*                                                                             *
#*******************************************************************************

P-STEP BF9091-P
{
    ATTRIBUTES
    {
        BusinessFunctionId = "9091";
        BusinessFunctionName = "BT Billing Dates Table Create";
        BusinessFunctionType = "Create";
        MirName = "CCWM9091";
    }

    OUT LSIR-RETURN-CD;

    OUT MIR-RETRN-CD;

    IN MIR-PRCES-DT-YYYY
    {
        Key;
        Length = "4";
        DBTableName = "TBTDT";
        SType = "Text";
        Label = "Process Date:  Year";
    }

    IN MIR-PRCES-DT-MM
    {
        Key;
        Length = "2";
        DBTableName = "TBTDT";
        SType = "Text";
        Label = "Month";
    }

    IN MIR-PRCES-DT-DD
    {
        Key;
        Length = "2";
        DBTableName = "TBTDT";
        SType = "Text";
        Label = "Day";
    }

}

