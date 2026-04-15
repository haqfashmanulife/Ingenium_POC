# Converted from PathFinder 2.2 to 3.0 Jun 18, 2004 3:12:44 PM EDT

#*******************************************************************************
#*  Component:   BF1482-I.s                                                    *
#*  Description:                                                               *
#*                                                                             *
#*******************************************************************************
#*  Chg#    Release  Description                                               *
#*                                                                             *
#*  014590  6.0      New for release 6.0                                       *
#*  017150  612J     Remove Currency Decimals = "2"                            *
#*                                                                             *
#*******************************************************************************

S-STEP BF1482-I
{
    ATTRIBUTES
    {
        Type = "Input";
        FocusField = "MIR-PLAN-TITL-TXT";
        FocusFrame = "ContentFrame";
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

    INOUT MIR-ADB-TITL-TXT
    {
        Length = "40";
        SType = "Text";
        Label = "Accidental Death Benefit Title";
    }

    INOUT MIR-COLA-1-TITL-TXT
    {
        Length = "40";
        SType = "Text";
        Label = "COLA 1 Title";
    }

    INOUT MIR-COLA-2-TITL-TXT
    {
        Length = "40";
        SType = "Text";
        Label = "COLA 2 Title";
    }

    INOUT MIR-COLA-3-TITL-TXT
    {
        Length = "40";
        SType = "Text";
        Label = "COLA 3 Title";
    }

    INOUT MIR-COLA-4-TITL-TXT
    {
        Length = "40";
        SType = "Text";
        Label = "COLA 4 Title";
    }

    IN MIR-DOC-ID
    {
        Key;
        DisplayOnly;
        Length = "40";
        CodeSource = "EDIT";
        CodeType = "DOCM";
        SType = "Text";
        Label = "Document name";
    }

    IN MIR-DOC-LANG-CD
    {
        Key;
        DisplayOnly;
        Length = "40";
        CodeSource = "EDIT";
        CodeType = "LANG";
        SType = "Text";
        Label = "Language";
    }

    INOUT MIR-FE-TITL-TXT
    {
        Length = "40";
        SType = "Text";
        Label = "Flat extra Title";
    }

    IN MIR-LOC-GR-ID
    {
        Key;
        DisplayOnly;
        Length = "40";
        CodeSource = "EDIT";
        CodeType = "LOCGP";
        SType = "Text";
        Label = "Location Group";
    }

    INOUT MIR-LTA-TITL-TXT
    {
        Length = "40";
        SType = "Text";
        Label = "Lifetime Accident Title";
    }

    INOUT MIR-LTB-TITL-TXT
    {
        Length = "40";
        SType = "Text";
        Label = "Lifetime Benefits Title";
    }

    INOUT MIR-ME-TITL-TXT
    {
        Length = "40";
        SType = "Text";
        Label = "Multiple rated Title";
    }

    INOUT MIR-OWN-OCCP-TITL-TXT
    {
        Length = "40";
        SType = "Text";
        Label = "Own Occupation Title";
    }

    INOUT MIR-PDISAB-TITL-TXT
    {
        Length = "40";
        SType = "Text";
        Label = "Partial Disability Title";
    }

    INOUT MIR-PLAN-TITL-TXT
    {
        Length = "40";
        SType = "Text";
        Label = "Product Title";
    }

    INOUT MIR-REDC-EP-TITL-TXT
    {
        Length = "40";
        SType = "Text";
        Label = "Elimination Period Title";
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

    INOUT MIR-WAV-BNFT-TITL-TXT
    {
        Length = "40";
        SType = "Text";
        Label = "Waiver Benefit Title";
    }

}

