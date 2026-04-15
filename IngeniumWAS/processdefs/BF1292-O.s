# Converted from PathFinder 2.2 to 3.0 Jun 18, 2004 3:12:37 PM EDT

#*******************************************************************************
#*  Component:   BF1292-O.s                                                    *
#*  Description:                                                               *
#*                                                                             *
#*******************************************************************************
#*  Chg#    Release  Description                                               *
#*                                                                             *
#*  014590  6.0      New for release 6.0                                       *
#*  017150  612J     Remove Currency Decimals = "2"                            *
#*                                                                             *
#*******************************************************************************

S-STEP BF1292-O
{
    ATTRIBUTES
    {
        BusinessFunctionType = "Misrcpt";
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

    IN MIR-ACCT-BASE-ID-T[100]
    {
        DisplayOnly;
        Length = "6";
        FieldGroup = "Table100";
        SType = "Text";
        Label = "Account Number";
        Index = "1";
    }

    IN MIR-BR-OR-DEPT-ID-T[100]
    {
        DisplayOnly;
        Length = "5";
        FieldGroup = "Table100";
        CodeSource = "XTAB";
        CodeType = "BRCH";
        SType = "Text";
        Label = "Branch / Departments";
        Index = "1";
    }

    IN MIR-DV-ACCT-DESC-TXT
    {
        DisplayOnly;
        Length = "20";
        SType = "Text";
        Label = "Accounting Entry Description";
    }

    IN MIR-DV-ACCT-DESC-TXT-T[100]
    {
        DisplayOnly;
        Length = "20";
        FieldGroup = "Table100";
        SType = "Text";
        Label = "Accounting Entry Description";
        Index = "1";
    }

    IN MIR-DV-ACCT-TRXN-AMT-T[4]
    {
        DisplayOnly;
        Signed;
        Length = "13";
        FieldGroup = "Table4";
        SType = "Currency";
        Label = "Amount";
        Index = "1";
    }

    IN MIR-DV-BNK-ACCT-BASE-ID-T[4]
    {
        DisplayOnly;
        Length = "6";
        FieldGroup = "Table4";
        SType = "Text";
        Label = "Account Number";
        Index = "1";
    }

    IN MIR-DV-BNK-ACCT-DESC-TXT-T[4]
    {
        DisplayOnly;
        Length = "20";
        FieldGroup = "Table4";
        SType = "Text";
        Label = "Description";
        Index = "1";
    }

    IN MIR-DV-BNK-BR-OR-DEPT-ID-T[4]
    {
        DisplayOnly;
        Length = "5";
        FieldGroup = "Table4";
        CodeSource = "XTAB";
        CodeType = "BRCH";
        SType = "Text";
        Label = "Branch / Department";
        Index = "1";
    }

    IN MIR-DV-BNK-SBSDRY-CO-ID-T[4]
    {
        DisplayOnly;
        Length = "40";
        FieldGroup = "Table4";
        CodeSource = "EDIT";
        CodeType = "SUBCO";
        SType = "Text";
        Label = "Sub Company";
        Index = "1";
    }

    IN MIR-DV-CHQ-VCHR-NUM
    {
        DisplayOnly;
        Length = "7";
        SType = "Text";
        Label = "Voucher Number";
    }

    IN MIR-DV-SCRN-ACCT-DESC-TXT-T[100]
    {
        DisplayOnly;
        Length = "14";
        FieldGroup = "Table100";
        SType = "Text";
        Label = "Accounting Description";
        Index = "1";
    }

    IN MIR-DV-TRNXT-CR-AMT-T[100]
    {
        DisplayOnly;
        Signed;
        Length = "13";
        FieldGroup = "Table100";
        SType = "Currency";
        Label = "Credit Amount";
        Index = "1";
    }

    IN MIR-DV-TRNXT-DR-AMT-T[100]
    {
        DisplayOnly;
        Signed;
        Length = "13";
        FieldGroup = "Table100";
        SType = "Currency";
        Label = "Debit Amount";
        Index = "1";
    }

    IN MIR-SBSDRY-CO-ID-T[100]
    {
        DisplayOnly;
        Length = "40";
        FieldGroup = "Table100";
        CodeSource = "EDIT";
        CodeType = "SUBCO";
        SType = "Text";
        Label = "Sub Company";
        Index = "1";
    }

    IN MIR-USER-SESN-CRCY-CD
    {
        DisplayOnly;
        Length = "2";
        CodeSource = "XTAB";
        CodeType = "CURR";
        DefaultSession = "MIR-USER-SESN-CRCY-CD";
        SType = "Text";
        Label = "Currency";
    }

}

