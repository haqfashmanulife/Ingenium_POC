# Converted from PathFinder 2.2 to 3.0 Jun 18, 2004 3:13:33 PM EDT

#*******************************************************************************
#*  Component:   BF1009-P.p                                                    *
#*  Description:                                                               *
#*                                                                             *
#*******************************************************************************
#*  Chg#    Release  Description                                               *
#*                                                                             *
#*  014590  6.0      New for release 6.0                                       *
#*  017150  612J     Remove Currency Decimals = "2"                            *
#*  TLB041  CTS      CORPORATE POLICY HOLDER NAME & ADDRESS EXPANSION          *
#*******************************************************************************

P-STEP BF1009-P
{
    ATTRIBUTES
    {
        BusinessFunctionId = "1009";
        BusinessFunctionName = "Client Inquiry - Owner Summary";
        BusinessFunctionType = "Ownsum";
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

    OUT MIR-CLI-SUSP-AMT
    {
        Signed;
        Length = "17";
        DBTableName = "TCLI";
        SType = "Currency";
        Label = "Suspense Amount";
    }

    OUT MIR-DV-CLI-OWN-INFC-AMT-T[6]
    {
        Signed;
        Length = "17";
        FieldGroup = "Table6";
        DBTableName = "Derived";
        SType = "Currency";
        Label = "Inforce Amt";
        Index = "1";
    }

    OUT MIR-DV-CLI-OWN-PEND-AMT-T[6]
    {
        Signed;
        Length = "17";
        FieldGroup = "Table6";
        DBTableName = "Derived";
        SType = "Currency";
        Label = "Pending Amt";
        Index = "1";
    }

    OUT MIR-DV-CLI-OWN-SPND-AMT-T[6]
    {
        Signed;
        Length = "17";
        FieldGroup = "Table6";
        DBTableName = "Derived";
        SType = "Currency";
        Label = "Suspended Amt";
        Index = "1";
    }

    OUT MIR-DV-CLI-OWN-TOT-AMT-T[6]
    {
        Signed;
        Length = "17";
        FieldGroup = "Table6";
        DBTableName = "Derived";
        SType = "Currency";
        Label = "Total Amt";
        Index = "1";
    }

    OUT MIR-DV-OWN-CLI-NM
    {
        #TLB041 CHANGES START HERE        
	#Length = "75";
	Length = "100";
	#TLB041 CHANGES END HERE
        DBTableName = "Derived";
        SType = "Text";
        Label = "Owner Name";
    }

}

