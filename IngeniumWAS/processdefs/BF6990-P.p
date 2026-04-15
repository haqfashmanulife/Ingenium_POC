# Converted from PathFinder 2.2 to 3.0 Jun 18, 2004 3:13:54 PM EDT

#*******************************************************************************
#*  Component:   BF6990-P.p                                                    *
#*  Description:                                                               *
#*                                                                             *
#*******************************************************************************
#*  Chg#    Release  Description                                               *
#*                                                                             *
#*  014590  6.0      New for release 6.0                                       *
#*  017150  612J     Remove Currency Decimals = "2"                            *
#*                                                                             *
#*******************************************************************************

P-STEP BF6990-P
{
    ATTRIBUTES
    {
        BusinessFunctionId = "6990";
        BusinessFunctionName = "Policy Inquiry - RRIF/LIF";
        BusinessFunctionType = "RRIFLIF";
        MirName = "CCWM6990";
    }

    OUT LSIR-RETURN-CD;

    OUT MIR-RETRN-CD;

    INOUT MIR-CVG-NUM
    {
        Key;
        Mandatory;
        Length = "2";
        DBTableName = "TCVG";
        DefaultConstant = "01";
        SType = "Text";
        Label = "Coverage Number";
    }

    INOUT MIR-POL-ID-BASE
    {
        Key;
        Mandatory;
        Length = "9";
        DBTableName = "TPOL";
        DefaultSession = "MIR-POL-ID-BASE";
        SType = "Text";
        Label = "Policy Id";
    }

    INOUT MIR-POL-ID-SFX
    {
        Key;
        Length = "1";
        DBTableName = "TPOL";
        DefaultSession = "MIR-POL-ID-SFX";
        SType = "Text";
        Label = "Suffix";
    }

    OUT MIR-ANPAYO-1-DEST-CD
    {
        Length = "40";
        CodeSource = "DataModel";
        CodeType = "ANPAYO-DEST-CD";
        DBTableName = "TPOL";
        SType = "Text";
        Label = "Destination policy is registered";
    }

    OUT MIR-ANPAYO-1-MTHD-CD
    {
        Length = "40";
        CodeSource = "DataModel";
        CodeType = "ANPAYO-MTHD-CD";
        DBTableName = "TPOL";
        SType = "Text";
        Label = "Method of Paying Annuitant";
    }

    OUT MIR-CASL-PMT-YTD-AMT
    {
        Signed;
        Length = "17";
        DBTableName = "TPOL";
        SType = "Currency";
        Label = "Casual Payments Year to Date";
    }

    OUT MIR-CONN-CVG-NUM
    {
        Length = "2";
        DBTableName = "TCVG";
        SType = "Text";
        Label = "Connected Coverage Number";
    }

    OUT MIR-CONN-POL-ID-BASE
    {
        Length = "9";
        DBTableName = "TCVG";
        SType = "Text";
        Label = "Connected Policy Id";
    }

    OUT MIR-CONN-POL-ID-SFX
    {
        Length = "1";
        DBTableName = "TCVG";
        SType = "Text";
        Label = "Connected Policy Id Suffix";
    }

    OUT MIR-CVG-CONN-REASN-CD
    {
        Length = "40";
        CodeSource = "DataModel";
        CodeType = "CVG-CONN-REASN-CD";
        DBTableName = "TCVG";
        SType = "Text";
        Label = "Connected Policy / Coverage Reason";
    }

    OUT MIR-DV-AUTO-ANPAYO-AMT
    {
        Signed;
        Length = "15";
        DBTableName = "Derived";
        SType = "Currency";
        Label = "Automatic Payments Made";
    }

    OUT MIR-DV-OWN-CLI-NM
    {
        Length = "75";
        DBTableName = "Derived";
        SType = "Text";
        Label = "Owner Name";
    }

    OUT MIR-FED-TAX-SUSP-AMT
    {
        Signed;
        Length = "15";
        DBTableName = "TPOLT";
        SType = "Currency";
        Label = "Federal: Tax Withheld on Post-dated Payout";
    }

    OUT MIR-FED-TAXWH-ADDL-AMT
    {
        Signed;
        Length = "15";
        DBTableName = "TPOLT";
        SType = "Currency";
        Label = "Federal: Additional Taxes Withheld";
    }

    OUT MIR-FED-TAXWH-AMT
    {
        Signed;
        Length = "15";
        DBTableName = "TPOLT";
        SType = "Currency";
        Label = "Federal: Tax Withheld from Most Recent Payout";
    }

    OUT MIR-FED-TAXWH-NYR-AMT
    {
        Signed;
        Length = "17";
        DBTableName = "TPOLT";
        SType = "Currency";
        Label = "Federal: Tax Withheld Next Year";
    }

    OUT MIR-FED-TAXWH-YTD-AMT
    {
        Signed;
        Length = "17";
        DBTableName = "TPOLT";
        SType = "Currency";
        Label = "Federal: Tax Withheld Year to Date";
    }

    OUT MIR-POL-ANPAYO-1-AMT
    {
        Signed;
        Length = "15";
        DBTableName = "TPOL";
        SType = "Currency";
        Label = "Amount of Annuity to be Paid";
    }

    OUT MIR-POL-ANPAYO-EFF-DT
    {
        Length = "10";
        DBTableName = "TPOL";
        SType = "Date";
        Label = "Annuity Payments Start Date";
    }

    OUT MIR-POL-ANPAYO-LTD-AMT
    {
        Signed;
        Length = "19";
        DBTableName = "TPOL";
        SType = "Currency";
        Label = "Accumulated Payments Life to Date";
    }

    OUT MIR-POL-ANPAYO-MODE-CD
    {
        Length = "40";
        CodeSource = "DataModel";
        CodeType = "POL-ANPAYO-MODE-CD";
        DBTableName = "TPOL";
        SType = "Text";
        Label = "Annuity Payment Frequency";
    }

    OUT MIR-POL-ANPAYO-PMT-DT
    {
        Length = "10";
        DBTableName = "TPOL";
        SType = "Date";
        Label = "Next Payment Date";
    }

    OUT MIR-POL-ANPAYO-YTD-AMT
    {
        Signed;
        Length = "17";
        DBTableName = "TPOL";
        SType = "Currency";
        Label = "Accumulated Payments Year to Date";
    }

    OUT MIR-POL-ANTY-SUSP-AMT
    {
        Signed;
        Length = "15";
        DBTableName = "TPOL";
        SType = "Currency";
        Label = "Annuity Suspense";
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

    OUT MIR-POL-LIF-MXPMT-AMT
    {
        Signed;
        Length = "15";
        DBTableName = "TPOL";
        SType = "Currency";
        Label = "Maximum Payment (LIF Policy)";
    }

    OUT MIR-POL-RRIF-MNPMT-AMT
    {
        Signed;
        Length = "15";
        DBTableName = "TPOL";
        SType = "Currency";
        Label = "Minimum Payment";
    }

    OUT MIR-PROV-TAX-SUSP-AMT
    {
        Signed;
        Length = "15";
        DBTableName = "TPOLT";
        SType = "Currency";
        Label = "Provincial: Tax Withheld on Post-dated Payout";
    }

    OUT MIR-PROV-TAXWH-AMT
    {
        Signed;
        Length = "15";
        DBTableName = "TPOLT";
        SType = "Currency";
        Label = "Provincial: Tax Withheld from Most Recent Payout";
    }

    OUT MIR-PROV-TAXWH-NYR-AMT
    {
        Signed;
        Length = "17";
        DBTableName = "TPOLT";
        SType = "Currency";
        Label = "Provincial: Tax Withheld Next Year";
    }

    OUT MIR-PROV-TAXWH-YTD-AMT
    {
        Signed;
        Length = "17";
        DBTableName = "TPOLT";
        SType = "Currency";
        Label = "Provincial: Tax Withheld Year to Date";
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

    OUT MIR-TAXBL-PAYO-AMT
    {
        Signed;
        Length = "15";
        DBTableName = "TPOLT";
        SType = "Currency";
        Label = "Annual Taxable Amount";
    }

}

