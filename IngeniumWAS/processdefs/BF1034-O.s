# Converted from PathFinder 2.2 to 3.0 Jun 18, 2004 3:12:34 PM EDT

#*******************************************************************************
#*  Component:   BF1034-O.s                                                    *
#*  Description:                                                               *
#*                                                                             *
#*******************************************************************************
#*  Chg#    Release  Description                                               *
#*                                                                             *
#*  014590  6.0      New for release 6.0                                       *
#*  017150  612J     Remove Currency Decimals = "2"                            *
#*                                                                             *
#*******************************************************************************

S-STEP BF1034-O
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

    IN MIR-BNK-ACCT-HLDR-NM
    {
        DisplayOnly;
        Length = "50";
        SType = "Text";
        Label = "Accountholder Name";
    }

    IN MIR-CLI-BNK-ACCT-NUM-T[11]
    {
        DisplayOnly;
        Length = "1";
        FieldGroup = "Table11";
        SType = "Text";
        Label = "Bank Account Number";
        Index = "1";
    }

    IN MIR-CLI-ID-T[11]
    {
        DisplayOnly;
        Length = "10";
        FieldGroup = "Table11";
        SType = "Text";
        Label = "Client Number";
        Index = "1";
    }

    IN MIR-POL-CSTAT-CD-T[11]
    {
        DisplayOnly;
        Length = "40";
        FieldGroup = "Table11";
        CodeSource = "DataModel";
        CodeType = "POL-CSTAT-CD";
        SType = "Text";
        Label = "Policy Status";
        Index = "1";
    }

    IN MIR-POL-ID-BASE-T[11]
    {
        DisplayOnly;
        Length = "9";
        FieldGroup = "Table11";
        SType = "Text";
        Label = "Policy Id";
        Index = "1";
    }

    IN MIR-POL-ID-SFX-T[11]
    {
        DisplayOnly;
        Length = "1";
        FieldGroup = "Table11";
        SType = "Text";
        Label = "Suffix";
        Index = "1";
    }

    IN MIR-POL-LOAN-REPAY-AMT-T[11]
    {
        DisplayOnly;
        Signed;
        Length = "13";
        FieldGroup = "Table11";
        SType = "Currency";
        Label = "Loan Repayment Amount";
        Index = "1";
    }

    IN MIR-POL-MPREM-AMT-T[11]
    {
        DisplayOnly;
        Signed;
        Length = "15";
        FieldGroup = "Table11";
        SType = "Currency";
        Label = "Mode Premium Amount";
        Index = "1";
    }

    IN MIR-POL-PAC-DRW-DY-T[11]
    {
        DisplayOnly;
        Length = "10";
        FieldGroup = "Table11";
        SType = "Day";
        Label = "Deposit Day";
        Index = "1";
    }

    IN MIR-POL-PD-TO-DT-NUM-T[11]
    {
        DisplayOnly;
        Length = "10";
        FieldGroup = "Table11";
        SType = "Text";
        Label = "Paid to Date";
        Index = "1";
    }

    IN MIR-POL-PREM-SUSP-AMT-T[11]
    {
        DisplayOnly;
        Signed;
        Length = "17";
        FieldGroup = "Table11";
        SType = "Currency";
        Label = "Premium Suspense";
        Index = "1";
    }

}

