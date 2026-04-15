# Converted from PathFinder 2.2 to 3.0 Jun 18, 2004 3:13:57 PM EDT

#*******************************************************************************
#*  Component:   BF9090-P.p                                                    *
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

P-STEP BF9090-P
{
    ATTRIBUTES
    {
        BusinessFunctionId = "9090";
        BusinessFunctionName = "BT Billing Dates Table Retrieve";
        BusinessFunctionType = "Retrieve";
        MirName = "CCWM9090";
    }

    OUT LSIR-RETURN-CD;

    OUT MIR-RETRN-CD;

    INOUT MIR-PRCES-DT-YYYY
    {
        Key;
        Length = "4";
        SType = "Text";
        Label = "Process Date:  Year";
    }

    INOUT MIR-PRCES-DT-MM
    {
        Key;
        Length = "2";
        SType = "Text";
        Label = "Month";
    }

    INOUT MIR-PRCES-DT-DD
    {
        Key;
        Length = "2";
        SType = "Text";
        Label = "Day";
    }

    OUT MIR-BT-BILL-RUN-DT
    {
        Length = "10";
        SType = "Date";
        Label = "Bank Transfer Billing Run Date";
    }

    OUT MIR-BT-BILL-HIGH-DT
    {
        Length = "10";
        SType = "Date";
        Label = "Bank Transfer High Billing Date";
    }

    OUT MIR-BT-BILL-LOW-PICK-DY
    {
        Length = "2";
        SType = "Text";
        Label = "Low Pick Day";
    }

    OUT MIR-BT-BILL-HIGH-PICK-DY
    {
        Length = "2";
        SType = "Text";
        Label = "High Pick Day";
    }
}

