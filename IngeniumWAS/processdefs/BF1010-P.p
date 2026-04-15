# Converted from PathFinder 2.2 to 3.0 Jun 18, 2004 3:13:33 PM EDT

#*******************************************************************************
#*  Component:   BF1010-P.p                                                    *
#*  Description:                                                               *
#*                                                                             *
#*******************************************************************************
#*  Chg#    Release  Description                                               *
#*                                                                             *
#*  014590  6.0      New for release 6.0                                       *
#*  017150  612J     Remove Currency Decimals = "2"                            *
#*  TLB041  CTS      CORPORATE POLICY HOLDER NAME & ADDRESS EXPANSION          *
#*******************************************************************************

P-STEP BF1010-P
{
    ATTRIBUTES
    {
        BusinessFunctionId = "1010";
        BusinessFunctionName = "Client Inquiry - PAC Details";
        BusinessFunctionType = "Pacdtl";
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

    IN MIR-DV-PRCES-STATE-CD
    {
        Length = "1";
        DBTableName = "Derived";
        SType = "Hidden";
        Label = "Process State";
    }

    OUT MIR-BILL-RMND-REASN-CD-T[6]
    {
        Length = "40";
        FieldGroup = "Table6";
        CodeSource = "DataModel";
        CodeType = "BILL-RMND-REASN-CD";
        DBTableName = "TPOL";
        SType = "Text";
        Label = "Notice Type";
        Index = "1";
    }

    OUT MIR-BNK-ACCT-ID
    {
        Length = "17";
        DBTableName = "TBNKA";
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
        DBTableName = "TBNKA";
        SType = "Text";
        Label = "Branch Number";
    }

    OUT MIR-BNK-ID
    {
        Length = "4";
        DBTableName = "TBNKA";
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

    OUT MIR-PAC-REDRW-OPT-CD-T[6]
    {
        Length = "40";
        FieldGroup = "Table6";
        CodeSource = "DataModel";
        CodeType = "PAC-REDRW-OPT-CD";
        DBTableName = "TPOL";
        SType = "Text";
        Label = "PAC Redraw Option";
        Index = "1";
    }

    OUT MIR-POL-BILL-MODE-CD-T[6]
    {
        Length = "40";
        FieldGroup = "Table6";
        CodeSource = "DataModel";
        CodeType = "POL-BILL-MODE-CD";
        DBTableName = "TPOL";
        SType = "Text";
        Label = "Premium Mode";
        Index = "1";
    }

    OUT MIR-POL-BILL-TO-DT-NUM-T[6]
    {
        Length = "10";
        FieldGroup = "Table6";
        DBTableName = "TPOL";
        SType = "Text";
        Label = "Billed to Date";
        Index = "1";
    }

    OUT MIR-POL-CSTAT-CD-T[6]
    {
        Length = "40";
        FieldGroup = "Table6";
        CodeSource = "DataModel";
        CodeType = "POL-CSTAT-CD";
        DBTableName = "TPOL";
        SType = "Text";
        Label = "Policy Status";
        Index = "1";
    }

    OUT MIR-POL-ID-BASE-T[6]
    {
        Length = "9";
        FieldGroup = "Table6";
        DBTableName = "TPOL";
        SType = "Text";
        Label = "Policy Id";
        Index = "1";
    }

    OUT MIR-POL-ID-SFX-T[6]
    {
        Length = "1";
        FieldGroup = "Table6";
        DBTableName = "TPOL";
        SType = "Text";
        Label = "Suffix";
        Index = "1";
    }

    OUT MIR-POL-ISS-EFF-DT-T[6]
    {
        Length = "10";
        FieldGroup = "Table6";
        DBTableName = "TPOL";
        SType = "Date";
        Label = "Policy Issue Date";
        Index = "1";
    }

    OUT MIR-POL-LOAN-REPAY-AMT-T[6]
    {
        Signed;
        Length = "17";
        FieldGroup = "Table6";
        DBTableName = "TPOL";
        SType = "Currency";
        Label = "Loan Repayment Amount";
        Index = "1";
    }

    OUT MIR-POL-MISC-SUSP-AMT-T[6]
    {
        Signed;
        Length = "17";
        FieldGroup = "Table6";
        DBTableName = "TPOL";
        SType = "Currency";
        Label = "Miscellaneous Suspense";
        Index = "1";
    }

    OUT MIR-POL-MPREM-AMT-T[6]
    {
        Signed;
        Length = "17";
        FieldGroup = "Table6";
        DBTableName = "TPOL";
        SType = "Currency";
        Label = "Mode Premium Amount";
        Index = "1";
    }

    OUT MIR-POL-PAC-DRW-DY-T[6]
    {
        Length = "10";
        FieldGroup = "Table6";
        DBTableName = "TPOL";
        SType = "Day";
        Label = "Deposit Day";
        Index = "1";
    }

    OUT MIR-POL-PAC-REDRW-DT-T[6]
    {
        Length = "10";
        FieldGroup = "Table6";
        DBTableName = "TPOL";
        SType = "Date";
        Label = "PAC Redraw Date";
        Index = "1";
    }

    OUT MIR-POL-PAC-RETRN-1-CD-T[6]
    {
        Length = "40";
        FieldGroup = "Table6";
        CodeSource = "DataModel";
        CodeType = "PAC-DRW-RETRN-CD";
        DBTableName = "TPOL";
        SType = "Text";
        Label = "Return PAC Cheque Reason (1)";
        Index = "1";
    }

    OUT MIR-POL-PAC-RETRN-1-DT-T[6]
    {
        Length = "10";
        FieldGroup = "Table6";
        DBTableName = "TPOL";
        SType = "Date";
        Label = "Return PAC Cheque Date 1";
        Index = "1";
    }

    OUT MIR-POL-PAC-RETRN-2-CD-T[6]
    {
        Length = "40";
        FieldGroup = "Table6";
        CodeSource = "DataModel";
        CodeType = "PAC-DRW-RETRN-CD";
        DBTableName = "TPOL";
        SType = "Text";
        Label = "Return PAC Cheque Reason (2)";
        Index = "1";
    }

    OUT MIR-POL-PAC-RETRN-2-DT-T[6]
    {
        Length = "10";
        FieldGroup = "Table6";
        DBTableName = "TPOL";
        SType = "Date";
        Label = "Return PAC Cheque Date 2";
        Index = "1";
    }

    OUT MIR-POL-PD-TO-DT-NUM-T[6]
    {
        Length = "10";
        FieldGroup = "Table6";
        DBTableName = "TPOL";
        SType = "Text";
        Label = "Paid to Date";
        Index = "1";
    }

    OUT MIR-POL-PREM-SUSP-AMT-T[6]
    {
        Signed;
        Length = "17";
        FieldGroup = "Table6";
        DBTableName = "TPOL";
        SType = "Currency";
        Label = "Premium Suspense";
        Index = "1";
    }

    OUT MIR-POL-RBILL-CD-T[6]
    {
        Length = "40";
        FieldGroup = "Table6";
        CodeSource = "DataModel";
        CodeType = "POL-RBILL-CD";
        DBTableName = "TPOL";
        SType = "Text";
        Label = "Restrict Billing";
        Index = "1";
    }

    OUT MIR-POL-SNDRY-AMT-T[6]
    {
        Signed;
        Length = "17";
        FieldGroup = "Table6";
        DBTableName = "TPOL";
        SType = "Currency";
        Label = "Sundry Amount";
        Index = "1";
    }

    OUT MIR-POL-SPND-IND-T[6]
    {
        Length = "1";
        FieldGroup = "Table6";
        DBTableName = "TPOL";
        SType = "Indicator";
        Label = "Suspend Status";
        Index = "1";
    }

    OUT MIR-RBILL-DEPT-ID-T[6]
    {
        Length = "40";
        FieldGroup = "Table6";
        CodeSource = "EDIT";
        CodeType = "DEPT";
        DBTableName = "TRSTB";
        SType = "Text";
        Label = "Department Responsible";
        Index = "1";
    }

    OUT MIR-RBILL-EFF-DT-T[6]
    {
        Length = "10";
        FieldGroup = "Table6";
        DBTableName = "TRSTB";
        SType = "Date";
        Label = "Effective Date";
        Index = "1";
    }

    OUT MIR-RBILL-END-DT-T[6]
    {
        Length = "10";
        FieldGroup = "Table6";
        DBTableName = "TRSTB";
        SType = "Date";
        Label = "End Date";
        Index = "1";
    }

    OUT MIR-RBILL-MISC-1-CD-T[6]
    {
        Length = "40";
        FieldGroup = "Table6";
        DBTableName = "TRSTB";
        SType = "Text";
        Label = "Restrict Billing Code 1";
        Index = "1";
    }

    OUT MIR-RBILL-MISC-2-CD-T[6]
    {
        Length = "40";
        FieldGroup = "Table6";
        DBTableName = "TRSTB";
        SType = "Text";
        Label = "Restrict Billing Code 2";
        Index = "1";
    }

    OUT MIR-RBILL-USER-ID-T[6]
    {
        Length = "8";
        FieldGroup = "Table6";
        DBTableName = "TRSTB";
        SType = "Text";
        Label = "User Responsible";
        Index = "1";
    }

    OUT MIR-SBSDRY-CO-ID-T[6]
    {
        Length = "40";
        FieldGroup = "Table6";
        CodeSource = "EDIT";
        CodeType = "SUBCO";
        DBTableName = "TPOL";
        SType = "Text";
        Label = "Sub Company";
        Index = "1";
    }

}

