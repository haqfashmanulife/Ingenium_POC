# Converted from PathFinder 2.2 to 3.0 Jun 18, 2004 3:12:38 PM EDT

#*******************************************************************************
#*  Component:   BF1330-O.s                                                    *
#*  Description:                                                               *
#*                                                                             *
#*******************************************************************************
#*  Chg#    Release  Description                                               *
#*                                                                             *
#*  014590  6.0      New for release 6.0                                       *
#*  016736  611J     Code cleanup                                              *
#*  017150  612J     Remove Currency Decimals = "2"                            *
#*                                                                             *
#*******************************************************************************

S-STEP BF1330-O
{
    ATTRIBUTES
    {
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

    IN MIR-CSN-REC-NUM
    {
        Key;
        DisplayOnly;
        Length = "2";
        DefaultConstant = "01";
        SType = "Text";
        Label = "Reinsurance Cession Record";
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

    IN MIR-ASSUM-CO-ID
    {
        DisplayOnly;
        Length = "2";
        CodeSource = "EDIT";
        CodeType = "REIN";
        SType = "Text";
        Label = "Reinsurance Company";
    }

    IN MIR-ASSUM-CO-REF-ID
    {
        DisplayOnly;
        Length = "10";
        SType = "Text";
        Label = "Cession Number";
    }

    IN MIR-BCK-BILL-ALLOW-AMT
    {
        DisplayOnly;
        Signed;
        Length = "13";
        SType = "Currency";
        Label = "Billing Adjustment Allowance";
    }

    IN MIR-BCK-BILL-PREM-AMT
    {
        DisplayOnly;
        Signed;
        Length = "13";
        SType = "Currency";
        Label = "Billing Adjustment Amount";
    }

    IN MIR-BCK-BILL-REASN-CD
    {
        DisplayOnly;
        Length = "1";
        CodeSource = "DataModel";
        CodeType = "BCK-BILL-REASN-CD";
        SType = "Text";
        Label = "Billing Adjustment Flag";
    }

    IN MIR-CSN-AD-ALLOW-ID
    {
        DisplayOnly;
        Length = "3";
        SType = "Text";
        Label = "AD Treaty";
    }

    IN MIR-CSN-AD-FACE-AMT
    {
        DisplayOnly;
        Signed;
        Length = "15";
        SType = "Currency";
        Label = "Accidental Death (AD) Face Amount";
    }

    IN MIR-CSN-AD-PREM-AMT
    {
        DisplayOnly;
        Length = "13";
        SType = "Currency";
        Label = "AD Premium";
    }

    IN MIR-CSN-BASIC-PREM-AMT
    {
        DisplayOnly;
        Length = "13";
        SType = "Currency";
        Label = "Reinsurer Annual Premium";
    }

    IN MIR-CSN-CHNG-EFF-DT
    {
        DisplayOnly;
        Length = "10";
        SType = "Date";
        Label = "Change Date";
    }

    IN MIR-CSN-COLA-ALLOW-ID
    {
        DisplayOnly;
        Length = "3";
        SType = "Text";
        Label = "COLA Treaty";
    }

    IN MIR-CSN-COLA-PREM-AMT
    {
        DisplayOnly;
        Length = "11";
        SType = "Currency";
        Label = "Cost of Living Adjustments (COLA) Premium";
    }

    IN MIR-CSN-CRNT-RSK-AMT
    {
        DisplayOnly;
        Length = "15";
        SType = "Currency";
        Label = "Cession Amount";
    }

    IN MIR-CSN-EFF-DT
    {
        DisplayOnly;
        Length = "10";
        SType = "Date";
        Label = "Reinsurance Effective Date";
    }

    IN MIR-CSN-FE-ALLOW-ID
    {
        DisplayOnly;
        Length = "3";
        SType = "Text";
        Label = "Flat Extra Treaty";
    }

    IN MIR-CSN-FE-FCT
    {
        DisplayOnly;
        Length = "5";
        Decimals = "2";
        SType = "Number";
        Label = "Flat Extra Duration";
    }

    IN MIR-CSN-FE-PREM-AMT
    {
        DisplayOnly;
        Length = "13";
        SType = "Currency";
        Label = "Flat Extra Premium";
    }

    IN MIR-CSN-LIFE-ALLOW-ID
    {
        DisplayOnly;
        Length = "3";
        SType = "Text";
        Label = "Original Cession Amount Treaty";
    }

    IN MIR-CSN-LTA-ALLOW-ID
    {
        DisplayOnly;
        Length = "3";
        SType = "Text";
        Label = "LTA Treaty";
    }

    IN MIR-CSN-LTA-PREM-AMT
    {
        DisplayOnly;
        Length = "11";
        SType = "Currency";
        Label = "Lifetime Accident (LTA) Premium";
    }

    IN MIR-CSN-LTB-ALLOW-ID
    {
        DisplayOnly;
        Length = "3";
        SType = "Text";
        Label = "LTB Treaty";
    }

    IN MIR-CSN-LTB-PREM-AMT
    {
        DisplayOnly;
        Length = "11";
        SType = "Currency";
        Label = "Lifetime Benefits (LTB) Premium";
    }

    IN MIR-CSN-MAT-XPRY-DT
    {
        DisplayOnly;
        Length = "10";
        SType = "Date";
        Label = "Maturity / Expiry Date";
    }

    IN MIR-CSN-ME-ALLOW-ID
    {
        DisplayOnly;
        Length = "3";
        SType = "Text";
        Label = "Multiple Rating Factor Treaty";
    }

    IN MIR-CSN-ME-FCT
    {
        DisplayOnly;
        Length = "5";
        Decimals = "2";
        SType = "Number";
        Label = "Multiple Rating Factor Duration";
    }

    IN MIR-CSN-ME-PREM-AMT
    {
        DisplayOnly;
        Length = "13";
        SType = "Currency";
        Label = "Multiple Rating Factor Premium";
    }

    IN MIR-CSN-NOTI-CD
    {
        DisplayOnly;
        Length = "2";
        SType = "Text";
        Label = "Notify Reason";
    }

    IN MIR-CSN-NOTI-DT
    {
        DisplayOnly;
        Length = "10";
        SType = "Date";
        Label = "Date Notify Message Produced";
    }

    IN MIR-CSN-NPREM-YTD-AMT
    {
        DisplayOnly;
        Length = "15";
        SType = "Currency";
        Label = "Gross Premium Paid Year to Date";
    }

    IN MIR-CSN-ORIG-RSK-AMT
    {
        DisplayOnly;
        Length = "15";
        SType = "Currency";
        Label = "Original Cession Amount";
    }

    IN MIR-CSN-PAR-CD
    {
        DisplayOnly;
        Length = "1";
        CodeSource = "DataModel";
        CodeType = "CSN-PAR-CD";
        SType = "Text";
        Label = "Dividend Option";
    }

    IN MIR-CSN-PD-TO-DT
    {
        DisplayOnly;
        Length = "10";
        SType = "Date";
        Label = "Reinsurance Paid to Date";
    }

    IN MIR-CSN-PFEE-AMT
    {
        DisplayOnly;
        Signed;
        Length = "13";
        SType = "Currency";
        Label = "Policy Fee";
    }

    IN MIR-CSN-PLAN-ID
    {
        DisplayOnly;
        Length = "6";
        CodeSource = "EDIT";
        CodeType = "PLAN";
        SType = "Text";
        Label = "Plan";
    }

    IN MIR-CSN-PREM-OFFST-DUR
    {
        DisplayOnly;
        Length = "3";
        SType = "Text";
        Label = "Premium Duration Offset";
    }

    IN MIR-CSN-PREV-STAT-CD
    {
        DisplayOnly;
        Length = "1";
        CodeSource = "DataModel";
        CodeType = "CSN-STAT-CD";
        SType = "Text";
        Label = "Previous Status";
    }

    IN MIR-CSN-REINS-TYP-CD
    {
        DisplayOnly;
        Length = "1";
        CodeSource = "DataModel";
        CodeType = "CSN-REINS-TYP-CD";
        SType = "Text";
        Label = "Reinsurance Type";
    }

    IN MIR-CSN-RESTR-PREM-IND
    {
        DisplayOnly;
        Length = "1";
        SType = "Indicator";
        Label = "Restrict automatic calculation of reinsurance premiums";
    }

    IN MIR-CSN-RETEN-AMT
    {
        DisplayOnly;
        Length = "15";
        SType = "Currency";
        Label = "Retention Amount";
    }

    IN MIR-CSN-RSK-CALC-CD
    {
        DisplayOnly;
        Length = "1";
        CodeSource = "DataModel";
        CodeType = "CSN-RSK-CALC-CD";
        SType = "Text";
        Label = "Risk Indicator";
    }

    IN MIR-CSN-RSK-DECR-AMT
    {
        DisplayOnly;
        Length = "11";
        Decimals = "0";
        SType = "Currency";
        Label = "Risk Amount Decrement";
    }

    IN MIR-CSN-RT-AGE
    {
        DisplayOnly;
        Length = "3";
        Decimals = "0";
        SType = "Number";
        Label = "Age";
    }

    IN MIR-CSN-SEX-CD
    {
        DisplayOnly;
        Length = "1";
        CodeSource = "DataModel";
        CodeType = "CSN-SEX-CD";
        SType = "Text";
        Label = "Sex";
    }

    IN MIR-CSN-SMKR-CD
    {
        DisplayOnly;
        Length = "1";
        CodeSource = "DataModel";
        CodeType = "CSN-SMKR-CD";
        SType = "Text";
        Label = "Smoker Status";
    }

    IN MIR-CSN-STAT-CD
    {
        DisplayOnly;
        Length = "1";
        CodeSource = "DataModel";
        CodeType = "CSN-STAT-CD";
        SType = "Text";
        Label = "Status";
    }

    IN MIR-CSN-TOT-ALLOW-AMT
    {
        DisplayOnly;
        Signed;
        Length = "13";
        SType = "Currency";
        Label = "Total Reinsurance Allowances";
    }

    IN MIR-CSN-TOT-NPREM-AMT
    {
        DisplayOnly;
        Signed;
        Length = "13";
        SType = "Currency";
        Label = "Net Reinsurance Premium";
    }

    IN MIR-CSN-TRTY-TYP-CD
    {
        DisplayOnly;
        Length = "1";
        CodeSource = "DataModel";
        CodeType = "CSN-TRTY-TYP-CD";
        SType = "Text";
        Label = "Reinsurance Treaty Type";
    }

    IN MIR-CSN-WP-ALLOW-ID
    {
        DisplayOnly;
        Length = "3";
        SType = "Text";
        Label = "WP Treaty";
    }

    IN MIR-CSN-WP-FACE-AMT
    {
        DisplayOnly;
        Length = "15";
        SType = "Currency";
        Label = "Waiver of Premium (WP) Face Amount";
    }

    IN MIR-CSN-WP-PREM-AMT
    {
        DisplayOnly;
        Length = "13";
        SType = "Currency";
        Label = "WP Premium";
    }

    IN MIR-CVG-BASIC-PREM-AMT
    {
        DisplayOnly;
        Signed;
        Length = "13";
        SType = "Currency";
        Label = "Annual Premium";
    }

    IN MIR-CVG-CSN-REC-CTR
    {
        Key;
        DisplayOnly;
        Length = "2";
        SType = "Text";
        Label = "Number of Reinsurance on Coverage";
    }

    IN MIR-CVG-CSTAT-CD
    {
        DisplayOnly;
        Length = "40";
        CodeSource = "DataModel";
        CodeType = "CVG-CSTAT-CD";
        SType = "Text";
        Label = "Coverage Status";
    }

    IN MIR-CVG-FACE-AMT
    {
        DisplayOnly;
        Signed;
        Length = "15";
        SType = "Currency";
        Label = "Face Amount";
    }

    IN MIR-CVG-FE-DUR
    {
        DisplayOnly;
        Length = "3";
        SType = "Text";
        Label = "Flat Extra Premium - Duration";
    }

    IN MIR-CVG-FE-PREM-AMT
    {
        DisplayOnly;
        Signed;
        Length = "13";
        SType = "Currency";
        Label = "Flat Extra Premium";
    }

    IN MIR-CVG-ME-PREM-AMT
    {
        DisplayOnly;
        Signed;
        Length = "13";
        SType = "Currency";
        Label = "Multiple Extra Premium";
    }

    IN MIR-CVG-FE-REASN-CD
    {
        DisplayOnly;
        Length = "1";
        CodeSource = "EDIT";
        CodeType = "RFLAT";
        SType = "Text";
        Label = "Flat Extra Premium - Reason";
    }

    IN MIR-CVG-ME-DUR
    {
        DisplayOnly;
        Length = "3";
        SType = "Text";
        Label = "Multiple Rating Duration";
    }

    IN MIR-CVG-ME-FCT
    {
        DisplayOnly;
        Signed;
        Length = "3";
        Decimals = "2";
        SType = "Number";
        Label = "Rating";
    }

    IN MIR-CVG-ME-REASN-CD
    {
        DisplayOnly;
        Length = "1";
        CodeSource = "EDIT";
        CodeType = "RMULT";
        SType = "Text";
        Label = "Multiple Rating Reason";
    }

    IN MIR-CVG-PAR-CD
    {
        DisplayOnly;
        Length = "40";
        CodeSource = "DataModel";
        CodeType = "CVG-PAR-CD";
        SType = "Text";
        Label = "Dividend Option";
    }

    IN MIR-CVG-RT-AGE
    {
        DisplayOnly;
        Length = "3";
        Decimals = "0";
        SType = "Number";
        Label = "Rate Age";
    }

    IN MIR-CVG-SEX-CD
    {
        DisplayOnly;
        Length = "40";
        CodeSource = "DataModel";
        CodeType = "CVG-SEX-CD";
        SType = "Text";
        Label = "Sex";
    }

    IN MIR-CVG-SMKR-CD
    {
        DisplayOnly;
        Length = "40";
        CodeSource = "EDIT";
        CodeType = "SMOKE";
        SType = "Text";
        Label = "Smoker";
    }

    IN MIR-CVG-STBL-1-CD
    {
        DisplayOnly;
        Length = "2";
        CodeSource = "EDIT";
        CodeType = "STB1";
        SType = "Text";
        Label = "Sub-table 1";
    }

    IN MIR-CVG-STBL-2-CD
    {
        DisplayOnly;
        Length = "3";
        CodeSource = "EDIT";
        CodeType = "STB2";
        SType = "Text";
        Label = "Sub-table 2";
    }

    IN MIR-CVG-STBL-3-CD
    {
        DisplayOnly;
        Length = "40";
        CodeSource = "EDIT";
        CodeType = "STB3";
        SType = "Text";
        Label = "Sub-table 3";
    }

    IN MIR-CVG-STBL-4-CD
    {
        DisplayOnly;
        Length = "2";
        CodeSource = "EDIT";
        CodeType = "STB4";
        SType = "Text";
        Label = "Sub-table 4";
    }

    IN MIR-DV-COLA-ALLOW-AMT
    {
        DisplayOnly;
        Length = "15";
        SType = "Currency";
        Label = "Reinsurance Allowance - Basic";
    }

    IN MIR-DV-LIFE-ALLOW-AMT
    {
        DisplayOnly;
        Length = "15";
        SType = "Currency";
        Label = "Reinsurance Allowance - Basic";
    }

    IN MIR-DV-LTA-ALLOW-AMT
    {
        DisplayOnly;
        Length = "15";
        SType = "Currency";
        Label = "Reinsurance Allowance - Basic";
    }

    IN MIR-DV-LTB-ALLOW-AMT
    {
        DisplayOnly;
        Length = "15";
        SType = "Currency";
        Label = "Reinsurance Allowance - Basic";
    }

    IN MIR-DV-ME-ALLOW-AMT
    {
        DisplayOnly;
        Length = "15";
        SType = "Currency";
        Label = "Reinsurance Allowance - Basic";
    }

    IN MIR-DV-OWN-CLI-NM
    {
        DisplayOnly;
        Length = "75";
        SType = "Text";
        Label = "Owner Name";
    }

    IN MIR-DV-OWN-OCCP-ALLOW-AMT
    {
        DisplayOnly;
        Length = "15";
        SType = "Currency";
        Label = "Reinsurance Allowance - Basic";
    }

    IN MIR-DV-PDISAB-ALLOW-AMT
    {
        DisplayOnly;
        Length = "15";
        SType = "Currency";
        Label = "Reinsurance Allowance - Basic";
    }

    IN MIR-DV-PREM-PD-YR-QTY
    {
        DisplayOnly;
        Length = "2";
        SType = "Text";
        Label = "Years Paid";
    }

    IN MIR-DV-REDC-EP-ALLOW-AMT
    {
        DisplayOnly;
        Length = "15";
        SType = "Currency";
        Label = "Reinsurance Allowance - Basic";
    }

    IN MIR-DV-TOT-VAR-PREM-AMT
    {
        DisplayOnly;
        Signed;
        Length = "13";
        SType = "Currency";
        Label = "Billing Adjustment Amount";
    }

    IN MIR-INSRD-CLI-ID
    {
        DisplayOnly;
        Length = "10";
        SType = "Text";
        Label = "Client Number of Lives Insured";
    }

    IN MIR-OWN-OCCP-ALLOW-ID
    {
        DisplayOnly;
        Length = "3";
        SType = "Text";
        Label = "OCC Treaty";
    }

    IN MIR-OWN-OCCP-PREM-AMT
    {
        DisplayOnly;
        Length = "11";
        SType = "Currency";
        Label = "Own Occupation Definition of Disability (OCC) Premium";
    }

    IN MIR-PDISAB-ALLOW-ID
    {
        DisplayOnly;
        Length = "3";
        SType = "Text";
        Label = "PDIS Treaty";
    }

    IN MIR-PDISAB-PREM-AMT
    {
        DisplayOnly;
        Length = "11";
        SType = "Currency";
        Label = "Partial Disability (PDIS) Premium";
    }

    IN MIR-PLAN-ID
    {
        DisplayOnly;
        Length = "40";
        CodeSource = "EDIT";
        CodeType = "PLAN";
        SType = "Text";
        Label = "Plan";
    }

    IN MIR-REDC-EP-ALLOW-ID
    {
        DisplayOnly;
        Length = "3";
        SType = "Text";
        Label = "HOSP Treaty";
    }

    IN MIR-REDC-EP-PREM-AMT
    {
        DisplayOnly;
        Length = "11";
        SType = "Currency";
        Label = "Reduced Elimination Period in Event of Hospitalization (HOSP) Premium";
    }

}

