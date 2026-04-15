# Converted from PathFinder 2.2 to 3.0 Jun 18, 2004 3:13:36 PM EDT

#*******************************************************************************
#*  Component:   BF1270-P.p                                                    *
#*  Description:                                                               *
#*                                                                             *
#*******************************************************************************
#*  Chg#    Release  Description                                               *
#*                                                                             *
#*  014590  6.0      New for release 6.0                                       *
#*  017150  612J     Remove Currency Decimals = "2"                            *
#*                                                                             *
#*******************************************************************************

P-STEP BF1270-P
{
    ATTRIBUTES
    {
        BusinessFunctionId = "1270";
        BusinessFunctionName = "Disability Income Claim Record Retrieve";
        BusinessFunctionType = "Retrieve";
        MirName = "CCWM0581";
    }

    OUT LSIR-RETURN-CD;

    OUT MIR-RETRN-CD;

    IN MIR-CVG-NUM
    {
        Key;
        Mandatory;
        Length = "2";
        DBTableName = "TCODI";
        DefaultConstant = "01";
        SType = "Text";
        Label = "Coverage Number";
    }

    IN MIR-DI-CLM-ID
    {
        Key;
        Mandatory;
        Length = "6";
        DBTableName = "TDCD";
        DefaultSession = "MIR-DI-CLM-ID";
        SType = "Text";
        Label = "Claim Number";
    }

    IN MIR-POL-ID-BASE
    {
        Key;
        Mandatory;
        Length = "9";
        DBTableName = "TDCD";
        DefaultSession = "MIR-POL-ID-BASE";
        SType = "Text";
        Label = "Policy Id";
    }

    IN MIR-POL-ID-SFX
    {
        Key;
        Length = "1";
        DBTableName = "TDCD";
        DefaultSession = "MIR-POL-ID-SFX";
        SType = "Text";
        Label = "Suffix";
    }

    OUT MIR-AUTO-PMT-XPRY-DT
    {
        Length = "10";
        DBTableName = "TDCD";
        SType = "Date";
        Label = "Automatic Payment Expiry Date";
    }

    OUT MIR-BNFT-ADJ-REASN-CD
    {
        Length = "1";
        CodeSource = "EDIT";
        CodeType = "ADJRE";
        DBTableName = "TCODI";
        SType = "Text";
        Label = "Benefit Adjustment Reason";
    }

    OUT MIR-BNFT-XPRY-DT
    {
        Length = "10";
        DBTableName = "TCODI";
        SType = "Date";
        Label = "Benefit Expiry Date";
    }

    OUT MIR-CLI-ADDR-TYP-CD
    {
        Length = "40";
        CodeSource = "EDIT";
        CodeType = "ADTYP";
        DBTableName = "TDCD";
        SType = "Text";
        Label = "Recipient's Address Type";
    }

    OUT MIR-CLI-ID
    {
        Length = "10";
        DBTableName = "TDCL";
        SType = "Text";
        Label = "Client Number";
    }

    OUT MIR-CLI-SEX-CD
    {
        Length = "40";
        CodeSource = "DataModel";
        CodeType = "CLI-SEX-CD";
        DBTableName = "TCLI";
        SType = "Text";
        Label = "Sex";
    }

    OUT MIR-CLM-APROV-CD
    {
        Length = "1";
        CodeSource = "DataModel";
        CodeType = "CLM-APROV-CD";
        DBTableName = "TDCD";
        SType = "Text";
        Label = "Payment Approval";
    }

    OUT MIR-CLM-AUTO-PMT-IND
    {
        Length = "1";
        DBTableName = "TDCD";
        SType = "Indicator";
        Label = "Automatic Payment";
    }

    OUT MIR-CLM-CLOS-REASN-CD
    {
        Length = "2";
        CodeSource = "EDIT";
        CodeType = "CLSRE";
        DBTableName = "TDCL";
        SType = "Text";
        Label = "Claim Closed Reason";
    }

    OUT MIR-CLM-CRNT-STAT-CD
    {
        Length = "1";
        CodeSource = "DataModel";
        CodeType = "CLM-CRNT-STAT-CD";
        DBTableName = "TDCL";
        SType = "Text";
        Label = "Claim Overall Status";
    }

    OUT MIR-CLM-PAYO-MTHD-CD
    {
        Length = "3";
        CodeSource = "DataModel";
        CodeType = "CLM-PAYO-MTHD-CD";
        DBTableName = "TDCD";
        SType = "Text";
        Label = "Claim Payment Method";
    }

    OUT MIR-CVG-BNFT-STAT-CD
    {
        Length = "1";
        CodeSource = "DataModel";
        CodeType = "CVG-BNFT-STAT-CD";
        DBTableName = "TCODI";
        SType = "Text";
        Label = "Benefit Status";
    }

    OUT MIR-CVG-COLA-SELCT-CD
    {
        Length = "1";
        CodeSource = "DataModel";
        CodeType = "CVG-COLA-SELCT-CD";
        DBTableName = "TCVG";
        SType = "Text";
        Label = "Cost of Living Adjustment Benefit (COLA)";
    }

    OUT MIR-CVG-ISS-EFF-DT
    {
        Length = "10";
        DBTableName = "TCVG";
        SType = "Date";
        Label = "Issue Date";
    }

    OUT MIR-CVG-LTA-SELCT-IND
    {
        Length = "1";
        DBTableName = "TCVG";
        SType = "Indicator";
        Label = "Lifetime accident (benefit provided; result of accident)";
    }

    OUT MIR-CVG-LTB-SELCT-IND
    {
        Length = "1";
        DBTableName = "TCVG";
        SType = "Indicator";
        Label = "Lifetime benefits (result of either accident or sickness)";
    }

    OUT MIR-CVG-MAT-XPRY-DT
    {
        Length = "10";
        DBTableName = "TCVG";
        SType = "Date";
        Label = "Coverage Maturity / Expiry Date";
    }

    OUT MIR-CVG-ORIG-FACE-AMT
    {
        Signed;
        Length = "15";
        DBTableName = "TCVG";
        SType = "Currency";
        Label = "Original Face Amount Applied For";
    }

    OUT MIR-CVG-STBL-1-CD
    {
        Length = "2";
        CodeSource = "EDIT";
        CodeType = "STB1";
        DBTableName = "TCVG";
        SType = "Text";
        Label = "Qualification Period";
    }

    OUT MIR-CVG-STBL-2-CD
    {
        Length = "3";
        CodeSource = "EDIT";
        CodeType = "STB2";
        DBTableName = "TCVG";
        SType = "Text";
        Label = "Elimination Period";
    }

    OUT MIR-CVG-STBL-3-CD
    {
        Length = "3";
        CodeSource = "EDIT";
        CodeType = "STB3";
        DBTableName = "TCVG";
        SType = "Text";
        Label = "Benefit Period";
    }

    OUT MIR-CVG-STBL-4-CD
    {
        Length = "2";
        CodeSource = "EDIT";
        CodeType = "STB4";
        DBTableName = "TCVG";
        SType = "Text";
        Label = "Occupation Class";
    }

    OUT MIR-DI-CLM-CLOS-DT
    {
        Length = "10";
        DBTableName = "TDCL";
        SType = "Date";
        Label = "Claim Closed Date";
    }

    OUT MIR-DI-CLM-RMRK-TXT
    {
        Length = "50";
        DBTableName = "TDCL";
        SType = "Text";
        Label = "Comments";
    }

    OUT MIR-DISAB-REASN-CD
    {
        Length = "2";
        CodeSource = "EDIT";
        CodeType = "DISRE";
        DBTableName = "TDCL";
        SType = "Text";
        Label = "Disability Reason";
    }

    OUT MIR-DISAB-RPT-DT
    {
        Length = "10";
        DBTableName = "TDCL";
        SType = "Date";
        Label = "Date Claim Reported";
    }

    OUT MIR-DV-CLI-DISAB-AGE
    {
        Length = "3";
        Decimals = "0";
        DBTableName = "Derived";
        SType = "Number";
        Label = "Disability Age";
    }

    OUT MIR-DV-CLI-INSRD-AGE
    {
        Length = "3";
        Decimals = "0";
        DBTableName = "Derived";
        SType = "Number";
        Label = "Current Age";
    }

    OUT MIR-DV-INSRD-CLI-NM
    {
        Length = "75";
        DBTableName = "Derived";
        SType = "Text";
        Label = "Insured Name";
    }

    OUT MIR-DV-NXT-CLM-PMT-DT
    {
        Length = "10";
        DBTableName = "Derived";
        SType = "Date";
        Label = "Next Payment Date";
    }

    OUT MIR-INSRD-CRNT-OCCP-CD
    {
        Length = "10";
        CodeSource = "EDIT";
        CodeType = "OCCCD";
        DBTableName = "TDCL";
        SType = "Text";
        Label = "Current Occupation";
    }

    OUT MIR-INSRD-DISAB-DT
    {
        Length = "10";
        DBTableName = "TDCL";
        SType = "Date";
        Label = "Date Insured Disabled";
    }

    OUT MIR-INSRD-DISAB-TYP-CD
    {
        Length = "1";
        CodeSource = "DataModel";
        CodeType = "INSRD-DISAB-TYP-CD";
        DBTableName = "TDCL";
        SType = "Text";
        Label = "Disability Type";
    }

    OUT MIR-MAX-BNFT-DUR
    {
        Length = "2";
        DBTableName = "TCODI";
        SType = "Text";
        Label = "Maximum Payment Period";
    }

    OUT MIR-MAX-BNFT-TYP-CD
    {
        Length = "1";
        CodeSource = "DataModel";
        CodeType = "MAX-BNFT-TYP-CD";
        DBTableName = "TCODI";
        SType = "Text";
        Label = "Benefit Period Qualifier";
    }

    OUT MIR-MTHLY-BNFT-AMT
    {
        Length = "15";
        DBTableName = "TCODI";
        SType = "Currency";
        Label = "Current Monthly Benefit Amount";
    }

    OUT MIR-OCCP-ID
    {
        Length = "10";
        CodeSource = "EDIT";
        CodeType = "OCCCD";
        DBTableName = "TCLI";
        SType = "Text";
        Label = "Original Occupation";
    }

    OUT MIR-OWN-OCCP-DUR
    {
        Length = "2";
        DBTableName = "TCODI";
        SType = "Text";
        Label = "Own Occupation Coverage (years)";
    }

    OUT MIR-OWN-OCCP-SELCT-IND
    {
        Length = "1";
        DBTableName = "TCVG";
        SType = "Indicator";
        Label = "Own occupation benefit";
    }

    OUT MIR-PAYO-RECIP-TYP-CD
    {
        Length = "1";
        CodeSource = "DataModel";
        CodeType = "PAYO-RECIP-TYP-CD";
        DBTableName = "TDCD";
        SType = "Text";
        Label = "Recipient Type";
    }

    OUT MIR-PDISAB-SELCT-IND
    {
        Length = "1";
        DBTableName = "TCVG";
        SType = "Indicator";
        Label = "Partial disability benefit";
    }

    OUT MIR-PLAN-ID
    {
        Length = "40";
        CodeSource = "EDIT";
        CodeType = "PLAN";
        DBTableName = "TCVG";
        SType = "Text";
        Label = "Type of Plan";
    }

    OUT MIR-PREV-CLM-PMT-DT
    {
        Length = "10";
        DBTableName = "TDCD";
        SType = "Date";
        Label = "Last Payment Date";
    }

    OUT MIR-REDC-EP-DUR
    {
        Length = "3";
        DBTableName = "TCODI";
        SType = "Text";
        Label = "Reduced Elimination Period/Hospital Confinement (months)";
    }

    OUT MIR-REDC-EP-SELCT-IND
    {
        Length = "1";
        DBTableName = "TCVG";
        SType = "Indicator";
        Label = "Reduced elimination period for hospitalization Confinement (EP/HOSP)";
    }

    OUT MIR-RSDUE-BNFT-FCT
    {
        Length = "3";
        Decimals = "2";
        DBTableName = "TCODI";
        SType = "Number";
        Label = "Residual Multiplier";
    }

    OUT MIR-RSDUE-BNFT-STRT-DT
    {
        Length = "10";
        DBTableName = "TCODI";
        SType = "Date";
        Label = "Date Residual Benefits Commenced";
    }

    OUT MIR-UW-USER-ID
    {
        Length = "8";
        DBTableName = "TCVG";
        SType = "Text";
        Label = "Underwriter's Initial";
    }

}

