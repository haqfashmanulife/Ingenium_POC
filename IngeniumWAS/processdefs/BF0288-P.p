# Converted from PathFinder 2.2 to 3.0 Jun 18, 2004 3:13:19 PM EDT

#*******************************************************************************
#*  Component:   BF0288-P.p                                                    *
#*  Description:                                                               *
#*                                                                             *
#*******************************************************************************
#*  Chg#    Release  Description                                               *
#*                                                                             *
#*  014590  6.0      New for release 6.0                                       *
#*  017150  612J     Remove Currency Decimals = "2"                            *
#*                                                                             *
#*******************************************************************************

P-STEP BF0288-P
{
    ATTRIBUTES
    {
        BusinessFunctionId = "0288";
        BusinessFunctionName = "List Bill Payment Reversal";
        BusinessFunctionType = "Reversal";
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

    OUT MIR-DV-TOT-BILL-AMT
    {
        Length = "17";
        DBTableName = "Derived";
        SType = "Currency";
        Label = "Total Amount of Billing";
    }

    OUT MIR-DV-TOT-CRNT-AMT
    {
        Length = "17";
        DBTableName = "Derived";
        SType = "Currency";
        Label = "Current Total for Group Billing";
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

