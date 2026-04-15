# Converted from PathFinder 2.2 to 3.0 Jun 18, 2004 3:13:30 PM EDT

#*******************************************************************************
#*  Component:   BF0862-P.p                                                    *
#*  Description:                                                               *
#*                                                                             *
#*******************************************************************************
#*  Chg#    Release  Description                                               *
#*                                                                             *
#*  014590  6.0      New for release 6.0                                       *
#*  017150  612J     Remove Currency Decimals = "2"                            *
#*                                                                             *
#*******************************************************************************

P-STEP BF0862-P
{
    ATTRIBUTES
    {
        BusinessFunctionId = "0862";
        BusinessFunctionName = "Agent Balance Update";
        BusinessFunctionType = "Update";
        MirName = "CCWM3350";
    }

    OUT LSIR-RETURN-CD;

    OUT MIR-RETRN-CD;

    INOUT MIR-AGT-APP-PMO-QTY
    {
        Length = "7";
        DBTableName = "TAB";
        SType = "Text";
        Label = "Application Count - Last Month";
    }

    INOUT MIR-AGT-APP-YTM-QTY
    {
        Length = "7";
        DBTableName = "TAB";
        SType = "Text";
        Label = "Application Count - Year to Month";
    }

    INOUT MIR-AGT-PWRIT-PMO-AMT
    {
        Signed;
        Length = "13";
        DBTableName = "TAB";
        SType = "Currency";
        Label = "Total Premiums Written - Last Month";
    }

    INOUT MIR-AGT-PWRIT-YTM-AMT
    {
        Signed;
        Length = "15";
        DBTableName = "TAB";
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
        DBTableName = "TAB";
        SType = "Currency";
        Label = "Total 1st Year Commissionable Premiums - Current Month";
    }

    INOUT MIR-FYR-CPREM-YTD-AMT
    {
        Signed;
        Length = "15";
        DBTableName = "TAB";
        SType = "Currency";
        Label = "Total 1st Year Commissionable Premium - Year to Date";
    }

    INOUT MIR-FYR-LCOMM-CMO-AMT
    {
        Signed;
        Length = "13";
        DBTableName = "TAB";
        SType = "Currency";
        Label = "Total 1st Year Life Commissions - Current Month";
    }

    INOUT MIR-FYR-LCOMM-YTD-AMT
    {
        Signed;
        Length = "15";
        DBTableName = "TAB";
        SType = "Currency";
        Label = "Total 1st Year Life Commission - Year to Date";
    }

    INOUT MIR-LIFE-PWRIT-PMO-AMT
    {
        Signed;
        Length = "13";
        DBTableName = "TAB";
        SType = "Currency";
        Label = "Total Life Premiums Written - Last Month";
    }

    INOUT MIR-LIFE-PWRIT-YTM-AMT
    {
        Signed;
        Length = "15";
        DBTableName = "TAB";
        SType = "Currency";
        Label = "Total Life Premiums Written - Year to Month";
    }

    INOUT MIR-MKT-BON-CMO-AMT
    {
        Signed;
        Length = "13";
        DBTableName = "TAB";
        SType = "Currency";
        Label = "Market Bonuses - Current Month";
    }

    INOUT MIR-MKT-BON-YTD-AMT
    {
        Signed;
        Length = "15";
        DBTableName = "TAB";
        SType = "Currency";
        Label = "Market Bonuses - Year to Date";
    }

    INOUT MIR-NHS-ALLOW-CMO-AMT
    {
        Signed;
        Length = "13";
        DBTableName = "TAB";
        SType = "Currency";
        Label = "Total Non-housed Allowance - Current Month";
    }

    INOUT MIR-NHS-ALLOW-YTD-AMT
    {
        Signed;
        Length = "15";
        DBTableName = "TAB";
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
        DBTableName = "TAB";
        SType = "Currency";
        Label = "Quality Bonuses - Current Month";
    }

    INOUT MIR-QLTY-BON-YTD-AMT
    {
        Signed;
        Length = "15";
        DBTableName = "TAB";
        SType = "Currency";
        Label = "Quality Bonuses - Year to Date";
    }

    INOUT MIR-RENW-CPREM-CMO-AMT
    {
        Signed;
        Length = "13";
        DBTableName = "TAB";
        SType = "Currency";
        Label = "Total Commissionable Renewal Premiums - Current Month";
    }

    INOUT MIR-RENW-CPREM-YTD-AMT
    {
        Signed;
        Length = "15";
        DBTableName = "TAB";
        SType = "Currency";
        Label = "Total Renewal Commissionable Premiums - Year to Date";
    }

    INOUT MIR-RENW-LCOMM-CMO-AMT
    {
        Signed;
        Length = "13";
        DBTableName = "TAB";
        SType = "Currency";
        Label = "Total Renewal Life Commissions - Current Month";
    }

    INOUT MIR-RENW-LCOMM-YTD-AMT
    {
        Signed;
        Length = "15";
        DBTableName = "TAB";
        SType = "Currency";
        Label = "TOtal Renewal Life Commissions - Year to Date";
    }

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

}

