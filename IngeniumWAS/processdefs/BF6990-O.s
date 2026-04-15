# Converted from PathFinder 2.2 to 3.0 Jun 18, 2004 3:13:01 PM EDT

#*******************************************************************************
#*  Component:   BF6990-O.s                                                    *
#*  Description:                                                               *
#*                                                                             *
#*******************************************************************************
#*  Chg#    Release  Description                                               *
#*                                                                             *
#*  014590  6.0      New for release 6.0                                       *
#*  017150  612J     Remove Currency Decimals = "2"                            *
#*                                                                             *
#*******************************************************************************

S-STEP BF6990-O
{
    ATTRIBUTES
    {
        BusinessFunctionType = "RRIFLIF";
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

    IN MIR-ANPAYO-1-DEST-CD
    {
        DisplayOnly;
        Length = "40";
        CodeSource = "DataModel";
        CodeType = "ANPAYO-DEST-CD";
        SType = "Text";
        Label = "Destination policy is registered";
    }

    IN MIR-ANPAYO-1-MTHD-CD
    {
        DisplayOnly;
        Length = "40";
        CodeSource = "DataModel";
        CodeType = "ANPAYO-MTHD-CD";
        SType = "Text";
        Label = "Method of Paying Annuitant";
    }

    IN MIR-CASL-PMT-YTD-AMT
    {
        DisplayOnly;
        Signed;
        Length = "17";
        SType = "Currency";
        Label = "Casual Payments Year to Date";
    }

    IN MIR-CONN-CVG-NUM
    {
        DisplayOnly;
        Length = "2";
        SType = "Text";
        Label = "Connected Coverage Number";
    }

    IN MIR-CONN-POL-ID-BASE
    {
        DisplayOnly;
        Length = "9";
        SType = "Text";
        Label = "Connected Policy Id";
    }

    IN MIR-CONN-POL-ID-SFX
    {
        DisplayOnly;
        Length = "1";
        SType = "Text";
        Label = "Connected Policy Id Suffix";
    }

    IN MIR-CVG-CONN-REASN-CD
    {
        DisplayOnly;
        Length = "40";
        CodeSource = "DataModel";
        CodeType = "CVG-CONN-REASN-CD";
        SType = "Text";
        Label = "Connected Policy / Coverage Reason";
    }

    IN MIR-DV-AUTO-ANPAYO-AMT
    {
        DisplayOnly;
        Signed;
        Length = "15";
        SType = "Currency";
        Label = "Automatic Payments Made";
    }

    IN MIR-DV-OWN-CLI-NM
    {
        DisplayOnly;
        Length = "75";
        SType = "Text";
        Label = "Owner Name";
    }

    IN MIR-FED-TAX-SUSP-AMT
    {
        DisplayOnly;
        Signed;
        Length = "15";
        SType = "Currency";
        Label = "Federal: Tax Withheld on Post-dated Payout";
    }

    IN MIR-FED-TAXWH-ADDL-AMT
    {
        DisplayOnly;
        Signed;
        Length = "15";
        SType = "Currency";
        Label = "Federal: Additional Taxes Withheld";
    }

    IN MIR-FED-TAXWH-AMT
    {
        DisplayOnly;
        Signed;
        Length = "15";
        SType = "Currency";
        Label = "Federal: Tax Withheld from Most Recent Payout";
    }

    IN MIR-FED-TAXWH-NYR-AMT
    {
        DisplayOnly;
        Signed;
        Length = "17";
        SType = "Currency";
        Label = "Federal: Tax Withheld Next Year";
    }

    IN MIR-FED-TAXWH-YTD-AMT
    {
        DisplayOnly;
        Signed;
        Length = "17";
        SType = "Currency";
        Label = "Federal: Tax Withheld Year to Date";
    }

    IN MIR-POL-ANPAYO-1-AMT
    {
        DisplayOnly;
        Signed;
        Length = "15";
        SType = "Currency";
        Label = "Amount of Annuity to be Paid";
    }

    IN MIR-POL-ANPAYO-EFF-DT
    {
        DisplayOnly;
        Length = "10";
        SType = "Date";
        Label = "Annuity Payments Start Date";
    }

    IN MIR-POL-ANPAYO-LTD-AMT
    {
        DisplayOnly;
        Signed;
        Length = "19";
        SType = "Currency";
        Label = "Accumulated Payments Life to Date";
    }

    IN MIR-POL-ANPAYO-MODE-CD
    {
        DisplayOnly;
        Length = "40";
        CodeSource = "DataModel";
        CodeType = "POL-ANPAYO-MODE-CD";
        SType = "Text";
        Label = "Annuity Payment Frequency";
    }

    IN MIR-POL-ANPAYO-PMT-DT
    {
        DisplayOnly;
        Length = "10";
        SType = "Date";
        Label = "Next Payment Date";
    }

    IN MIR-POL-ANPAYO-YTD-AMT
    {
        DisplayOnly;
        Signed;
        Length = "17";
        SType = "Currency";
        Label = "Accumulated Payments Year to Date";
    }

    IN MIR-POL-ANTY-SUSP-AMT
    {
        DisplayOnly;
        Signed;
        Length = "15";
        SType = "Currency";
        Label = "Annuity Suspense";
    }

    IN MIR-POL-CSTAT-CD
    {
        DisplayOnly;
        Length = "40";
        CodeSource = "DataModel";
        CodeType = "POL-CSTAT-CD";
        SType = "Text";
        Label = "Policy Status";
    }

    IN MIR-POL-CVG-REC-CTR
    {
        DisplayOnly;
        Length = "2";
        SType = "Text";
        Label = "Number of Coverages";
    }

    IN MIR-POL-LIF-MXPMT-AMT
    {
        DisplayOnly;
        Signed;
        Length = "15";
        SType = "Currency";
        Label = "Maximum Payment (LIF Policy)";
    }

    IN MIR-POL-RRIF-MNPMT-AMT
    {
        DisplayOnly;
        Signed;
        Length = "15";
        SType = "Currency";
        Label = "Minimum Payment";
    }

    IN MIR-PROV-TAX-SUSP-AMT
    {
        DisplayOnly;
        Signed;
        Length = "15";
        SType = "Currency";
        Label = "Provincial: Tax Withheld on Post-dated Payout";
    }

    IN MIR-PROV-TAXWH-AMT
    {
        DisplayOnly;
        Signed;
        Length = "15";
        SType = "Currency";
        Label = "Provincial: Tax Withheld from Most Recent Payout";
    }

    IN MIR-PROV-TAXWH-NYR-AMT
    {
        DisplayOnly;
        Signed;
        Length = "17";
        SType = "Currency";
        Label = "Provincial: Tax Withheld Next Year";
    }

    IN MIR-PROV-TAXWH-YTD-AMT
    {
        DisplayOnly;
        Signed;
        Length = "17";
        SType = "Currency";
        Label = "Provincial: Tax Withheld Year to Date";
    }

    IN MIR-SBSDRY-CO-ID
    {
        DisplayOnly;
        Length = "40";
        CodeSource = "EDIT";
        CodeType = "SUBCO";
        SType = "Text";
        Label = "Sub Company";
    }

    IN MIR-TAXBL-PAYO-AMT
    {
        DisplayOnly;
        Signed;
        Length = "15";
        SType = "Currency";
        Label = "Annual Taxable Amount";
    }

}

