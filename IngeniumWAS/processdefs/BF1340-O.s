# Converted from PathFinder 2.2 to 3.0 Jun 18, 2004 3:12:38 PM EDT

#*******************************************************************************
#*  Component:   BF1340-O.s                                                    *
#*  Description:                                                               *
#*                                                                             *
#*******************************************************************************
#*  Chg#    Release  Description                                               *
#*                                                                             *
#*  014590  6.0      New for release 6.0                                       *
#*  017150  612J     Remove Currency Decimals = "2"                            *
#*                                                                             *
#*******************************************************************************

S-STEP BF1340-O
{
    ATTRIBUTES
    {
        Type = "Output";
        DelEmptyRows;
        FocusField = "OKButton";
        FocusFrame = "ButtonFrame";
    }

    IN Title;

    IN TitleBar;

    IN TitleBarSize;

    IN ButtonBar;

    IN ButtonBarSize;

    IN MessageFrame;

    IN MessageFrameSize;

    OUT action
    {
        SType = "Hidden";
    }

    OUT index
    {
        SType = "Hidden";
    }

    IN MIR-PLAN-ID
    {
        Key;
        DisplayOnly;
        Length = "40";
        CodeSource = "EDIT";
        CodeType = "PLAN";
        SType = "Text";
        Label = "Plan";
    }

    IN MIR-SBSDRY-CO-ID
    {
        Key;
        DisplayOnly;
        Length = "40";
        CodeSource = "EDIT";
        CodeType = "SUBCO";
        SType = "Text";
        Label = "Sub Company";
    }

    IN MIR-TRTY-ASSUM-CO-ID
    {
        Key;
        DisplayOnly;
        Length = "2";
        CodeSource = "EDIT";
        CodeType = "REIN";
        SType = "Text";
        Label = "Company";
    }

    IN MIR-TRTY-SMKR-CD
    {
        Key;
        DisplayOnly;
        Length = "1";
        CodeSource = "DataModel";
        CodeType = "TRTY-SMKR-CD";
        SType = "Text";
        Label = "Smoker";
    }

    IN MIR-ALPHA-SPLT-1-CO-ID
    {
        DisplayOnly;
        Length = "2";
        CodeSource = "EDIT";
        CodeType = "REIN";
        SType = "Text";
        Label = "First Company";
    }

    IN MIR-ALPHA-SPLT-1-TXT
    {
        DisplayOnly;
        Length = "1";
        SType = "Text";
        Label = "First Letter Split";
    }

    IN MIR-ALPHA-SPLT-2-CO-ID
    {
        DisplayOnly;
        Length = "2";
        CodeSource = "EDIT";
        CodeType = "REIN";
        SType = "Text";
        Label = "Second Company";
    }

    IN MIR-ALPHA-SPLT-2-TXT
    {
        DisplayOnly;
        Length = "1";
        SType = "Text";
        Label = "Second Letter Split";
    }

    IN MIR-ALPHA-SPLT-3-CO-ID
    {
        DisplayOnly;
        Length = "2";
        CodeSource = "EDIT";
        CodeType = "REIN";
        SType = "Text";
        Label = "Third Company";
    }

    IN MIR-OWN-OCCP-ALLOW-ID
    {
        DisplayOnly;
        Length = "3";
        SType = "Text";
        Label = "Own Occupation Benefit Treaty";
    }

    IN MIR-PDISAB-ALLOW-ID
    {
        DisplayOnly;
        Length = "3";
        SType = "Text";
        Label = "Partial Disability Benefit Treaty";
    }

    IN MIR-REDC-EP-ALLOW-ID
    {
        DisplayOnly;
        Length = "3";
        SType = "Text";
        Label = "Reduced Elimination Period / Hospital Confinement Treaty";
    }

    IN MIR-TRTY-AD-ALLOW-ID
    {
        DisplayOnly;
        Length = "3";
        SType = "Text";
        Label = "Accidental Death Allowance Treaty";
    }

    IN MIR-TRTY-COLA-ALLOW-ID
    {
        DisplayOnly;
        Length = "3";
        SType = "Text";
        Label = "Cost of Living Adjustment Allowance Treaty";
    }

    IN MIR-TRTY-CSN-PLAN-ID
    {
        DisplayOnly;
        Length = "6";
        CodeSource = "EDIT";
        CodeType = "PLAN";
        SType = "Text";
        Label = "Reinsurance Plan";
    }

    IN MIR-TRTY-EFF-DT
    {
        DisplayOnly;
        Length = "10";
        SType = "Date";
        Label = "Effective Date";
    }

    IN MIR-TRTY-FE-ALLOW-ID
    {
        DisplayOnly;
        Length = "3";
        SType = "Text";
        Label = "Flat Extra Allowance Treaty";
    }

    IN MIR-TRTY-LIFE-ALLOW-ID
    {
        DisplayOnly;
        Length = "3";
        SType = "Text";
        Label = "Base Premium Allowance Treaty";
    }

    IN MIR-TRTY-LTA-ALLOW-ID
    {
        DisplayOnly;
        Length = "3";
        SType = "Text";
        Label = "Life Time Benefits (LTA)";
    }

    IN MIR-TRTY-LTB-ALLOW-ID
    {
        DisplayOnly;
        Length = "3";
        SType = "Text";
        Label = "Life Time Benefits (LTB)";
    }

    IN MIR-TRTY-ME-ALLOW-ID
    {
        DisplayOnly;
        Length = "3";
        SType = "Text";
        Label = "Multiple Rating Allowance Treaty";
    }

    IN MIR-TRTY-RECAP-AGE-DUR
    {
        DisplayOnly;
        Length = "3";
        SType = "Text";
        Label = "Recapture Years";
    }

    IN MIR-TRTY-RECAP-TYP-CD
    {
        DisplayOnly;
        Length = "1";
        CodeSource = "DataModel";
        CodeType = "TRTY-RECAP-TYP-CD";
        SType = "Text";
        Label = "Recapture Type";
    }

    IN MIR-TRTY-REINS-TYP-CD
    {
        DisplayOnly;
        Length = "1";
        CodeSource = "DataModel";
        CodeType = "TRTY-REINS-TYP-CD";
        SType = "Text";
        Label = "Reinsurance Type";
    }

    IN MIR-TRTY-RSK-MAX-AMT
    {
        DisplayOnly;
        Length = "13";
        Decimals = "0";
        SType = "Currency";
        Label = "Maximum Cession Amount";
    }

    IN MIR-TRTY-RSK-MIN-AMT
    {
        DisplayOnly;
        Length = "13";
        Decimals = "0";
        SType = "Currency";
        Label = "Minimum Cession Amount";
    }

    IN MIR-TRTY-TRMN-DT
    {
        DisplayOnly;
        Length = "10";
        SType = "Date";
        Label = "Termination Date";
    }

    IN MIR-TRTY-TYP-CD
    {
        DisplayOnly;
        Length = "1";
        CodeSource = "DataModel";
        CodeType = "TRTY-TYP-CD";
        SType = "Text";
        Label = "Treaty Type";
    }

    IN MIR-TRTY-WP-ALLOW-ID
    {
        DisplayOnly;
        Length = "3";
        SType = "Text";
        Label = "Waiver of Premium Allowance Treaty";
    }

}

