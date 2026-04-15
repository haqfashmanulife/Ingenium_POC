# Converted from PathFinder 2.2 to 3.0 Jun 18, 2004 3:12:11 PM EDT

#*******************************************************************************
#*  Component:   AppCwaJPUL.s                                                 *
#*  Description:                                                               *
#*                                                                             *
#*******************************************************************************
#*  Chg#    Release  Description                                               *
#*                                                                             *
#*  016423  602J     New for release 602J                                      *
#*  017150  612J     Remove Currency Decimals = "2"                            *
#*                                                                             *
#*******************************************************************************

S-STEP AppCwaJPUL
{
    ATTRIBUTES
    {
        Type = "Input";
        FocusField = "cashYesNo";
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


    # RADIO BUTTON TO TRACK IF CASH WITH APP
    # SUBMITTED.

    INOUT cashYesNo
    {
        SType = "YesNo";
        Label = "Was Payment Submitted With This Application?";
        DefaultConstant = "N";
    }

    INOUT MIR-DV-ENTR-CSH-AMT
    {
        Length = "15";
        SType = "Currency";
        Label = "Cash Amount";
    }

    INOUT MIR-DV-PRCES-STATE-CD
    {
        Length = "1";
        SType = "Hidden";
        Label = "Process State";
    }

    INOUT MIR-DV-PRCES-DT
    {
        Mandatory;
        Length = "10";
        DefaultSession = "LSIR-PRCES-DT";
        SType = "Hidden";
        Label = "Process date";
    }

    IN MIR-POL-MPREM-AMT
    {
        DisplayOnly;
        Signed;
        Length = "15";
        SType = "Currency";
        Label = "Modal Premium as of Paid To Date";
    }

    IN tempCashAmount
    {
        DisplayOnly;
        Signed;
        Length = "17";
        SType = "Currency";
        Label = "Last Cash Payment";
    }

}

