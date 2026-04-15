# Converted from PathFinder 2.2 to 3.0 Jun 18, 2004 3:12:30 PM EDT

#*******************************************************************************
#*  Component:   BF0862-I.s                                                    *
#*  Description:                                                               *
#*                                                                             *
#*******************************************************************************
#*  Chg#    Release  Description                                               *
#*                                                                             *
#*  014590  6.0      New for release 6.0                                       *
#*  017150  612J     Remove Currency Decimals = "2"                            *
#*                                                                             *
#*******************************************************************************

S-STEP BF0862-I
{
    ATTRIBUTES
    {
        BusinessFunctionType = "Update";
        Type = "Input";
        FocusField = "MIR-FYR-CPREM-CMO-AMT";
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

    INOUT MIR-AGT-APP-PMO-QTY
    {
        Length = "7";
        SType = "Text";
        Label = "Application Count - Last Month";
    }

    INOUT MIR-AGT-APP-YTM-QTY
    {
        Length = "7";
        SType = "Text";
        Label = "Application Count - Year to Month";
    }

    INOUT MIR-AGT-PWRIT-PMO-AMT
    {
        Signed;
        Length = "13";
        SType = "Currency";
        Label = "Total Premiums Written - Last Month";
    }

    INOUT MIR-AGT-PWRIT-YTM-AMT
    {
        Signed;
        Length = "15";
        SType = "Currency";
        Label = "Total Premiums Written - Year to Month";
    }

    INOUT MIR-APTVTY-AWD-4-IND-T[4]
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

    INOUT MIR-CNVTN-ATND-4-IND-T[4]
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

    INOUT MIR-FYR-CPREM-CMO-AMT
    {
        Signed;
        Length = "13";
        SType = "Currency";
        Label = "Total 1st Year Commissionable Premiums - Current Month";
    }

    INOUT MIR-FYR-CPREM-YTD-AMT
    {
        Signed;
        Length = "15";
        SType = "Currency";
        Label = "Total 1st Year Commissionable Premium - Year to Date";
    }

    INOUT MIR-FYR-LCOMM-CMO-AMT
    {
        Signed;
        Length = "13";
        SType = "Currency";
        Label = "Total 1st Year Life Commissions - Current Month";
    }

    INOUT MIR-FYR-LCOMM-YTD-AMT
    {
        Signed;
        Length = "15";
        SType = "Currency";
        Label = "Total 1st Year Life Commission - Year to Date";
    }

    INOUT MIR-LIFE-PWRIT-PMO-AMT
    {
        Signed;
        Length = "13";
        SType = "Currency";
        Label = "Total Life Premiums Written - Last Month";
    }

    INOUT MIR-LIFE-PWRIT-YTM-AMT
    {
        Signed;
        Length = "15";
        SType = "Currency";
        Label = "Total Life Premiums Written - Year to Month";
    }

    INOUT MIR-MKT-BON-CMO-AMT
    {
        Signed;
        Length = "13";
        SType = "Currency";
        Label = "Market Bonuses - Current Month";
    }

    INOUT MIR-MKT-BON-YTD-AMT
    {
        Signed;
        Length = "15";
        SType = "Currency";
        Label = "Market Bonuses - Year to Date";
    }

    INOUT MIR-NHS-ALLOW-CMO-AMT
    {
        Signed;
        Length = "13";
        SType = "Currency";
        Label = "Total Non-housed Allowance - Current Month";
    }

    INOUT MIR-NHS-ALLOW-YTD-AMT
    {
        Signed;
        Length = "15";
        SType = "Currency";
        Label = "Total Non-housed Allowance - Year to Date";
    }

    INOUT MIR-NQA-4-IND-T[4]
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

    INOUT MIR-QLTY-BON-CMO-AMT
    {
        Signed;
        Length = "13";
        SType = "Currency";
        Label = "Quality Bonuses - Current Month";
    }

    INOUT MIR-QLTY-BON-YTD-AMT
    {
        Signed;
        Length = "15";
        SType = "Currency";
        Label = "Quality Bonuses - Year to Date";
    }

    INOUT MIR-RENW-CPREM-CMO-AMT
    {
        Signed;
        Length = "13";
        SType = "Currency";
        Label = "Total Commissionable Renewal Premiums - Current Month";
    }

    INOUT MIR-RENW-CPREM-YTD-AMT
    {
        Signed;
        Length = "15";
        SType = "Currency";
        Label = "Total Renewal Commissionable Premiums - Year to Date";
    }

    INOUT MIR-RENW-LCOMM-CMO-AMT
    {
        Signed;
        Length = "13";
        SType = "Currency";
        Label = "Total Renewal Life Commissions - Current Month";
    }

    INOUT MIR-RENW-LCOMM-YTD-AMT
    {
        Signed;
        Length = "15";
        SType = "Currency";
        Label = "TOtal Renewal Life Commissions - Year to Date";
    }

    IN MIR-AGT-ID
    {
        Key;
        DisplayOnly;
        Length = "6";
        SType = "Text";
        Label = "Agent ID";
    }

    IN MIR-SBSDRY-CO-ID
    {
        Key;
        DisplayOnly;
        Length = "40";
        CodeSource = "EDIT";
        CodeType = "SUBCO";
        SType = "Text";
        Label = "Sub Company";
    }

    IN MIR-AGT-MDRT-4-AMT-T[4]
    {
        DisplayOnly;
        Signed;
        Length = "13";
        Decimals = "0";
        FieldGroup = "Table4";
        SType = "Currency";
        Label = "MDRT - Year 1";
        Index = "1";
    }

    IN MIR-AGT-PAYBL-BAL-AMT
    {
        DisplayOnly;
        Signed;
        Length = "13";
        SType = "Currency";
        Label = "Current Balance";
    }

    IN MIR-AGT-PAYO-CMO-AMT
    {
        DisplayOnly;
        Signed;
        Length = "13";
        SType = "Currency";
        Label = "Total Payments Made - Current Month";
    }

    IN MIR-AGT-PAYO-YTD-AMT
    {
        DisplayOnly;
        Signed;
        Length = "15";
        SType = "Currency";
        Label = "Total Payments Made - Year to Date";
    }

    IN MIR-AGT-PROD-4-AMT-T[4]
    {
        DisplayOnly;
        Signed;
        Length = "13";
        Decimals = "0";
        FieldGroup = "Table4";
        SType = "Currency";
        Label = "Production Level - Year 1";
        Index = "1";
    }

    IN MIR-AGT-PRST-4-PCT-T[4]
    {
        DisplayOnly;
        Length = "5";
        Decimals = "2";
        FieldGroup = "Table4";
        SType = "Percent";
        Label = "Persistency Rate - Year 1";
        Index = "1";
    }

    IN MIR-BR-ID
    {
        DisplayOnly;
        Length = "5";
        CodeSource = "XTAB";
        CodeType = "BRCH";
        SType = "Text";
        Label = "Branch";
    }

    IN MIR-DV-COMM-AGT-NM
    {
        DisplayOnly;
        Length = "75";
        SType = "Text";
        Label = "Agent Name";
    }

    IN MIR-FYR-COMM-12-AMT-T[12]
    {
        DisplayOnly;
        Signed;
        Length = "13";
        FieldGroup = "Table12";
        SType = "Currency";
        Label = "Last Month";
        Index = "1";
    }

    IN MIR-FYR-COMM-CMO-AMT
    {
        DisplayOnly;
        Signed;
        Length = "13";
        SType = "Currency";
        Label = "Net 1st Year Commission - Current Month";
    }

    IN MIR-FYR-COMM-YTD-AMT
    {
        DisplayOnly;
        Signed;
        Length = "15";
        SType = "Currency";
        Label = "Net 1st Year Commission - Year to Date";
    }

    IN MIR-OVRID-COMM-CMO-AMT
    {
        DisplayOnly;
        Signed;
        Length = "13";
        SType = "Currency";
        Label = "Total Net Override - Current Month";
    }

    IN MIR-OVRID-COMM-YTD-AMT
    {
        DisplayOnly;
        Signed;
        Length = "15";
        SType = "Currency";
        Label = "Total Net Override - Year to Date";
    }

    IN MIR-RENW-COMM-12-AMT-T[12]
    {
        DisplayOnly;
        Signed;
        Length = "13";
        FieldGroup = "Table12";
        SType = "Currency";
        Label = "Last Month";
        Index = "1";
    }

    IN MIR-RENW-COMM-CMO-AMT
    {
        DisplayOnly;
        Signed;
        Length = "13";
        SType = "Currency";
        Label = "Net Renewal Commissions - Current Month";
    }

    IN MIR-RENW-COMM-YTD-AMT
    {
        DisplayOnly;
        Signed;
        Length = "15";
        SType = "Currency";
        Label = "Net Renewable Commissions - Year to Date";
    }

    IN MIR-TRAIL-COMM-CMO-AMT
    {
        DisplayOnly;
        Signed;
        Length = "13";
        SType = "Currency";
        Label = "Trail Commissions - Current Month";
    }

    IN MIR-TRAIL-COMM-YTD-AMT
    {
        DisplayOnly;
        Signed;
        Length = "15";
        SType = "Currency";
        Label = "Trail Commissions - Year to Date";
    }

}

