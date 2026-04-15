# Converted from PathFinder 2.2 to 3.0 Jun 18, 2004 3:12:11 PM EDT


#*******************************************************************************
#*  Component:   AppChangeQuestions.s                                          *
#*  Description:                                                               *
#*                                                                             *
#*******************************************************************************
#*  Chg#    Release  Description                                               *
#*                                                                             *
#*  016423  602J     New for release 602J                                        *
#*  017150  612J     Remove Currency Decimals = "2"                            *
#*                                                                             *
#*******************************************************************************

S-STEP AppChangeQuestions
{
    ATTRIBUTES
    {
        BusinessFunctionType = "Update";
        Type = "Input";
        FocusField = "MIR-DV-QSTN-RESP-TXT-004";
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

    IN QuestionText
    {
        DisplayOnly;
        Length = "75";
        SType = "Text";
        Label = "Question Text";
    }

    INOUT MIR-DV-QSTN-RESP-TXT-004
    {
        Length = "20";
        SType = "Text";
        Label = "Response to Variable Questions";
    }

    INOUT MIR-DV-QSTN-RESP-TXT-005
    {
        Length = "20";
        SType = "Text";
        Label = "Response to Variable Questions";
    }

    INOUT MIR-DV-QSTN-RESP-TXT-006
    {
        Length = "20";
        SType = "Text";
        Label = "Response to Variable Questions";
    }

    IN MIR-DV-INSRD-CLI-NM
    {
        DisplayOnly;
        Length = "75";
        SType = "Text";
        Label = "Insured Name";
    }

}

