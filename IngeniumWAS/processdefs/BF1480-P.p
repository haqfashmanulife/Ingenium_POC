# Converted from PathFinder 2.2 to 3.0 Jun 18, 2004 3:13:40 PM EDT

#*******************************************************************************
#*  Component:   BF1480-P.p                                                    *
#*  Description:                                                               *
#*                                                                             *
#*******************************************************************************
#*  Chg#    Release  Description                                               *
#*                                                                             *
#*  014590  6.0      New for release 6.0                                       *
#*  017150  612J     Remove Currency Decimals = "2"                            *
#*                                                                             *
#*******************************************************************************

P-STEP BF1480-P
{
    ATTRIBUTES
    {
        BusinessFunctionId = "1480";
        BusinessFunctionName = "Plan Face Page Retrieve";
        BusinessFunctionType = "Retrieve";
        MirName = "CCWM0732";
    }

    OUT LSIR-RETURN-CD;

    OUT MIR-RETRN-CD;

    IN MIR-DOC-ID
    {
        Key;
        Mandatory;
        Length = "40";
        CodeSource = "EDIT";
        CodeType = "DOCM";
        DBTableName = "TPW";
        SType = "Selection";
        Label = "Document name";
    }

    IN MIR-DOC-LANG-CD
    {
        Key;
        Mandatory;
        Length = "40";
        CodeSource = "EDIT";
        CodeType = "LANG";
        DBTableName = "TPW";
        SType = "Selection";
        Label = "Language";
    }

    IN MIR-LOC-GR-ID
    {
        Key;
        Mandatory;
        Length = "40";
        CodeSource = "EDIT";
        CodeType = "LOCGP";
        DBTableName = "TPW";
        SType = "Selection";
        Label = "Location Group";
    }

    IN MIR-SBSDRY-CO-ID
    {
        Key;
        Mandatory;
        Length = "40";
        CodeSource = "EDIT";
        CodeType = "SUBCO";
        DBTableName = "TPW";
        SType = "Selection";
        Label = "Sub Company";
    }

    OUT MIR-ADB-TITL-TXT
    {
        Length = "40";
        DBTableName = "TPW";
        SType = "Text";
        Label = "Accidental Death Benefit Title";
    }

    OUT MIR-COLA-1-TITL-TXT
    {
        Length = "40";
        DBTableName = "TPW";
        SType = "Text";
        Label = "COLA 1 Title";
    }

    OUT MIR-COLA-2-TITL-TXT
    {
        Length = "40";
        DBTableName = "TPW";
        SType = "Text";
        Label = "COLA 2 Title";
    }

    OUT MIR-COLA-3-TITL-TXT
    {
        Length = "40";
        DBTableName = "TPW";
        SType = "Text";
        Label = "COLA 3 Title";
    }

    OUT MIR-COLA-4-TITL-TXT
    {
        Length = "40";
        DBTableName = "TPW";
        SType = "Text";
        Label = "COLA 4 Title";
    }

    OUT MIR-FE-TITL-TXT
    {
        Length = "40";
        DBTableName = "TPW";
        SType = "Text";
        Label = "Flat extra Title";
    }

    OUT MIR-LTA-TITL-TXT
    {
        Length = "40";
        DBTableName = "TPW";
        SType = "Text";
        Label = "Lifetime Accident Title";
    }

    OUT MIR-LTB-TITL-TXT
    {
        Length = "40";
        DBTableName = "TPW";
        SType = "Text";
        Label = "Lifetime Benefits Title";
    }

    OUT MIR-ME-TITL-TXT
    {
        Length = "40";
        DBTableName = "TPW";
        SType = "Text";
        Label = "Multiple rated Title";
    }

    OUT MIR-OWN-OCCP-TITL-TXT
    {
        Length = "40";
        DBTableName = "TPW";
        SType = "Text";
        Label = "Own Occupation Title";
    }

    OUT MIR-PDISAB-TITL-TXT
    {
        Length = "40";
        DBTableName = "TPW";
        SType = "Text";
        Label = "Partial Disability Title";
    }

    OUT MIR-PLAN-TITL-TXT
    {
        Length = "40";
        DBTableName = "TPW";
        SType = "Text";
        Label = "Product Title";
    }

    OUT MIR-REDC-EP-TITL-TXT
    {
        Length = "40";
        DBTableName = "TPW";
        SType = "Text";
        Label = "Elimination Period Title";
    }

    OUT MIR-WAV-BNFT-TITL-TXT
    {
        Length = "40";
        DBTableName = "TPW";
        SType = "Text";
        Label = "Waiver Benefit Title";
    }

}

