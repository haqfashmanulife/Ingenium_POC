# Converted from PathFinder 2.2 to 3.0 Jun 18, 2004 3:13:57 PM EDT

#*******************************************************************************
#*  Component:   BF9093-P.p                                                    *
#*  Description:                                                               *
#*                                                                             *
#*******************************************************************************
#*  Chg#    Release  Description                                               *
#*                                                                             *
#*  DBL63   25JAN02  Module created                                            *
#*  MP0016  01NOV05  2nd Bank Transfer - changed keys to include Process Day   *     
#*                                                                             *
#*******************************************************************************

P-STEP BF9093-P
{
    ATTRIBUTES
    {
        BusinessFunctionId = "9093";
        BusinessFunctionName = "BT Billing Dates Table Delete";
        BusinessFunctionType = "Delete";
        MirName = "CCWM9093";
    }

    OUT LSIR-RETURN-CD;

    OUT MIR-RETRN-CD;


    IN MIR-PRCES-DT-YYYY
    {
        Key;
        Mandatory;
        Length = "4";
        DBTableName = "TBTDT";
        SType = "Text";
        Label = "Process Date:  Year";
    }

    IN MIR-PRCES-DT-MM
    {
        Key;
        Mandatory;
        Length = "2";
        DBTableName = "TBTDT";
        SType = "Text";
        Label = "Month";
    }

    IN MIR-PRCES-DT-DD
    {
        Key;
        Mandatory;
        Length = "2";
        DBTableName = "TBTDT";
        SType = "Text";
        Label = "Day";
    }

}

