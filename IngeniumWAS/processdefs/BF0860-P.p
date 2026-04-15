# Converted from PathFinder 2.2 to 3.0 Jun 18, 2004 3:13:30 PM EDT

#*******************************************************************************
#*  Component:   BF0860-P.p                                                    *
#*  Description:                                                               *
#*                                                                             *
#*******************************************************************************
#*  Chg#    Release  Description                                               *
#*                                                                             *
#*  014590  6.0      New for release 6.0                                       *
#*  017150  612J     Remove Currency Decimals = "2"                            *
#*                                                                             *
#*******************************************************************************

P-STEP BF0860-P
{
    ATTRIBUTES
    {
        BusinessFunctionId = "0860";
        BusinessFunctionName = "Agent Balance Retrieve";
        BusinessFunctionType = "Retrieve";
        MirName = "CCWM3350";
    }

    OUT LSIR-RETURN-CD;

    OUT MIR-RETRN-CD;

    IN MIR-AGT-ID
    {
        Key;
        Mandatory;
        Length = "6";
        DBTableName = "TAG";
        SType = "Text";
        Label = "Agent ID";
    }

    IN MIR-SBSDRY-CO-ID
    {
        Key;
        Mandatory;
        Length = "40";
        CodeSource = "EDIT";
        CodeType = "SUBCO";
        DBTableName = "TSCOM";
        SType = "Selection";
        Label = "Sub Company";
    }

    OUT MIR-AGT-APP-PMO-QTY
    {
        Length = "7";
        DBTableName = "TAB";
        SType = "Text";
        Label = "Application Count - Last Month";
    }

    OUT MIR-AGT-APP-YTM-QTY
    {
        Length = "7";
        DBTableName = "TAB";
        SType = "Text";
        Label = "Application Count - Year to Month";
    }

    OUT MIR-AGT-MDRT-4-AMT-T[4]
    {
        Signed;
        Length = "13";
        Decimals = "0";
        FieldGroup = "Table4";
        DBTableName = "TAB";
        SType = "Currency";
        Label = "MDRT - Year 1";
        Index = "1";
    }

    OUT MIR-AGT-PAYBL-BAL-AMT
    {
        Signed;
        Length = "13";
        DBTableName = "TAB";
        SType = "Currency";
        Label = "Current Balance";
    }

    OUT MIR-AGT-PAYO-CMO-AMT
    {
        Signed;
        Length = "13";
        DBTableName = "TAB";
        SType = "Currency";
        Label = "Total Payments Made - Current Month";
    }

    OUT MIR-AGT-PAYO-YTD-AMT
    {
        Signed;
        Length = "15";
        DBTableName = "TAB";
        SType = "Currency";
        Label = "Total Payments Made - Year to Date";
    }

    OUT MIR-AGT-PROD-4-AMT-T[4]
    {
        Signed;
        Length = "13";
        Decimals = "0";
        FieldGroup = "Table4";
        DBTableName = "TAB";
        SType = "Currency";
        Label = "Production Level - Year 1";
        Index = "1";
    }

    OUT MIR-AGT-PRST-4-PCT-T[4]
    {
        Length = "5";
        Decimals = "2";
        FieldGroup = "Table4";
        DBTableName = "TAB";
        SType = "Percent";
        Label = "Persistency Rate - Year 1";
        Index = "1";
    }

    OUT MIR-AGT-PWRIT-PMO-AMT
    {
        Signed;
        Length = "13";
        DBTableName = "TAB";
        SType = "Currency";
        Label = "Total Premiums Written - Last Month";
    }

    OUT MIR-AGT-PWRIT-YTM-AMT
    {
        Signed;
        Length = "15";
        DBTableName = "TAB";
        SType = "Currency";
        Label = "Total Premiums Written - Year to Month";
    }

    OUT MIR-APTVTY-AWD-4-IND-T[4]
    {
        Length = "1";
        FieldGroup = "Table4";
        CodeSource = "DataModel";
        CodeType = "APTVTY-AWD-IND";
        DBTableName = "TAB";
        SType = "Selection";
        Label = "Apptivity Awards - Year 1";
        Index = "1";
    }

    OUT MIR-BR-ID
    {
        Length = "5";
        CodeSource = "XTAB";
        CodeType = "BRCH";
        DBTableName = "TAG";
        SType = "Text";
        Label = "Branch";
    }

    OUT MIR-CNVTN-ATND-4-IND-T[4]
    {
        Length = "1";
        FieldGroup = "Table4";
        CodeSource = "DataModel";
        CodeType = "CNVTN-ATND-IND";
        DBTableName = "TAB";
        SType = "Selection";
        Label = "Convention Attended - Year 1";
        Index = "1";
    }

    OUT MIR-DV-COMM-AGT-NM
    {
        Length = "75";
        DBTableName = "Derived";
        SType = "Text";
        Label = "Agent Name";
    }

    OUT MIR-FYR-COMM-12-AMT-T[12]
    {
        Signed;
        Length = "13";
        FieldGroup = "Table12";
        DBTableName = "TAB";
        SType = "Currency";
        Label = "Last Month";
        Index = "1";
    }

    OUT MIR-FYR-COMM-CMO-AMT
    {
        Signed;
        Length = "13";
        DBTableName = "TAB";
        SType = "Currency";
        Label = "Net 1st Year Commission - Current Month";
    }

    OUT MIR-FYR-COMM-YTD-AMT
    {
        Signed;
        Length = "15";
        DBTableName = "TAB";
        SType = "Currency";
        Label = "Net 1st Year Commission - Year to Date";
    }

    OUT MIR-FYR-CPREM-CMO-AMT
    {
        Signed;
        Length = "13";
        DBTableName = "TAB";
        SType = "Currency";
        Label = "Total 1st Year Commissionable Premiums - Current Month";
    }

    OUT MIR-FYR-CPREM-YTD-AMT
    {
        Signed;
        Length = "15";
        DBTableName = "TAB";
        SType = "Currency";
        Label = "Total 1st Year Commissionable Premium - Year to Date";
    }

    OUT MIR-FYR-LCOMM-CMO-AMT
    {
        Signed;
        Length = "13";
        DBTableName = "TAB";
        SType = "Currency";
        Label = "Total 1st Year Life Commissions - Current Month";
    }

    OUT MIR-FYR-LCOMM-YTD-AMT
    {
        Signed;
        Length = "15";
        DBTableName = "TAB";
        SType = "Currency";
        Label = "Total 1st Year Life Commission - Year to Date";
    }

    OUT MIR-LIFE-PWRIT-PMO-AMT
    {
        Signed;
        Length = "13";
        DBTableName = "TAB";
        SType = "Currency";
        Label = "Total Life Premiums Written - Last Month";
    }

    OUT MIR-LIFE-PWRIT-YTM-AMT
    {
        Signed;
        Length = "15";
        DBTableName = "TAB";
        SType = "Currency";
        Label = "Total Life Premiums Written - Year to Month";
    }

    OUT MIR-MKT-BON-CMO-AMT
    {
        Signed;
        Length = "13";
        DBTableName = "TAB";
        SType = "Currency";
        Label = "Market Bonuses - Current Month";
    }

    OUT MIR-MKT-BON-YTD-AMT
    {
        Signed;
        Length = "15";
        DBTableName = "TAB";
        SType = "Currency";
        Label = "Market Bonuses - Year to Date";
    }

    OUT MIR-NHS-ALLOW-CMO-AMT
    {
        Signed;
        Length = "13";
        DBTableName = "TAB";
        SType = "Currency";
        Label = "Total Non-housed Allowance - Current Month";
    }

    OUT MIR-NHS-ALLOW-YTD-AMT
    {
        Signed;
        Length = "15";
        DBTableName = "TAB";
        SType = "Currency";
        Label = "Total Non-housed Allowance - Year to Date";
    }

    OUT MIR-NQA-4-IND-T[4]
    {
        Length = "1";
        FieldGroup = "Table4";
        CodeSource = "DataModel";
        CodeType = "NQA-IND";
        DBTableName = "TAB";
        SType = "Selection";
        Label = "National Quality Awards - Year 1";
        Index = "1";
    }

    OUT MIR-OVRID-COMM-CMO-AMT
    {
        Signed;
        Length = "13";
        DBTableName = "TAB";
        SType = "Currency";
        Label = "Total Net Override - Current Month";
    }

    OUT MIR-OVRID-COMM-YTD-AMT
    {
        Signed;
        Length = "15";
        DBTableName = "TAB";
        SType = "Currency";
        Label = "Total Net Override - Year to Date";
    }

    OUT MIR-QLTY-BON-CMO-AMT
    {
        Signed;
        Length = "13";
        DBTableName = "TAB";
        SType = "Currency";
        Label = "Quality Bonuses - Current Month";
    }

    OUT MIR-QLTY-BON-YTD-AMT
    {
        Signed;
        Length = "15";
        DBTableName = "TAB";
        SType = "Currency";
        Label = "Quality Bonuses - Year to Date";
    }

    OUT MIR-RENW-COMM-12-AMT-T[12]
    {
        Signed;
        Length = "13";
        FieldGroup = "Table12";
        DBTableName = "TAB";
        SType = "Currency";
        Label = "Last Month";
        Index = "1";
    }

    OUT MIR-RENW-COMM-CMO-AMT
    {
        Signed;
        Length = "13";
        DBTableName = "TAB";
        SType = "Currency";
        Label = "Net Renewal Commissions - Current Month";
    }

    OUT MIR-RENW-COMM-YTD-AMT
    {
        Signed;
        Length = "15";
        DBTableName = "TAB";
        SType = "Currency";
        Label = "Net Renewable Commissions - Year to Date";
    }

    OUT MIR-RENW-CPREM-CMO-AMT
    {
        Signed;
        Length = "13";
        DBTableName = "TAB";
        SType = "Currency";
        Label = "Total Commissionable Renewal Premiums - Current Month";
    }

    OUT MIR-RENW-CPREM-YTD-AMT
    {
        Signed;
        Length = "15";
        DBTableName = "TAB";
        SType = "Currency";
        Label = "Total Renewal Commissionable Premiums - Year to Date";
    }

    OUT MIR-RENW-LCOMM-CMO-AMT
    {
        Signed;
        Length = "13";
        DBTableName = "TAB";
        SType = "Currency";
        Label = "Total Renewal Life Commissions - Current Month";
    }

    OUT MIR-RENW-LCOMM-YTD-AMT
    {
        Signed;
        Length = "15";
        DBTableName = "TAB";
        SType = "Currency";
        Label = "TOtal Renewal Life Commissions - Year to Date";
    }

    OUT MIR-TRAIL-COMM-CMO-AMT
    {
        Signed;
        Length = "13";
        DBTableName = "TAB";
        SType = "Currency";
        Label = "Trail Commissions - Current Month";
    }

    OUT MIR-TRAIL-COMM-YTD-AMT
    {
        Signed;
        Length = "15";
        DBTableName = "TAB";
        SType = "Currency";
        Label = "Trail Commissions - Year to Date";
    }

}

