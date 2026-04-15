# Converted from PathFinder 2.2 to 3.0 Jun 18, 2004 3:13:52 PM EDT

#*******************************************************************************
#*  Component:   BF6927-P.p                                                    *
#*  Description:                                                               *
#*                                                                             *
#*******************************************************************************
#*  Chg#    Release  Description                                               *
#*                                                                             *
#*  014590  6.0      New for release 6.0                                       *
#*  017150  612J     Remove Currency Decimals = "2"                            *
#*                                                                             *
#*******************************************************************************

P-STEP BF6927-P
{
    ATTRIBUTES
    {
        BusinessFunctionId = "6927";
        BusinessFunctionName = "Policy Inquiry - Immediate Annuities";
        BusinessFunctionType = "Immann";
        MirName = "CCWM6927";
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
        Label = "Destination Policy is Registered (1)";
    }

    OUT MIR-ANPAYO-1-MTHD-CD
    {
        Length = "40";
        CodeSource = "DataModel";
        CodeType = "ANPAYO-MTHD-CD";
        DBTableName = "TPOL";
        SType = "Text";
        Label = "Method of Paying Annuitant (1)";
    }

    OUT MIR-ANPAYO-2-DEST-CD
    {
        Length = "40";
        CodeSource = "DataModel";
        CodeType = "ANPAYO-DEST-CD";
        DBTableName = "TPOL";
        SType = "Text";
        Label = "Destination Policy is Registered (2)";
    }

    OUT MIR-ANPAYO-2-MTHD-CD
    {
        Length = "40";
        CodeSource = "DataModel";
        CodeType = "ANPAYO-MTHD-CD";
        DBTableName = "TPOL";
        SType = "Text";
        Label = "Method of Paying Annuitant (2)";
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

    OUT MIR-IA-BTH-DT-USE-CD
    {
        Length = "40";
        CodeSource = "DataModel";
        CodeType = "IA-BTH-DT-USE-CD";
        DBTableName = "TQT";
        SType = "Text";
        Label = "Birth Date of Annuitant Used";
    }

    OUT MIR-IA-GUAR-MO-DUR
    {
        Length = "2";
        DBTableName = "TQT";
        SType = "Text";
        Label = "Number of Months";
    }

    OUT MIR-IA-GUAR-YR-DUR
    {
        Length = "2";
        DBTableName = "TQT";
        SType = "Text";
        Label = "Number of Years";
    }

    OUT MIR-IA-INCM-1-ADJ-FCT
    {
        Signed;
        Length = "5";
        Decimals = "4";
        DBTableName = "TQT";
        SType = "Number";
        Label = "Income Adjustment Factor 1 - Death of First Annuitant";
    }

    OUT MIR-IA-INCM-2-ADJ-FCT
    {
        Signed;
        Length = "5";
        Decimals = "4";
        DBTableName = "TQT";
        SType = "Number";
        Label = "Income Adjustment Factor 2 - Death of Second Annuitant";
    }

    OUT MIR-IA-INCM-ADJ-AMT
    {
        Signed;
        Length = "15";
        DBTableName = "TQT";
        SType = "Currency";
        Label = "Income Adjustment Amount";
    }

    OUT MIR-IA-INCM-ADJ-DT
    {
        Length = "10";
        DBTableName = "TQT";
        SType = "Date";
        Label = "Income Adjustment Date";
    }

    OUT MIR-IA-INCM-MODE-CD
    {
        Length = "40";
        CodeSource = "DataModel";
        CodeType = "IA-INCM-MODE-CD";
        DBTableName = "TQT";
        SType = "Text";
        Label = "Income Mode";
    }

    OUT MIR-IA-INCM-STRT-DT
    {
        Length = "10";
        DBTableName = "TQT";
        SType = "Date";
        Label = "Income Date";
    }

    OUT MIR-IA-QUOT-FND-SRC-CD
    {
        Length = "40";
        CodeSource = "DataModel";
        CodeType = "IA-QUOT-FND-SRC-CD";
        DBTableName = "TQT";
        SType = "Text";
        Label = "Fund Source";
    }

    OUT MIR-IA-QUOT-GUAR-AGE
    {
        Length = "3";
        Decimals = "0";
        DBTableName = "TQT";
        SType = "Number";
        Label = "Age Income Guaranteed Paid";
    }

    OUT MIR-IA-QUOT-INCM-AMT
    {
        Signed;
        Length = "15";
        DBTableName = "TQT";
        SType = "Currency";
        Label = "Ultimate Periodic Income";
    }

    OUT MIR-IA-QUOT-JNT-DTH-CD
    {
        Length = "40";
        CodeSource = "DataModel";
        CodeType = "IA-QUOT-JNT-DTH-CD";
        DBTableName = "TQT";
        SType = "Text";
        Label = "Joint Death Status";
    }

    OUT MIR-IA-QUOT-NUM
    {
        Length = "6";
        DBTableName = "TCVG";
        SType = "Text";
        Label = "Quote Number";
    }

    OUT MIR-IA-QUOT-STAT-CD
    {
        Length = "40";
        CodeSource = "DataModel";
        CodeType = "IA-QUOT-STAT-CD";
        DBTableName = "TQT";
        SType = "Text";
        Label = "Quote Status";
    }

    OUT MIR-IA-QUOT-TYP-CD
    {
        Length = "40";
        CodeSource = "DataModel";
        CodeType = "IA-QUOT-TYP-CD";
        DBTableName = "TQT";
        SType = "Text";
        Label = "Annuity Type";
    }

    OUT MIR-IA-TAX-EXCL-PCT
    {
        Length = "5";
        Decimals = "1";
        DBTableName = "TPOLT";
        SType = "Percent";
        Label = "Tax Exclusion Ratio";
    }

    OUT MIR-NTAXBL-PAY-LTD-AMT
    {
        Signed;
        Length = "17";
        DBTableName = "TPOLT";
        SType = "Currency";
        Label = "Nontaxed Portion Life to Date";
    }

    OUT MIR-NTAXBL-PAY-YTD-AMT
    {
        Signed;
        Length = "17";
        DBTableName = "TPOLT";
        SType = "Currency";
        Label = "Nontaxed Portion Year to Date";
    }

    OUT MIR-PLAN-ID
    {
        Length = "40";
        CodeSource = "EDIT";
        CodeType = "PLAN";
        DBTableName = "TQT";
        SType = "Text";
        Label = "Plan";
    }

    OUT MIR-POL-ANPAYO-1-AMT
    {
        Signed;
        Length = "15";
        DBTableName = "TPOL";
        SType = "Currency";
        Label = "Amount of Annuity to be Paid (1)";
    }

    OUT MIR-POL-ANPAYO-2-AMT
    {
        Signed;
        Length = "15";
        DBTableName = "TPOL";
        SType = "Currency";
        Label = "Amount of Annuity to be Paid (2)";
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
        Label = "Last Payment Date";
    }

    OUT MIR-POL-ANPAYO-YTD-AMT
    {
        Signed;
        Length = "17";
        DBTableName = "TPOL";
        SType = "Currency";
        Label = "Accumulated Payments Year to Date";
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

    OUT MIR-TAXBL-PAYO-LTD-AMT
    {
        Signed;
        Length = "17";
        DBTableName = "TPOLT";
        SType = "Currency";
        Label = "Taxed Portion Life to Date";
    }

    OUT MIR-TAXBL-PAYO-YTD-AMT
    {
        Signed;
        Length = "17";
        DBTableName = "TPOLT";
        SType = "Currency";
        Label = "Taxable Portion Year to Date";
    }

}

