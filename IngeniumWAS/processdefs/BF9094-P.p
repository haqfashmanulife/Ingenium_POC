# Converted from PathFinder 2.2 to 3.0 Jun 18, 2004 3:13:57 PM EDT

#*******************************************************************************
#*  Component:   BF9094-P.p                                                    *
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

P-STEP BF9094-P
{
    ATTRIBUTES
    {
        BusinessFunctionId = "9094";
        BusinessFunctionName = "BT Billing Dates Table List";
        BusinessFunctionType = "List";
        MirName = "CCWM9094";
    }

    OUT LSIR-RETURN-CD;

    OUT MIR-RETRN-CD;

    INOUT MIR-PRCES-DT-YYYY
    {
        Key;
        Length = "4";
        DBTableName = "TBTDT";
        SType = "Text";
        Label = "Process Date:  Year";
    }

    INOUT MIR-PRCES-DT-MM
    {
        Key;
        Length = "2";
        DBTableName = "TBTDT";
        SType = "Text";
        Label = "Month";
    }

    INOUT MIR-PRCES-DT-DD
    {
        Key;
        Length = "2";
        DBTableName = "TBTDT";
        SType = "Text";
        Label = "Day";
    }


    OUT MIR-BT-BILL-RUN-DT-T[13]
    {
        Length = "10";
        FieldGroup = "Table13";
        DBTableName = "TBTDT";
        SType = "Date";
        Label = "Bank Transfer Billing Run Date";
        Index = "1";
    }

    OUT MIR-BT-BILL-HIGH-DT-T[13]
    {
        Length = "10";
        FieldGroup = "Table13";
        DBTableName = "TBTDT";
        SType = "Date";
        Label = "Bank Transfer High Billing Date";
        Index = "1";
    }

    OUT MIR-BT-BILL-LOW-PICK-DY-T[13]
    {
        Length = "2";
        FieldGroup = "Table13";
        DBTableName = "TBTDT";
        SType = "Text";
        Label = "Low Pick Day";
        Index = "1";
    }

    OUT MIR-BT-BILL-HIGH-PICK-DY-T[13]
    {
        Length = "2";
        FieldGroup = "Table13";
        DBTableName = "TBTDT";
        SType = "Text";
        Label = "High Low Pick Day";
        Index = "1";
    }


}

