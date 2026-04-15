# Converted from PathFinder 2.2 to 3.0 Jun 18, 2004 3:13:32 PM EDT

#*******************************************************************************
#*  Component:   BF1005-P.p                                                    *
#*  Description:                                                               *
#*                                                                             *
#*******************************************************************************
#*  Chg#    Release  Description                                               *
#*                                                                             *
#*  014590  6.0      New for release 6.0                                       *
#*  017150  612J     Remove Currency Decimals = "2"                            *
#*  01BL18  BMB      Remove Listbill Status and add Payroll Deduction fields   *
#*                                                                             *
#*******************************************************************************

P-STEP BF1005-P
{
    ATTRIBUTES
    {
        BusinessFunctionId = "1005";
        BusinessFunctionName = "Client Inquiry - List Billing Summary";
        BusinessFunctionType = "Lblsum";
        MirName = "CCWM5050";
    }

    OUT LSIR-RETURN-CD;

    OUT MIR-RETRN-CD;

    IN MIR-CLI-ID
    {
        Key;
        Mandatory;
        Length = "10";
        DBTableName = "TCLI";
        DefaultSession = "MIR-CLI-ID";
        SType = "Text";
        Label = "Client Number";
    }

    OUT MIR-DV-CLI-LBILL-INFC-AMT-T[5]
    {
        Signed;
        Length = "17";
        FieldGroup = "Table5";
        DBTableName = "Derived";
        SType = "Currency";
        Label = "Inforce Amt";
        Index = "1";
    }

    OUT MIR-DV-CLI-LBILL-PEND-AMT-T[5]
    {
        Signed;
        Length = "17";
        FieldGroup = "Table5";
        DBTableName = "Derived";
        SType = "Currency";
        Label = "Pending Amt";
        Index = "1";
    }

    OUT MIR-DV-CLI-LBILL-SPND-AMT-T[5]
    {
        Signed;
        Length = "17";
        FieldGroup = "Table5";
        DBTableName = "Derived";
        SType = "Currency";
        Label = "Suspended Amt";
        Index = "1";
    }

    OUT MIR-DV-CLI-LBILL-TOT-AMT-T[5]
    {
        Signed;
        Length = "17";
        FieldGroup = "Table5";
        DBTableName = "Derived";
        SType = "Currency";
        Label = "Total Amt";
        Index = "1";
    }

    OUT MIR-DV-OWN-CLI-NM
    {
        Length = "75";
        DBTableName = "Derived";
        SType = "Text";
        Label = "Owner Name";
    }

    OUT MIR-LBILL-GR-PICK-DY
    {
        Length = "2";
        FieldGroup = "Table2";
        DBTableName = "TCLIG";
        SType = "Text";
        Label = "Pick Day";
    }

    OUT MIR-LBILL-GR-DRW-DY
    {
        Length = "2";
        FieldGroup = "Table2";
        DBTableName = "TCLIG";
        SType = "Text";
        Label = "Draw Day";
    }

    OUT MIR-LBILL-BILL-MODE-CD
    {
        Length = "2";
        FieldGroup = "Table2";
        DBTableName = "TCLIG";
        SType = "Text";
        Label = "Billing Mode";
    }

}

