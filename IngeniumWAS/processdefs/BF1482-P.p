# Converted from PathFinder 2.2 to 3.0 Jun 18, 2004 3:13:40 PM EDT

#*******************************************************************************
#*  Component:   BF1482-P.p                                                    *
#*  Description:                                                               *
#*                                                                             *
#*******************************************************************************
#*  Chg#    Release  Description                                               *
#*                                                                             *
#*  014590  6.0      New for release 6.0                                       *
#*  017150  612J     Remove Currency Decimals = "2"                            *
#*                                                                             *
#*******************************************************************************

P-STEP BF1482-P
{
    ATTRIBUTES
    {
        BusinessFunctionId = "1482";
        BusinessFunctionName = "Plan Face Page Update";
        BusinessFunctionType = "Update";
        MirName = "CCWM0732";
    }

    OUT LSIR-RETURN-CD;

    OUT MIR-RETRN-CD;

    INOUT MIR-ADB-TITL-TXT
    {
        MixedCase;
        Length = "40";
        DBTableName = "TPW";
        SType = "Text";
        Label = "Accidental Death Benefit Title";
    }

    INOUT MIR-COLA-1-TITL-TXT
    {
        MixedCase;
        Length = "40";
        DBTableName = "TPW";
        SType = "Text";
        Label = "COLA 1 Title";
    }

    INOUT MIR-COLA-2-TITL-TXT
    {
        MixedCase;
        Length = "40";
        DBTableName = "TPW";
        SType = "Text";
        Label = "COLA 2 Title";
    }

    INOUT MIR-COLA-3-TITL-TXT
    {
        MixedCase;
        Length = "40";
        DBTableName = "TPW";
        SType = "Text";
        Label = "COLA 3 Title";
    }

    INOUT MIR-COLA-4-TITL-TXT
    {
        MixedCase;
        Length = "40";
        DBTableName = "TPW";
        SType = "Text";
        Label = "COLA 4 Title";
    }

    INOUT MIR-DOC-ID
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

    INOUT MIR-DOC-LANG-CD
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

    INOUT MIR-FE-TITL-TXT
    {
        MixedCase;
        Length = "40";
        DBTableName = "TPW";
        SType = "Text";
        Label = "Flat extra Title";
    }

    INOUT MIR-LOC-GR-ID
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

    INOUT MIR-LTA-TITL-TXT
    {
        MixedCase;
        Length = "40";
        DBTableName = "TPW";
        SType = "Text";
        Label = "Lifetime Accident Title";
    }

    INOUT MIR-LTB-TITL-TXT
    {
        MixedCase;
        Length = "40";
        DBTableName = "TPW";
        SType = "Text";
        Label = "Lifetime Benefits Title";
    }

    INOUT MIR-ME-TITL-TXT
    {
        MixedCase;
        Length = "40";
        DBTableName = "TPW";
        SType = "Text";
        Label = "Multiple rated Title";
    }

    INOUT MIR-OWN-OCCP-TITL-TXT
    {
        MixedCase;
        Length = "40";
        DBTableName = "TPW";
        SType = "Text";
        Label = "Own Occupation Title";
    }

    INOUT MIR-PDISAB-TITL-TXT
    {
        MixedCase;
        Length = "40";
        DBTableName = "TPW";
        SType = "Text";
        Label = "Partial Disability Title";
    }

    INOUT MIR-PLAN-TITL-TXT
    {
        MixedCase;
        Length = "40";
        DBTableName = "TPW";
        SType = "Text";
        Label = "Product Title";
    }

    INOUT MIR-REDC-EP-TITL-TXT
    {
        MixedCase;
        Length = "40";
        DBTableName = "TPW";
        SType = "Text";
        Label = "Elimination Period Title";
    }

    INOUT MIR-SBSDRY-CO-ID
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

    INOUT MIR-WAV-BNFT-TITL-TXT
    {
        MixedCase;
        Length = "40";
        DBTableName = "TPW";
        SType = "Text";
        Label = "Waiver Benefit Title";
    }

}

