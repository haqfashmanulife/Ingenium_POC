# Converted from PathFinder 2.2 to 3.0 Jun 18, 2004 3:13:36 PM EDT

#*******************************************************************************
#*  Component:   BF1276-P.p                                                    *
#*  Description:                                                               *
#*                                                                             *
#*******************************************************************************
#*  Chg#    Release  Description                                               *
#*                                                                             *
#*  014590  6.0      New for release 6.0                                       *
#*  017150  612J     Remove Currency Decimals = "2"                            *
#*                                                                             *
#*******************************************************************************

P-STEP BF1276-P
{
    ATTRIBUTES
    {
        BusinessFunctionId = "1276";
        BusinessFunctionName = "Disability Income Claim Policy List";
        BusinessFunctionType = "Pollist";
        MirName = "CCWM0581";
    }

    OUT LSIR-RETURN-CD;

    OUT MIR-RETRN-CD;

    INOUT MIR-CVG-NUM
    {
        Key;
        Length = "2";
        DBTableName = "TCODI";
        DefaultConstant = "01";
        SType = "Text";
        Label = "Coverage Number";
    }

    INOUT MIR-DI-CLM-ID
    {
        Key;
        Length = "6";
        DBTableName = "TDCD";
        DefaultSession = "MIR-DI-CLM-ID";
        SType = "Text";
        Label = "Claim Number";
    }

    INOUT MIR-POL-ID-BASE
    {
        Key;
        Length = "9";
        DBTableName = "TDCD";
        DefaultSession = "MIR-POL-ID-BASE";
        SType = "Text";
        Label = "Policy Id";
    }

    INOUT MIR-POL-ID-SFX
    {
        Key;
        Length = "1";
        DBTableName = "TDCD";
        DefaultSession = "MIR-POL-ID-SFX";
        SType = "Text";
        Label = "Suffix";
    }

    OUT MIR-CLM-CLOS-REASN-CD-T[100]
    {
        Length = "2";
        FieldGroup = "Table100";
        CodeSource = "EDIT";
        CodeType = "CLSRE";
        DBTableName = "TDCL";
        SType = "Text";
        Label = "Claim Closed Reason";
        Index = "1";
    }

    OUT MIR-CLM-CRNT-STAT-CD-T[100]
    {
        Length = "1";
        FieldGroup = "Table100";
        CodeSource = "DataModel";
        CodeType = "CLM-CRNT-STAT-CD";
        DBTableName = "TDCL";
        SType = "Text";
        Label = "Claim Overall Status";
        Index = "1";
    }

    OUT MIR-CVG-BNFT-STAT-CD-T[100]
    {
        Length = "1";
        FieldGroup = "Table100";
        CodeSource = "DataModel";
        CodeType = "CVG-BNFT-STAT-CD";
        DBTableName = "TCODI";
        SType = "Text";
        Label = "Benefit Status";
        Index = "1";
    }

    OUT MIR-CVG-NUM-T[100]
    {
        Length = "2";
        FieldGroup = "Table100";
        DBTableName = "TCODI";
        SType = "Text";
        Label = "Coverage Number";
        Index = "1";
    }

    OUT MIR-DI-CLM-CLOS-DT-T[100]
    {
        Length = "10";
        FieldGroup = "Table100";
        DBTableName = "TDCL";
        SType = "Date";
        Label = "Claim Closed Date";
        Index = "1";
    }

    OUT MIR-DI-CLM-ID-T[100]
    {
        Length = "6";
        FieldGroup = "Table100";
        DBTableName = "TDCL";
        SType = "Text";
        Label = "Claim Number";
        Index = "1";
    }

    OUT MIR-DISAB-REASN-CD-T[100]
    {
        Length = "2";
        FieldGroup = "Table100";
        CodeSource = "EDIT";
        CodeType = "DISRE";
        DBTableName = "TDCL";
        SType = "Text";
        Label = "Disability Reason";
        Index = "1";
    }

    OUT MIR-INSRD-DISAB-DT-T[100]
    {
        Length = "10";
        FieldGroup = "Table100";
        DBTableName = "TDCL";
        SType = "Date";
        Label = "Date Insured Disabled";
        Index = "1";
    }

    OUT MIR-MTHLY-BNFT-AMT-T[100]
    {
        Length = "15";
        FieldGroup = "Table100";
        DBTableName = "TCODI";
        SType = "Currency";
        Label = "Current Monthly Benefit Amount";
        Index = "1";
    }

    OUT MIR-POL-ID-BASE-T[100]
    {
        Length = "9";
        FieldGroup = "Table100";
        DBTableName = "TDCD";
        SType = "Text";
        Label = "Policy Id";
        Index = "1";
    }

    OUT MIR-POL-ID-SFX-T[100]
    {
        Length = "1";
        FieldGroup = "Table100";
        DBTableName = "TDCD";
        SType = "Text";
        Label = "Suffix";
        Index = "1";
    }

}

