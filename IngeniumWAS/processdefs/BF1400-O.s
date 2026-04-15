# Converted from PathFinder 2.2 to 3.0 Jun 18, 2004 3:12:40 PM EDT

#*******************************************************************************
#*  Component:   BF1400-O.s                                                    *
#*  Description:                                                               *
#*                                                                             *
#*******************************************************************************
#*  Chg#    Release  Description                                               *
#*                                                                             *
#*  014590  6.0      New for release 6.0                                       *
#*  017150  612J     Remove Currency Decimals = "2"                            *
#*                                                                             *
#*******************************************************************************

S-STEP BF1400-O
{
    ATTRIBUTES
    {
        BusinessFunctionType = "Irreg";
        Type = "Output";
        DelEmptyRows;
        FocusField = "confirmButton";
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

    IN MIR-INSRD-DISAB-DT
    {
        DisplayOnly;
        Length = "10";
        SType = "Date";
        Label = "Date Insured Disabled";
    }

    IN MIR-PREV-CLM-PMT-AMT
    {
        DisplayOnly;
        Length = "13";
        SType = "Currency";
        Label = "Amount";
    }

    IN MIR-DI-CLM-ID
    {
        Key;
        DisplayOnly;
        Length = "6";
        DefaultSession = "MIR-DI-CLM-ID";
        SType = "Text";
        Label = "Claim Number";
    }

    IN MIR-POL-ID-BASE
    {
        Key;
        DisplayOnly;
        Length = "9";
        DefaultSession = "MIR-POL-ID-BASE";
        SType = "Text";
        Label = "Policy Id";
    }

    IN MIR-POL-ID-SFX
    {
        Key;
        DisplayOnly;
        Length = "1";
        DefaultSession = "MIR-POL-ID-SFX";
        SType = "Text";
        Label = "Suffix";
    }

    IN MIR-DV-INSRD-CLI-NM
    {
        DisplayOnly;
        Length = "75";
        SType = "Text";
        Label = "Insured Name";
    }

    IN MIR-DV-OWN-CLI-NM
    {
        DisplayOnly;
        Length = "75";
        SType = "Text";
        Label = "Owner Name";
    }

}

