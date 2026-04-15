# Converted from PathFinder 2.2 to 3.0 Jun 18, 2004 3:13:44 PM EDT

#*******************************************************************************
#*  Component:   BF1742-P.p                                                    *
#*  Description:                                                               *
#*                                                                             *
#*******************************************************************************
#*  Chg#    Release  Description                                               *
#*                                                                             *
#*  014590  6.0      New for release 6.0                                       *
#*  017150  612J     Remove Currency Decimals = "2"                            *
#*                                                                             *
#*******************************************************************************

P-STEP BF1742-P
{
    ATTRIBUTES
    {
        BusinessFunctionId = "1742";
        BusinessFunctionName = "Fund Plan Relationship Record Update";
        BusinessFunctionType = "Update";
        MirName = "SCWM0040";
    }

    OUT LSIR-RETURN-CD;

    OUT MIR-RETRN-CD;

    INOUT MIR-DV-FREE-LK-FND-CD
    {
        Length = "1";
        CodeSource = "DataModel";
        CodeType = "DV-FREE-LK-FND-CD";
        DBTableName = "Derived";
        SType = "Selection";
        Label = "Free Look Fund Designation";
    }

    INOUT MIR-MIN-OPN-AMT
    {
        Length = "15";
        DBTableName = "TFR";
        SType = "Currency";
        Label = "Minimum Amount to Open Fund";
    }

    INOUT MIR-MIN-REMN-AMT
    {
        Length = "15";
        DBTableName = "TFR";
        SType = "Currency";
        Label = "Minimum Remaining Fund Value";
    }

    INOUT MIR-MUT-EXCL-IND
    {
        Length = "1";
        DBTableName = "TFR";
        SType = "Indicator";
        Label = "Fund is mutually exclusive with other funds for this plan";
    }

    INOUT MIR-PLAN-FND-REQIR-CD
    {
        Length = "1";
        CodeSource = "DataModel";
        CodeType = "PLAN-FND-REQIR-CD";
        DBTableName = "TFR";
        SType = "Selection";
        Label = "Fund Required";
    }

    INOUT MIR-PSUR-ALLOW-IND
    {
        Length = "1";
        DBTableName = "TFR";
        SType = "Indicator";
        Label = "Partial surrenders allowed";
    }

    IN MIR-FND-ID
    {
        Key;
        Mandatory;
        Length = "5";
        CodeSource = "EDIT";
        CodeType = "SEGFD";
        DBTableName = "TFR";
        SType = "Selection";
        Label = "Fund";
    }

    IN MIR-LOC-GR-ID
    {
        Key;
        Mandatory;
        Length = "3";
        CodeSource = "EDIT";
        CodeType = "LOCGP";
        DBTableName = "TFR";
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
        DBTableName = "TFR";
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
        DBTableName = "TFR";
        SType = "Selection";
        Label = "Sub Company";
    }

}

