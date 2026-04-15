# Converted from PathFinder 2.2 to 3.0 Jun 18, 2004 3:13:37 PM EDT

#*******************************************************************************
#*  Component:   BF1340-P.p                                                    *
#*  Description:                                                               *
#*                                                                             *
#*******************************************************************************
#*  Chg#    Release  Description                                               *
#*                                                                             *
#*  014590  6.0      New for release 6.0                                       *
#*  017150  612J     Remove Currency Decimals = "2"                            *
#*                                                                             *
#*******************************************************************************

P-STEP BF1340-P
{
    ATTRIBUTES
    {
        BusinessFunctionId = "1340";
        BusinessFunctionName = "Reinsurance Treaty Record Retrieve";
        BusinessFunctionType = "Retrieve";
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

    OUT MIR-ALPHA-SPLT-1-CO-ID
    {
        Length = "2";
        CodeSource = "EDIT";
        CodeType = "REIN";
        DBTableName = "TTT";
        SType = "Text";
        Label = "First Company";
    }

    OUT MIR-ALPHA-SPLT-1-TXT
    {
        Length = "1";
        DBTableName = "TTT";
        SType = "Text";
        Label = "First Letter Split";
    }

    OUT MIR-ALPHA-SPLT-2-CO-ID
    {
        Length = "2";
        CodeSource = "EDIT";
        CodeType = "REIN";
        DBTableName = "TTT";
        SType = "Text";
        Label = "Second Company";
    }

    OUT MIR-ALPHA-SPLT-2-TXT
    {
        Length = "1";
        DBTableName = "TTT";
        SType = "Text";
        Label = "Second Letter Split";
    }

    OUT MIR-ALPHA-SPLT-3-CO-ID
    {
        Length = "2";
        CodeSource = "EDIT";
        CodeType = "REIN";
        DBTableName = "TTT";
        SType = "Text";
        Label = "Third Company";
    }

    OUT MIR-OWN-OCCP-ALLOW-ID
    {
        Length = "3";
        DBTableName = "TTT";
        SType = "Text";
        Label = "Own Occupation Benefit Treaty";
    }

    OUT MIR-PDISAB-ALLOW-ID
    {
        Length = "3";
        DBTableName = "TTT";
        SType = "Text";
        Label = "Partial Disability Benefit Treaty";
    }

    OUT MIR-REDC-EP-ALLOW-ID
    {
        Length = "3";
        DBTableName = "TTT";
        SType = "Text";
        Label = "Reduced Elimination Period / Hospital Confinement Treaty";
    }

    OUT MIR-TRTY-AD-ALLOW-ID
    {
        Length = "3";
        DBTableName = "TTT";
        SType = "Text";
        Label = "Accidental Death Allowance Treaty";
    }

    OUT MIR-TRTY-COLA-ALLOW-ID
    {
        Length = "3";
        DBTableName = "TTT";
        SType = "Text";
        Label = "Cost of Living Adjustment Allowance Treaty";
    }

    OUT MIR-TRTY-CSN-PLAN-ID
    {
        Length = "6";
        CodeSource = "EDIT";
        CodeType = "PLAN";
        DBTableName = "TTT";
        SType = "Text";
        Label = "Reinsurance Plan";
    }

    OUT MIR-TRTY-EFF-DT
    {
        Length = "10";
        DBTableName = "TTT";
        SType = "Date";
        Label = "Effective Date";
    }

    OUT MIR-TRTY-FE-ALLOW-ID
    {
        Length = "3";
        DBTableName = "TTT";
        SType = "Text";
        Label = "Flat Extra Allowance Treaty";
    }

    OUT MIR-TRTY-LIFE-ALLOW-ID
    {
        Length = "3";
        DBTableName = "TTT";
        SType = "Text";
        Label = "Base Premium Allowance Treaty";
    }

    OUT MIR-TRTY-LTA-ALLOW-ID
    {
        Length = "3";
        DBTableName = "TTT";
        SType = "Text";
        Label = "Life Time Benefits (LTA)";
    }

    OUT MIR-TRTY-LTB-ALLOW-ID
    {
        Length = "3";
        DBTableName = "TTT";
        SType = "Text";
        Label = "Life Time Benefits (LTB)";
    }

    OUT MIR-TRTY-ME-ALLOW-ID
    {
        Length = "3";
        DBTableName = "TTT";
        SType = "Text";
        Label = "Multiple Rating Allowance Treaty";
    }

    OUT MIR-TRTY-RECAP-AGE-DUR
    {
        Length = "3";
        DBTableName = "TTT";
        SType = "Text";
        Label = "Recapture Years";
    }

    OUT MIR-TRTY-RECAP-TYP-CD
    {
        Length = "1";
        CodeSource = "DataModel";
        CodeType = "TRTY-RECAP-TYP-CD";
        DBTableName = "TTT";
        SType = "Text";
        Label = "Recapture Type";
    }

    OUT MIR-TRTY-REINS-TYP-CD
    {
        Length = "1";
        CodeSource = "DataModel";
        CodeType = "TRTY-REINS-TYP-CD";
        DBTableName = "TTT";
        SType = "Text";
        Label = "Reinsurance Type";
    }

    OUT MIR-TRTY-RSK-MAX-AMT
    {
        Length = "13";
        Decimals = "0";
        DBTableName = "TTT";
        SType = "Currency";
        Label = "Maximum Cession Amount";
    }

    OUT MIR-TRTY-RSK-MIN-AMT
    {
        Length = "13";
        Decimals = "0";
        DBTableName = "TTT";
        SType = "Currency";
        Label = "Minimum Cession Amount";
    }

    OUT MIR-TRTY-TRMN-DT
    {
        Length = "10";
        DBTableName = "TTT";
        SType = "Date";
        Label = "Termination Date";
    }

    OUT MIR-TRTY-TYP-CD
    {
        Length = "1";
        CodeSource = "DataModel";
        CodeType = "TRTY-TYP-CD";
        DBTableName = "TTT";
        SType = "Text";
        Label = "Treaty Type";
    }

    OUT MIR-TRTY-WP-ALLOW-ID
    {
        Length = "3";
        DBTableName = "TTT";
        SType = "Text";
        Label = "Waiver of Premium Allowance Treaty";
    }

}

