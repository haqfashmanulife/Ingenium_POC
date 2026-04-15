# Converted from PathFinder 2.2 to 3.0 Jun 18, 2004 3:12:11 PM EDT

#*******************************************************************************
#*  Component:   AppAllocationsVUL.s                                           *
#*  Description:                                                               *
#*                                                                             *
#*******************************************************************************
#*  Chg#    Release  Description                                               *
#*                                                                             *
#*  016423  602J     New for release 602J                                      *
#*  017150  612J     Remove Currency Decimals = "2"                            *
#*                                                                             *
#*******************************************************************************

S-STEP AppAllocationsVUL
{
    ATTRIBUTES
    {
        BusinessFunctionType = "Update";
        Type = "Input";
        FocusField = "MIR-CDI-ALLOC-PCT-T[1]";
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

    INOUT index
    {
        SType = "Hidden";
    }


    # the following fields are used to retrieve the
    # fund description for all funds on the page.
    # BF0851 will send these to the page.  They do not
    # need to be sent back to the server.

    IN MIR-DV-FND-DESC-TXT-T[20]
    {
        DisplayOnly;
        Length = "40";
        FieldGroup = "Table1";
        SType = "Text";
        Label = "Fund Description";
        Index = "1";
    }


    # the following fields are used to capture and
    # send initial allocation percents.

    INOUT MIR-CDI-ALLOC-PCT-T[20]
    {
        Length = "7";
        Decimals = "4";
        FieldGroup = "Table1";
        SType = "Percent";
        Label = "Allocation Percentage";
        Index = "1";
    }

    INOUT MIR-CDI-ALLOC-PCT-S-T[20]
    {
        Length = "7";
        Decimals = "4";
        FieldGroup = "Table1";
        SType = "Percent";
        Label = "Allocation Percentage";
        Index = "1";
    }

    INOUT MIR-CDI-ALLOC-AMT-T[20]
    {
        Length = "17";
        FieldGroup = "Table1";
        SType = "Percent";
        Label = "Amount / Percent / No. of Units";
        Index = "1";
    }

    INOUT InitialSubsequent
    {
        Label = "Are Subsequent Allocations the same as the Initial Allocations?";
        SType = "YesNo";
        DefaultConstant = "Y";
    }

    INOUT AssetRebalance
    {
        Label = "Participate in Asset Rebalancing?";
        SType = "YesNo";
        DefaultConstant = "N";
    }

    INOUT AssetRebalanceFromSubsequent
    {
        Label = "Use the same funds and percentages as Subsequent Allocations?";
        SType = "YesNo";
        DefaultConstant = "Y";
    }

    INOUT MIR-AR-START-DT
    {
        Label = "AR Start Date:";
        SType = "Date";
        Mandatory;
    }

    INOUT MIR-POL-PAYO-MODE-CD-2
    {
        Label = "Asset Rebalance Frequency:";
        SType = "Selection";
        Length = "15";
        Mandatory;
        CodeSource = "DataModel";
        CodeType = "POL-PAYO-MODE-CD";
    }

    INOUT DollarCostAvg
    {
        Label = "Participate in Dollar Cost Averaging?";
        SType = "YesNo";
        DefaultConstant = "N";
    }

    INOUT MIR-POL-PAYO-AMT
    {
        Mandatory;
        Length = "15";
        SType = "Currency";
        Label = "DCA Payout Amount";
    }

    INOUT MIR-POL-PAYO-EFF-DT
    {
        Mandatory;
        Length = "10";
        SType = "Date";
        Label = "DCA Effective Date";
    }

    INOUT MIR-POL-PAYO-END-DT
    {
        Length = "10";
        SType = "Date";
        Label = "DCA End Date";
    }

    INOUT MIR-POL-PAYO-MODE-CD
    {
        Mandatory;
        Length = "2";
        CodeSource = "DataModel";
        CodeType = "POL-PAYO-MODE-CD";
        SType = "Selection";
        Label = "DCA Payout Mode";
    }

}

