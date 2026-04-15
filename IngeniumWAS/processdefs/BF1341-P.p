# Converted from PathFinder 2.2 to 3.0 Jun 18, 2004 3:13:37 PM EDT

#*******************************************************************************
#*  Component:   BF1341-P.p                                                    *
#*  Description:                                                               *
#*                                                                             *
#*******************************************************************************
#*  Chg#    Release  Description                                               *
#*                                                                             *
#*  014590  6.0      New for release 6.0                                       *
#*  017150  612J     Remove Currency Decimals = "2"                            *
#*                                                                             *
#*******************************************************************************

P-STEP BF1341-P
{
    ATTRIBUTES
    {
        BusinessFunctionId = "1341";
        BusinessFunctionName = "Reinsurance Treaty Record Create";
        BusinessFunctionType = "Create";
        MirName = "CCWM0391";
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
        DBTableName = "TTT";
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
        DBTableName = "TTT";
        SType = "Selection";
        Label = "Sub Company";
    }

    IN MIR-TRTY-ASSUM-CO-ID
    {
        Key;
        Mandatory;
        Length = "2";
        CodeSource = "EDIT";
        CodeType = "REIN";
        DBTableName = "TTT";
        SType = "Selection";
        Label = "Company";
    }

    IN MIR-TRTY-SMKR-CD
    {
        Key;
        Mandatory;
        Length = "1";
        CodeSource = "DataModel";
        CodeType = "TRTY-SMKR-CD";
        DBTableName = "TTT";
        SType = "Selection";
        Label = "Smoker";
    }

}

