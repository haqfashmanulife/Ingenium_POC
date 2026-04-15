# Converted from PathFinder 2.2 to 3.0 Jun 18, 2004 3:13:21 PM EDT

#*******************************************************************************
#*  Component:   BF0414-P.p                                                    *
#*  Description:                                                               *
#*                                                                             *
#*******************************************************************************
#*  Chg#    Release  Description                                               *
#*                                                                             *
#*  014590  6.0      New for release 6.0                                       *
#*  017150  612J     Remove Currency Decimals = "2"                            *
#*                                                                             *
#*******************************************************************************

P-STEP BF0414-P
{
    ATTRIBUTES
    {
        BusinessFunctionId = "0414";
        BusinessFunctionName = "Disability Claim - Claim List";
        BusinessFunctionType = "Clmlist";
        MirName = "CCWM0571";
    }

    OUT LSIR-RETURN-CD;

    OUT MIR-RETRN-CD;

    INOUT MIR-CLI-ID
    {
        Key;
        Length = "10";
        DBTableName = "TDCL";
        DefaultSession = "MIR-CLI-ID";
        SType = "Text";
        Label = "Client Number";
    }

    INOUT MIR-DI-CLM-ID
    {
        Key;
        Length = "6";
        DBTableName = "TDCL";
        DefaultSession = "MIR-DI-CLM-ID";
        SType = "Text";
        Label = "Claim Number";
    }

    OUT MIR-CLI-ID-T[100]
    {
        Length = "10";
        FieldGroup = "Table100";
        DBTableName = "TDCL";
        SType = "Text";
        Label = "Client Number";
        Index = "1";
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

    OUT MIR-INSRD-DISAB-TYP-CD-T[100]
    {
        Length = "1";
        FieldGroup = "Table100";
        CodeSource = "DataModel";
        CodeType = "INSRD-DISAB-TYP-CD";
        DBTableName = "TDCL";
        SType = "Text";
        Label = "Disability Type";
        Index = "1";
    }

}

