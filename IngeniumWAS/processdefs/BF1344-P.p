# Converted from PathFinder 2.2 to 3.0 Jun 18, 2004 3:13:37 PM EDT

#*******************************************************************************
#*  Component:   BF1344-P.p                                                    *
#*  Description:                                                               *
#*                                                                             *
#*******************************************************************************
#*  Chg#    Release  Description                                               *
#*                                                                             *
#*  014590  6.0      New for release 6.0                                       *
#*  017150  612J     Remove Currency Decimals = "2"                            *
#*                                                                             *
#*******************************************************************************

P-STEP BF1344-P
{
    ATTRIBUTES
    {
        BusinessFunctionId = "1344";
        BusinessFunctionName = "Reinsurance Treaty Record List";
        BusinessFunctionType = "List";
        MirName = "CCWM0391";
    }

    OUT LSIR-RETURN-CD;

    OUT MIR-RETRN-CD;

    INOUT MIR-PLAN-ID
    {
        Key;
        Length = "40";
        CodeSource = "EDIT";
        CodeType = "PLAN";
        DBTableName = "TTT";
        SType = "Selection";
        Label = "Plan";
    }

    INOUT MIR-SBSDRY-CO-ID
    {
        Key;
        Length = "40";
        CodeSource = "EDIT";
        CodeType = "SUBCO";
        DBTableName = "TTT";
        SType = "Selection";
        Label = "Sub Company";
    }

    INOUT MIR-TRTY-ASSUM-CO-ID
    {
        Key;
        Length = "2";
        CodeSource = "EDIT";
        CodeType = "REIN";
        DBTableName = "TTT";
        SType = "Selection";
        Label = "Company";
    }

    INOUT MIR-TRTY-SMKR-CD
    {
        Key;
        Length = "1";
        CodeSource = "DataModel";
        CodeType = "TRTY-SMKR-CD";
        DBTableName = "TTT";
        SType = "Selection";
        Label = "Smoker";
    }

    OUT MIR-PLAN-ID-T[12]
    {
        Length = "40";
        FieldGroup = "Table12";
        CodeSource = "EDIT";
        CodeType = "PLAN";
        DBTableName = "TTT";
        SType = "Text";
        Label = "Plan";
        Index = "1";
    }

    OUT MIR-SBSDRY-CO-ID-T[12]
    {
        Length = "40";
        FieldGroup = "Table12";
        CodeSource = "EDIT";
        CodeType = "SUBCO";
        DBTableName = "TTT";
        SType = "Text";
        Label = "Sub Company";
        Index = "1";
    }

    OUT MIR-TRTY-ASSUM-CO-ID-T[12]
    {
        Length = "2";
        FieldGroup = "Table12";
        CodeSource = "EDIT";
        CodeType = "REIN";
        DBTableName = "TTT";
        SType = "Text";
        Label = "Company";
        Index = "1";
    }

    OUT MIR-TRTY-CSN-PLAN-ID-T[12]
    {
        Length = "6";
        FieldGroup = "Table12";
        CodeSource = "EDIT";
        CodeType = "PLAN";
        DBTableName = "TTT";
        SType = "Text";
        Label = "Reinsurance Plan";
        Index = "1";
    }

    OUT MIR-TRTY-REINS-TYP-CD-T[12]
    {
        Length = "1";
        FieldGroup = "Table12";
        CodeSource = "DataModel";
        CodeType = "TRTY-REINS-TYP-CD";
        DBTableName = "TTT";
        SType = "Text";
        Label = "Reinsurance Type";
        Index = "1";
    }

    OUT MIR-TRTY-SMKR-CD-T[12]
    {
        Length = "1";
        FieldGroup = "Table12";
        CodeSource = "DataModel";
        CodeType = "TRTY-SMKR-CD";
        DBTableName = "TTT";
        SType = "Text";
        Label = "Smoker";
        Index = "1";
    }

    OUT MIR-TRTY-TYP-CD-T[12]
    {
        Length = "1";
        FieldGroup = "Table12";
        CodeSource = "DataModel";
        CodeType = "TRTY-TYP-CD";
        DBTableName = "TTT";
        SType = "Text";
        Label = "Treaty Type";
        Index = "1";
    }

}

