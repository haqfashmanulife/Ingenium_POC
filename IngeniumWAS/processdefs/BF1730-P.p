# Converted from PathFinder 2.2 to 3.0 Jun 18, 2004 3:13:44 PM EDT

#*******************************************************************************
#*  Component:   BF1730-P.p                                                    *
#*  Description:                                                               *
#*                                                                             *
#*******************************************************************************
#*  Chg#    Release  Description                                               *
#*                                                                             *
#*  014590  6.0      New for release 6.0                                       *
#*  017150  612J     Remove Currency Decimals = "2"                            *
#*                                                                             *
#*******************************************************************************

P-STEP BF1730-P
{
    ATTRIBUTES
    {
        BusinessFunctionId = "1730";
        BusinessFunctionName = "Fund Inquiry - Contract";
        BusinessFunctionType = "Contr";
        MirName = "SCWM0020";
    }

    OUT LSIR-RETURN-CD;

    OUT MIR-RETRN-CD;

    IN MIR-CVG-NUM
    {
        Key;
        Mandatory;
        Length = "2";
        DBTableName = "TFA";
        DefaultConstant = "01";
        SType = "Text";
        Label = "Coverage Number";
    }

    IN MIR-POL-ID-BASE
    {
        Key;
        Mandatory;
        Length = "9";
        DBTableName = "TFA";
        DefaultSession = "MIR-POL-ID-BASE";
        SType = "Text";
        Label = "Policy Id";
    }

    IN MIR-POL-ID-SFX
    {
        Key;
        Length = "1";
        DBTableName = "TFA";
        DefaultSession = "MIR-POL-ID-SFX";
        SType = "Text";
        Label = "Suffix";
    }

    OUT MIR-CFN-STAT-CD
    {
        Length = "40";
        CodeSource = "DataModel";
        CodeType = "CFN-STAT-CD";
        DBTableName = "TFS";
        SType = "Selection";
        Label = "Status";
    }

    OUT MIR-CVG-CDN-GAIN-AMT
    {
        Signed;
        Length = "15";
        DBTableName = "TFC";
        SType = "Currency";
        Label = "Net Realized Capital Gains (Canadian)";
    }

    OUT MIR-CVG-ELIG-DIV-AMT
    {
        Signed;
        Length = "15";
        DBTableName = "TFC";
        SType = "Currency";
        Label = "Investment Income Deduction - Eligible Dividend Income";
    }

    OUT MIR-CVG-ELIG-INT-AMT
    {
        Signed;
        Length = "15";
        DBTableName = "TFC";
        SType = "Currency";
        Label = "Investment Income Deduction - Eligible Interest Income";
    }

    OUT MIR-CVG-FRGN-GAIN-AMT
    {
        Signed;
        Length = "15";
        DBTableName = "TFC";
        SType = "Currency";
        Label = "Net Realized Capital Gains (Foreign)";
    }

    OUT MIR-CVG-INELG-DIV-AMT
    {
        Signed;
        Length = "15";
        DBTableName = "TFC";
        SType = "Currency";
        Label = "Ineligible dividend Income - Investment Income Deduction";
    }

    OUT MIR-CVG-INELG-INT-AMT
    {
        Signed;
        Length = "15";
        DBTableName = "TFC";
        SType = "Currency";
        Label = "Ineligible Interest Income - Investment Income Deduction";
    }

    OUT MIR-CVG-OTHR-INCM-AMT
    {
        Signed;
        Length = "15";
        DBTableName = "TFC";
        SType = "Currency";
        Label = "Other Income";
    }

    OUT MIR-CVG-T5-INT-AMT
    {
        Signed;
        Length = "15";
        DBTableName = "TFC";
        SType = "Currency";
        Label = "Pending Interest Amount";
    }

    OUT MIR-DV-CDN-TAX-ACB-AMT
    {
        Signed;
        Length = "17";
        DBTableName = "Derived";
        SType = "Currency";
        Label = "Total Adjusted Cost Basis Amount";
    }

    OUT MIR-EARLST-CIA-DT
    {
        Length = "10";
        DBTableName = "TFC";
        SType = "Date";
        Label = "Activity Dates - Earliest Record";
    }

    OUT MIR-FRST-PRCES-CIA-DT
    {
        Length = "10";
        DBTableName = "TFC";
        SType = "Date";
        Label = "Activity Dates - First Record";
    }

    OUT MIR-LATST-CIA-DT
    {
        Length = "10";
        DBTableName = "TFC";
        SType = "Date";
        Label = "Last Record";
    }

    OUT MIR-LATST-DPOS-CIA-DT
    {
        Length = "10";
        DBTableName = "TFC";
        SType = "Date";
        Label = "Last Deposit";
    }

    OUT MIR-LATST-PSUR-CIA-DT
    {
        Length = "10";
        DBTableName = "TFC";
        SType = "Date";
        Label = "Last Partial Surrender";
    }

    OUT MIR-PREV-T3-PRCES-DT
    {
        Length = "10";
        DBTableName = "TFC";
        SType = "Date";
        Label = "Last T3 Date";
    }

    OUT MIR-RPT-PEND-CIA-DT
    {
        Length = "10";
        DBTableName = "TFC";
        SType = "Date";
        Label = "Report Pending Activity Date";
    }

    OUT MIR-VALU-PEND-CIA-DT
    {
        Length = "10";
        DBTableName = "TFC";
        SType = "Date";
        Label = "Fund Units Pending Activity Date";
    }

}

