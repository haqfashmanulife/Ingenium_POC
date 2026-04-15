# Converted from PathFinder 2.2 to 3.0 Jun 18, 2004 3:13:28 PM EDT

#*******************************************************************************
#*  Component:   BF0770-P.p                                                    *
#*  Description:                                                               *
#*                                                                             *
#*******************************************************************************
#*  Chg#    Release  Description                                               *
#*                                                                             *
#*  014590  6.0      New for release 6.0                                       *
#*  017150  612J     Remove Currency Decimals = "2"                            *
#*                                                                             *
#*******************************************************************************

P-STEP BF0770-P
{
    ATTRIBUTES
    {
        BusinessFunctionId = "0770";
        BusinessFunctionName = "Plan Rate Table Retrieve";
        BusinessFunctionType = "Retrieve";
        MirName = "CCWM3000";
    }

    OUT LSIR-RETURN-CD;

    OUT MIR-RETRN-CD;

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

    IN MIR-PLAN-RT-TYP-CD
    {
        Key;
        Mandatory;
        Length = "5";
        CodeSource = "DataModel";
        CodeType = "PLAN-RT-TYP-CD";
        DBTableName = "TPLRT";
        SType = "Selection";
        Label = "Plan Rate Type";
    }

    OUT MIR-RH-ID
    {
        Length = "6";
        CodeSource = "EDIT";
        CodeType = "RHDR";
        DBTableName = "TPLRT";
        SType = "Text";
        Label = "Rate Header Pointer";
    }

}

