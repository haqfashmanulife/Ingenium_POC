# Converted from PathFinder 2.2 to 3.0 Jun 18, 2004 3:12:50 PM EDT

#*******************************************************************************
#*  Component:   BF1742-I.s                                                    *
#*  Description:                                                               *
#*                                                                             *
#*******************************************************************************
#*  Chg#    Release  Description                                               *
#*                                                                             *
#*  014590  6.0      New for release 6.0                                       *
#*  017150  612J     Remove Currency Decimals = "2"                            *
#*                                                                             *
#*******************************************************************************

S-STEP BF1742-I
{
    ATTRIBUTES
    {
        BusinessFunctionType = "Update";
        Type = "Input";
        FocusField = "MIR-PLAN-ID";
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

    INOUT MIR-DV-FREE-LK-FND-CD
    {
        Length = "1";
        CodeSource = "DataModel";
        CodeType = "DV-FREE-LK-FND-CD";
        SType = "Selection";
        Label = "Free Look Fund Designation";
    }

    INOUT MIR-MIN-OPN-AMT
    {
        Length = "15";
        SType = "Currency";
        Label = "Minimum Amount to Open Fund";
    }

    INOUT MIR-MIN-REMN-AMT
    {
        Length = "15";
        SType = "Currency";
        Label = "Minimum Remaining Fund Value";
    }

    INOUT MIR-MUT-EXCL-IND
    {
        Length = "1";
        SType = "Indicator";
        Label = "Fund is mutually exclusive with other funds for this plan";
    }

    INOUT MIR-PLAN-FND-REQIR-CD
    {
        Length = "1";
        CodeSource = "DataModel";
        CodeType = "PLAN-FND-REQIR-CD";
        SType = "Selection";
        Label = "Fund Required";
    }

    INOUT MIR-PSUR-ALLOW-IND
    {
        Length = "1";
        SType = "Indicator";
        Label = "Partial surrenders allowed";
    }

    IN MIR-FND-ID
    {
        Key;
        DisplayOnly;
        Length = "5";
        CodeSource = "EDIT";
        CodeType = "SEGFD";
        SType = "Text";
        Label = "Fund";
    }

    IN MIR-LOC-GR-ID
    {
        Key;
        DisplayOnly;
        Length = "3";
        CodeSource = "EDIT";
        CodeType = "LOCGP";
        SType = "Text";
        Label = "Location Group";
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

}

