# Converted from PathFinder 2.2 to 3.0 Jun 18, 2004 3:13:33 PM EDT

#*******************************************************************************
#*  Component:   BF1015-P.p                                                    *
#*  Description:                                                               *
#*                                                                             *
#*******************************************************************************
#*  Chg#    Release  Description                                               *
#*                                                                             *
#*  014590  6.0      New for release 6.0                                       *
#*  017150  612J     Remove Currency Decimals = "2"                            *
#*                                                                             *
#*******************************************************************************

P-STEP BF1015-P
{
    ATTRIBUTES
    {
        BusinessFunctionId = "1015";
        BusinessFunctionName = "Client Inquiry - US Tax Summary";
        BusinessFunctionType = "Ustsum";
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

    OUT MIR-DV-OWN-CLI-NM
    {
        Length = "75";
        DBTableName = "Derived";
        SType = "Text";
        Label = "Owner Name";
    }

    OUT MIR-DV-US-TAX-INFC-AMT-T[6]
    {
        Signed;
        Length = "17";
        FieldGroup = "Table6";
        DBTableName = "Derived";
        SType = "Currency";
        Label = "Inforce Amt";
        Index = "1";
    }

    OUT MIR-DV-US-TAX-PEND-AMT-T[6]
    {
        Signed;
        Length = "17";
        FieldGroup = "Table6";
        DBTableName = "Derived";
        SType = "Currency";
        Label = "Pending Amt";
        Index = "1";
    }

    OUT MIR-DV-US-TAX-SPND-AMT-T[6]
    {
        Signed;
        Length = "17";
        FieldGroup = "Table6";
        DBTableName = "Derived";
        SType = "Currency";
        Label = "Suspended Amt";
        Index = "1";
    }

    OUT MIR-DV-US-TAX-TOT-AMT-T[6]
    {
        Signed;
        Length = "17";
        FieldGroup = "Table6";
        DBTableName = "Derived";
        SType = "Currency";
        Label = "Total Amt";
        Index = "1";
    }

}

