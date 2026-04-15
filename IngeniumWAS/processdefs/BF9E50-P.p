# Converted from PathFinder 2.2 to 3.0 Jun 18, 2004 3:13:22 PM EDT

#*******************************************************************************
#*  Component:   BF9E50-P.p                                                    *
#*  Description:                                                               *
#*                                                                             *
#*******************************************************************************
#*  Chg#    Release  Description                                               *
#*                                                                             *
#*  014590  6.0      New for release 6.0                                       *
#*  017150  612J     Remove Currency Decimals = "2"                            *
#*                                                                             *
#*******************************************************************************

P-STEP BF9E50-P
{
    ATTRIBUTES
    {
        BusinessFunctionId = "9E50";
        BusinessFunctionName = "Whole life premium Quote screen";
        BusinessFunctionType = "Wholelife";
        MirName = "CCWM9E50";
    }

    OUT LSIR-RETURN-CD;

    OUT MIR-RETRN-CD;

    INOUT MIR-POL-ID-BASE
    {
        Key;
        Mandatory;
        Length = "9";
        DBTableName = "THI";
        DefaultSession = "MIR-POL-ID-BASE";
        SType = "Text";
        Label = "Policy Id";
    }

    INOUT MIR-POL-ID-SFX
    {
        Key;
        Length = "1";
        DBTableName = "THI";
        DefaultSession = "MIR-POL-ID-SFX";
        SType = "Text";
        Label = "Suffix";
    }

    INOUT MIR-SETL-OPT-IND
    {
        Length = "1";
        SType = "Indicator";
        Label = "Settlement Option";
    }
    INOUT MIR-POL-PREM-PMT-TYP-CD
    {
        Length = "2";
        CodeSource = "DataModel";
        CodeType = "MEDIC-CVG-PMT-TYP-CD";
        DBTableName = "TPOL";
        SType = "Selection";
        Label = "Payment type for Medical Rider";
    }
    INOUT MIR-POL-HOLD-NM
    {
        Length = "75";
        SType = "Text";
        Label = "Policy holder name";
    }

    INOUT MIR-PLAN-ID
    {
        Length = "40";
        CodeSource = "EDIT";
        CodeType = "PLAN";
        SType = "Text";
        Label = "Plan";
    }
    INOUT MIR-POL-ISS-EFF-DT
    {
        Length = "10";
        DBTableName = "TPOL";
        SType = "Date";
        Label = "Policy Issue Date";
    }
    INOUT MIR-BASE-PREM-PMT-COMP-IND
    {
        Length = "01";
        SType = "Indicator";
        Label = "Base policy premium payment completion indicator";
    }
    INOUT MIR-BASE-PREM-PMT-COMP-DT
    {
        Length = "10";
        SType = "Date";
        Label = "Base policy premium payment completion date";
    }
    INOUT MIR-DIV-PMT-OP
    {
        Length = "02";
        SType = "Text";
        Label = "Policy Dividend Option";
    }
    INOUT MIR-INSR-CLI-NM
    {
        Length = "75";
        SType = "Text";
        Label = "Insured Name";
    }
    INOUT MIR-TOT-MED-RD-PREM-AMT
    {
        Length = "17";
        SType = "Currency";
        Label = "Lump sum premium";
    }
    INOUT MIR-INST-ADV-PREM-AMT
    {
        Length = "17";
        SType = "Currency";
        Label = "5-year installment advance payment";
    }
    INOUT MIR-ADV-PMT-DUR
    {
        Length = "3";
        SType = "Currency";
        Label = "Advance payment duration";
    }
    INOUT MIR-RIDER-CSV-AMT
    {
        Length = "17";
        SType = "Currency";
        Label = "Rider CSV";
    }
    INOUT MIR-ACC-DIV-AMT
    {
        Length = "17";
        SType = "Currency";
        Label = "Accumulated Dividend Amount";
    }
    INOUT MIR-SPE-DIV-AMT
    {
        Length = "17";
        SType = "Currency";
        Label = "Special dividend amount";
    }
    INOUT MIR-SPE-DIV-DEF-AMT
    {
        Length = "17";
        SType = "Currency";
        Label = "Special dividend deferred amount";
    }
    INOUT MIR-INC-PUR-SUR-AMT
    {
        Length = "17";

        SType = "Currency";
        Label = "Increased purchase of survival benefit amount";
    }
    INOUT MIR-INC-PUR-SUR-DEF-AMT
    {
        Length = "17";
        SType = "Currency";
        Label = "Increased purchase of survival benefit deferred amount";
    }
    INOUT MIR-VES-AMT
    {
        Length = "17";
        SType = "Currency";
        Label = "Vesting Amount";
    }
    INOUT MIR-VES-DEF-AMT
    {
        Length = "17";
        SType = "Currency";
        Label = "Vesting deferred amount";
    }
    INOUT MIR-HTH-BON-AMT
    {
        Length = "17";
        SType = "Currency";
        Label = "Health Bonus Amount";
    }
    INOUT MIR-HTH-BON-DEF-AMT
    {
        Length = "17";
        SType = "Currency";
        Label = "Health Bonus Deferred Amount";
    }
    INOUT MIR-EXC-PREM-AMT
    {
        Length = "17";
        SType = "Currency";
        Label = "Excess premium";
    }
    INOUT MIR-POL-LOAN-AMT
    {
        Length = "17";
        SType = "Currency";
        Label = "Policy Loan";
    }
    INOUT MIR-APL-LOAN-AMT
    {
        Length = "17";
        SType = "Currency";
        Label = "APL Amount";
    }
    INOUT MIR-NET-PAY-AMT
    {
        Length = "17";
        SType = "Currency";
        Label = "Net Payment Amount";
    }

}

