# Converted from PathFinder 2.2 to 3.0 Jun 18, 2004 3:12:11 PM EDT

#*******************************************************************************
#*  Component:   AppAnalysisVUL.s                                              *
#*  Description:                                                               *
#*                                                                             *
#*******************************************************************************
#*  Chg#    Release  Description                                               *
#*                                                                             *
#*  016423  602J     New for release 602J                                      *
#*  017150  612J     Remove Currency Decimals = "2"                            *
#*                                                                             *
#*******************************************************************************

S-STEP AppAnalysisVUL
{
    ATTRIBUTES
    {
        FocusField = "RunAnalysisRoutines";
        DelEmptyRows;
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


    #*****************************************************
    #  Field Definitions
    #*****************************************************

    IN MIR-DV-OWN-CLI-NM
    {
        DisplayOnly;
        Length = "75";
        SType = "Text";
        Label = "Owner Name";
    }

    IN BillingName
    {
        DisplayOnly;
        Length = "75";
        SType = "Text";
        Label = "Billing Name";
    }

    IN MIR-POL-MPREM-AMT
    {
        DisplayOnly;
        Signed;
        Length = "15";
        SType = "Currency";
        Label = "Modal Target Premium";
    }

    IN MIR-POL-ISS-EFF-DT
    {
        DisplayOnly;
        Length = "10";
        SType = "Date";
        Label = "Potential Effective Date";
    }

    IN MIR-POL-BILL-MODE-CD
    {
        DisplayOnly;
        Length = "40";
        CodeSource = "DataModel";
        CodeType = "POL-BILL-MODE-CD";
        SType = "Text";
        Label = "Policy Billing Mode";
    }

    IN MIR-POL-BILL-TYP-CD
    {
        DisplayOnly;
        Length = "1";
        CodeSource = "DataModel";
        CodeType = "POL-BILL-TYP-CD";
        SType = "Text";
        Label = "Policy Billing Method";
    }

    IN MIR-POL-SNDRY-AMT
    {
        DisplayOnly;
        Signed;
        Length = "13";
        SType = "Currency";
        Label = "Planned Billing Amount";
    }

    IN MIR-POL-DB-OPT-CD
    {
        DisplayOnly;
        Length = "40";
        CodeSource = "DataModel";
        CodeType = "POL-DB-OPT-CD";
        SType = "Text";
        Label = "Death Benefit Option";
    }

    IN MIR-PLAN-ID-T[20]
    {
        DisplayOnly;
        KeyColumn;
        Length = "40";
        FieldGroup = "TABLE20";
        CodeSource = "EDIT";
        CodeType = "PLAN";
        SType = "Text";
        Label = "Plan";
        Index = "1";
    }

    IN MIR-DV-INSRD-CLI-NM-T[20]
    {
        DisplayOnly;
        Length = "75";
        FieldGroup = "TABLE20";
        SType = "Text";
        Label = "Insured's Name";
        Index = "1";
    }

    IN MIR-CVG-RT-AGE-T[20]
    {
        DisplayOnly;
        Length = "3";
        Decimals = "0";
        FieldGroup = "TABLE20";
        SType = "Number";
        Label = "Issue Age";
        Index = "1";
    }

    IN MIR-CVG-SEX-CD-T[20]
    {
        DisplayOnly;
        Length = "40";
        FieldGroup = "TABLE20";
        CodeSource = "DataModel";
        CodeType = "CVG-SEX-CD";
        SType = "Text";
        Label = "Sex";
        Index = "1";
    }

    IN MIR-CVG-SMKR-CD-T[20]
    {
        DisplayOnly;
        Length = "40";
        FieldGroup = "TABLE20";
        CodeSource = "EDIT";
        CodeType = "SMOKE";
        SType = "Text";
        Label = "Smoker";
        Index = "1";
    }

    IN MIR-CVG-FACE-AMT-T[20]
    {
        DisplayOnly;
        Length = "15";
        FieldGroup = "TABLE20";
        SType = "Currency";
        Label = "Face Amount";
        Index = "1";
    }

    IN MIR-CVG-WP-IND-T[20]
    {
        DisplayOnly;
        Length = "40";
        FieldGroup = "TABLE20";
        SType = "Indicator";
        Label = "Waiver";
        Index = "1";
    }

    IN MIR-CVG-AD-FACE-AMT-T[20]
    {
        DisplayOnly;
        Length = "15";
        FieldGroup = "TABLE20";
        SType = "Currency";
        Label = "ADB Amount";
        Index = "1";
    }

    IN MIR-CVG-CSTAT-CD-T[20]
    {
        DisplayOnly;
        CodeSource = "DataModel";
        CodeType = "CVG-CSTAT-CD";
        Length = "3";
        FieldGroup = "TABLE20";
        DBTableName = "TCVG";
        SType = "Text";
        Label = "CVG Status Code";
        Index = "1";
    }

    IN MIR-DV-AGT-CLI-NM-T[3]
    {
        DisplayOnly;
        Length = "30";
        FieldGroup = "Table3";
        SType = "Text";
        Label = "Agent Name";
        Index = "1";
    }

    IN MIR-POL-AGT-SHR-PCT-T[3]
    {
        DisplayOnly;
        Length = "5";
        Decimals = "2";
        FieldGroup = "Table3";
        SType = "Percent";
        Label = "Agent's Share Percentage";
        Index = "1";
    }

    OUT RunAnalysisRoutines
    {
        Label = "Check Policy for Errors";
        Link;
        SType = "Text";
        Action = "GoToCheckPolicy";
    }

    OUT RunClearCaseProcessing
    {
        Label = "Submit";
        Link;
        SType = "Text";
        Action = "GoToClearCase";
    }

    IN MIR-POL-CSTAT-CD
    {
        DisplayOnly;
        Length = "40";
        CodeSource = "DataModel";
        CodeType = "POL-CSTAT-CD";
        SType = "Text";
        Label = "Current Policy Status";
    }

}

