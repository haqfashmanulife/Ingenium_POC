# Converted from PathFinder 2.2 to 3.0 Jun 18, 2004 3:12:12 PM EDT

#*******************************************************************************
#*  Component:   AppNonmedEmploymentJP.s                                      *
#*  Description:                                                               *
#*                                                                             *
#*******************************************************************************
#*  Chg#    Release  Description                                               *
#*                                                                             *
#*  016423  602J     New for release 602J                                      *
#*  017150  612J     Remove Currency Decimals = "2"                            *
#*                                                                             *
#*******************************************************************************

S-STEP AppNonmedEmploymentJP
{
    ATTRIBUTES
    {
        Type = "Input";
        FocusField = "MIR-OCCP-ID";
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

    INOUT MIR-CLI-EARN-INCM-AMT
    {
        Length = "13";
        Decimals = "0";
        SType = "Currency";
        Label = "Earned Income";
    }

    INOUT MIR-CLI-OTHR-INCM-AMT
    {
        Length = "13";
        Decimals = "0";
        SType = "Currency";
        Label = "Other Income";
    }

    INOUT MIR-EARN-INCM-MODE-CD
    {
        Length = "1";
        CodeSource = "DataModel";
        CodeType = "EARN-INCM-MODE-CD";
        SType = "Selection";
        Label = "Earned Income Mode";
    }

    INOUT MIR-OTHR-INCM-MODE-CD
    {
        Length = "1";
        CodeSource = "DataModel";
        CodeType = "OTHR-INCM-MODE-CD";
        SType = "Selection";
        Label = "Other Income Mode";
    }

    IN MIR-CLI-INCM-EFF-DT
    {
        Key;
        DisplayOnly;
        Length = "10";
        DefaultSession = "LSIR-PRCES-DT";
        SType = "Date";
        Label = "Date";
    }

    IN MIR-DV-INSRD-CLI-NM
    {
        DisplayOnly;
        Length = "75";
        SType = "Text";
        Label = "Applicant";
    }

    INOUT MIR-OCCP-ID
    {
        Length = "10";
        CodeSource = "EDIT";
        CodeType = "OCCCD";
        SType = "Selection";
        Label = "Occupation";
    }

    INOUT MIR-CLI-EMPLR-NM-T[1]
    {
        Length = "50";
        FieldGroup = "Table7";
        SType = "Text";
        Label = "Current Employer Name";
        Index = "1";
    }

    INOUT MIR-EMPLR-ADDR-1-TXT-T[1]
    {
        Length = "25";
        FieldGroup = "Table6";
        SType = "Text";
        Label = "Current Employer Address";
        Index = "1";
    }

    INOUT MIR-EMPLR-ADDR-2-TXT-T[1]
    {
        Length = "25";
        FieldGroup = "Table6";
        SType = "Text";
        Label = "Current Employer Address";
        Index = "1";
    }

    INOUT MIR-CLI-EMPLR-LOC-CD
    {
        Length = "2";
        CodeSource = "CTLC";
        CodeType = "CLOC";
        SType = "Selection";
        FilterFields = "1";
        FilterField1 = "MIR-CLI-EMPLR-CTRY-CD";
        Label = "Province/State";
    }

    INOUT MIR-CLI-EMPLR-CTRY-CD
    {
        Length = "40";
        CodeSource = "XTAB";
        CodeType = "CNTRY";
        DefaultSession = "MIR-USER-SESN-CTRY-CD";
        SType = "Selection";
        Label = "Country";
    }

    INOUT MIR-CLI-EMPL-YR-DUR
    {
        Length = "2";
        SType = "Text";
        Label = "Years with Employer";
    }

    INOUT MIR-CLI-PREV-EMPLR-NM-T[1]
    {
        Length = "50";
        FieldGroup = "Table8";
        SType = "Text";
        Label = "Previous Employer Name";
        Index = "1";
    }

    INOUT MIR-PREV-EMPL-YR-DUR
    {
        Length = "3";
        SType = "Text";
        Label = "Number of Years with Employer";
    }

}

