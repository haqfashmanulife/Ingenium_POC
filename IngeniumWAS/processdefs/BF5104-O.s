# Converted from PathFinder 2.2 to 3.0 Jun 18, 2004 3:12:59 PM EDT

#*******************************************************************************
#*  Component:   BF5104-O.s                                                    *
#*  Description:                                                               *
#*                                                                             *
#*******************************************************************************
#*  Chg#    Release  Description                                               *
#*                                                                             *
#*  014590  6.0      New for release 6.0                                       *
#*  017150  612J     Remove Currency Decimals = "2"                            *
#*  UY3004  STREAM3  UNISYS POST MIGRATION DUPLICATION POLICY                  *
#*******************************************************************************

S-STEP BF5104-O
{
    ATTRIBUTES
    {
        BusinessFunctionType = "List";
        Type = "Output";
        DelEmptyRows;
        FocusField = "MIR-BNK-ID";
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

#UY3004 CHANGES START
    INOUT Dispolval
    {
        SType = "Hidden";
    }

    INOUT Dissfxval
    {
        SType = "Hidden";
    }
#UY3004 CHANGES END

    INOUT MIR-BNK-ACCT-ID
    {
        Key;
        Mandatory;
        Length = "17";
        SType = "Text";
        Label = "Account Number";
    }

    INOUT MIR-BNK-BR-ID
    {
        Key;
        Mandatory;
        Length = "5";
        SType = "Text";
        Label = "Branch Number";
    }

    INOUT MIR-BNK-ID
    {
        Key;
        Mandatory;
        Length = "4";
        SType = "Text";
        Label = "Bank Number";
    }

    INOUT MIR-PAC-DRWD-DUE-DT
    {
        Key;
        Length = "10";
        SType = "Date";
        Label = "Premium Due Date";
    }

    INOUT MIR-PAC-DRW-IDT-NUM
    {
        Key;
        Mandatory;
        Length = "10";
        SType = "Date";
        Label = "PAC Withdrawal Date";
    }

    INOUT MIR-PAC-DRW-SEQ-NUM
    {
        Key;
        Mandatory;
        Length = "3";
        SType = "Text";
        Label = "Sequence Number";
    }

    INOUT MIR-POL-ID-BASE
    {
        Key;
        Length = "9";
        DefaultSession = "MIR-POL-ID-BASE";
        SType = "Text";
        Label = "Policy Id";
    }

    INOUT MIR-POL-ID-SFX
    {
        Key;
        Length = "1";
        DefaultSession = "MIR-POL-ID-SFX";
        SType = "Text";
        Label = "Suffix";
    }

    IN MIR-PAC-DRW-CREAT-CD
    {
        DisplayOnly;
        Length = "1";
        CodeSource = "DataModel";
        CodeType = "PAC-DRW-CREAT-CD";
        SType = "Text";
        Label = "Type of PAC Draw";
    }

    IN MIR-PAC-DRWD-DUE-DT-T[100]
    {
        DisplayOnly;
        Length = "10";
        FieldGroup = "Table100";
        SType = "Date";
        Label = "Premium Due Date";
        Index = "1";
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
        Length = "13";
        FieldGroup = "Table100";
        SType = "Currency";
        Label = "Premium Suspense Amount";
        Index = "1";
    }

    IN MIR-PAC-DRW-TOT-AMT
    {
        DisplayOnly;
        Signed;
        Length = "11";
        SType = "Currency";
        Label = "PAC Amount";
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

    IN MIR-POL-ID-BASE-T[100]
    {
        DisplayOnly;
        Length = "9";
        FieldGroup = "Table100";
        KeyColumn;
        Link;
        SType = "Text";
        Label = "Policy Id";
        Action = "SelectItem";
        Index = "1";
    }

    IN MIR-POL-ID-SFX-T[100]
    {
        DisplayOnly;
        Length = "1";
        FieldGroup = "Table100";
        SType = "Text";
        Label = "Suffix";
        Index = "1";
    }

}

