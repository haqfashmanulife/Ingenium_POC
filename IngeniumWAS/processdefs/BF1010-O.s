# Converted from PathFinder 2.2 to 3.0 Jun 18, 2004 3:12:33 PM EDT

#*******************************************************************************
#*  Component:   BF1010-O.s                                                    *
#*  Description:                                                               *
#*                                                                             *
#*******************************************************************************
#*  Chg#    Release  Description                                               *
#*                                                                             *
#*  014590  6.0      New for release 6.0                                       *
#*  017150  612J     Remove Currency Decimals = "2"                            *
#*  TLB041  CTS      CORPORATE POLICY HOLDER NAME & ADDRESS EXPANSION          *
#*******************************************************************************

S-STEP BF1010-O
{
    ATTRIBUTES
    {
        BusinessFunctionType = "Pacdtl";
        Type = "Output";
        DelEmptyRows;
        FocusField = "MIR-CLI-ID";
        FocusFrame = "ContentFrame";
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

    INOUT MIR-CLI-BNK-ACCT-NUM
    {
        Key;
        Length = "1";
        DefaultSession = "MIR-CLI-BNK-ACCT-NUM";
        SType = "Text";
        Label = "Bank Account Number";
    }

    INOUT MIR-CLI-ID
    {
        Key;
        Length = "10";
        DefaultSession = "MIR-CLI-ID";
        SType = "Text";
        Label = "Client Number";
    }

    IN MIR-BILL-RMND-REASN-CD-T[6]
    {
        DisplayOnly;
        Length = "40";
        FieldGroup = "Table6";
        CodeSource = "DataModel";
        CodeType = "BILL-RMND-REASN-CD";
        SType = "Text";
        Label = "Notice Type";
        Index = "1";
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

    IN MIR-PAC-REDRW-OPT-CD-T[6]
    {
        DisplayOnly;
        Length = "40";
        FieldGroup = "Table6";
        CodeSource = "DataModel";
        CodeType = "PAC-REDRW-OPT-CD";
        SType = "Text";
        Label = "PAC Redraw Option";
        Index = "1";
    }

    IN MIR-POL-BILL-MODE-CD-T[6]
    {
        DisplayOnly;
        Length = "40";
        FieldGroup = "Table6";
        CodeSource = "DataModel";
        CodeType = "POL-BILL-MODE-CD";
        SType = "Text";
        Label = "Premium Mode";
        Index = "1";
    }

    IN MIR-POL-BILL-TO-DT-NUM-T[6]
    {
        DisplayOnly;
        Length = "10";
        FieldGroup = "Table6";
        SType = "Text";
        Label = "Billed to Date";
        Index = "1";
    }

    IN MIR-POL-CSTAT-CD-T[6]
    {
        DisplayOnly;
        Length = "40";
        FieldGroup = "Table6";
        CodeSource = "DataModel";
        CodeType = "POL-CSTAT-CD";
        SType = "Text";
        Label = "Policy Status";
        Index = "1";
    }

    IN MIR-POL-ID-BASE-T[6]
    {
        DisplayOnly;
        Length = "9";
        FieldGroup = "Table6";
        SType = "Text";
        Label = "Policy Id";
        Index = "1";
    }

    IN MIR-POL-ID-SFX-T[6]
    {
        DisplayOnly;
        Length = "1";
        FieldGroup = "Table6";
        SType = "Text";
        Label = "Suffix";
        Index = "1";
    }

    IN MIR-POL-ISS-EFF-DT-T[6]
    {
        DisplayOnly;
        Length = "10";
        FieldGroup = "Table6";
        SType = "Date";
        Label = "Policy Issue Date";
        Index = "1";
    }

    IN MIR-POL-LOAN-REPAY-AMT-T[6]
    {
        DisplayOnly;
        Signed;
        Length = "17";
        FieldGroup = "Table6";
        SType = "Currency";
        Label = "Loan Repayment Amount";
        Index = "1";
    }

    IN MIR-POL-MISC-SUSP-AMT-T[6]
    {
        DisplayOnly;
        Signed;
        Length = "17";
        FieldGroup = "Table6";
        SType = "Currency";
        Label = "Miscellaneous Suspense";
        Index = "1";
    }

    IN MIR-POL-MPREM-AMT-T[6]
    {
        DisplayOnly;
        Signed;
        Length = "17";
        FieldGroup = "Table6";
        SType = "Currency";
        Label = "Mode Premium Amount";
        Index = "1";
    }

    IN MIR-POL-PAC-DRW-DY-T[6]
    {
        DisplayOnly;
        Length = "10";
        FieldGroup = "Table6";
        SType = "Day";
        Label = "Deposit Day";
        Index = "1";
    }

    IN MIR-POL-PAC-REDRW-DT-T[6]
    {
        DisplayOnly;
        Length = "10";
        FieldGroup = "Table6";
        SType = "Date";
        Label = "PAC Redraw Date";
        Index = "1";
    }

    IN MIR-POL-PAC-RETRN-1-CD-T[6]
    {
        DisplayOnly;
        Length = "40";
        FieldGroup = "Table6";
        CodeSource = "DataModel";
        CodeType = "PAC-DRW-RETRN-CD";
        SType = "Text";
        Label = "Return PAC Cheque Reason (1)";
        Index = "1";
    }

    IN MIR-POL-PAC-RETRN-1-DT-T[6]
    {
        DisplayOnly;
        Length = "10";
        FieldGroup = "Table6";
        SType = "Date";
        Label = "Return PAC Cheque Date 1";
        Index = "1";
    }

    IN MIR-POL-PAC-RETRN-2-CD-T[6]
    {
        DisplayOnly;
        Length = "40";
        FieldGroup = "Table6";
        CodeSource = "DataModel";
        CodeType = "PAC-DRW-RETRN-CD";
        SType = "Text";
        Label = "Return PAC Cheque Reason (2)";
        Index = "1";
    }

    IN MIR-POL-PAC-RETRN-2-DT-T[6]
    {
        DisplayOnly;
        Length = "10";
        FieldGroup = "Table6";
        SType = "Date";
        Label = "Return PAC Cheque Date 2";
        Index = "1";
    }

    IN MIR-POL-PD-TO-DT-NUM-T[6]
    {
        DisplayOnly;
        Length = "10";
        FieldGroup = "Table6";
        SType = "Text";
        Label = "Paid to Date";
        Index = "1";
    }

    IN MIR-POL-PREM-SUSP-AMT-T[6]
    {
        DisplayOnly;
        Signed;
        Length = "17";
        FieldGroup = "Table6";
        SType = "Currency";
        Label = "Premium Suspense";
        Index = "1";
    }

    IN MIR-POL-RBILL-CD-T[6]
    {
        DisplayOnly;
        Length = "40";
        FieldGroup = "Table6";
        CodeSource = "DataModel";
        CodeType = "POL-RBILL-CD";
        SType = "Text";
        Label = "Restrict Billing";
        Index = "1";
    }

    IN MIR-POL-SNDRY-AMT-T[6]
    {
        DisplayOnly;
        Signed;
        Length = "17";
        FieldGroup = "Table6";
        SType = "Currency";
        Label = "Sundry Amount";
        Index = "1";
    }

    IN MIR-POL-SPND-IND-T[6]
    {
        DisplayOnly;
        Length = "1";
        FieldGroup = "Table6";
        SType = "Indicator";
        Label = "Suspend Status";
        Index = "1";
    }

    IN MIR-RBILL-DEPT-ID-T[6]
    {
        DisplayOnly;
        Length = "40";
        FieldGroup = "Table6";
        CodeSource = "EDIT";
        CodeType = "DEPT";
        SType = "Text";
        Label = "Department Responsible";
        Index = "1";
    }

    IN MIR-RBILL-EFF-DT-T[6]
    {
        DisplayOnly;
        Length = "10";
        FieldGroup = "Table6";
        SType = "Date";
        Label = "Effective Date";
        Index = "1";
    }

    IN MIR-RBILL-END-DT-T[6]
    {
        DisplayOnly;
        Length = "10";
        FieldGroup = "Table6";
        SType = "Date";
        Label = "End Date";
        Index = "1";
    }

    IN MIR-RBILL-MISC-1-CD-T[6]
    {
        DisplayOnly;
        Length = "40";
        FieldGroup = "Table6";
        SType = "Text";
        Label = "Restrict Billing Code 1";
        Index = "1";
    }

    IN MIR-RBILL-MISC-2-CD-T[6]
    {
        DisplayOnly;
        Length = "40";
        FieldGroup = "Table6";
        SType = "Text";
        Label = "Restrict Billing Code 2";
        Index = "1";
    }

    IN MIR-RBILL-USER-ID-T[6]
    {
        DisplayOnly;
        Length = "8";
        FieldGroup = "Table6";
        SType = "Text";
        Label = "User Responsible";
        Index = "1";
    }

    IN MIR-SBSDRY-CO-ID-T[6]
    {
        DisplayOnly;
        Length = "40";
        FieldGroup = "Table6";
        CodeSource = "EDIT";
        CodeType = "SUBCO";
        SType = "Text";
        Label = "Sub Company";
        Index = "1";
    }

}

