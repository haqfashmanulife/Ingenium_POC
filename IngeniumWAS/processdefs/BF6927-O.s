# Converted from PathFinder 2.2 to 3.0 Jun 18, 2004 3:13:00 PM EDT

#*******************************************************************************
#*  Component:   BF6927-O.s                                                    *
#*  Description:                                                               *
#*                                                                             *
#*******************************************************************************
#*  Chg#    Release  Description                                               *
#*                                                                             *
#*  014590  6.0      New for release 6.0                                       *
#*  017150  612J     Remove Currency Decimals = "2"                            *
#*                                                                             *
#*******************************************************************************

S-STEP BF6927-O
{
    ATTRIBUTES
    {
        BusinessFunctionType = "Immann";
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
        Label = "Destination Policy is Registered (1)";
    }

    IN MIR-ANPAYO-1-MTHD-CD
    {
        DisplayOnly;
        Length = "40";
        CodeSource = "DataModel";
        CodeType = "ANPAYO-MTHD-CD";
        SType = "Text";
        Label = "Method of Paying Annuitant (1)";
    }

    IN MIR-ANPAYO-2-DEST-CD
    {
        DisplayOnly;
        Length = "40";
        CodeSource = "DataModel";
        CodeType = "ANPAYO-DEST-CD";
        SType = "Text";
        Label = "Destination Policy is Registered (2)";
    }

    IN MIR-ANPAYO-2-MTHD-CD
    {
        DisplayOnly;
        Length = "40";
        CodeSource = "DataModel";
        CodeType = "ANPAYO-MTHD-CD";
        SType = "Text";
        Label = "Method of Paying Annuitant (2)";
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

    IN MIR-IA-BTH-DT-USE-CD
    {
        DisplayOnly;
        Length = "40";
        CodeSource = "DataModel";
        CodeType = "IA-BTH-DT-USE-CD";
        SType = "Text";
        Label = "Birth Date of Annuitant Used";
    }

    IN MIR-IA-GUAR-MO-DUR
    {
        DisplayOnly;
        Length = "2";
        SType = "Text";
        Label = "Number of Months";
    }

    IN MIR-IA-GUAR-YR-DUR
    {
        DisplayOnly;
        Length = "2";
        SType = "Text";
        Label = "Number of Years";
    }

    IN MIR-IA-INCM-1-ADJ-FCT
    {
        DisplayOnly;
        Signed;
        Length = "5";
        Decimals = "4";
        SType = "Number";
        Label = "Income Adjustment Factor 1 - Death of First Annuitant";
    }

    IN MIR-IA-INCM-2-ADJ-FCT
    {
        DisplayOnly;
        Signed;
        Length = "5";
        Decimals = "4";
        SType = "Number";
        Label = "Income Adjustment Factor 2 - Death of Second Annuitant";
    }

    IN MIR-IA-INCM-ADJ-AMT
    {
        DisplayOnly;
        Signed;
        Length = "15";
        SType = "Currency";
        Label = "Income Adjustment Amount";
    }

    IN MIR-IA-INCM-ADJ-DT
    {
        DisplayOnly;
        Length = "10";
        SType = "Date";
        Label = "Income Adjustment Date";
    }

    IN MIR-IA-INCM-MODE-CD
    {
        DisplayOnly;
        Length = "40";
        CodeSource = "DataModel";
        CodeType = "IA-INCM-MODE-CD";
        SType = "Text";
        Label = "Income Mode";
    }

    IN MIR-IA-INCM-STRT-DT
    {
        DisplayOnly;
        Length = "10";
        SType = "Date";
        Label = "Income Date";
    }

    IN MIR-IA-QUOT-FND-SRC-CD
    {
        DisplayOnly;
        Length = "40";
        CodeSource = "DataModel";
        CodeType = "IA-QUOT-FND-SRC-CD";
        SType = "Text";
        Label = "Fund Source";
    }

    IN MIR-IA-QUOT-GUAR-AGE
    {
        DisplayOnly;
        Length = "3";
        Decimals = "0";
        SType = "Number";
        Label = "Age Income Guaranteed Paid";
    }

    IN MIR-IA-QUOT-INCM-AMT
    {
        DisplayOnly;
        Signed;
        Length = "15";
        SType = "Currency";
        Label = "Ultimate Periodic Income";
    }

    IN MIR-IA-QUOT-JNT-DTH-CD
    {
        DisplayOnly;
        Length = "40";
        CodeSource = "DataModel";
        CodeType = "IA-QUOT-JNT-DTH-CD";
        SType = "Text";
        Label = "Joint Death Status";
    }

    IN MIR-IA-QUOT-NUM
    {
        DisplayOnly;
        Length = "6";
        SType = "Text";
        Label = "Quote Number";
    }

    IN MIR-IA-QUOT-STAT-CD
    {
        DisplayOnly;
        Length = "40";
        CodeSource = "DataModel";
        CodeType = "IA-QUOT-STAT-CD";
        SType = "Text";
        Label = "Quote Status";
    }

    IN MIR-IA-QUOT-TYP-CD
    {
        DisplayOnly;
        Length = "40";
        CodeSource = "DataModel";
        CodeType = "IA-QUOT-TYP-CD";
        SType = "Text";
        Label = "Annuity Type";
    }

    IN MIR-IA-TAX-EXCL-PCT
    {
        DisplayOnly;
        Length = "5";
        Decimals = "1";
        SType = "Percent";
        Label = "Tax Exclusion Ratio";
    }

    IN MIR-NTAXBL-PAY-LTD-AMT
    {
        DisplayOnly;
        Signed;
        Length = "17";
        SType = "Currency";
        Label = "Nontaxed Portion Life to Date";
    }

    IN MIR-NTAXBL-PAY-YTD-AMT
    {
        DisplayOnly;
        Signed;
        Length = "17";
        SType = "Currency";
        Label = "Nontaxed Portion Year to Date";
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

    IN MIR-POL-ANPAYO-1-AMT
    {
        DisplayOnly;
        Signed;
        Length = "15";
        SType = "Currency";
        Label = "Amount of Annuity to be Paid (1)";
    }

    IN MIR-POL-ANPAYO-2-AMT
    {
        DisplayOnly;
        Signed;
        Length = "15";
        SType = "Currency";
        Label = "Amount of Annuity to be Paid (2)";
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
        Label = "Last Payment Date";
    }

    IN MIR-POL-ANPAYO-YTD-AMT
    {
        DisplayOnly;
        Signed;
        Length = "17";
        SType = "Currency";
        Label = "Accumulated Payments Year to Date";
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

    IN MIR-TAXBL-PAYO-LTD-AMT
    {
        DisplayOnly;
        Signed;
        Length = "17";
        SType = "Currency";
        Label = "Taxed Portion Life to Date";
    }

    IN MIR-TAXBL-PAYO-YTD-AMT
    {
        DisplayOnly;
        Signed;
        Length = "17";
        SType = "Currency";
        Label = "Taxable Portion Year to Date";
    }

}

