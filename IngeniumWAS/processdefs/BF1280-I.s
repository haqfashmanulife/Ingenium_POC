# Converted from PathFinder 2.2 to 3.0 Jun 18, 2004 3:12:37 PM EDT

#*******************************************************************************
#*  Component:   BF1280-I.s                                                    *
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

S-STEP BF1280-I
{
    ATTRIBUTES
    {
        BusinessFunctionType = "Prmacct";
        Type = "Input";
        FocusField = "MIR-TRNXT-DT";
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

    INOUT MIR-ACCT-BASE-ID-T[10]
    {
        Key;
        Length = "6";
        FieldGroup = "Table10";
        KeyColumn;
        SType = "Text";
        Label = "Account Number";
        Index = "1";
    }

    INOUT MIR-ACCT-CRNT-LOC-CD-T[10]
    {
        Key;
        Length = "2";
        FieldGroup = "Table10";
        CodeSource = "CTLC";
        CodeType = "CLOC";
        FilterFields = "1";
        FilterField1 = "MIR-USER-SESN-CTRY-CD";
        SType = "Selection";
        Label = "Current Location  (CL)";
        Index = "1";
    }

    INOUT MIR-ACCT-ISS-LOC-CD-T[10]
    {
        Key;
        Length = "2";
        FieldGroup = "Table10";
        CodeSource = "CTLC";
        CodeType = "ILOC";
        FilterFields = "1";
        FilterField1 = "MIR-USER-SESN-CTRY-CD";
        SType = "Selection";
        Label = "Issue Location  (IL)";
        Index = "1";
    }

    INOUT MIR-BR-OR-DEPT-ID-T[10]
    {
        Key;
        Length = "5";
        FieldGroup = "Table10";
        CodeSource = "XTAB";
        CodeType = "BRCH";
        SType = "Selection";
        Label = "Branch";
        Index = "1";
    }

    INOUT MIR-DV-ACCT-DESC-TXT
    {
        Mandatory;
        Length = "20";
        SType = "Text";
        Label = "Description";
    }

    INOUT MIR-DV-ACCT-DESC-TXT-T[10]
    {
        Length = "20";
        FieldGroup = "Table10";
        SType = "Text";
        Label = "Account Description";
        Index = "1";
    }

    INOUT MIR-DV-CHQ-VCHR-NUM
    {
        Length = "7";
        SType = "Text";
        Label = "Voucher Number";
    }

    INOUT MIR-DV-TRNXT-CR-AMT-T[10]
    {
        Signed;
        Length = "13";
        FieldGroup = "Table10";
        SType = "Currency";
        Label = "Credit Amount";
        Index = "1";
    }

    INOUT MIR-DV-TRNXT-DR-AMT-T[10]
    {
        Signed;
        Length = "13";
        FieldGroup = "Table10";
        SType = "Currency";
        Label = "Debit Amount";
        Index = "1";
    }

    INOUT MIR-PLAN-ID-T[10]
    {
        Key;
        Length = "40";
        FieldGroup = "Table10";
        CodeSource = "EDIT";
        CodeType = "PLAN";
        SType = "Selection";
        Label = "Plan";
        Index = "1";
    }

    INOUT MIR-POL-ID-BASE
    {
        Length = "9";
        SType = "Text";
        Label = "Policy Id";
    }

    INOUT MIR-POL-ID-SFX
    {
        Length = "1";
        SType = "Text";
        Label = "Suffix";
    }

    INOUT MIR-SBSDRY-CO-ID-T[10]
    {
        Key;
        Length = "40";
        FieldGroup = "Table10";
        CodeSource = "EDIT";
        CodeType = "SUBCO";
        SType = "Selection";
        Label = "Sub Company  (SC)";
        Index = "1";
    }

    INOUT MIR-TRNXT-DT
    {
        Key;
        Mandatory;
        Length = "10";
        SType = "Date";
        Label = "Date";
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
        Label = "Process code";
    }

}

