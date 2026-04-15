# Converted from PathFinder 2.2 to 3.0 Jun 18, 2004 3:13:19 PM EDT

#*******************************************************************************
#*  Component:   BF0284-P.p                                                    *
#*  Description:                                                               *
#*                                                                             *
#*******************************************************************************
#*  Chg#    Release  Description                                               *
#*                                                                             *
#*  014590  6.0      New for release 6.0                                       *
#*  017150  612J     Remove Currency Decimals = "2"                            *
#*                                                                             *
#*******************************************************************************

P-STEP BF0284-P
{
    ATTRIBUTES
    {
        BusinessFunctionId = "0284";
        BusinessFunctionName = "List Bill Individual Member List";
        BusinessFunctionType = "List";
        MirName = "CCWM0281";
    }

    OUT LSIR-RETURN-CD;

    OUT MIR-RETRN-CD;

    INOUT MIR-LBILL-CLI-ID
    {
        Key;
        Mandatory;
        Length = "10";
        DBTableName = "TGR";
        SType = "Text";
        Label = "Group";
    }

    INOUT MIR-LBILL-EFF-DT
    {
        Key;
        Mandatory;
        Length = "10";
        DBTableName = "TGR";
        DefaultSession = "LSIR-PRCES-DT";
        SType = "Date";
        Label = "Billing Date";
    }

    INOUT MIR-POL-ID-BASE
    {
        Key;
        Length = "9";
        DBTableName = "TGR";
        DefaultSession = "MIR-POL-ID-BASE";
        SType = "Text";
        Label = "Policy Id";
    }

    INOUT MIR-POL-ID-SFX
    {
        Key;
        Length = "1";
        DBTableName = "TGR";
        DefaultSession = "MIR-POL-ID-SFX";
        SType = "Text";
        Label = "Suffix";
    }

    INOUT MIR-SBSDRY-CO-ID
    {
        Key;
        Mandatory;
        Length = "40";
        CodeSource = "EDIT";
        CodeType = "SUBCO";
        DBTableName = "TGR";
        SType = "Selection";
        Label = "Sub Company";
    }

    OUT MIR-DV-LBILL-CLI-NM
    {
        Length = "30";
        DBTableName = "Derived";
        SType = "Text";
        Label = "Group Name";
    }

    OUT MIR-DV-LBILL-PREM-DUE-AMT-T[9]
    {
        Length = "15";
        FieldGroup = "Table9";
        DBTableName = "Derived";
        SType = "Currency";
        Label = "Premium Due";
        Index = "1";
    }

    OUT MIR-DV-OWN-CLI-NM-T[9]
    {
        Length = "30";
        FieldGroup = "Table9";
        DBTableName = "Derived";
        SType = "Text";
        Label = "Owner Name";
        Index = "1";
    }

    OUT MIR-DV-TOT-BILL-AMT
    {
        Signed;
        Length = "17";
        DBTableName = "Derived";
        SType = "Currency";
        Label = "Billed Total";
    }

    OUT MIR-DV-TOT-CRNT-AMT
    {
        Length = "17";
        DBTableName = "Derived";
        SType = "Currency";
        Label = "Current Total";
    }

    OUT MIR-LBILL-POL-LPAY-AMT-T[9]
    {
        Length = "15";
        FieldGroup = "Table9";
        DBTableName = "TGR";
        SType = "Currency";
        Label = "Loan Payment";
        Index = "1";
    }

    OUT MIR-LBILL-POL-SFB-IND-T[9]
    {
        Length = "1";
        FieldGroup = "Table9";
        DBTableName = "TGR";
        SType = "Indicator";
        Label = "Special Frequency Indicator";
        Index = "1";
    }

    OUT MIR-LBILL-POL-STAT-CD-T[9]
    {
        Length = "1";
        FieldGroup = "Table9";
        CodeSource = "DataModel";
        CodeType = "LBILL-POL-STAT-CD";
        DBTableName = "TGR";
        SType = "Text";
        Label = "Status";
        Index = "1";
    }

    OUT MIR-LBILL-STAT-CD
    {
        Length = "1";
        CodeSource = "DataModel";
        CodeType = "LBILL-STAT-CD";
        DBTableName = "TGR";
        SType = "Text";
        Label = "Group Status";
    }

    OUT MIR-POL-ID-BASE-T[9]
    {
        Length = "9";
        FieldGroup = "Table9";
        KeyColumn;
        DBTableName = "TGR";
        SType = "Text";
        Label = "Policy Id";
        Index = "1";
    }

    OUT MIR-POL-ID-SFX-T[9]
    {
        Length = "1";
        FieldGroup = "Table9";
        DBTableName = "TGR";
        SType = "Text";
        Label = "Suffix";
        Index = "1";
    }

    OUT MIR-POL-SNDRY-AMT-T[9]
    {
        Length = "13";
        FieldGroup = "Table9";
        DBTableName = "TGR";
        SType = "Currency";
        Label = "Sundry Payment";
        Index = "1";
    }

    OUT MIR-TOT-BILL-LPAY-AMT
    {
        Signed;
        Length = "17";
        DBTableName = "TGR";
        SType = "Currency";
        Label = "Total Loan Payment";
    }

    OUT MIR-TOT-BILL-PREM-AMT
    {
        Signed;
        Length = "17";
        DBTableName = "TGR";
        SType = "Currency";
        Label = "Total Billable Premium";
    }

    OUT MIR-TOT-BILL-SNDRY-AMT
    {
        Signed;
        Length = "17";
        DBTableName = "TGR";
        SType = "Currency";
        Label = "Total Sundry Payment";
    }

    OUT MIR-TOT-CRNT-LPAY-AMT
    {
        Length = "17";
        DBTableName = "TGR";
        SType = "Currency";
        Label = "Current Loan Payment";
    }

    OUT MIR-TOT-CRNT-PREM-AMT
    {
        Length = "17";
        DBTableName = "TGR";
        SType = "Currency";
        Label = "Current Premium Due";
    }

    OUT MIR-TOT-CRNT-SNDRY-AMT
    {
        Length = "17";
        DBTableName = "TGR";
        SType = "Currency";
        Label = "Current Sundry Payment";
    }

}

