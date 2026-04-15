# Converted from PathFinder 2.2 to 3.0 Jun 18, 2004 3:12:38 PM EDT

#*******************************************************************************
#*  Component:   BF1332-I.s                                                    *
#*  Description:                                                               *
#*                                                                             *
#*******************************************************************************
#*  Chg#    Release  Description                                               *
#*                                                                             *
#*  014590  6.0      New for release 6.0                                       *
#*  016736  611J     Code cleanup					       *	
#*  017150  612J     Remove Currency Decimals = "2"                            *
#*                                                                             *
#*******************************************************************************

S-STEP BF1332-I
{
    ATTRIBUTES
    {
        Type = "Input";
        FocusField = "MIR-ASSUM-CO-REF-ID";
        FocusFrame = "ContentFrame";
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

    INOUT MIR-ASSUM-CO-ID
    {
        Mandatory;
        Length = "2";
        CodeSource = "EDIT";
        CodeType = "REIN";
        SType = "Selection";
        Label = "Reinsurance Company";
    }

    INOUT MIR-ASSUM-CO-REF-ID
    {
        Length = "10";
        SType = "Text";
        Label = "Cession Number";
    }

    INOUT MIR-BCK-BILL-ALLOW-AMT
    {
        Signed;
        Length = "13";
        SType = "Currency";
        Label = "Billing Adjustment Allowance";
    }

    INOUT MIR-BCK-BILL-PREM-AMT
    {
        Signed;
        Length = "13";
        SType = "Currency";
        Label = "Billing Adjustment Amount";
    }

    INOUT MIR-BCK-BILL-REASN-CD
    {
        Length = "1";
        CodeSource = "DataModel";
        CodeType = "BCK-BILL-REASN-CD";
        SType = "Selection";
        Label = "Billing Adjustment Flag";
    }

    INOUT MIR-CSN-AD-ALLOW-ID
    {
        Length = "3";
        SType = "Text";
        Label = "AD Treaty";
    }

    INOUT MIR-CSN-AD-FACE-AMT
    {
        Signed;
        Length = "15";
        SType = "Currency";
        Label = "Accidental Death (AD) Face Amount";
    }

    INOUT MIR-CSN-AD-PREM-AMT
    {
        Length = "13";
        SType = "Currency";
        Label = "AD Premium";
    }

    INOUT MIR-CSN-BASIC-PREM-AMT
    {
        Length = "13";
        SType = "Currency";
        Label = "Reinsurer Annual Premium";
    }

    INOUT MIR-CSN-CHNG-EFF-DT
    {
        Length = "10";
        SType = "Date";
        Label = "Change Date";
    }

    INOUT MIR-CSN-COLA-ALLOW-ID
    {
        Length = "3";
        SType = "Text";
        Label = "COLA Treaty";
    }

    INOUT MIR-CSN-COLA-PREM-AMT
    {
        Length = "11";
        SType = "Currency";
        Label = "Cost of Living Adjustments (COLA) Premium";
    }

    INOUT MIR-CSN-CRNT-RSK-AMT
    {
        Length = "15";
        SType = "Currency";
        Label = "Cession Amount";
    }

    INOUT MIR-CSN-EFF-DT
    {
        Length = "10";
        SType = "Date";
        Label = "Reinsurance Effective Date";
    }

    INOUT MIR-CSN-FE-ALLOW-ID
    {
        Length = "3";
        SType = "Text";
        Label = "Flat Extra Treaty";
    }

    INOUT MIR-CSN-FE-FCT
    {
        Length = "5";
        Decimals = "2";
        SType = "Number";
        Label = "Flat Extra Duration";
    }

    INOUT MIR-CSN-FE-PREM-AMT
    {
        Length = "13";
        SType = "Currency";
        Label = "Flat Extra Premium";
    }

    INOUT MIR-CSN-LIFE-ALLOW-ID
    {
        Length = "3";
        SType = "Text";
        Label = "Original Cession Amount Treaty";
    }

    INOUT MIR-CSN-LTA-ALLOW-ID
    {
        Length = "3";
        SType = "Text";
        Label = "LTA Treaty";
    }

    INOUT MIR-CSN-LTA-PREM-AMT
    {
        Length = "11";
        SType = "Currency";
        Label = "Lifetime Accident (LTA) Premium";
    }

    INOUT MIR-CSN-LTB-ALLOW-ID
    {
        Length = "3";
        SType = "Text";
        Label = "LTB Treaty";
    }

    INOUT MIR-CSN-LTB-PREM-AMT
    {
        Length = "11";
        SType = "Currency";
        Label = "Lifetime Benefits (LTB) Premium";
    }

    INOUT MIR-CSN-MAT-XPRY-DT
    {
        Length = "10";
        SType = "Date";
        Label = "Maturity / Expiry Date";
    }

    INOUT MIR-CSN-ME-ALLOW-ID
    {
        Length = "3";
        SType = "Text";
        Label = "Multiple Rating Factor Treaty";
    }

    INOUT MIR-CSN-ME-FCT
    {
        Length = "5";
        Decimals = "2";
        SType = "Number";
        Label = "Multiple Rating Factor Duration";
    }

    INOUT MIR-CSN-ME-PREM-AMT
    {
        Length = "13";
        SType = "Currency";
        Label = "Multiple Rating Factor Premium";
    }

    INOUT MIR-CSN-NOTI-CD
    {
        Length = "2";
        SType = "Text";
        Label = "Notify Reason";
    }

    INOUT MIR-CSN-NOTI-DT
    {
        Length = "10";
        SType = "Date";
        Label = "Date Notify Message Produced";
    }

    INOUT MIR-CSN-NPREM-YTD-AMT
    {
        Length = "15";
        SType = "Currency";
        Label = "Gross Premium Paid Year to Date";
    }

    INOUT MIR-CSN-ORIG-RSK-AMT
    {
        Length = "15";
        SType = "Currency";
        Label = "Original Cession Amount";
    }

    INOUT MIR-CSN-PAR-CD
    {
        Length = "1";
        CodeSource = "DataModel";
        CodeType = "CSN-PAR-CD";
        SType = "Selection";
        Label = "Dividend Option";
    }

    INOUT MIR-CSN-PD-TO-DT
    {
        Length = "10";
        SType = "Date";
        Label = "Reinsurance Paid to Date";
    }

    INOUT MIR-CSN-PFEE-AMT
    {
        Signed;
        Length = "13";
        SType = "Currency";
        Label = "Policy Fee";
    }

    INOUT MIR-CSN-PLAN-ID
    {
        Length = "6";
        CodeSource = "EDIT";
        CodeType = "PLAN";
        SType = "Selection";
        Label = "Plan";
    }

    INOUT MIR-CSN-PREM-OFFST-DUR
    {
        Length = "3";
        SType = "Text";
        Label = "Premium Duration Offset";
    }

    INOUT MIR-CSN-PREV-STAT-CD
    {
        Length = "1";
        CodeSource = "DataModel";
        CodeType = "CSN-STAT-CD";
        SType = "Selection";
        Label = "Previous Status";
    }

    INOUT MIR-CSN-RESTR-PREM-IND
    {
        Length = "1";
        SType = "Indicator";
        Label = "Restrict automatic calculation of reinsurance premiums";
    }

    INOUT MIR-CSN-RETEN-AMT
    {
        Length = "15";
        SType = "Currency";
        Label = "Retention Amount";
    }

    INOUT MIR-CSN-RSK-CALC-CD
    {
        Mandatory;
        Length = "1";
        CodeSource = "DataModel";
        CodeType = "CSN-RSK-CALC-CD";
        SType = "Selection";
        Label = "Risk Indicator";
    }

    INOUT MIR-CSN-RSK-DECR-AMT
    {
        Length = "11";
        Decimals = "0";
        SType = "Currency";
        Label = "Risk Amount Decrement";
    }

    INOUT MIR-CSN-RT-AGE
    {
        Length = "3";
        Decimals = "0";
        SType = "Number";
        Label = "Age";
    }

    INOUT MIR-CSN-SEX-CD
    {
        Length = "1";
        CodeSource = "DataModel";
        CodeType = "CSN-SEX-CD";
        SType = "Selection";
        Label = "Sex";
    }

    INOUT MIR-CSN-SMKR-CD
    {
        Length = "1";
        CodeSource = "DataModel";
        CodeType = "CSN-SMKR-CD";
        SType = "Selection";
        Label = "Smoker Status";
    }

    INOUT MIR-CSN-STAT-CD
    {
        Length = "1";
        CodeSource = "DataModel";
        CodeType = "CSN-STAT-CD";
        SType = "Selection";
        Label = "Status";
    }

    INOUT MIR-CSN-TRTY-TYP-CD
    {
        Length = "1";
        CodeSource = "DataModel";
        CodeType = "CSN-TRTY-TYP-CD";
        SType = "Selection";
        Label = "Reinsurance Treaty Type";
    }

    INOUT MIR-CSN-REINS-TYP-CD
    {
        Length = "1";
        CodeSource = "DataModel";
        CodeType = "CSN-REINS-TYP-CD";
        SType = "Selection";
        Label = "Reinsurance Type";
    }

    INOUT MIR-CSN-WP-ALLOW-ID
    {
        Length = "3";
        SType = "Text";
        Label = "WP Treaty";
    }

    INOUT MIR-CSN-WP-FACE-AMT
    {
        Length = "15";
        SType = "Currency";
        Label = "Waiver of Premium (WP) Face Amount";
    }

    INOUT MIR-CSN-WP-PREM-AMT
    {
        Length = "13";
        SType = "Currency";
        Label = "WP Premium";
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

    INOUT MIR-DV-TOT-VAR-PREM-AMT
    {
        Signed;
        Length = "13";
        SType = "Currency";
        Label = "Billing Adjustment Amount";
    }

    INOUT MIR-OWN-OCCP-ALLOW-ID
    {
        Length = "3";
        SType = "Text";
        Label = "OCC Treaty";
    }

    INOUT MIR-OWN-OCCP-PREM-AMT
    {
        Length = "11";
        SType = "Currency";
        Label = "Own Occupation Definition of Disability (OCC) Premium";
    }

    INOUT MIR-PDISAB-ALLOW-ID
    {
        Length = "3";
        SType = "Text";
        Label = "PDIS Treaty";
    }

    INOUT MIR-PDISAB-PREM-AMT
    {
        Length = "11";
        SType = "Currency";
        Label = "Partial Disability (PDIS) Premium";
    }

    INOUT MIR-REDC-EP-ALLOW-ID
    {
        Length = "3";
        SType = "Text";
        Label = "HOSP Treaty";
    }

    INOUT MIR-REDC-EP-PREM-AMT
    {
        Length = "11";
        SType = "Currency";
        Label = "Reduced Elimination Period in Event of Hospitalization (HOSP) Premium";
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

    IN MIR-INSRD-CLI-ID
    {
        DisplayOnly;
        Length = "10";
        SType = "Text";
        Label = "Client Number of Lives Insured";
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

    IN MIR-DV-OWN-CLI-NM
    {
        DisplayOnly;
        Length = "75";
        SType = "Text";
        Label = "Insured Name";
    }

}

