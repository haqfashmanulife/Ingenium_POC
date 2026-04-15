# Converted from PathFinder 2.2 to 3.0 Jun 18, 2004 3:12:44 PM EDT

#*******************************************************************************
#*  Component:   BF1480-O.s                                                    *
#*  Description:                                                               *
#*                                                                             *
#*******************************************************************************
#*  Chg#    Release  Description                                               *
#*                                                                             *
#*  014590  6.0      New for release 6.0                                       *
#*  017150  612J     Remove Currency Decimals = "2"                            *
#*                                                                             *
#*******************************************************************************

S-STEP BF1480-O
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

    IN MIR-ADB-TITL-TXT
    {
        DisplayOnly;
        Length = "40";
        SType = "Text";
        Label = "Accidental Death Benefit Title";
    }

    IN MIR-COLA-1-TITL-TXT
    {
        DisplayOnly;
        Length = "40";
        SType = "Text";
        Label = "COLA 1 Title";
    }

    IN MIR-COLA-2-TITL-TXT
    {
        DisplayOnly;
        Length = "40";
        SType = "Text";
        Label = "COLA 2 Title";
    }

    IN MIR-COLA-3-TITL-TXT
    {
        DisplayOnly;
        Length = "40";
        SType = "Text";
        Label = "COLA 3 Title";
    }

    IN MIR-COLA-4-TITL-TXT
    {
        DisplayOnly;
        Length = "40";
        SType = "Text";
        Label = "COLA 4 Title";
    }

    IN MIR-FE-TITL-TXT
    {
        DisplayOnly;
        Length = "40";
        SType = "Text";
        Label = "Flat extra Title";
    }

    IN MIR-LTA-TITL-TXT
    {
        DisplayOnly;
        Length = "40";
        SType = "Text";
        Label = "Lifetime Accident Title";
    }

    IN MIR-LTB-TITL-TXT
    {
        DisplayOnly;
        Length = "40";
        SType = "Text";
        Label = "Lifetime Benefits Title";
    }

    IN MIR-ME-TITL-TXT
    {
        DisplayOnly;
        Length = "40";
        SType = "Text";
        Label = "Multiple rated Title";
    }

    IN MIR-OWN-OCCP-TITL-TXT
    {
        DisplayOnly;
        Length = "40";
        SType = "Text";
        Label = "Own Occupation Title";
    }

    IN MIR-PDISAB-TITL-TXT
    {
        DisplayOnly;
        Length = "40";
        SType = "Text";
        Label = "Partial Disability Title";
    }

    IN MIR-PLAN-TITL-TXT
    {
        DisplayOnly;
        Length = "40";
        SType = "Text";
        Label = "Product Title";
    }

    IN MIR-REDC-EP-TITL-TXT
    {
        DisplayOnly;
        Length = "40";
        SType = "Text";
        Label = "Elimination Period Title";
    }

    IN MIR-WAV-BNFT-TITL-TXT
    {
        DisplayOnly;
        Length = "40";
        SType = "Text";
        Label = "Waiver Benefit Title";
    }

}

