# Converted from PathFinder 2.2 to 3.0 Jun 18, 2004 3:13:57 PM EDT
#*******************************************************************************
#*  Component:   BF9092-P.p                                                    *
#*  Description:                                                               *
#*                                                                             *
#*******************************************************************************
#*  Chg#    Release  Description                                               *
#*                                                                             *
#*  DBL63   25JAN02  Module created                                            *
#*  MP0016  01NOV05  2nd Bank Transfer - changed keys and added Low Pick Day   *                
#*                   and High Pick Day                                         *
#*                                                                             *
#*******************************************************************************

P-STEP BF9092-P
{
    ATTRIBUTES
    {
        BusinessFunctionId = "9092";
        BusinessFunctionName = "BT Billing Dates Table Update";
        BusinessFunctionType = "Update";
        MirName = "CCWM9092";
    }

    OUT LSIR-RETURN-CD;

    OUT MIR-RETRN-CD;


    IN MIR-PRCES-DT-YYYY
    {
        Key;
        Length = "4";
        DBTableName = "TNBDT";
        SType = "Text";
        Label = "Process Date:  Year";
    }

    IN MIR-PRCES-DT-MM
    {
        Key;
        Length = "2";
        DBTableName = "TNBDT";
        SType = "Text";
        Label = "Month";
    }

    IN MIR-PRCES-DT-DD
    {
        Key;
        Length = "2";
        DBTableName = "TNBDT";
        SType = "Text";
        Label = "Day";
    }


    INOUT MIR-BT-BILL-HIGH-DT
    {
        Length = "10";
        DBTableName = "TBTDT";
        SType = "Date";
        Label = "Bank Transfer High Billing Date";
    }

    INOUT MIR-BT-BILL-LOW-PICK-DY
    {
        Length = "2";
        DBTableName = "TBTDT";
        SType = "Text";
        Label = "Low Pick Day";
    }

    INOUT MIR-BT-BILL-HIGH-PICK-DY
    {
        Length = "2";
        DBTableName = "TBTDT";
        SType = "Text";
        Label = "High Pick Day";
    }

}

