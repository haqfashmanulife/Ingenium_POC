# Converted from PathFinder 2.2 to 3.0 Jun 18, 2004 3:13:37 PM EDT

#*******************************************************************************
#*  Component:   BF1342-P.p                                                    *
#*  Description:                                                               *
#*                                                                             *
#*******************************************************************************
#*  Chg#    Release  Description                                               *
#*                                                                             *
#*  014590  6.0      New for release 6.0                                       *
#*  017150  612J     Remove Currency Decimals = "2"                            *
#*                                                                             *
#*******************************************************************************

P-STEP BF1342-P
{
    ATTRIBUTES
    {
        BusinessFunctionId = "1342";
        BusinessFunctionName = "Reinsurance Treaty Record Update";
        BusinessFunctionType = "Update";
        MirName = "CCWM0391";
    }

    OUT LSIR-RETURN-CD;

    OUT MIR-RETRN-CD;

    INOUT MIR-ALPHA-SPLT-1-CO-ID
    {
        Length = "2";
        CodeSource = "EDIT";
        CodeType = "REIN";
        DBTableName = "TTT";
        SType = "Selection";
        Label = "First Company";
    }

    INOUT MIR-ALPHA-SPLT-1-TXT
    {
        Length = "1";
        DBTableName = "TTT";
        SType = "Text";
        Label = "First Letter Split";
    }

    INOUT MIR-ALPHA-SPLT-2-CO-ID
    {
        Length = "2";
        CodeSource = "EDIT";
        CodeType = "REIN";
        DBTableName = "TTT";
        SType = "Selection";
        Label = "Second Company";
    }

    INOUT MIR-ALPHA-SPLT-2-TXT
    {
        Length = "1";
        DBTableName = "TTT";
        SType = "Text";
        Label = "Second Letter Split";
    }

    INOUT MIR-ALPHA-SPLT-3-CO-ID
    {
        Length = "2";
        CodeSource = "EDIT";
        CodeType = "REIN";
        DBTableName = "TTT";
        SType = "Selection";
        Label = "Third Company";
    }

    INOUT MIR-OWN-OCCP-ALLOW-ID
    {
        Length = "3";
        DBTableName = "TTT";
        SType = "Text";
        Label = "Own Occupation Benefit Treaty";
    }

    INOUT MIR-PDISAB-ALLOW-ID
    {
        Length = "3";
        DBTableName = "TTT";
        SType = "Text";
        Label = "Partial Disability Benefit Treaty";
    }

    INOUT MIR-REDC-EP-ALLOW-ID
    {
        Length = "3";
        DBTableName = "TTT";
        SType = "Text";
        Label = "Reduced Elimination Period / Hospital Confinement Treaty";
    }

    INOUT MIR-TRTY-AD-ALLOW-ID
    {
        Length = "3";
        DBTableName = "TTT";
        SType = "Text";
        Label = "Accidental Death Allowance Treaty";
    }

    INOUT MIR-TRTY-COLA-ALLOW-ID
    {
        Length = "3";
        DBTableName = "TTT";
        SType = "Text";
        Label = "Cost of Living Adjustment Allowance Treaty";
    }

    INOUT MIR-TRTY-CSN-PLAN-ID
    {
        Length = "6";
        CodeSource = "EDIT";
        CodeType = "PLAN";
        DBTableName = "TTT";
        SType = "Selection";
        Label = "Reinsurance Plan";
    }

    INOUT MIR-TRTY-EFF-DT
    {
        Length = "10";
        DBTableName = "TTT";
        SType = "Date";
        Label = "Effective Date";
    }

    INOUT MIR-TRTY-FE-ALLOW-ID
    {
        Length = "3";
        DBTableName = "TTT";
        SType = "Text";
        Label = "Flat Extra Allowance Treaty";
    }

    INOUT MIR-TRTY-LIFE-ALLOW-ID
    {
        Length = "3";
        DBTableName = "TTT";
        SType = "Text";
        Label = "Base Premium Allowance Treaty";
    }

    INOUT MIR-TRTY-LTA-ALLOW-ID
    {
        Length = "3";
        DBTableName = "TTT";
        SType = "Text";
        Label = "Life Time Benefits (LTA)";
    }

    INOUT MIR-TRTY-LTB-ALLOW-ID
    {
        Length = "3";
        DBTableName = "TTT";
        SType = "Text";
        Label = "Life Time Benefits (LTB)";
    }

    INOUT MIR-TRTY-ME-ALLOW-ID
    {
        Length = "3";
        DBTableName = "TTT";
        SType = "Text";
        Label = "Multiple Rating Allowance Treaty";
    }

    INOUT MIR-TRTY-RECAP-AGE-DUR
    {
        Length = "3";
        DBTableName = "TTT";
        SType = "Text";
        Label = "Recapture Years";
    }

    INOUT MIR-TRTY-RECAP-TYP-CD
    {
        Length = "1";
        CodeSource = "DataModel";
        CodeType = "TRTY-RECAP-TYP-CD";
        DBTableName = "TTT";
        SType = "Selection";
        Label = "Recapture Type";
    }

    INOUT MIR-TRTY-REINS-TYP-CD
    {
        Length = "1";
        CodeSource = "DataModel";
        CodeType = "TRTY-REINS-TYP-CD";
        DBTableName = "TTT";
        SType = "Selection";
        Label = "Reinsurance Type";
    }

    INOUT MIR-TRTY-RSK-MAX-AMT
    {
        Length = "13";
        Decimals = "0";
        DBTableName = "TTT";
        SType = "Currency";
        Label = "Maximum Cession Amount";
    }

    INOUT MIR-TRTY-RSK-MIN-AMT
    {
        Length = "13";
        Decimals = "0";
        DBTableName = "TTT";
        SType = "Currency";
        Label = "Minimum Cession Amount";
    }

    INOUT MIR-TRTY-TRMN-DT
    {
        Length = "10";
        DBTableName = "TTT";
        SType = "Date";
        Label = "Termination Date";
    }

    INOUT MIR-TRTY-TYP-CD
    {
        Length = "1";
        CodeSource = "DataModel";
        CodeType = "TRTY-TYP-CD";
        DBTableName = "TTT";
        SType = "Selection";
        Label = "Treaty Type";
    }

    INOUT MIR-TRTY-WP-ALLOW-ID
    {
        Length = "3";
        DBTableName = "TTT";
        SType = "Text";
        Label = "Waiver of Premium Allowance Treaty";
    }

    IN MIR-PLAN-ID
    {
        Key;
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
        Length = "1";
        CodeSource = "DataModel";
        CodeType = "TRTY-SMKR-CD";
        DBTableName = "TTT";
        SType = "Selection";
        Label = "Smoker";
    }

}

