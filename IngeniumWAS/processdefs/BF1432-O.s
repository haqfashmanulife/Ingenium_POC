# Converted from PathFinder 2.2 to 3.0 Jun 18, 2004 3:12:43 PM EDT

#*******************************************************************************
#*  Component:   BF1432-O.s                                                    *
#*  Description:                                                               *
#*                                                                             *
#*******************************************************************************
#*  Chg#    Release  Description                                               *
#*                                                                             *
#*  014590  6.0      New for release 6.0                                       *
#*  017150  612J     Remove Currency Decimals = "2"                            *
#*  01GL02  TMC      Add MCL Account Numbers                                   *
#*  02GL03  WBP      Add Account Bulk Code                                     *
#*  MFFACC  CLB      Change usage of Branch/Department to Fund. Add SUN ind.   *
#*******************************************************************************

S-STEP BF1432-O
{
    ATTRIBUTES
    {
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

    IN MIR-ACCT-BDGT-TYP-CD
    {
        DisplayOnly;
        Length = "1";
        CodeSource = "DataModel";
        CodeType = "ACCT-BDGT-TYP-CD";
        SType = "Text";
        Label = "Budget Amount Type";
    }

    IN MIR-ACCT-BEG-BAL-AMT
    {
        DisplayOnly;
        Signed;
        Length = "17";
        SType = "Currency";
        Label = "Beginning Balance";
    }

    IN MIR-ACCT-CTL-IND
    {
        DisplayOnly;
        Length = "1";
        SType = "Indicator";
        Label = "This is a controllable account";
    }

    IN MIR-ACCT-DESC-TXT
    {
        DisplayOnly;
        Length = "20";
        SType = "Text";
        Label = "Description";
    }

    IN MIR-ACCT-MCL-BASE-1-ID
    {
        DisplayOnly;
        Length = "8";
        SType = "Text";
        Label = "MLJ Account Number";
    }

    IN MIR-ACCT-MCL-BASE-2-ID
    {
        DisplayOnly;
        Length = "8";
        SType = "Text";
        Label = "MLJ Account Subsequent Number";
    }

    IN MIR-ACCT-BULK-CD    
    {
        DisplayOnly;
        Length = "1";
        CodeSource = "EDIT";
        CodeType = "BULK";
        SType = "Text";
        Label = "Account Bulk Code";
    }

    IN MIR-ACCT-MTHLY-RPT-IND
    {
        DisplayOnly;
        Length = "1";
        SType = "Indicator";
        Label = "Monthly Report Indicator";
    }

    IN MIR-ACCT-SUB-TYP-CD
    {
        DisplayOnly;
        Length = "1";
        CodeSource = "DataModel";
        CodeType = "ACCT-SUB-TYP-CD";
        SType = "Text";
        Label = "Bank / Cash Clearing";
    }

    IN MIR-ACCT-TOT-BDGT-AMT
    {
        DisplayOnly;
        Signed;
        Length = "17";
        SType = "Currency";
        Label = "Total Budget Amount";
    }

    IN MIR-ACCT-TYP-CD
    {
        DisplayOnly;
        Length = "1";
        CodeSource = "DataModel";
        CodeType = "ACCT-TYP-CD";
        SType = "Text";
        Label = "Account Type";
    }

    IN MIR-DV-ACCT-MO-BAL-AMT-T[12]
    {
        DisplayOnly;
        Signed;
        Length = "17";
        FieldGroup = "Table12";
        KeyColumn;
        SType = "Currency";
        Label = "Monthly Balance - January";
        Index = "1";
    }

    IN MIR-DV-ACCT-YTD-AMT
    {
        DisplayOnly;
        Signed;
        Length = "17";
        SType = "Currency";
        Label = "Current Balance";
    }

    IN MIR-DV-MO-BDGT-AMT-PCT-T[12]
    {
        DisplayOnly;
        Signed;
        Length = "17";
        Decimals = "2";
        FieldGroup = "Table12";
        SType = "Number";
        Label = "Budget - January";
        Index = "1";
    }

    IN MIR-ENTR-IMPCT-CD
    {
        DisplayOnly;
        Length = "2";
        CodeSource = "DataModel";
        CodeType = "ENTR-IMPCT-CD";
        SType = "Text";
        Label = "Policy Account Updated";
    }

    IN MIR-MEMO-BDGT-RPT-AMT
    {
        DisplayOnly;
        Signed;
        Length = "17";
        SType = "Currency";
        Label = "Memo Item";
    }

    IN MIR-ACCT-BASE-ID
    {
        Key;
        DisplayOnly;
        Length = "6";
        SType = "Text";
        Label = "Account Number";
    }

    IN MIR-ACCT-CRCY-CD
    {
        Key;
        DisplayOnly;
        Length = "2";
        CodeSource = "XTAB";
        CodeType = "CURR";
        SType = "Text";
        Label = "Currency";
    }

    IN MIR-ACCT-CRNT-LOC-CD
    {
        Key;
        DisplayOnly;
        Length = "2";
        CodeSource = "CTLC";
        CodeType = "CLOC";
        FilterFields = "1";
        FilterField1 = "MIR-USER-SESN-CTRY-CD";
        SType = "Text";
        Label = "Current Location";
    }

    IN MIR-ACCT-ISS-LOC-CD
    {
        Key;
        DisplayOnly;
        Length = "2";
        CodeSource = "CTLC";
        CodeType = "ILOC";
        FilterFields = "1";
        FilterField1 = "MIR-USER-SESN-CTRY-CD";
        SType = "Text";
        Label = "Issue Location";
    }

    IN MIR-ACCT-YR
    {
        Key;
        DisplayOnly;
        Length = "4";
        SType = "Year";
        Label = "Year";
    }

    IN MIR-BR-OR-DEPT-ID
    {
        Key;
        DisplayOnly;
        Length = "5";
        CodeSource = "EDIT";
        CodeType = "SEGFD";
    #   CodeSource = "XTAB";
    #   CodeType = "BRCH";
        SType = "Text";
        Label = "Fund";
    #   Label = "Branch / Departments";
    }

    IN MIR-PLAN-ID
    {
        Key;
        DisplayOnly;
        Length = "40";
        CodeSource = "EDIT";
        CodeType = "PLAN";
        SType = "Text";
        Label = "Plan";
    }

    IN MIR-SBSDRY-CO-ID
    {
        Key;
        DisplayOnly;
        Length = "40";
        CodeSource = "EDIT";
        CodeType = "SUBCO";
        SType = "Text";
        Label = "Sub Company";
    }

    IN MIR-ACCT-SUN-GL-IND
    {
        DisplayOnly;
        Length = "1";
        SType = "Indicator";
        Label = "SUN Account";
    }

}

