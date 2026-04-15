# Converted from PathFinder 2.2 to 3.0 Jun 18, 2004 3:12:37 PM EDT

#*******************************************************************************
#*  Component:   BF1270-O.s                                                    *
#*  Description:                                                               *
#*                                                                             *
#*******************************************************************************
#*  Chg#    Release  Description                                               *
#*                                                                             *
#*  014590  6.0      New for release 6.0                                       *
#*  017150  612J     Remove Currency Decimals = "2"                            *
#*                                                                             *
#*******************************************************************************

S-STEP BF1270-O
{
    ATTRIBUTES
    {
        BusinessFunctionType = "Retrieve";
        Type = "Output";
        DelEmptyRows;
        FocusField = "OKButton";
        FocusFrame = "ButtonFrame";
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

    IN MIR-CVG-NUM
    {
        Key;
        DisplayOnly;
        Length = "2";
        DefaultConstant = "01";
        SType = "Text";
        Label = "Coverage Number";
    }

    IN MIR-DI-CLM-ID
    {
        Key;
        DisplayOnly;
        Length = "6";
        DefaultSession = "MIR-DI-CLM-ID";
        SType = "Text";
        Label = "Claim Number";
    }

    IN MIR-POL-ID-BASE
    {
        Key;
        DisplayOnly;
        Length = "9";
        DefaultSession = "MIR-POL-ID-BASE";
        SType = "Text";
        Label = "Policy Id";
    }

    IN MIR-POL-ID-SFX
    {
        Key;
        DisplayOnly;
        Length = "1";
        DefaultSession = "MIR-POL-ID-SFX";
        SType = "Text";
        Label = "Suffix";
    }

    IN MIR-AUTO-PMT-XPRY-DT
    {
        DisplayOnly;
        Length = "10";
        SType = "Date";
        Label = "Automatic Payment Expiry Date";
    }

    IN MIR-BNFT-ADJ-REASN-CD
    {
        DisplayOnly;
        Length = "1";
        CodeSource = "EDIT";
        CodeType = "ADJRE";
        SType = "Text";
        Label = "Benefit Adjustment Reason";
    }

    IN MIR-BNFT-XPRY-DT
    {
        DisplayOnly;
        Length = "10";
        SType = "Date";
        Label = "Benefit Expiry Date";
    }

    IN MIR-CLI-ADDR-TYP-CD
    {
        DisplayOnly;
        Length = "40";
        CodeSource = "EDIT";
        CodeType = "ADTYP";
        SType = "Text";
        Label = "Recipient's Address Type";
    }

    IN MIR-CLI-ID
    {
        DisplayOnly;
        Length = "10";
        SType = "Text";
        Label = "Client Number";
    }

    IN MIR-CLI-SEX-CD
    {
        DisplayOnly;
        Length = "40";
        CodeSource = "DataModel";
        CodeType = "CLI-SEX-CD";
        SType = "Text";
        Label = "Sex";
    }

    IN MIR-CLM-APROV-CD
    {
        DisplayOnly;
        Length = "1";
        CodeSource = "DataModel";
        CodeType = "CLM-APROV-CD";
        SType = "Text";
        Label = "Payment Approval";
    }

    IN MIR-CLM-AUTO-PMT-IND
    {
        DisplayOnly;
        Length = "1";
        SType = "Indicator";
        Label = "Automatic Payment";
    }

    IN MIR-CLM-CLOS-REASN-CD
    {
        DisplayOnly;
        Length = "2";
        CodeSource = "EDIT";
        CodeType = "CLSRE";
        SType = "Text";
        Label = "Claim Closed Reason";
    }

    IN MIR-CLM-CRNT-STAT-CD
    {
        DisplayOnly;
        Length = "1";
        CodeSource = "DataModel";
        CodeType = "CLM-CRNT-STAT-CD";
        SType = "Text";
        Label = "Claim Overall Status";
    }

    IN MIR-CLM-PAYO-MTHD-CD
    {
        DisplayOnly;
        Length = "3";
        CodeSource = "DataModel";
        CodeType = "CLM-PAYO-MTHD-CD";
        SType = "Text";
        Label = "Claim Payment Method";
    }

    IN MIR-CVG-BNFT-STAT-CD
    {
        DisplayOnly;
        Length = "1";
        CodeSource = "DataModel";
        CodeType = "CVG-BNFT-STAT-CD";
        SType = "Text";
        Label = "Benefit Status";
    }

    IN MIR-CVG-COLA-SELCT-CD
    {
        DisplayOnly;
        Length = "1";
        CodeSource = "DataModel";
        CodeType = "CVG-COLA-SELCT-CD";
        SType = "Text";
        Label = "Cost of Living Adjustment Benefit (COLA)";
    }

    IN MIR-CVG-ISS-EFF-DT
    {
        DisplayOnly;
        Length = "10";
        SType = "Date";
        Label = "Issue Date";
    }

    IN MIR-CVG-LTA-SELCT-IND
    {
        DisplayOnly;
        Length = "1";
        SType = "Indicator";
        Label = "Lifetime accident (benefit provided; result of accident)";
    }

    IN MIR-CVG-LTB-SELCT-IND
    {
        DisplayOnly;
        Length = "1";
        SType = "Indicator";
        Label = "Lifetime benefits (result of either accident or sickness)";
    }

    IN MIR-CVG-MAT-XPRY-DT
    {
        DisplayOnly;
        Length = "10";
        SType = "Date";
        Label = "Coverage Maturity / Expiry Date";
    }

    IN MIR-CVG-ORIG-FACE-AMT
    {
        DisplayOnly;
        Signed;
        Length = "15";
        SType = "Currency";
        Label = "Original Face Amount Applied For";
    }

    IN MIR-CVG-STBL-1-CD
    {
        DisplayOnly;
        Length = "2";
        CodeSource = "EDIT";
        CodeType = "STB1";
        SType = "Text";
        Label = "Qualification Period";
    }

    IN MIR-CVG-STBL-2-CD
    {
        DisplayOnly;
        Length = "3";
        CodeSource = "EDIT";
        CodeType = "STB2";
        SType = "Text";
        Label = "Elimination Period";
    }

    IN MIR-CVG-STBL-3-CD
    {
        DisplayOnly;
        Length = "3";
        CodeSource = "EDIT";
        CodeType = "STB3";
        SType = "Text";
        Label = "Benefit Period";
    }

    IN MIR-CVG-STBL-4-CD
    {
        DisplayOnly;
        Length = "2";
        CodeSource = "EDIT";
        CodeType = "STB4";
        SType = "Text";
        Label = "Occupation Class";
    }

    IN MIR-DI-CLM-CLOS-DT
    {
        DisplayOnly;
        Length = "10";
        SType = "Date";
        Label = "Claim Closed Date";
    }

    IN MIR-DI-CLM-RMRK-TXT
    {
        DisplayOnly;
        Length = "50";
        SType = "Text";
        Label = "Comments";
    }

    IN MIR-DISAB-REASN-CD
    {
        DisplayOnly;
        Length = "2";
        CodeSource = "EDIT";
        CodeType = "DISRE";
        SType = "Text";
        Label = "Disability Reason";
    }

    IN MIR-DISAB-RPT-DT
    {
        DisplayOnly;
        Length = "10";
        SType = "Date";
        Label = "Date Claim Reported";
    }

    IN MIR-DV-CLI-DISAB-AGE
    {
        DisplayOnly;
        Length = "3";
        Decimals = "0";
        SType = "Number";
        Label = "Disability Age";
    }

    IN MIR-DV-CLI-INSRD-AGE
    {
        DisplayOnly;
        Length = "3";
        Decimals = "0";
        SType = "Number";
        Label = "Current Age";
    }

    IN MIR-DV-INSRD-CLI-NM
    {
        DisplayOnly;
        Length = "75";
        SType = "Text";
        Label = "Insured Name";
    }

    IN MIR-DV-NXT-CLM-PMT-DT
    {
        DisplayOnly;
        Length = "10";
        SType = "Date";
        Label = "Next Payment Date";
    }

    IN MIR-INSRD-CRNT-OCCP-CD
    {
        DisplayOnly;
        Length = "10";
        CodeSource = "EDIT";
        CodeType = "OCCCD";
        SType = "Text";
        Label = "Current Occupation";
    }

    IN MIR-INSRD-DISAB-DT
    {
        DisplayOnly;
        Length = "10";
        SType = "Date";
        Label = "Date Insured Disabled";
    }

    IN MIR-INSRD-DISAB-TYP-CD
    {
        DisplayOnly;
        Length = "1";
        CodeSource = "DataModel";
        CodeType = "INSRD-DISAB-TYP-CD";
        SType = "Text";
        Label = "Disability Type";
    }

    IN MIR-MAX-BNFT-DUR
    {
        DisplayOnly;
        Length = "2";
        SType = "Text";
        Label = "Maximum Payment Period";
    }

    IN MIR-MAX-BNFT-TYP-CD
    {
        DisplayOnly;
        Length = "1";
        CodeSource = "DataModel";
        CodeType = "MAX-BNFT-TYP-CD";
        SType = "Text";
        Label = "Benefit Period Qualifier";
    }

    IN MIR-MTHLY-BNFT-AMT
    {
        DisplayOnly;
        Length = "15";
        SType = "Currency";
        Label = "Current Monthly Benefit Amount";
    }

    IN MIR-OCCP-ID
    {
        DisplayOnly;
        Length = "10";
        CodeSource = "EDIT";
        CodeType = "OCCCD";
        SType = "Text";
        Label = "Original Occupation";
    }

    IN MIR-OWN-OCCP-DUR
    {
        DisplayOnly;
        Length = "2";
        SType = "Text";
        Label = "Own Occupation Coverage (years)";
    }

    IN MIR-OWN-OCCP-SELCT-IND
    {
        DisplayOnly;
        Length = "1";
        SType = "Indicator";
        Label = "Own occupation benefit";
    }

    IN MIR-PAYO-RECIP-TYP-CD
    {
        DisplayOnly;
        Length = "1";
        CodeSource = "DataModel";
        CodeType = "PAYO-RECIP-TYP-CD";
        SType = "Text";
        Label = "Recipient Type";
    }

    IN MIR-PDISAB-SELCT-IND
    {
        DisplayOnly;
        Length = "1";
        SType = "Indicator";
        Label = "Partial disability benefit";
    }

    IN MIR-PLAN-ID
    {
        DisplayOnly;
        Length = "40";
        CodeSource = "EDIT";
        CodeType = "PLAN";
        SType = "Text";
        Label = "Type of Plan";
    }

    IN MIR-PREV-CLM-PMT-DT
    {
        DisplayOnly;
        Length = "10";
        SType = "Date";
        Label = "Last Payment Date";
    }

    IN MIR-REDC-EP-DUR
    {
        DisplayOnly;
        Length = "3";
        SType = "Text";
        Label = "Reduced Elimination Period/Hospital Confinement (months)";
    }

    IN MIR-REDC-EP-SELCT-IND
    {
        DisplayOnly;
        Length = "1";
        SType = "Indicator";
        Label = "Reduced elimination period for hospitalization Confinement (EP/HOSP)";
    }

    IN MIR-RSDUE-BNFT-FCT
    {
        DisplayOnly;
        Length = "3";
        Decimals = "2";
        SType = "Number";
        Label = "Residual Multiplier";
    }

    IN MIR-RSDUE-BNFT-STRT-DT
    {
        DisplayOnly;
        Length = "10";
        SType = "Date";
        Label = "Date Residual Benefits Commenced";
    }

    IN MIR-UW-USER-ID
    {
        DisplayOnly;
        Length = "8";
        SType = "Text";
        Label = "Underwriter's Initial";
    }

}

