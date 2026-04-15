# Converted from PathFinder 2.2 to 3.0 Jun 18, 2004 3:12:12 PM EDT

#*******************************************************************************
#*  Component:   AppNonmedHeightWeightJP.s                                    *
#*  Description:                                                               *
#*                                                                             *
#*******************************************************************************
#*  Chg#    Release  Description                                               *
#*                                                                             *
#*  016423  602J     New for release 602J                                      *
#*  017150  612J     Remove Currency Decimals = "2"                            *
#*                                                                             *
#*******************************************************************************

S-STEP AppNonmedHeightWeightJP
{
    ATTRIBUTES
    {
        Type = "Input";
        FocusField = "MIR-DV-CLI-CM-HT";
        FocusFrame = "ContentFrame";
    }

    IN Title;

    IN TitleBar;

    IN TitleBarSize;

    IN BannerBar;

    IN BannerBarSize;

    IN BannerProductID
    {
        CodeSource = "EDIT";
        CodeType = "PLAN";
    }

    IN BannerPolicyID;

    IN BannerPrimaryInsured;

    IN ButtonBar;

    IN ButtonBarSize;

    IN MessageFrame;

    IN MessageFrameSize;

    OUT action
    {
        SType = "Hidden";
    }

    IN MIR-DV-INSRD-CLI-NM
    {
        DisplayOnly;
        Length = "75";
        SType = "Text";
        Label = "Insured Name";
    }

    INOUT MIR-DV-CLI-CM-HT
    {
        Length = "3";
        SType = "Text";
        Label = "cm";
    }

    INOUT MIR-DV-CLI-KG-WGT
    {
        Length = "3";
        SType = "Text";
        Label = "kgs";
    }

    INOUT MIR-DV-CLI-WGT-CHNG-KG-QTY
    {
        Length = "3";
        SType = "Text";
        Label = "Weight Change  (lbs / kgs)";
    }

    INOUT MIR-REASN-WGT-CHNG-TXT
    {
        Length = "40";
        CodeSource = "EDIT";
        CodeType = "WCRSN";
        SType = "Selection";
        Label = "Reason for Weight Change";
    }

    INOUT MIR-WGT-GAIN-LOS-CD
    {
        Length = "40";
        CodeSource = "DataModel";
        CodeType = "WGT-GAIN-LOS-CD";
        SType = "Selection";
        Label = "Gain / Loss";
    }

}

