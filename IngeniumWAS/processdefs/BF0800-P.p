# Converted from PathFinder 2.2 to 3.0 Jun 18, 2004 3:13:29 PM EDT

#*******************************************************************************
#*  Component:   BF0800-P.p                                                    *
#*  Description:                                                               *
#*                                                                             *
#*******************************************************************************
#*  Chg#    Release  Description                                               *
#*                                                                             *
#*  014590  6.0      New for release 6.0                                       *
#*  017150  612J     Remove Currency Decimals = "2"                            *
#*                                                                             *
#*******************************************************************************

P-STEP BF0800-P
{
    ATTRIBUTES
    {
        BusinessFunctionId = "0800";
        BusinessFunctionName = "Plan Billing Option Retrieve";
        BusinessFunctionType = "Retrieve";
        MirName = "CCWM3030";
    }

    OUT LSIR-RETURN-CD;

    OUT MIR-RETRN-CD;

    IN MIR-LOC-GR-ID
    {
        Key;
        Mandatory;
        Length = "3";
        CodeSource = "EDIT";
        CodeType = "LOCGP";
        DBTableName = "TPBTM";
        SType = "Selection";
        Label = "Location Group";
    }

    IN MIR-PLAN-BILL-MODE-CD
    {
        Key;
        Mandatory;
        Length = "2";
        CodeSource = "DataModel";
        CodeType = "PLAN-BILL-MODE-CD";
        DBTableName = "TPBTM";
        SType = "Selection";
        Label = "Billing Mode";
    }

    IN MIR-PLAN-BILL-TYP-CD
    {
        Key;
        Mandatory;
        Length = "1";
        CodeSource = "DataModel";
        CodeType = "PLAN-BILL-TYP-CD";
        DBTableName = "TPBTM";
        SType = "Selection";
        Label = "Billing Type";
    }

    IN MIR-PLAN-ID
    {
        Key;
        Mandatory;
        Length = "40";
        CodeSource = "EDIT";
        CodeType = "PLAN";
        DBTableName = "TPH";
        SType = "Selection";
        Label = "Plan";
    }

    OUT MIR-PLAN-BILL-DFLT-IND
    {
        Length = "1";
        DBTableName = "TPBTM";
        SType = "Indicator";
        Label = "Default";
    }

}

