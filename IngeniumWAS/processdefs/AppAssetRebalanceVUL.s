# Converted from PathFinder 2.2 to 3.0 Jun 18, 2004 3:12:11 PM EDT

#*******************************************************************************
#*  Component:   AppAssetRebalanceVUL.s                                        *
#*  Description:                                                               *
#*                                                                             *
#*******************************************************************************
#*  Chg#    Release  Description                                               *
#*                                                                             *
#*  016423  602J     New for release 602J                                      *
#*  017150  612J     Remove Currency Decimals = "2"                            *
#*                                                                             *
#*******************************************************************************

S-STEP AppAssetRebalanceVUL
{
    ATTRIBUTES
    {
        BusinessFunctionType = "Update";
        Type = "Input";
        FocusField = "MIR-CDI-ALLOC-AMT-T[1]";
        FocusFrame = "ContentFrame";
    }

    IN Title;

    IN TitleBar;

    IN TitleBarSize;

    IN ButtonBar;

    IN ButtonBarSize;

    IN MessageFrame;

    IN MessageFrameSize;

    IN BannerBar;

    IN BannerBarSize;

    IN BannerProductID
    {
        CodeSource = "EDIT";
        CodeType = "PLAN";
    }

    IN BannerPolicyID;

    IN BannerPrimaryInsured;

    OUT action
    {
        SType = "Hidden";
    }

    OUT index
    {
        SType = "Hidden";
    }


    # the following fields are used to retrieve the
    # fund description for all funds on the page.
    # BF0940 will send these to the page.  They do not
    # need to be sent back to the server.

    IN MIR-DV-FND-DESC-TXT-T[20]
    {
        DisplayOnly;
        KeyColumn;
        Length = "40";
        FieldGroup = "Table1";
        SType = "Text";
        Label = "Fund Description";
        Index = "1";
    }


    # the following fields are used to capture and
    # send asset reblance allocation percents.

    INOUT MIR-CDI-ALLOC-AMT-T[20]
    {
        Length = "7";
        Decimals = "4";
        FieldGroup = "Table1";
        SType = "Percent";
        Label = "Allocation Percentage";
        Index = "1";
    }

    INOUT MIR-POL-PAYO-EFF-DT
    {
        Label = "AR Start Date:";
        SType = "Date";
        Mandatory;
    }

    INOUT MIR-POL-PAYO-MODE-CD
    {
        Label = "Asset Rebalance Frequency:";
        SType = "Selection";
        Length = "15";
        Mandatory;
        CodeSource = "DataModel";
        CodeType = "POL-PAYO-MODE-CD";
    }

}

