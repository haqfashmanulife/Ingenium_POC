# Converted from PathFinder 2.2 to 3.0 Jun 18, 2004 3:13:21 PM EDT

#*******************************************************************************
#*  Component:   BF0401-P.p                                                    *
#*  Description:                                                               *
#*                                                                             *
#*******************************************************************************
#*  Chg#    Release  Description                                               *
#*                                                                             *
#*  014590  6.0      New for release 6.0                                       *
#*  017150  612J     Remove Currency Decimals = "2"                            *
#*                                                                             *
#*******************************************************************************

P-STEP BF0401-P
{
    ATTRIBUTES
    {
        BusinessFunctionId = "0401";
        BusinessFunctionName = "Health Plan Packaging Create";
        BusinessFunctionType = "Create";
        MirName = "CCWM0531";
    }

    OUT LSIR-RETURN-CD;

    OUT MIR-RETRN-CD;

    IN MIR-CONN-PKG-NUM
    {
        Key;
        Length = "3";
        DBTableName = "TPACH";
        SType = "Text";
        Label = "Other Coverage - Package Number";
    }

    IN MIR-CONN-PLAN-ID
    {
        Key;
        Length = "6";
        CodeSource = "EDIT";
        CodeType = "PLAN";
        DBTableName = "TPACH";
        SType = "Selection";
        Label = "Other Coverage Plan";
    }

    IN MIR-DI-PKG-NUM
    {
        Key;
        Mandatory;
        Length = "3";
        DBTableName = "TPACH";
        SType = "Text";
        Label = "Package Number";
    }

    IN MIR-LOC-GR-ID
    {
        Key;
        Mandatory;
        Length = "3";
        CodeSource = "EDIT";
        CodeType = "LOCGP";
        DBTableName = "TPACH";
        SType = "Selection";
        Label = "Location Group";
    }

    IN MIR-PLAN-ID
    {
        Key;
        Mandatory;
        Length = "40";
        CodeSource = "EDIT";
        CodeType = "PLAN";
        DBTableName = "TPACH";
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
        DBTableName = "TPACH";
        SType = "Selection";
        Label = "Sub Company";
    }

}

