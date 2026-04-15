# Converted from PathFinder 2.2 to 3.0 Jun 18, 2004 3:12:43 PM EDT

#*******************************************************************************
#*  Component:   BF1432-I.s                                                    *
#*  Description:                                                               *
#*                                                                             *
#*******************************************************************************
#*  Chg#    Release  Description                                               *
#*                                                                             *
#*  014590  6.0      New for release 6.0                                       *
#*  016203  6.02J    Can't create a US account with location while Cdn signon  *
#*  017150  612J     Remove Currency Decimals = "2"                            *
#*  01GL02  TMC      Add MCL Account Numbers                                   *
#*  02GL03  WBP      Add Account Bulk Code                                     *
#*  MFFACC  CLB      Change usage of Branch/Department to Fund. Add SUN ind.   *
#*******************************************************************************

S-STEP BF1432-I
{
    ATTRIBUTES
    {
        Type = "Input";
        FocusField = "MIR-ACCT-TYP-CD";
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

    INOUT MIR-ACCT-BDGT-TYP-CD
    {
        Length = "1";
        CodeSource = "DataModel";
        CodeType = "ACCT-BDGT-TYP-CD";
        SType = "Selection";
        Label = "Budget Amount Type";
    }

    INOUT MIR-ACCT-BEG-BAL-AMT
    {
        Signed;
        Length = "17";
        SType = "Currency";
        Label = "Beginning Balance";
    }

    INOUT MIR-ACCT-CTL-IND
    {
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

    INOUT MIR-ACCT-MCL-BASE-1-ID
    {
        Length = "8";
        SType = "Text";
        Label = "MLJ Account Number";
    }

    INOUT MIR-ACCT-MCL-BASE-2-ID
    {
        Length = "8";
        SType = "Text";
        Label = "MLJ Account Subsequent Number";
    }

    INOUT MIR-ACCT-BULK-CD    
    {
        Length = "1";
        CodeSource = "EDIT";
        CodeType = "BULK";
        SType = "Selection";
        Label = "Account Bulk Code";
    }

    INOUT MIR-ACCT-MTHLY-RPT-IND
    {
        Length = "1";
        SType = "Indicator";
        Label = "Monthly Report Indicator";
    }

    INOUT MIR-ACCT-SUB-TYP-CD
    {
        Length = "1";
        CodeSource = "DataModel";
        CodeType = "ACCT-SUB-TYP-CD";
        SType = "Selection";
        Label = "Bank / Cash Clearing";
    }

    INOUT MIR-ACCT-TOT-BDGT-AMT
    {
        Signed;
        Length = "17";
        SType = "Currency";
        Label = "Total Budget Amount";
    }

    INOUT MIR-ACCT-TYP-CD
    {
        Length = "1";
        CodeSource = "DataModel";
        CodeType = "ACCT-TYP-CD";
        SType = "Selection";
        Label = "Account Type";
    }

    INOUT MIR-DV-ACCT-MO-BAL-AMT-T[12]
    {
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

    INOUT MIR-DV-MO-BDGT-AMT-PCT-T[12]
    {
        Signed;
        Length = "17";
        Decimals = "2";
        FieldGroup = "Table12";
        SType = "Number";
        Label = "Budget - January";
        Index = "1";
    }

    INOUT MIR-ENTR-IMPCT-CD
    {
        Length = "2";
        CodeSource = "DataModel";
        CodeType = "ENTR-IMPCT-CD";
        SType = "Selection";
        Label = "Policy Account Updated";
    }

    INOUT MIR-MEMO-BDGT-RPT-AMT
    {
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
        CodeSource = "EDIT";
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
        CodeSource = "EDIT";
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

    INOUT MIR-ACCT-SUN-GL-IND
    {
        Length = "1";
        SType = "Indicator";
        Label = "SUN Account";
    }
     
}

