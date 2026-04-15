# Converted from PathFinder 2.2 to 3.0 Jun 18, 2004 3:13:29 PM EDT

#*******************************************************************************
#*  Component:   BF0822-P.p                                                    *
#*  Description:                                                               *
#*                                                                             *
#*******************************************************************************
#*  Chg#    Release  Description                                               *
#*                                                                             *
#*  014590  6.0      New for release 6.0                                       *
#*  017150  612J     Remove Currency Decimals = "2"                            *
#*                                                                             *
#*******************************************************************************

P-STEP BF0822-P
{
    ATTRIBUTES
    {
        BusinessFunctionId = "0822";
        BusinessFunctionName = "Plan Non-Forfeiture Option Update";
        BusinessFunctionType = "Update";
        MirName = "CCWM3050";
    }

    OUT LSIR-RETURN-CD;

    OUT MIR-RETRN-CD;

    INOUT MIR-PLAN-NFO-DFLT-IND
    {
        Length = "1";
        DBTableName = "TPNFO";
        SType = "Indicator";
        Label = "Non-Forfeiture Default Indicator";
    }

    IN MIR-LOC-GR-ID
    {
        Key;
        Mandatory;
        Length = "3";
        CodeSource = "EDIT";
        CodeType = "LOCGP";
        DBTableName = "TPNFO";
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
        DBTableName = "TPH";
        SType = "Selection";
        Label = "Plan";
    }

    IN MIR-PLAN-NFO-CD
    {
        Key;
        Mandatory;
        Length = "1";
        CodeSource = "DataModel";
        CodeType = "PLAN-NFO-CD";
        DBTableName = "TPNFO";
        SType = "Selection";
        Label = "Non-Forfeiture Option";
    }

}

