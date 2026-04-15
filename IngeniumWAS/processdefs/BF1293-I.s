# Converted from PathFinder 2.2 to 3.0 Jun 18, 2004 3:12:37 PM EDT

#*******************************************************************************
#*  Component:   BF1293-I.s                                                    *
#*  Description:                                                               *
#*                                                                             *
#*******************************************************************************
#*  Chg#    Release  Description                                               *
#*                                                                             *
#*  014590  6.0      New for release 6.0                                       *
#*  017150  612J     Remove Currency Decimals = "2"                            *
#*  PF20    PF 2.0   DisplayOnly flds with DefaultSession must be IN not INOUT *
#*                                                                             *
#*******************************************************************************

S-STEP BF1293-I
{
    ATTRIBUTES
    {
        BusinessFunctionType = "Misrevs";
        Type = "Input";
        FocusField = "MIR-DV-ACCT-DESC-TXT";
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

    INOUT MIR-ACCT-BASE-ID-T[100]
    {
        Length = "6";
        FieldGroup = "Table100";
        SType = "Text";
        Label = "Account Number";
        Index = "1";
    }

    INOUT MIR-BR-OR-DEPT-ID-T[100]
    {
        Length = "5";
        FieldGroup = "Table100";
        CodeSource = "XTAB";
        CodeType = "BRCH";
        SType = "Selection";
        Label = "Branch / Departments";
        Index = "1";
    }

    INOUT MIR-DV-ACCT-DESC-TXT
    {
        Mandatory;
        Length = "20";
        SType = "Text";
        Label = "Accounting Entry Description";
    }

    INOUT MIR-DV-ACCT-DESC-TXT-T[100]
    {
        Length = "20";
        FieldGroup = "Table100";
        SType = "Text";
        Label = "Accounting Entry Description";
        Index = "1";
    }

    INOUT MIR-DV-ACCT-TRXN-AMT-T[4]
    {
        Signed;
        Length = "13";
        FieldGroup = "Table4";
        SType = "Currency";
        Label = "Amount";
        Index = "1";
    }

    INOUT MIR-DV-BNK-ACCT-BASE-ID-T[4]
    {
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

    INOUT MIR-DV-BNK-BR-OR-DEPT-ID-T[4]
    {
        Length = "5";
        FieldGroup = "Table4";
        CodeSource = "XTAB";
        CodeType = "BRCH";
        SType = "Selection";
        Label = "Branch / Department";
        Index = "1";
    }

    INOUT MIR-DV-BNK-SBSDRY-CO-ID-T[4]
    {
        Length = "40";
        FieldGroup = "Table4";
        CodeSource = "EDIT";
        CodeType = "SUBCO";
        SType = "Selection";
        Label = "Sub Company";
        Index = "1";
    }

    INOUT MIR-DV-CHQ-VCHR-NUM
    {
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

    INOUT MIR-DV-TRNXT-CR-AMT-T[100]
    {
        Signed;
        Length = "13";
        FieldGroup = "Table100";
        SType = "Currency";
        Label = "Credit Amount";
        Index = "1";
    }

    INOUT MIR-DV-TRNXT-DR-AMT-T[100]
    {
        Signed;
        Length = "13";
        FieldGroup = "Table100";
        SType = "Currency";
        Label = "Debit Amount";
        Index = "1";
    }

    INOUT MIR-SBSDRY-CO-ID-T[100]
    {
        Length = "40";
        FieldGroup = "Table100";
        CodeSource = "EDIT";
        CodeType = "SUBCO";
        SType = "Selection";
        Label = "Sub Company";
        Index = "1";
    }

#   PF20 - change for Pathfinder Release 2.0
#   INOUT MIR-USER-SESN-CRCY-CD
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

    INOUT MIR-DV-PRCES-STATE-CD
    {
        Length = "1";
        SType = "Hidden";
        Label = "process code";
    }

}

