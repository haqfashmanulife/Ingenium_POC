# Converted from PathFinder 2.2 to 3.0 Jun 18, 2004 3:12:50 PM EDT

#*******************************************************************************
#*  Component:   BF1745-O.s                                                    *
#*  Description:                                                               *
#*                                                                             *
#*******************************************************************************
#*  Chg#    Release  Description                                               *
#*                                                                             *
#*  014590  6.0      New for release 6.0                                       *
#*  017150  612J     Remove Currency Decimals = "2"                            *
#*                                                                             *
#*******************************************************************************

S-STEP BF1745-O
{
    ATTRIBUTES
    {
        BusinessFunctionType = "Copy";
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

    IN MIR-FND-ID
    {
        Key;
        DisplayOnly;
        Length = "5";
        CodeSource = "EDIT";
        CodeType = "SEGFD";
        SType = "Text";
        Label = "From Fund";
    }

    IN MIR-FND-ID-2
    {
        Key;
        DisplayOnly;
        Length = "5";
        CodeSource = "EDIT";
        CodeType = "SEGFD";
        SType = "Text";
        Label = "To Fund";
    }

    IN MIR-LOC-GR-ID
    {
        Key;
        DisplayOnly;
        Length = "3";
        CodeSource = "EDIT";
        CodeType = "LOCGP";
        SType = "Text";
        Label = "From Location Group";
    }

    IN MIR-LOC-GR-ID-2
    {
        Key;
        DisplayOnly;
        Length = "3";
        CodeSource = "EDIT";
        CodeType = "LOCGP";
        SType = "Text";
        Label = "To Location Group";
    }

    IN MIR-PLAN-ID
    {
        Key;
        DisplayOnly;
        Length = "40";
        CodeSource = "EDIT";
        CodeType = "PLAN";
        SType = "Text";
        Label = "From Plan";
    }

    IN MIR-PLAN-ID-2
    {
        Key;
        DisplayOnly;
        Length = "40";
        CodeSource = "EDIT";
        CodeType = "PLAN";
        SType = "Text";
        Label = "To Plan";
    }

    IN MIR-SBSDRY-CO-ID
    {
        Key;
        DisplayOnly;
        Length = "40";
        CodeSource = "EDIT";
        CodeType = "SUBCO";
        SType = "Text";
        Label = "From Sub Company";
    }

    IN MIR-SBSDRY-CO-ID-2
    {
        Key;
        DisplayOnly;
        Length = "40";
        CodeSource = "EDIT";
        CodeType = "SUBCO";
        SType = "Text";
        Label = "To Sub Company";
    }

    IN MIR-DV-FREE-LK-FND-CD
    {
        DisplayOnly;
        Length = "1";
        CodeSource = "DataModel";
        CodeType = "DV-FREE-LK-FND-CD";
        SType = "Text";
        Label = "Free Look Fund Designation";
    }

    IN MIR-MIN-OPN-AMT
    {
        DisplayOnly;
        Length = "15";
        SType = "Currency";
        Label = "Minimum Amount to Open Fund";
    }

    IN MIR-MIN-REMN-AMT
    {
        DisplayOnly;
        Length = "15";
        SType = "Currency";
        Label = "Minimum Remaining Fund Value";
    }

    IN MIR-MUT-EXCL-IND
    {
        DisplayOnly;
        Length = "1";
        SType = "Indicator";
        Label = "Fund is mutually exclusive with other funds for this plan";
    }

    IN MIR-PLAN-FND-REQIR-CD
    {
        DisplayOnly;
        Length = "1";
        CodeSource = "DataModel";
        CodeType = "PLAN-FND-REQIR-CD";
        SType = "Text";
        Label = "Fund Required";
    }

    IN MIR-PSUR-ALLOW-IND
    {
        DisplayOnly;
        Length = "1";
        SType = "Indicator";
        Label = "Partial surrenders allowed";
    }

}

