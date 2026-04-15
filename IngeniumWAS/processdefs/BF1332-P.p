# Converted from PathFinder 2.2 to 3.0 Jun 18, 2004 3:13:37 PM EDT

#*******************************************************************************
#*  Component:   BF1332-P.p                                                    *
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

P-STEP BF1332-P
{
    ATTRIBUTES
    {
        BusinessFunctionId = "1332";
        BusinessFunctionName = "Reinsurance Cession Record Update";
        BusinessFunctionType = "Update";
        MirName = "CCWM0381";
    }

    OUT LSIR-RETURN-CD;

    OUT MIR-RETRN-CD;

    INOUT MIR-ASSUM-CO-ID
    {
        Mandatory;
        Length = "2";
        CodeSource = "EDIT";
        CodeType = "REIN";
        DBTableName = "TRI";
        SType = "Selection";
        Label = "Reinsurance Company";
    }

    INOUT MIR-ASSUM-CO-REF-ID
    {
        Length = "10";
        DBTableName = "TRI";
        SType = "Text";
        Label = "Cession Number";
    }

    INOUT MIR-BCK-BILL-ALLOW-AMT
    {
        Signed;
        Length = "13";
        DBTableName = "TRI";
        SType = "Currency";
        Label = "Billing Adjustment Allowance";
    }

    INOUT MIR-BCK-BILL-PREM-AMT
    {
        Signed;
        Length = "13";
        DBTableName = "TRI";
        SType = "Currency";
        Label = "Billing Adjustment Amount";
    }

    INOUT MIR-BCK-BILL-REASN-CD
    {
        Length = "1";
        CodeSource = "DataModel";
        CodeType = "BCK-BILL-REASN-CD";
        DBTableName = "TRI";
        SType = "Selection";
        Label = "Billing Adjustment Flag";
    }

    INOUT MIR-CSN-AD-ALLOW-ID
    {
        Mandatory;
        Length = "3";
        DBTableName = "TRI";
        SType = "Text";
        Label = "AD Treaty";
    }

    INOUT MIR-CSN-AD-FACE-AMT
    {
        Signed;
        Length = "15";
        DBTableName = "TRI";
        SType = "Currency";
        Label = "Accidental Death (AD) Face Amount";
    }

    INOUT MIR-CSN-AD-PREM-AMT
    {
        Length = "13";
        DBTableName = "TRI";
        SType = "Currency";
        Label = "AD Premium";
    }

    INOUT MIR-CSN-BASIC-PREM-AMT
    {
        Length = "13";
        DBTableName = "TRI";
        SType = "Currency";
        Label = "Reinsurer Annual Premium";
    }

    INOUT MIR-CSN-CHNG-EFF-DT
    {
        Length = "10";
        DBTableName = "TRI";
        SType = "Date";
        Label = "Change Date";
    }

    INOUT MIR-CSN-COLA-ALLOW-ID
    {
        Length = "3";
        DBTableName = "TRI";
        SType = "Text";
        Label = "COLA Treaty";
    }

    INOUT MIR-CSN-COLA-PREM-AMT
    {
        Length = "11";
        DBTableName = "TRI";
        SType = "Currency";
        Label = "Cost of Living Adjustments (COLA) Premium";
    }

    INOUT MIR-CSN-CRNT-RSK-AMT
    {
        Mandatory;
        Length = "15";
        DBTableName = "TRI";
        SType = "Currency";
        Label = "Cession Amount";
    }

    INOUT MIR-CSN-EFF-DT
    {
        Length = "10";
        DBTableName = "TRI";
        SType = "Date";
        Label = "Reinsurance Effective Date";
    }

    INOUT MIR-CSN-FE-ALLOW-ID
    {
        Mandatory;
        Length = "3";
        DBTableName = "TRI";
        SType = "Text";
        Label = "Flat Extra Treaty";
    }

    INOUT MIR-CSN-FE-FCT
    {
        Mandatory;
        Length = "5";
        Decimals = "2";
        DBTableName = "TRI";
        SType = "Number";
        Label = "Flat Extra Duration";
    }

    INOUT MIR-CSN-FE-PREM-AMT
    {
        Length = "13";
        DBTableName = "TRI";
        SType = "Currency";
        Label = "Flat Extra Premium";
    }

    INOUT MIR-CSN-LIFE-ALLOW-ID
    {
        Length = "3";
        DBTableName = "TRI";
        SType = "Text";
        Label = "Original Cession Amount Treaty";
    }

    INOUT MIR-CSN-LTA-ALLOW-ID
    {
        Length = "3";
        DBTableName = "TRI";
        SType = "Text";
        Label = "LTA Treaty";
    }

    INOUT MIR-CSN-LTA-PREM-AMT
    {
        Length = "11";
        DBTableName = "TRI";
        SType = "Currency";
        Label = "Lifetime Accident (LTA) Premium";
    }

    INOUT MIR-CSN-LTB-ALLOW-ID
    {
        Length = "3";
        DBTableName = "TRI";
        SType = "Text";
        Label = "LTB Treaty";
    }

    INOUT MIR-CSN-LTB-PREM-AMT
    {
        Length = "11";
        DBTableName = "TRI";
        SType = "Currency";
        Label = "Lifetime Benefits (LTB) Premium";
    }

    INOUT MIR-CSN-MAT-XPRY-DT
    {
        Length = "10";
        DBTableName = "TRI";
        SType = "Date";
        Label = "Maturity / Expiry Date";
    }

    INOUT MIR-CSN-ME-ALLOW-ID
    {
        Length = "3";
        DBTableName = "TRI";
        SType = "Text";
        Label = "Multiple Rating Factor Treaty";
    }

    INOUT MIR-CSN-ME-FCT
    {
        Length = "5";
        Decimals = "2";
        DBTableName = "TRI";
        SType = "Number";
        Label = "Multiple Rating Factor Duration";
    }

    INOUT MIR-CSN-ME-PREM-AMT
    {
        Length = "13";
        DBTableName = "TRI";
        SType = "Currency";
        Label = "Multiple Rating Factor Premium";
    }

    INOUT MIR-CSN-NOTI-CD
    {
        Length = "2";
        DBTableName = "TRI";
        SType = "Text";
        Label = "Notify Reason";
    }

    INOUT MIR-CSN-NOTI-DT
    {
        Length = "10";
        DBTableName = "TRI";
        SType = "Date";
        Label = "Date Notify Message Produced";
    }

    INOUT MIR-CSN-NPREM-YTD-AMT
    {
        Length = "15";
        DBTableName = "TRI";
        SType = "Currency";
        Label = "Gross Premium Paid Year to Date";
    }

    INOUT MIR-CSN-ORIG-RSK-AMT
    {
        Length = "15";
        DBTableName = "TRI";
        SType = "Currency";
        Label = "Original Cession Amount";
    }

    INOUT MIR-CSN-PAR-CD
    {
        Mandatory;
        Length = "1";
        CodeSource = "DataModel";
        CodeType = "CSN-PAR-CD";
        DBTableName = "TRI";
        SType = "Selection";
        Label = "Dividend Option";
    }

    INOUT MIR-CSN-PD-TO-DT
    {
        Length = "10";
        DBTableName = "TRI";
        SType = "Date";
        Label = "Reinsurance Paid to Date";
    }

    INOUT MIR-CSN-PFEE-AMT
    {
        Signed;
        Length = "13";
        DBTableName = "TRI";
        SType = "Currency";
        Label = "Policy Fee";
    }

    INOUT MIR-CSN-PREM-OFFST-DUR
    {
        Length = "3";
        DBTableName = "TRI";
        SType = "Text";
        Label = "Premium Duration Offset";
    }

    INOUT MIR-CSN-PREV-STAT-CD
    {
        Mandatory;
        Length = "1";
        CodeSource = "DataModel";
        CodeType = "CSN-STAT-CD";
        DBTableName = "TRI";
        SType = "Selection";
        Label = "Previous Status";
    }

    INOUT MIR-CSN-RESTR-PREM-IND
    {
        Length = "1";
        DBTableName = "TRI";
        SType = "Indicator";
        Label = "Restrict automatic calculation of reinsurance premiums";
    }

    INOUT MIR-CSN-RETEN-AMT
    {
        Length = "15";
        DBTableName = "TRI";
        SType = "Currency";
        Label = "Retention Amount";
    }

    INOUT MIR-CSN-RSK-CALC-CD
    {
        Mandatory;
        Length = "1";
        CodeSource = "DataModel";
        CodeType = "CSN-RSK-CALC-CD";
        DBTableName = "TRI";
        SType = "Selection";
        Label = "Risk Indicator";
    }

    INOUT MIR-CSN-RSK-DECR-AMT
    {
        Length = "11";
        Decimals = "0";
        DBTableName = "TRI";
        SType = "Currency";
        Label = "Risk Amount Decrement";
    }

    INOUT MIR-CSN-RT-AGE
    {
        Mandatory;
        Length = "3";
        Decimals = "0";
        DBTableName = "TRI";
        SType = "Number";
        Label = "Age";
    }

    INOUT MIR-CSN-SEX-CD
    {
        Mandatory;
        Length = "1";
        CodeSource = "DataModel";
        CodeType = "CSN-SEX-CD";
        DBTableName = "TRI";
        SType = "Selection";
        Label = "Sex";
    }

    INOUT MIR-CSN-SMKR-CD
    {
        Mandatory;
        Length = "1";
        CodeSource = "DataModel";
        CodeType = "CSN-SMKR-CD";
        DBTableName = "TRI";
        SType = "Selection";
        Label = "Smoker Status";
    }

    INOUT MIR-CSN-STAT-CD
    {
        Mandatory;
        Length = "1";
        CodeSource = "DataModel";
        CodeType = "CSN-STAT-CD";
        DBTableName = "TRI";
        SType = "Selection";
        Label = "Status";
    }

    INOUT MIR-CSN-TRTY-TYP-CD
    {
        Length = "1";
        CodeSource = "DataModel";
        CodeType = "CSN-TRTY-TYP-CD";
        DBTableName = "TRI";
        SType = "Selection";
        Label = "Reinsurance Treaty Type";
    }

    INOUT MIR-CSN-REINS-TYP-CD
    {
        Length = "1";
        CodeSource = "DataModel";
        CodeType = "CSN-REINS-TYP-CD";
        DBTableName = "TRI";
        SType = "Selection";
        Label = "Reinsurance Type";
    }

    INOUT MIR-CSN-PLAN-ID
    {
        Mandatory;
        Length = "1";
        CodeSource = "EDIT";
        CodeType = "EDIT";
        DBTableName = "TRI";
        SType = "Selection";
        Label = "Plan";
    }

    INOUT MIR-CSN-WP-ALLOW-ID
    {
        Mandatory;
        Length = "3";
        DBTableName = "TRI";
        SType = "Text";
        Label = "WP Treaty";
    }

    INOUT MIR-CSN-WP-FACE-AMT
    {
        Length = "15";
        DBTableName = "TRI";
        SType = "Currency";
        Label = "Waiver of Premium (WP) Face Amount";
    }

    INOUT MIR-CSN-WP-PREM-AMT
    {
        Length = "13";
        DBTableName = "TRI";
        SType = "Currency";
        Label = "WP Premium";
    }

    INOUT MIR-CVG-FE-DUR
    {
        Mandatory;
        Length = "3";
        DBTableName = "TCVG";
        SType = "Text";
        Label = "Flat Extra Premium - Duration";
    }

    INOUT MIR-CVG-FE-PREM-AMT
    {
        Signed;
        Length = "13";
        DBTableName = "TCVG";
        SType = "Currency";
        Label = "Flat Extra Premium";
    }

    INOUT MIR-CVG-FE-REASN-CD
    {
        Mandatory;
        Length = "1";
        CodeSource = "EDIT";
        CodeType = "RFLAT";
        DBTableName = "TCVG";
        SType = "Selection";
        Label = "Flat Extra Premium - Reason";
    }

    INOUT MIR-DV-TOT-VAR-PREM-AMT
    {
        Signed;
        Length = "13";
        DBTableName = "TRI";
        SType = "Currency";
        Label = "Billing Adjustment Amount";
    }

    INOUT MIR-OWN-OCCP-ALLOW-ID
    {
        Length = "3";
        DBTableName = "TRI";
        SType = "Text";
        Label = "OCC Treaty";
    }

    INOUT MIR-OWN-OCCP-PREM-AMT
    {
        Length = "11";
        DBTableName = "TRI";
        SType = "Currency";
        Label = "Own Occupation Definition of Disability (OCC) Premium";
    }

    INOUT MIR-PDISAB-ALLOW-ID
    {
        Length = "3";
        DBTableName = "TRI";
        SType = "Text";
        Label = "PDIS Treaty";
    }

    INOUT MIR-PDISAB-PREM-AMT
    {
        Length = "11";
        DBTableName = "TRI";
        SType = "Currency";
        Label = "Partial Disability (PDIS) Premium";
    }

    INOUT MIR-REDC-EP-ALLOW-ID
    {
        Length = "3";
        DBTableName = "TRI";
        SType = "Text";
        Label = "HOSP Treaty";
    }

    INOUT MIR-REDC-EP-PREM-AMT
    {
        Length = "11";
        DBTableName = "TRI";
        SType = "Currency";
        Label = "Reduced Elimination Period in Event of Hospitalization (HOSP) Premium";
    }

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
        Label = "Insured Name";
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

    OUT MIR-INSRD-CLI-ID
    {
        Length = "10";
        DBTableName = "TCVGC";
        SType = "Text";
        Label = "Client Number of Lives Insured";
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

    INOUT MIR-CVG-ME-PREM-AMT
    {
        Length = "13";
        DBTableName = "TRI";
        SType = "Currency";
        Label = "Multiple Extra Premium";
    }

}

