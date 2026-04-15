# Converted from PathFinder 2.2 to 3.0 Jun 18, 2004 3:13:33 PM EDT

#*******************************************************************************
#*  Component:   BF1011-P.p                                                    *
#*  Description:                                                               *
#*                                                                             *
#*******************************************************************************
#*  Chg#    Release  Description                                               *
#*                                                                             *
#*  014590  6.0      New for release 6.0                                       *
#*  017150  612J     Remove Currency Decimals = "2"                            *
#*  TLB041  CTS      CORPORATE POLICY HOLDER NAME & ADDRESS EXPANSION          *
#*******************************************************************************

P-STEP BF1011-P
{
    ATTRIBUTES
    {
        BusinessFunctionId = "1011";
        BusinessFunctionName = "Client Inquiry - PAC Summary";
        BusinessFunctionType = "Pacsum";
        MirName = "CCWM5050";
    }

    OUT LSIR-RETURN-CD;

    OUT MIR-RETRN-CD;

    IN MIR-CLI-BNK-ACCT-NUM
    {
        Key;
        Length = "1";
        DBTableName = "TCLIB";
        DefaultSession = "MIR-CLI-BNK-ACCT-NUM";
        SType = "Text";
        Label = "Bank Account Number";
    }

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

    OUT MIR-BNK-ACCT-ID
    {
        Length = "17";
        DBTableName = "TCLIB";
        SType = "Text";
        Label = "Account Number";
    }

    OUT MIR-BNK-ACCT-MICR-IND
    {
        Length = "1";
        DBTableName = "TBNKA";
        SType = "Indicator";
        Label = "Cheque from account is MICR-encoded";
    }

    OUT MIR-BNK-ACCT-TYP-CD
    {
        Length = "40";
        CodeSource = "EDIT";
        CodeType = "ACTYP";
        DBTableName = "TBNKA";
        SType = "Text";
        Label = "Account Type";
    }

    OUT MIR-BNK-BR-ID
    {
        Length = "5";
        DBTableName = "TCLIB";
        SType = "Text";
        Label = "Branch Number";
    }

    OUT MIR-BNK-ID
    {
        Length = "4";
        DBTableName = "TCLIB";
        SType = "Text";
        Label = "Bank Number";
    }

    OUT MIR-DV-OWN-CLI-NM
    {
        #TLB041 CHANGES START HERE 
        #Length = "75";
        Length = "100";
        #TLB041 CHANGES END HERE
        DBTableName = "Derived";
        SType = "Text";
        Label = "Payor Name";
    }

    OUT MIR-DV-PAC-PEND-AMT-T[7]
    {
        Signed;
        Length = "17";
        FieldGroup = "Table7";
        DBTableName = "Derived";
        SType = "Currency";
        Label = "Total Pending Amount";
        Index = "1";
    }

    OUT MIR-DV-PAC-PREM-AMT-T[7]
    {
        Signed;
        Length = "17";
        FieldGroup = "Table7";
        DBTableName = "Derived";
        SType = "Currency";
        Label = "Total Premium Paying Amount";
        Index = "1";
    }

    OUT MIR-DV-PAC-SPND-AMT-T[7]
    {
        Signed;
        Length = "17";
        FieldGroup = "Table7";
        DBTableName = "Derived";
        SType = "Currency";
        Label = "Total Suspended Amount";
        Index = "1";
    }

    OUT MIR-DV-TOT-PAC-AMT-T[7]
    {
        Signed;
        Length = "17";
        FieldGroup = "Table7";
        DBTableName = "Derived";
        SType = "Currency";
        Label = "Total PAC Draw Amount";
        Index = "1";
    }

    OUT MIR-POL-PAC-DRW-DY-T[7]
    {
        Length = "10";
        FieldGroup = "Table7";
        DBTableName = "TPOL";
        SType = "Day";
        Label = "Deposit Day";
        Index = "1";
    }

}

