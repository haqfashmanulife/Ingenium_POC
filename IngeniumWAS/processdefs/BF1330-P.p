# Converted from PathFinder 2.2 to 3.0 Jun 18, 2004 3:13:37 PM EDT

#*******************************************************************************
#*  Component:   BF1330-P.p                                                    *
#*  Description:                                                               *
#*                                                                             *
#*******************************************************************************
#*  Chg#    Release  Description                                               *
#*                                                                             *
#*  014590  6.0      New for release 6.0                                       *
#*  017150  612J     Remove Currency Decimals = "2"                            *
#*                                                                             *
#*******************************************************************************

P-STEP BF1330-P
{
    ATTRIBUTES
    {
        BusinessFunctionId = "1330";
        BusinessFunctionName = "Reinsurance Cession Record Retrieve";
        BusinessFunctionType = "Retrieve";
        MirName = "CCWM0381";
    }

    OUT LSIR-RETURN-CD;

    OUT MIR-RETRN-CD;

    IN MIR-CSN-REC-NUM
    {
        Key;
        Mandatory;
        Length = "2";
        DBTableName = "TRI";
        DefaultConstant = "01";
        SType = "Text";
        Label = "Reinsurance Cession Record";
    }

    IN MIR-CVG-NUM
    {
        Key;
        Mandatory;
        Length = "2";
        DBTableName = "TRI";
        DefaultConstant = "01";
        SType = "Text";
        Label = "Coverage Number";
    }

    IN MIR-POL-ID-BASE
    {
        Key;
        Mandatory;
        Length = "9";
        DBTableName = "TRI";
        DefaultSession = "MIR-POL-ID-BASE";
        SType = "Text";
        Label = "Policy Id";
    }

    IN MIR-POL-ID-SFX
    {
        Key;
        Length = "1";
        DBTableName = "TRI";
        DefaultSession = "MIR-POL-ID-SFX";
        SType = "Text";
        Label = "Suffix";
    }

    OUT MIR-ASSUM-CO-ID
    {
        Length = "2";
        CodeSource = "EDIT";
        CodeType = "REIN";
        DBTableName = "TRI";
        SType = "Text";
        Label = "Reinsurance Company";
    }

    OUT MIR-ASSUM-CO-REF-ID
    {
        Length = "10";
        DBTableName = "TRI";
        SType = "Text";
        Label = "Cession Number";
    }

    OUT MIR-BCK-BILL-ALLOW-AMT
    {
        Signed;
        Length = "13";
        DBTableName = "TRI";
        SType = "Currency";
        Label = "Billing Adjustment Allowance";
    }

    OUT MIR-BCK-BILL-PREM-AMT
    {
        Signed;
        Length = "13";
        DBTableName = "TRI";
        SType = "Currency";
        Label = "Billing Adjustment Amount";
    }

    OUT MIR-BCK-BILL-REASN-CD
    {
        Length = "1";
        CodeSource = "DataModel";
        CodeType = "BCK-BILL-REASN-CD";
        DBTableName = "TRI";
        SType = "Text";
        Label = "Billing Adjustment Flag";
    }

    OUT MIR-CSN-AD-ALLOW-ID
    {
        Length = "3";
        DBTableName = "TRI";
        SType = "Text";
        Label = "AD Treaty";
    }

    OUT MIR-CSN-AD-FACE-AMT
    {
        Signed;
        Length = "15";
        DBTableName = "TRI";
        SType = "Currency";
        Label = "Accidental Death (AD) Face Amount";
    }

    OUT MIR-CSN-AD-PREM-AMT
    {
        Length = "13";
        DBTableName = "TRI";
        SType = "Currency";
        Label = "AD Premium";
    }

    OUT MIR-CSN-BASIC-PREM-AMT
    {
        Length = "13";
        DBTableName = "TRI";
        SType = "Currency";
        Label = "Reinsurer Annual Premium";
    }

    OUT MIR-CSN-CHNG-EFF-DT
    {
        Length = "10";
        DBTableName = "TRI";
        SType = "Date";
        Label = "Change Date";
    }

    OUT MIR-CSN-COLA-ALLOW-ID
    {
        Length = "3";
        DBTableName = "TRI";
        SType = "Text";
        Label = "COLA Treaty";
    }

    OUT MIR-CSN-COLA-PREM-AMT
    {
        Length = "11";
        DBTableName = "TRI";
        SType = "Currency";
        Label = "Cost of Living Adjustments (COLA) Premium";
    }

    OUT MIR-CSN-CRNT-RSK-AMT
    {
        Length = "15";
        DBTableName = "TRI";
        SType = "Currency";
        Label = "Cession Amount";
    }

    OUT MIR-CSN-EFF-DT
    {
        Length = "10";
        DBTableName = "TRI";
        SType = "Date";
        Label = "Reinsurance Effective Date";
    }

    OUT MIR-CSN-FE-ALLOW-ID
    {
        Length = "3";
        DBTableName = "TRI";
        SType = "Text";
        Label = "Flat Extra Treaty";
    }

    OUT MIR-CSN-FE-FCT
    {
        Length = "5";
        Decimals = "2";
        DBTableName = "TRI";
        SType = "Number";
        Label = "Flat Extra Duration";
    }

    OUT MIR-CSN-FE-PREM-AMT
    {
        Length = "13";
        DBTableName = "TRI";
        SType = "Currency";
        Label = "Flat Extra Premium";
    }

    OUT MIR-CSN-LIFE-ALLOW-ID
    {
        Length = "3";
        DBTableName = "TRI";
        SType = "Text";
        Label = "Original Cession Amount Treaty";
    }

    OUT MIR-CSN-LTA-ALLOW-ID
    {
        Length = "3";
        DBTableName = "TRI";
        SType = "Text";
        Label = "LTA Treaty";
    }

    OUT MIR-CSN-LTA-PREM-AMT
    {
        Length = "11";
        DBTableName = "TRI";
        SType = "Currency";
        Label = "Lifetime Accident (LTA) Premium";
    }

    OUT MIR-CSN-LTB-ALLOW-ID
    {
        Length = "3";
        DBTableName = "TRI";
        SType = "Text";
        Label = "LTB Treaty";
    }

    OUT MIR-CSN-LTB-PREM-AMT
    {
        Length = "11";
        DBTableName = "TRI";
        SType = "Currency";
        Label = "Lifetime Benefits (LTB) Premium";
    }

    OUT MIR-CSN-MAT-XPRY-DT
    {
        Length = "10";
        DBTableName = "TRI";
        SType = "Date";
        Label = "Maturity / Expiry Date";
    }

    OUT MIR-CSN-ME-ALLOW-ID
    {
        Length = "3";
        DBTableName = "TRI";
        SType = "Text";
        Label = "Multiple Rating Factor Treaty";
    }

    OUT MIR-CSN-ME-FCT
    {
        Length = "5";
        Decimals = "2";
        DBTableName = "TRI";
        SType = "Number";
        Label = "Multiple Rating Factor Duration";
    }

    OUT MIR-CSN-ME-PREM-AMT
    {
        Length = "13";
        DBTableName = "TRI";
        SType = "Currency";
        Label = "Multiple Rating Factor Premium";
    }

    OUT MIR-CSN-NOTI-CD
    {
        Length = "2";
        DBTableName = "TRI";
        SType = "Text";
        Label = "Notify Reason";
    }

    OUT MIR-CSN-NOTI-DT
    {
        Length = "10";
        DBTableName = "TRI";
        SType = "Date";
        Label = "Date Notify Message Produced";
    }

    OUT MIR-CSN-NPREM-YTD-AMT
    {
        Length = "15";
        DBTableName = "TRI";
        SType = "Currency";
        Label = "Gross Premium Paid Year to Date";
    }

    OUT MIR-CSN-ORIG-RSK-AMT
    {
        Length = "15";
        DBTableName = "TRI";
        SType = "Currency";
        Label = "Original Cession Amount";
    }

    OUT MIR-CSN-PAR-CD
    {
        Length = "1";
        CodeSource = "DataModel";
        CodeType = "CSN-PAR-CD";
        DBTableName = "TRI";
        SType = "Text";
        Label = "Dividend Option";
    }

    OUT MIR-CSN-PD-TO-DT
    {
        Length = "10";
        DBTableName = "TRI";
        SType = "Date";
        Label = "Reinsurance Paid to Date";
    }

    OUT MIR-CSN-PFEE-AMT
    {
        Signed;
        Length = "13";
        DBTableName = "TRI";
        SType = "Currency";
        Label = "Policy Fee";
    }

    OUT MIR-CSN-PLAN-ID
    {
        Length = "6";
        CodeSource = "EDIT";
        CodeType = "PLAN";
        DBTableName = "TRI";
        SType = "Text";
        Label = "Plan";
    }

    OUT MIR-CSN-PREM-OFFST-DUR
    {
        Length = "3";
        DBTableName = "TRI";
        SType = "Text";
        Label = "Premium Duration Offset";
    }

    OUT MIR-CSN-PREV-STAT-CD
    {
        Length = "1";
        CodeSource = "DataModel";
        CodeType = "CSN-STAT-CD";
        DBTableName = "TRI";
        SType = "Text";
        Label = "Previous Status";
    }

    OUT MIR-CSN-REINS-TYP-CD
    {
        Length = "1";
        CodeSource = "DataModel";
        CodeType = "CSN-REINS-TYP-CD";
        DBTableName = "TRI";
        SType = "Text";
        Label = "Reinsurance Type";
    }

    OUT MIR-CSN-RESTR-PREM-IND
    {
        Length = "1";
        DBTableName = "TRI";
        SType = "Indicator";
        Label = "Restrict automatic calculation of reinsurance premiums";
    }

    OUT MIR-CSN-RETEN-AMT
    {
        Length = "15";
        DBTableName = "TRI";
        SType = "Currency";
        Label = "Retention Amount";
    }

    OUT MIR-CSN-RSK-CALC-CD
    {
        Length = "1";
        CodeSource = "DataModel";
        CodeType = "CSN-RSK-CALC-CD";
        DBTableName = "TRI";
        SType = "Text";
        Label = "Risk Indicator";
    }

    OUT MIR-CSN-RSK-DECR-AMT
    {
        Length = "11";
        Decimals = "0";
        DBTableName = "TRI";
        SType = "Currency";
        Label = "Risk Amount Decrement";
    }

    OUT MIR-CSN-RT-AGE
    {
        Length = "3";
        Decimals = "0";
        DBTableName = "TRI";
        SType = "Number";
        Label = "Age";
    }

    OUT MIR-CSN-SEX-CD
    {
        Length = "1";
        CodeSource = "DataModel";
        CodeType = "CSN-SEX-CD";
        DBTableName = "TRI";
        SType = "Text";
        Label = "Sex";
    }

    OUT MIR-CSN-SMKR-CD
    {
        Length = "1";
        CodeSource = "DataModel";
        CodeType = "CSN-SMKR-CD";
        DBTableName = "TRI";
        SType = "Text";
        Label = "Smoker Status";
    }

    OUT MIR-CSN-STAT-CD
    {
        Length = "1";
        CodeSource = "DataModel";
        CodeType = "CSN-STAT-CD";
        DBTableName = "TRI";
        SType = "Text";
        Label = "Status";
    }

    OUT MIR-CSN-TOT-ALLOW-AMT
    {
        Signed;
        Length = "13";
        DBTableName = "TRI";
        SType = "Currency";
        Label = "Total Reinsurance Allowances";
    }

    OUT MIR-CSN-TOT-NPREM-AMT
    {
        Signed;
        Length = "13";
        DBTableName = "TRI";
        SType = "Currency";
        Label = "Net Reinsurance Premium";
    }

    OUT MIR-CSN-TRTY-TYP-CD
    {
        Length = "1";
        CodeSource = "DataModel";
        CodeType = "CSN-TRTY-TYP-CD";
        DBTableName = "TRI";
        SType = "Text";
        Label = "Reinsurance Treaty Type";
    }

    OUT MIR-CSN-WP-ALLOW-ID
    {
        Length = "3";
        DBTableName = "TRI";
        SType = "Text";
        Label = "WP Treaty";
    }

    OUT MIR-CSN-WP-FACE-AMT
    {
        Length = "15";
        DBTableName = "TRI";
        SType = "Currency";
        Label = "Waiver of Premium (WP) Face Amount";
    }

    OUT MIR-CSN-WP-PREM-AMT
    {
        Length = "13";
        DBTableName = "TRI";
        SType = "Currency";
        Label = "WP Premium";
    }

    OUT MIR-CVG-BASIC-PREM-AMT
    {
        Signed;
        Length = "13";
        DBTableName = "TCVG";
        SType = "Currency";
        Label = "Annual Premium";
    }

    OUT MIR-CVG-CSN-REC-CTR
    {
        Key;
        Length = "2";
        DBTableName = "TCVG";
        SType = "Text";
        Label = "Number of Reinsurance on Coverage";
    }

    OUT MIR-CVG-CSTAT-CD
    {
        Length = "40";
        CodeSource = "DataModel";
        CodeType = "CVG-CSTAT-CD";
        DBTableName = "TCVG";
        SType = "Text";
        Label = "Coverage Status";
    }

    OUT MIR-CVG-FACE-AMT
    {
        Signed;
        Length = "15";
        DBTableName = "TCVG";
        SType = "Currency";
        Label = "Face Amount";
    }

    OUT MIR-CVG-FE-DUR
    {
        Length = "3";
        DBTableName = "TCVG";
        SType = "Text";
        Label = "Flat Extra Premium - Duration";
    }

    OUT MIR-CVG-FE-PREM-AMT
    {
        Signed;
        Length = "13";
        DBTableName = "TCVG";
        SType = "Currency";
        Label = "Flat Extra Premium";
    }

    OUT MIR-CVG-FE-REASN-CD
    {
        Length = "1";
        CodeSource = "EDIT";
        CodeType = "RFLAT";
        DBTableName = "TCVG";
        SType = "Text";
        Label = "Flat Extra Premium - Reason";
    }

    OUT MIR-CVG-ME-DUR
    {
        Length = "3";
        DBTableName = "TCVG";
        SType = "Text";
        Label = "Multiple Rating Duration";
    }

    OUT MIR-CVG-ME-FCT
    {
        Signed;
        Length = "3";
        Decimals = "2";
        DBTableName = "TCVG";
        SType = "Number";
        Label = "Rating";
    }

    OUT MIR-CVG-ME-REASN-CD
    {
        Length = "1";
        CodeSource = "EDIT";
        CodeType = "RMULT";
        DBTableName = "TCVG";
        SType = "Text";
        Label = "Multiple Rating Reason";
    }

    OUT MIR-CVG-PAR-CD
    {
        Length = "40";
        CodeSource = "DataModel";
        CodeType = "CVG-PAR-CD";
        DBTableName = "TCVG";
        SType = "Text";
        Label = "Dividend Option";
    }

    OUT MIR-CVG-RT-AGE
    {
        Length = "3";
        Decimals = "0";
        DBTableName = "TCVG";
        SType = "Number";
        Label = "Rate Age";
    }

    OUT MIR-CVG-SEX-CD
    {
        Length = "40";
        CodeSource = "DataModel";
        CodeType = "CVG-SEX-CD";
        DBTableName = "TCVG";
        SType = "Text";
        Label = "Sex";
    }

    OUT MIR-CVG-SMKR-CD
    {
        Length = "40";
        CodeSource = "EDIT";
        CodeType = "SMOKE";
        DBTableName = "TCVG";
        SType = "Text";
        Label = "Smoker";
    }

    OUT MIR-CVG-STBL-1-CD
    {
        Length = "2";
        CodeSource = "EDIT";
        CodeType = "STB1";
        DBTableName = "TCVG";
        SType = "Text";
        Label = "Sub-table 1";
    }

    OUT MIR-CVG-STBL-2-CD
    {
        Length = "3";
        CodeSource = "EDIT";
        CodeType = "STB2";
        DBTableName = "TCVG";
        SType = "Text";
        Label = "Sub-table 2";
    }

    OUT MIR-CVG-STBL-3-CD
    {
        Length = "40";
        CodeSource = "EDIT";
        CodeType = "STB3";
        DBTableName = "TCVG";
        SType = "Text";
        Label = "Sub-table 3";
    }

    OUT MIR-CVG-STBL-4-CD
    {
        Length = "2";
        CodeSource = "EDIT";
        CodeType = "STB4";
        DBTableName = "TCVG";
        SType = "Text";
        Label = "Sub-table 4";
    }

    OUT MIR-DV-COLA-ALLOW-AMT
    {
        Length = "15";
        DBTableName = "Derived";
        SType = "Currency";
        Label = "Reinsurance Allowance - Basic";
    }

    OUT MIR-DV-LIFE-ALLOW-AMT
    {
        Length = "15";
        DBTableName = "Derived";
        SType = "Currency";
        Label = "Reinsurance Allowance - Basic";
    }

    OUT MIR-DV-LTA-ALLOW-AMT
    {
        Length = "15";
        DBTableName = "Derived";
        SType = "Currency";
        Label = "Reinsurance Allowance - Basic";
    }

    OUT MIR-DV-LTB-ALLOW-AMT
    {
        Length = "15";
        DBTableName = "Derived";
        SType = "Currency";
        Label = "Reinsurance Allowance - Basic";
    }

    OUT MIR-DV-ME-ALLOW-AMT
    {
        Length = "15";
        DBTableName = "Derived";
        SType = "Currency";
        Label = "Reinsurance Allowance - Basic";
    }

    OUT MIR-DV-OWN-CLI-NM
    {
        Length = "75";
        DBTableName = "Derived";
        SType = "Text";
        Label = "Owner Name";
    }

    OUT MIR-DV-OWN-OCCP-ALLOW-AMT
    {
        Length = "15";
        DBTableName = "Derived";
        SType = "Currency";
        Label = "Reinsurance Allowance - Basic";
    }

    OUT MIR-DV-PDISAB-ALLOW-AMT
    {
        Length = "15";
        DBTableName = "Derived";
        SType = "Currency";
        Label = "Reinsurance Allowance - Basic";
    }

    OUT MIR-DV-PREM-PD-YR-QTY
    {
        Length = "2";
        DBTableName = "Derived";
        SType = "Text";
        Label = "Years Paid";
    }

    OUT MIR-DV-REDC-EP-ALLOW-AMT
    {
        Length = "15";
        DBTableName = "Derived";
        SType = "Currency";
        Label = "Reinsurance Allowance - Basic";
    }

    OUT MIR-DV-TOT-VAR-PREM-AMT
    {
        Signed;
        Length = "13";
        DBTableName = "TRI";
        SType = "Currency";
        Label = "Billing Adjustment Amount";
    }

    OUT MIR-INSRD-CLI-ID
    {
        Length = "10";
        DBTableName = "TCVGC";
        SType = "Text";
        Label = "Client Number of Lives Insured";
    }

    OUT MIR-OWN-OCCP-ALLOW-ID
    {
        Length = "3";
        DBTableName = "TRI";
        SType = "Text";
        Label = "OCC Treaty";
    }

    OUT MIR-OWN-OCCP-PREM-AMT
    {
        Length = "11";
        DBTableName = "TRI";
        SType = "Currency";
        Label = "Own Occupation Definition of Disability (OCC) Premium";
    }

    OUT MIR-PDISAB-ALLOW-ID
    {
        Length = "3";
        DBTableName = "TRI";
        SType = "Text";
        Label = "PDIS Treaty";
    }

    OUT MIR-PDISAB-PREM-AMT
    {
        Length = "11";
        DBTableName = "TRI";
        SType = "Currency";
        Label = "Partial Disability (PDIS) Premium";
    }

    OUT MIR-PLAN-ID
    {
        Length = "40";
        CodeSource = "EDIT";
        CodeType = "PLAN";
        DBTableName = "TCVG";
        SType = "Text";
        Label = "Plan";
    }

    OUT MIR-REDC-EP-ALLOW-ID
    {
        Length = "3";
        DBTableName = "TRI";
        SType = "Text";
        Label = "HOSP Treaty";
    }

    OUT MIR-REDC-EP-PREM-AMT
    {
        Length = "11";
        DBTableName = "TRI";
        SType = "Currency";
        Label = "Reduced Elimination Period in Event of Hospitalization (HOSP) Premium";
    }

}

