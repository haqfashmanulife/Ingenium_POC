# Converted from PathFinder 2.2 to 3.0 Jun 18, 2004 3:12:12 PM EDT

#*******************************************************************************
#*  Component:   AppInsuredQuestions.s                                         *
#*  Description:                                                               *
#*                                                                             *
#*******************************************************************************
#*  Chg#    Release  Description                                               *
#*                                                                             *
#*  016423  602J     New for release 602J                                      *
#*  017150  612J     Remove Currency Decimals = "2"                            *
#*                                                                             *
#*******************************************************************************

S-STEP AppInsuredQuestions
{
    ATTRIBUTES
    {
        FocusField = "InsuranceInforceLink";
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


    #*****************************************************
    #  Field Definitions
    #*****************************************************

    IN MIR-DV-INSRD-CLI-NM
    {
        DisplayOnly;
        Length = "75";
        SType = "Text";
        Label = "Applicant";
    }

    INOUT InsuranceInforceLink
    {
        Label = "Enter Insurance inforce or Applied for information";
        Link;
        SType = "Text";
        Action = "GoToInsuranceHistory";
    }

    OUT EmploymentLink
    {
        Label = "Enter Employment information";
        Link;
        SType = "Text";
        Action = "GoToEmployment";
    }

    OUT HeightWeightLink
    {
        Label = "Enter Height/Weight information";
        Link;
        SType = "Text";
        Action = "GoToHeightWeight";
    }

    OUT PersonalPhysicianLink
    {
        Label = "Enter Personal Physician information";
        Link;
        SType = "Text";
        Action = "GoToPhysician";
    }

    OUT FamilyHistoryLink
    {
        Label = "Enter Family History information";
        Link;
        SType = "Text";
        Action = "GoToFamilyHistory";
    }

    OUT LifestyleLink
    {
        Label = "Enter Lifestyle/Medical information";
        Link;
        SType = "Text";
        Action = "GoToLifestyle";
    }

}

