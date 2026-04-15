# Converted from PathFinder 2.2 to 3.0 Jun 18, 2004 3:12:33 PM EDT

#*******************************************************************************
#*  Component:   BF1011-O.s                                                    *
#*  Description:                                                               *
#*                                                                             *
#*******************************************************************************
#*  Chg#    Release  Description                                               *
#*                                                                             *
#*  014590  6.0      New for release 6.0                                       *
#*  017150  612J     Remove Currency Decimals = "2"                            *
#*  TLB041  CTS      CORPORATE POLICY HOLDER NAME & ADDRESS EXPANSION          *
#*******************************************************************************

S-STEP BF1011-O
{
    ATTRIBUTES
    {
        BusinessFunctionType = "Pacsum";
        Type = "Output";
        DelEmptyRows;
        FocusField = "OKButton";
        FocusFrame = "ButtonFrame";
    }

    IN Title;

    IN TitleBar;

    IN TitleBarSize;

    IN ButtonBar;

    IN ButtonBarSize;

    IN MessageFrame;

    IN MessageFrameSize;

    OUT action
    {
        SType = "Hidden";
    }

    OUT index
    {
        SType = "Hidden";
    }

    IN MIR-CLI-BNK-ACCT-NUM
    {
        Key;
        DisplayOnly;
        Length = "1";
        DefaultSession = "MIR-CLI-BNK-ACCT-NUM";
        SType = "Text";
        Label = "Bank Account Number";
    }

    IN MIR-CLI-ID
    {
        Key;
        DisplayOnly;
        Length = "10";
        DefaultSession = "MIR-CLI-ID";
        SType = "Text";
        Label = "Client Number";
    }

    IN MIR-BNK-ACCT-ID
    {
        DisplayOnly;
        Length = "17";
        SType = "Text";
        Label = "Account Number";
    }

    IN MIR-BNK-ACCT-MICR-IND
    {
        DisplayOnly;
        Length = "1";
        SType = "Indicator";
        Label = "Cheque from account is MICR-encoded";
    }

    IN MIR-BNK-ACCT-TYP-CD
    {
        DisplayOnly;
        Length = "40";
        CodeSource = "EDIT";
        CodeType = "ACTYP";
        SType = "Text";
        Label = "Account Type";
    }

    IN MIR-BNK-BR-ID
    {
        DisplayOnly;
        Length = "5";
        SType = "Text";
        Label = "Branch Number";
    }

    IN MIR-BNK-ID
    {
        DisplayOnly;
        Length = "4";
        SType = "Text";
        Label = "Bank Number";
    }

    IN MIR-DV-OWN-CLI-NM
    {
        DisplayOnly;
        #TLB041 CHANGES START HERE 
        #Length = "75";
        Length = "100";
        #TLB041 CHANGES END HERE
        SType = "Text";
        Label = "Payor Name";
    }

    IN MIR-DV-PAC-PEND-AMT-T[7]
    {
        DisplayOnly;
        Signed;
        Length = "17";
        FieldGroup = "Table7";
        SType = "Currency";
        Label = "Total Pending Amount";
        Index = "1";
    }

    IN MIR-DV-PAC-PREM-AMT-T[7]
    {
        DisplayOnly;
        Signed;
        Length = "17";
        FieldGroup = "Table7";
        SType = "Currency";
        Label = "Total Premium Paying Amount";
        Index = "1";
    }

    IN MIR-DV-PAC-SPND-AMT-T[7]
    {
        DisplayOnly;
        Signed;
        Length = "17";
        FieldGroup = "Table7";
        SType = "Currency";
        Label = "Total Suspended Amount";
        Index = "1";
    }

    IN MIR-DV-TOT-PAC-AMT-T[7]
    {
        DisplayOnly;
        Signed;
        Length = "17";
        FieldGroup = "Table7";
        SType = "Currency";
        Label = "Total PAC Draw Amount";
        Index = "1";
    }

    IN MIR-POL-PAC-DRW-DY-T[7]
    {
        DisplayOnly;
        Length = "10";
        FieldGroup = "Table7";
        SType = "Day";
        Label = "Deposit Day";
        Index = "1";
    }

}

