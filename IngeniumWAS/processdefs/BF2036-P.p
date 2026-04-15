# Converted from PathFinder 2.2 to 3.0 Jun 18, 2004 3:13:49 PM EDT

#*******************************************************************************
#*  Component:   BF2036-P.p                                                    *
#*  Description:                                                               *
#*                                                                             *
#*******************************************************************************
#*  Chg#    Release  Description                                               *
#*                                                                             *
#*  014590  6.0      New for release 6.0                                       *
#*  017150  612J     Remove Currency Decimals = "2"                            *
#*                                                                             *
#*******************************************************************************

P-STEP BF2036-P
{
    ATTRIBUTES
    {
        BusinessFunctionId = "2036";
        BusinessFunctionName = "Life Plan Packaging Copy";
        BusinessFunctionType = "Copy";
        MirName = "CCWM0521";
    }

    OUT LSIR-RETURN-CD;

    OUT MIR-RETRN-CD;

    INOUT MIR-BASIC-PLAN-ID
    {
        Key;
        Mandatory;
        Length = "6";
        CodeSource = "EDIT";
        CodeType = "PLAN";
        DBTableName = "TPACK";
        SType = "Selection";
        Label = "Basic Plan";
    }

    INOUT MIR-BASIC-PLAN-ID-2
    {
        Key;
        Mandatory;
        Length = "6";
        CodeSource = "EDIT";
        CodeType = "PLAN";
        DBTableName = "TPACK";
        SType = "Selection";
        Label = "Basic Plan";
    }

    INOUT MIR-SBSDRY-CO-ID
    {
        Key;
        Mandatory;
        Length = "40";
        CodeSource = "EDIT";
        CodeType = "SUBCO";
        DBTableName = "TPACK";
        SType = "Selection";
        Label = "Sub Company";
    }

    INOUT MIR-SBSDRY-CO-ID-2
    {
        Key;
        Mandatory;
        Length = "40";
        CodeSource = "EDIT";
        CodeType = "SUBCO";
        DBTableName = "TPACK";
        SType = "Selection";
        Label = "Sub Company";
    }

}

