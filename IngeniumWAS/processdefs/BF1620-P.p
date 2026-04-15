# Converted from PathFinder 2.2 to 3.0 Jun 18, 2004 3:13:42 PM EDT

#*******************************************************************************
#*  Component:   BF1620-P.p                                                    *
#*  Description:                                                               *
#*                                                                             *
#*******************************************************************************
#*  Chg#    Release  Description                                               *
#*                                                                             *
#*  014590  6.0      New for release 6.0                                       *
#*  017150  612J     Remove Currency Decimals = "2"                            *
#*                                                                             *
#*******************************************************************************

P-STEP BF1620-P
{
    ATTRIBUTES
    {
        BusinessFunctionId = "1620";
        BusinessFunctionName = "Plan Bonus Declaration Retrieve";
        BusinessFunctionType = "Retrieve";
        MirName = "CCWM3070";
    }

    OUT LSIR-RETURN-CD;

    OUT MIR-RETRN-CD;

    IN MIR-PLAN-BON-IDT-NUM
    {
        Key;
        Mandatory;
        Length = "10";
        DBTableName = "TPLBN";
        SType = "Date";
        Label = "Effective Date";
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

    IN MIR-SBSDRY-CO-ID
    {
        Key;
        Mandatory;
        Length = "40";
        CodeSource = "EDIT";
        CodeType = "SUBCO";
        DBTableName = "TPLBN";
        SType = "Selection";
        Label = "Sub Company";
    }

    OUT MIR-PLAN-BON-STAT-CD
    {
        Length = "1";
        CodeSource = "DataModel";
        CodeType = "PLAN-BON-STAT-CD";
        DBTableName = "TPLBN";
        SType = "Text";
        Label = "Status";
    }

}

