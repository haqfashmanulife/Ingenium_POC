# Converted from PathFinder 2.2 to 3.0 Jun 18, 2004 3:12:59 PM EDT

#*******************************************************************************
#*  Component:   BF5103-O.s                                                    *
#*  Description:                                                               *
#*                                                                             *
#*******************************************************************************
#*  Chg#    Release  Description                                               *
#*                                                                             *
#*  014590  6.0      New for release 6.0                                       *
#*  017150  612J     Remove Currency Decimals = "2"                            *
#*                                                                             *
#*******************************************************************************

S-STEP BF5103-O
{
    ATTRIBUTES
    {
        BusinessFunctionType = "Delete";
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

    IN MIR-BNK-ACCT-ID
    {
        Key;
        DisplayOnly;
        Length = "17";
        SType = "Text";
        Label = "Account Number";
    }

    IN MIR-BNK-BR-ID
    {
        Key;
        DisplayOnly;
        Length = "5";
        SType = "Text";
        Label = "Branch Number";
    }

    IN MIR-BNK-ID
    {
        Key;
        DisplayOnly;
        Length = "4";
        SType = "Text";
        Label = "Bank Number";
    }

    IN MIR-PAC-DRWD-DUE-DT
    {
        Key;
        DisplayOnly;
        Length = "10";
        SType = "Date";
        Label = "Premium Due Date";
    }

    IN MIR-PAC-DRW-IDT-NUM
    {
        Key;
        DisplayOnly;
        Length = "10";
        SType = "Date";
        Label = "PAC Withdrawal Date";
    }

    IN MIR-PAC-DRW-SEQ-NUM
    {
        Key;
        DisplayOnly;
        Length = "3";
        SType = "Text";
        Label = "Sequence Number";
    }

    IN MIR-POL-ID-BASE
    {
        Key;
        DisplayOnly;
        Length = "9";
        DefaultSession = "MIR-POL-ID-BASE";
        SType = "Text";
        Label = "Policy Id";
    }

    IN MIR-POL-ID-SFX
    {
        Key;
        DisplayOnly;
        Length = "1";
        DefaultSession = "MIR-POL-ID-SFX";
        SType = "Text";
        Label = "Suffix";
    }

    IN MIR-PAC-DRWD-LOAN-AMT-T[100]
    {
        DisplayOnly;
        Length = "13";
        FieldGroup = "Table100";
        SType = "Currency";
        Label = "Loan Repayment";
        Index = "1";
    }

    IN MIR-PAC-DRWD-MPREM-AMT-T[100]
    {
        DisplayOnly;
        Length = "13";
        FieldGroup = "Table100";
        SType = "Currency";
        Label = "Mode Premium";
        Index = "1";
    }

    IN MIR-PAC-DRWD-REDRW-IND-T[100]
    {
        DisplayOnly;
        Length = "1";
        FieldGroup = "Table100";
        SType = "Indicator";
        Label = "PAC draw for the policy was a redraw";
        Index = "1";
    }

    IN MIR-PAC-DRWD-SNDRY-AMT-T[100]
    {
        DisplayOnly;
        Length = "13";
        FieldGroup = "Table100";
        SType = "Currency";
        Label = "Sundry Amount Billed";
        Index = "1";
    }

    IN MIR-PAC-DRWD-STAT-CD-T[100]
    {
        DisplayOnly;
        Length = "1";
        FieldGroup = "Table100";
        CodeSource = "DataModel";
        CodeType = "PAC-DRWD-STAT-CD";
        SType = "Text";
        Label = "Status";
        Index = "1";
    }

    IN MIR-PAC-DRWD-SUSP-AMT-T[100]
    {
        DisplayOnly;
        Signed;
        Length = "13";
        FieldGroup = "Table100";
        SType = "Currency";
        Label = "Premium Suspense Amount";
        Index = "1";
    }

    IN MIR-PAC-DRW-TOT-AMT-T[100]
    {
        DisplayOnly;
        Signed;
        Length = "11";
        FieldGroup = "Table100";
        SType = "Currency";
        Label = "PAC Amount";
        Index = "1";
    }

}

