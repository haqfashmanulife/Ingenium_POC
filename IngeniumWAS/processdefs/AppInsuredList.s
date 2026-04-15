# Converted from PathFinder 2.2 to 3.0 Jun 18, 2004 3:12:12 PM EDT

#*******************************************************************************
#*  Component:   AppInsuredList.s                                              *
#*  Description:                                                               *
#*                                                                             *
#*******************************************************************************
#*  Chg#    Release  Description                                               *
#*                                                                             *
#*  016423  602J     New for release 602J                                      *
#*  017150  612J     Remove Currency Decimals = "2"                            *
#*                                                                             *
#*******************************************************************************

S-STEP AppInsuredList
{
    ATTRIBUTES
    {
        BusinessFunctionType = "List";
        Type = "Output";
        DelEmptyRows;
        FocusField = "MIR-DV-INSRD-CLI-NM-T[1]";
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

    OUT index
    {
        SType = "Hidden";
    }

    IN MIR-DV-INSRD-CLI-NM-T[10]
    {
        DisplayOnly;
        Length = "75";
        FieldGroup = "Table10";
        Link;
        SType = "Text";
        Action = "GoToInsuredQuestions";
        Label = "Client Name";
        Index = "1";
    }

    IN MIR-CLI-BTH-DT-T[10]
    {
        DisplayOnly;
        Length = "10";
        FieldGroup = "Table10";
        SType = "Date";
        Label = "Birth Date";
        Index = "1";
    }

    IN MIR-PLAN-UWG-IND-T[10]
    {
        DisplayOnly;
        Length = "40";
        FieldGroup = "Table10";
        SType = "Text";
        Label = "Underwriting Required";
        CodeSource = "DataModel";
        CodeType = "PLAN-UWG-IND";
        Index = "1";
    }

    IN DataCollected-T[10]
    {
        DisplayOnly;
        Length = "3";
        FieldGroup = "Table10";
        SType = "Text";
        Label = "Data Collected";
        Index = "1";
    }

}

