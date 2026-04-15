# Converted from PathFinder 2.2 to 3.0 Jun 18, 2004 3:13:53 PM EDT

#*******************************************************************************
#*  Component:   BF6970-P.p                                                    *
#*  Description:                                                               *
#*                                                                             *
#*******************************************************************************
#*  Chg#    Release  Description                                               *
#*                                                                             *
#*  014590  6.0      New for release 6.0                                       *
#*  017150  612J     Remove Currency Decimals = "2"                            *
#*  01AD25  BMB      Change MIR-CVG-NUM to control display of more than 20 cvgs*
#*                                                                             *
#*******************************************************************************

P-STEP BF6970-P
{
    ATTRIBUTES
    {
        BusinessFunctionId = "6970";
        BusinessFunctionName = "Policy Inquiry - Universal Life Details";
        BusinessFunctionType = "Uldtl";
        MirName = "CCWM6970";
    }

    OUT LSIR-RETURN-CD;

    OUT MIR-RETRN-CD;

#01AD25 - Add in the coverage number
    INOUT MIR-CVG-NUM
    {
        Length = "2";
        DBTableName = "TCVG";
        SType = "Text";
        Label = "Coverage Number";
    }

    IN MIR-POL-ID-BASE
    {
        Key;
        Mandatory;
        Length = "9";
        DBTableName = "TPOL";
        DefaultSession = "MIR-POL-ID-BASE";
        SType = "Text";
        Label = "Policy Id";
    }

    IN MIR-POL-ID-SFX
    {
        Key;
        Length = "1";
        DBTableName = "TPOL";
        DefaultSession = "MIR-POL-ID-SFX";
        SType = "Text";
        Label = "Suffix";
    }

    OUT MIR-CVG-COMM-TRG-AMT
    {
        Signed;
        Length = "13";
        Decimals = "0";
        DBTableName = "TCVG";
        SType = "Currency";
        Label = "Total Commission Targets";
    }

    OUT MIR-CVG-COMM-TRG-AMT-T[20]
    {
        Signed;
        Length = "13";
        Decimals = "0";
        FieldGroup = "Table20";
        DBTableName = "TCVG";
        SType = "Currency";
        Label = "Total Commission Targets";
        Index = "1";
    }

    OUT MIR-CVGD-DUR-T[20]
    {
        Length = "3";
        FieldGroup = "Table20";
        DBTableName = "TCVGD";
        SType = "Text";
        Label = "Duration";
        Index = "1";
    }

    OUT MIR-CVGD-PMT-AMT-T[20]
    {
        Signed;
        Length = "17";
        FieldGroup = "Table20";
        DBTableName = "TCVGD";
        SType = "Currency";
        Label = "Cumulative Payments for Duration";
        Index = "1";
    }

    OUT MIR-CVGD-PMT-LOAD-AMT-T[20]
    {
        Signed;
        Length = "17";
        FieldGroup = "Table20";
        DBTableName = "TCVGD";
        SType = "Currency";
        Label = "Cumulative Front-end Load";
        Index = "1";
    }

    OUT MIR-CVG-GUAR-INT-PCT-T[20]
    {
        Signed;
        Length = "9";
        Decimals = "6";
        FieldGroup = "Table20";
        DBTableName = "TCVG";
        SType = "Percent";
        Label = "Interest Guaranteed Period - Interest Rate";
        Index = "1";
    }

    OUT MIR-CVG-NUM-T[20]
    {
        Length = "2";
        FieldGroup = "Table20";
        DBTableName = "TCVG";
        SType = "Text";
        Label = "Coverage Number";
        Index = "1";
    }

    OUT MIR-CVG-PMT-LTD-AMT-T[20]
    {
        Signed;
        Length = "19";
        FieldGroup = "Table20";
        DBTableName = "TCVG";
        SType = "Currency";
        Label = "Cumulative Payments Life to Date";
        Index = "1";
    }

    OUT MIR-CVG-SURR-LTD-AMT-T[20]
    {
        Signed;
        Length = "19";
        FieldGroup = "Table20";
        DBTableName = "TCVG";
        SType = "Currency";
        Label = "Surrender Charges Life to Date";
        Index = "1";
    }

    OUT MIR-CVG-SURR-TRG-AMT
    {
        Signed;
        Length = "13";
        Decimals = "0";
        DBTableName = "TCVG";
        SType = "Currency";
        Label = "Total Surrender Charge Targets";
    }

    OUT MIR-CVG-SURR-TRG-AMT-T[20]
    {
        Signed;
        Length = "13";
        Decimals = "0";
        FieldGroup = "Table20";
        DBTableName = "TCVG";
        SType = "Currency";
        Label = "Total Surrender Charge Targets";
        Index = "1";
    }

    OUT MIR-DV-OWN-CLI-NM
    {
        Length = "75";
        DBTableName = "Derived";
        SType = "Text";
        Label = "Owner Name";
    }

    OUT MIR-DV-UL-NLAPS-END-DT
    {
        Length = "10";
        DBTableName = "Derived";
        SType = "Date";
        Label = "No Lapse Guaranteed End Date";
    }

    OUT MIR-GUAR-IMPRD-INT-PCT-T[20]
    {
        Signed;
        Length = "7";
        Decimals = "6";
        FieldGroup = "Table20";
        DBTableName = "TCVG";
        SType = "Percent";
        Label = "Interest Guaranteed Period - Impaired Interest Rate";
        Index = "1";
    }

    OUT MIR-GUAR-INT-END-DT-T[20]
    {
        Length = "10";
        FieldGroup = "Table20";
        DBTableName = "TCVG";
        SType = "Date";
        Label = "Interest Guarantee Period - End Date";
        Index = "1";
    }

    OUT MIR-MNPMT-TRG-LTD-AMT-T[20]
    {
        Signed;
        Length = "15";
        Decimals = "0";
        FieldGroup = "Table20";
        DBTableName = "TCVG";
        SType = "Currency";
        Label = "Minimum Payment Target Amount";
        Index = "1";
    }

    OUT MIR-PMT-LOAD-LTD-AMT-T[20]
    {
        Signed;
        Length = "17";
        FieldGroup = "Table20";
        DBTableName = "TCVG";
        SType = "Currency";
        Label = "Payment Loads Life to Date";
        Index = "1";
    }

    OUT MIR-PMT-LOAD-TRG-AMT
    {
        Signed;
        Length = "13";
        Decimals = "0";
        DBTableName = "TCVG";
        SType = "Currency";
        Label = "Total Payment Load Targets";
    }

    OUT MIR-PMT-LOAD-TRG-AMT-T[20]
    {
        Signed;
        Length = "13";
        Decimals = "0";
        FieldGroup = "Table20";
        DBTableName = "TCVG";
        SType = "Currency";
        Label = "Total Payment Load Targets";
        Index = "1";
    }

    OUT MIR-POL-CSTAT-CD
    {
        Length = "40";
        CodeSource = "DataModel";
        CodeType = "POL-CSTAT-CD";
        DBTableName = "TPOL";
        SType = "Text";
        Label = "Policy Status";
    }

    OUT MIR-POL-CVG-REC-CTR
    {
        Length = "2";
        DBTableName = "TPOL";
        SType = "Text";
        Label = "Number of Coverages";
    }

    OUT MIR-POL-DB-OPT-CD
    {
        Length = "40";
        CodeSource = "DataModel";
        CodeType = "POL-DB-OPT-CD";
        DBTableName = "TPOL";
        SType = "Text";
        Label = "Death Benefit Option";
    }

    OUT MIR-POL-MNPMT-TRG-AMT
    {
        Signed;
        Length = "15";
        Decimals = "0";
        DBTableName = "TPOL";
        SType = "Currency";
        Label = "Total Minimum Payment Targets";
    }

    OUT MIR-POL-UL-PRCES-DT
    {
        Length = "10";
        DBTableName = "TPOL";
        SType = "Date";
        Label = "Monthiversary Paid to Date";
    }

    OUT MIR-POL-UL-SHRT-AMT
    {
        Signed;
        Length = "15";
        DBTableName = "TPOL";
        SType = "Currency";
        Label = "Shortage Amount";
    }

    OUT MIR-SBSDRY-CO-ID
    {
        Length = "40";
        CodeSource = "EDIT";
        CodeType = "SUBCO";
        DBTableName = "TPOL";
        SType = "Text";
        Label = "Sub Company";
    }

    OUT MIR-SURR-LOAD-LTD-AMT-T[20]
    {
        Signed;
        Length = "17";
        FieldGroup = "Table20";
        DBTableName = "TCVG";
        SType = "Currency";
        Label = "Cumulative Surrender Life to Date";
        Index = "1";
    }

    OUT MIR-UL-LAPS-NOTI-AMT
    {
        Signed;
        Length = "15";
        DBTableName = "TPOL";
        SType = "Currency";
        Label = "Reactivate Policy Amount";
    }

    OUT MIR-UL-LAPS-STRT-DT
    {
        Length = "10";
        DBTableName = "TPOL";
        SType = "Date";
        Label = "Lapse Start Date";
    }

}

