# Converted from PathFinder 2.2 to 3.0 Jun 18, 2004 3:13:21 PM EDT

#*******************************************************************************
#*  Component:   BF0406-P.p                                                    *
#*  Description:                                                               *
#*                                                                             *
#*******************************************************************************
#*  Chg#    Release  Description                                               *
#*                                                                             *
#*  014590  6.0      New for release 6.0                                       *
#*  017150  612J     Remove Currency Decimals = "2"                            *
#*                                                                             *
#*******************************************************************************

P-STEP BF0406-P
{
    ATTRIBUTES
    {
        BusinessFunctionId = "0406";
        BusinessFunctionName = "Health Plan Packaging Copy";
        BusinessFunctionType = "Copy";
        MirName = "CCWM0531";
    }

    OUT LSIR-RETURN-CD;

    OUT MIR-RETRN-CD;

    INOUT MIR-PLAN-ID
    {
        Key;
        Mandatory;
        Length = "40";
        CodeSource = "EDIT";
        CodeType = "PLAN";
        DBTableName = "TPACH";
        SType = "Selection";
        Label = "From Plan";
    }

    INOUT MIR-PLAN-ID-2
    {
        Key;
        Mandatory;
        Length = "40";
        CodeSource = "EDIT";
        CodeType = "PLAN";
        DBTableName = "TPACH";
        SType = "Selection";
        Label = "To Plan";
    }

    INOUT MIR-SBSDRY-CO-ID
    {
        Key;
        Mandatory;
        Length = "40";
        CodeSource = "EDIT";
        CodeType = "SUBCO";
        DBTableName = "TPACH";
        SType = "Selection";
        Label = "From Sub Company";
    }

    INOUT MIR-SBSDRY-CO-ID-2
    {
        Key;
        Mandatory;
        Length = "40";
        CodeSource = "EDIT";
        CodeType = "SUBCO";
        DBTableName = "TPACH";
        SType = "Selection";
        Label = "To Sub Company";
    }

}

